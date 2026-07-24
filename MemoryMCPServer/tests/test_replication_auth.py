from __future__ import annotations

import hmac
import warnings

from fastmcp import FastMCP

warnings.filterwarnings(
    "ignore",
    message="Using `httpx` with `starlette.testclient` is deprecated",
)
from starlette.testclient import TestClient

from memory_mcp.auth import (
    AuthenticationError,
    RequestGuard,
    TokenAuthorizer,
)
from memory_mcp.replication import install_replication_routes
from memory_mcp.storage import Storage


def _authorizer() -> TokenAuthorizer:
    return TokenAuthorizer(
        {
            "read-token-123456": {"read"},
            "replicate-token-123456": {"replicate"},
            "admin-token-123456": {"admin"},
        }
    )


def _client(storage: Storage, *, max_body_bytes: int = 4096, rate_limit: int = 100):
    mcp = FastMCP("test-memory")
    install_replication_routes(
        mcp,
        storage,
        _authorizer(),
        RequestGuard(
            max_body_bytes=max_body_bytes,
            max_requests=rate_limit,
            window_seconds=60,
        ),
    )
    return TestClient(mcp.http_app(json_response=True))


def test_bearer_auth_uses_constant_time_verification_and_separate_capabilities(monkeypatch):
    calls = []
    real_compare = hmac.compare_digest

    def observed(left, right):
        calls.append((left, right))
        return real_compare(left, right)

    monkeypatch.setattr("memory_mcp.auth.hmac.compare_digest", observed)
    authorizer = _authorizer()

    assert authorizer.require("Bearer read-token-123456", "read")["capability"] == "read"
    assert len(calls) == 3
    assert all(len(left) == len(right) == 32 for left, right in calls)
    assert "read-token-123456" not in repr(authorizer._tokens)

    for capability in ("replicate", "admin"):
        try:
            authorizer.require("Bearer read-token-123456", capability)
        except AuthenticationError as error:
            assert str(error) == "unauthorized"
        else:
            raise AssertionError("read token crossed a capability boundary")


def test_replication_http_endpoints_require_auth_and_redact_failures(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    with _client(storage) as client:
        missing = client.get("/replication/readiness")
        wrong_capability = client.post(
            "/replication/export",
            headers={"Authorization": "Bearer read-token-123456"},
            json={"cursor": 0, "limit": 10},
        )
        invalid = client.get(
            "/replication/readiness",
            headers={"Authorization": "Bearer super-secret-value"},
        )

    assert missing.status_code == 401
    assert wrong_capability.status_code == 403
    assert invalid.status_code == 401
    assert invalid.json() == {"error": "unauthorized"}
    assert "super-secret-value" not in invalid.text


def test_readiness_export_import_ack_and_admin_endpoints_are_bounded(tmp_path):
    source = Storage(tmp_path / "source", node_id="node:source")
    target = Storage(tmp_path / "target", node_id="node:target")
    source.record_event(
        content="Replicate through HTTP",
        entities=["Memory MCP"],
        event_date="2026-07-24T10:00:00+00:00",
        tags=[],
        agent="CODEX",
    )

    with _client(source) as source_client, _client(target) as target_client:
        readiness = source_client.get(
            "/replication/readiness",
            headers={"Authorization": "Bearer read-token-123456"},
        )
        exported = source_client.post(
            "/replication/export",
            headers={"Authorization": "Bearer replicate-token-123456"},
            json={"cursor": 0, "limit": 10},
        )
        imported = target_client.post(
            "/replication/import",
            headers={"Authorization": "Bearer replicate-token-123456"},
            json={"envelope": exported.json()},
        )
        acknowledged = source_client.post(
            "/replication/ack",
            headers={"Authorization": "Bearer replicate-token-123456"},
            json={"peer_node_id": "node:target", "cursor": exported.json()["to_cursor"]},
        )
        backup = source_client.post(
            "/replication/backups",
            headers={"Authorization": "Bearer admin-token-123456"},
            json={},
        )
        unsafe_restore = source_client.post(
            "/replication/restore",
            headers={"Authorization": "Bearer admin-token-123456"},
            json={"backup_id": "../../etc/passwd"},
        )

    assert readiness.status_code == 200
    assert readiness.json()["node_id"] == "node:source"
    assert imported.status_code == 200
    assert imported.json()["accepted"] == 1
    assert acknowledged.json()["cursor"] == exported.json()["to_cursor"]
    assert backup.status_code == 201
    assert unsafe_restore.status_code == 400
    assert unsafe_restore.json() == {"error": "invalid_request"}
    assert next(target.iter_events())["content"] == "Replicate through HTTP"


def test_body_and_rate_limits_fail_closed(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    with _client(storage, max_body_bytes=64, rate_limit=1) as client:
        first = client.get(
            "/replication/readiness",
            headers={"Authorization": "Bearer read-token-123456"},
        )
        limited = client.get(
            "/replication/readiness",
            headers={"Authorization": "Bearer read-token-123456"},
        )

    with _client(storage, max_body_bytes=64) as client:
        oversized = client.post(
            "/replication/export",
            headers={"Authorization": "Bearer replicate-token-123456"},
            content=b'{"cursor":0,"limit":10,"padding":"' + b"x" * 128 + b'"}',
        )
        chunked = client.post(
            "/replication/export",
            headers={"Authorization": "Bearer replicate-token-123456"},
            content=iter([b'{"cursor":0,"padding":"', b"x" * 128, b'"}']),
        )

    assert first.status_code == 200
    assert limited.status_code == 429
    assert limited.json() == {"error": "rate_limited"}
    assert oversized.status_code == 413
    assert oversized.json() == {"error": "payload_too_large"}
    assert chunked.status_code == 413
    assert chunked.json() == {"error": "payload_too_large"}


def test_conflicts_endpoint_is_cursor_paginated(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    conflicts = {
        f"entity:entity-{index}": {
            "subject_type": "entity",
            "subject_id": f"entity-{index}",
            "revision_ids": [],
            "branches": [],
            "conflicted_fields": ["content"],
            "detected_at": "2026-07-24T10:00:00+00:00",
        }
        for index in range(3)
    }
    storage.revision_journal._write_json(
        storage.revision_journal.conflicts_path,
        conflicts,
    )

    with _client(storage) as client:
        first = client.get(
            "/replication/conflicts?cursor=0&limit=2",
            headers={"Authorization": "Bearer read-token-123456"},
        )
        second = client.get(
            f"/replication/conflicts?cursor={first.json()['next_cursor']}&limit=2",
            headers={"Authorization": "Bearer read-token-123456"},
        )

    assert [item["subject_id"] for item in first.json()["conflicts"]] == [
        "entity-0",
        "entity-1",
    ]
    assert first.json()["has_more"] is True
    assert first.json()["next_cursor"] == "2"
    assert [item["subject_id"] for item in second.json()["conflicts"]] == ["entity-2"]
    assert second.json()["has_more"] is False
    assert second.json()["next_cursor"] is None
