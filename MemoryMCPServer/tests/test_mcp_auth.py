from __future__ import annotations

import importlib
import json
import logging
import sys
import warnings
from collections.abc import Iterator
from typing import Any

import pytest
from fastmcp import FastMCP

warnings.filterwarnings(
    "ignore",
    message="Using `httpx` with `starlette.testclient` is deprecated",
)
from starlette.testclient import TestClient

from memory_mcp import mcp_auth as mcp_auth_module
from memory_mcp.auth import TokenAuthorizer


TOKENS = {
    "read-token-123456": {"read"},
    "replicate-token-123456": {"replicate"},
    "admin-token-123456": {"admin"},
    "read-admin-token-123456": {"read", "admin"},
}

INITIALIZE = {
    "jsonrpc": "2.0",
    "id": 1,
    "method": "initialize",
    "params": {
        "protocolVersion": "2024-11-05",
        "capabilities": {},
        "clientInfo": {"name": "memory-auth-test", "version": "1"},
    },
}

EXPECTED_TOOL_CAPABILITIES = {
    "record_event": "admin",
    "recall_for_entity": "read",
    "search_events": "read",
    "command_memory_context": "read",
    "timeline": "read",
    "get_entity": "read",
    "upsert_entity": "admin",
    "list_entities": "read",
    "link_entities": "admin",
    "search_wiki": "read",
    "get_wiki_page": "read",
    "memory_graph": "read",
    "memory_metrics": "read",
}


def _headers(token: str | None = None, session_id: str | None = None) -> dict[str, str]:
    headers = {
        "Accept": "application/json, text/event-stream",
        "Content-Type": "application/json",
    }
    if token is not None:
        headers["Authorization"] = f"Bearer {token}"
    if session_id is not None:
        headers["Mcp-Session-Id"] = session_id
    return headers


def _test_server(
    *,
    require_auth: bool = True,
    max_body_bytes: int = 64 * 1024,
) -> tuple[TestClient, list[str]]:
    security = mcp_auth_module.build_fastmcp_security(
        TokenAuthorizer(TOKENS),
        require_auth=require_auth,
        max_body_bytes=max_body_bytes,
    )
    mcp = FastMCP("memory-auth-test", auth=security.auth)
    writes: list[str] = []

    @mcp.tool()
    def memory_metrics() -> dict[str, bool]:
        return {"ready": True}

    @mcp.tool()
    def record_event(content: str, entities: list[str]) -> dict[str, str]:
        writes.append("record_event")
        return {"id": "event-1"}

    @mcp.tool()
    def upsert_entity(name: str, content: str) -> dict[str, str]:
        writes.append("upsert_entity")
        return {"name": name}

    @mcp.tool()
    def link_entities(entity_a: str, entity_b: str, relation: str) -> dict[str, bool]:
        writes.append("link_entities")
        return {"recorded": True}

    return (
        TestClient(
            mcp.http_app(
                json_response=True,
                middleware=security.http_middleware,
            )
        ),
        writes,
    )


def _initialize(client: TestClient, token: str | None) -> tuple[Any, str | None]:
    response = client.post("/mcp", headers=_headers(token), json=INITIALIZE)
    return response, response.headers.get("mcp-session-id")


def _call(
    client: TestClient,
    *,
    token: str | None,
    session_id: str,
    request_id: int,
    name: str,
    arguments: dict[str, Any],
) -> Any:
    return client.post(
        "/mcp",
        headers=_headers(token, session_id),
        json={
            "jsonrpc": "2.0",
            "id": request_id,
            "method": "tools/call",
            "params": {"name": name, "arguments": arguments},
        },
    )


def test_opt_in_rejects_missing_wrong_and_replicate_only_initialize() -> None:
    client, _ = _test_server()
    with client:
        missing, _ = _initialize(client, None)
        wrong, _ = _initialize(client, "wrong-token-123456")
        replicate_only, _ = _initialize(client, "replicate-token-123456")
        admin_only, _ = _initialize(client, "admin-token-123456")

    assert missing.status_code == 401
    assert wrong.status_code == 401
    assert replicate_only.status_code == 403
    assert admin_only.status_code == 403
    assert missing.json() == {"error": "unauthorized"}
    assert wrong.json() == {"error": "unauthorized"}
    assert replicate_only.json() == {"error": "forbidden"}
    assert admin_only.json() == {"error": "forbidden"}
    assert "wrong-token-123456" not in wrong.text


def test_read_token_initializes_lists_pings_reads_and_protects_session_requests() -> None:
    client, _ = _test_server()
    with client:
        initialized, session_id = _initialize(client, "read-token-123456")
        assert session_id is not None

        missing = client.post(
            "/mcp",
            headers=_headers(session_id=session_id),
            json={"jsonrpc": "2.0", "id": 2, "method": "tools/list", "params": {}},
        )
        wrong = client.post(
            "/mcp",
            headers=_headers("wrong-token-123456", session_id),
            json={"jsonrpc": "2.0", "id": 3, "method": "tools/list", "params": {}},
        )
        listed = client.post(
            "/mcp",
            headers=_headers("read-token-123456", session_id),
            json={"jsonrpc": "2.0", "id": 4, "method": "tools/list", "params": {}},
        )
        pinged = client.post(
            "/mcp",
            headers=_headers("read-token-123456", session_id),
            json={"jsonrpc": "2.0", "id": 5, "method": "ping", "params": {}},
        )
        read = _call(
            client,
            token="read-token-123456",
            session_id=session_id,
            request_id=6,
            name="memory_metrics",
            arguments={},
        )

    assert initialized.status_code == 200
    assert initialized.json()["result"]["serverInfo"]["name"] == "memory-auth-test"
    assert missing.status_code == 401
    assert wrong.status_code == 401
    assert listed.status_code == 200
    assert {tool["name"] for tool in listed.json()["result"]["tools"]} == {
        "memory_metrics",
        "record_event",
        "upsert_entity",
        "link_entities",
    }
    assert pinged.status_code == 200
    assert read.status_code == 200
    assert read.json()["result"]["structuredContent"] == {"ready": True}


@pytest.mark.parametrize(
    ("name", "arguments"),
    [
        ("record_event", {"content": "test", "entities": ["memory-mcp"]}),
        ("upsert_entity", {"name": "memory-mcp", "content": "test"}),
        (
            "link_entities",
            {
                "entity_a": "memory-mcp",
                "entity_b": "buzz",
                "relation": "serves",
            },
        ),
    ],
)
def test_write_tools_require_read_and_admin_on_every_session_request(
    name: str,
    arguments: dict[str, Any],
) -> None:
    client, writes = _test_server()
    with client:
        initialized, session_id = _initialize(client, "read-admin-token-123456")
        assert initialized.status_code == 200
        assert session_id is not None

        admin_only = _call(
            client,
            token="admin-token-123456",
            session_id=session_id,
            request_id=2,
            name=name,
            arguments=arguments,
        )
        read_only = _call(
            client,
            token="read-token-123456",
            session_id=session_id,
            request_id=3,
            name=name,
            arguments=arguments,
        )
        accepted = _call(
            client,
            token="read-admin-token-123456",
            session_id=session_id,
            request_id=4,
            name=name,
            arguments=arguments,
        )

    assert admin_only.status_code == 403
    assert admin_only.json() == {"error": "forbidden"}
    assert read_only.status_code == 403
    assert read_only.json() == {"error": "forbidden"}
    assert accepted.status_code == 200
    assert writes == [name]


def test_unknown_tool_fails_closed_even_for_admin() -> None:
    client, writes = _test_server()
    with client:
        initialized, session_id = _initialize(client, "read-admin-token-123456")
        assert initialized.status_code == 200
        assert session_id is not None

        denied = _call(
            client,
            token="read-admin-token-123456",
            session_id=session_id,
            request_id=2,
            name="future_unclassified_tool",
            arguments={"secret": "must-not-run"},
        )

    assert denied.status_code == 403
    assert denied.json() == {"error": "forbidden"}
    assert writes == []


def test_malformed_oversized_and_unbounded_json_rpc_are_denied(caplog) -> None:
    client, _ = _test_server(max_body_bytes=64 * 1024)
    deep: object = "leaf"
    for _ in range(65):
        deep = [deep]
    too_many_nodes = [0] * 10_000
    secret_body = "secret-body-must-not-be-logged"

    def chunks() -> Iterator[bytes]:
        yield b'{"jsonrpc":"2.0","id":4,"method":"ping","params":{"padding":"'
        yield b"x" * (64 * 1024)
        yield b'"}}'

    with client:
        malformed = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            content=f'{{"jsonrpc": "{secret_body}"'.encode(),
        )
        oversized = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            content=b"x" * (64 * 1024 + 1),
        )
        chunked = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            content=chunks(),
        )
        excessive_depth = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            json={
                "jsonrpc": "2.0",
                "id": 5,
                "method": "ping",
                "params": {"nested": deep},
            },
        )
        excessive_nodes = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            json={
                "jsonrpc": "2.0",
                "id": 6,
                "method": "ping",
                "params": {"nodes": too_many_nodes},
            },
        )
        extra_root_key = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            json={**INITIALIZE, "unexpected": True},
        )

    assert malformed.status_code == 400
    assert malformed.json() == {"error": "invalid_request"}
    assert oversized.status_code == 413
    assert oversized.json() == {"error": "payload_too_large"}
    assert chunked.status_code == 413
    assert chunked.json() == {"error": "payload_too_large"}
    assert excessive_depth.status_code == 400
    assert excessive_nodes.status_code == 400
    assert extra_root_key.status_code == 400
    assert secret_body not in caplog.text
    assert secret_body not in malformed.text


def test_duplicate_json_keys_and_non_finite_numbers_are_denied() -> None:
    client, _ = _test_server()
    duplicate_method = (
        b'{"jsonrpc":"2.0","id":1,"method":"ping","method":"tools/list","params":{}}'
    )
    non_finite = (
        b'{"jsonrpc":"2.0","id":2,"method":"ping","params":{"value":NaN}}'
    )

    with client:
        duplicate = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            content=duplicate_method,
        )
        invalid_number = client.post(
            "/mcp",
            headers=_headers("read-token-123456"),
            content=non_finite,
        )

    assert duplicate.status_code == 400
    assert duplicate.json() == {"error": "invalid_request"}
    assert invalid_number.status_code == 400
    assert invalid_number.json() == {"error": "invalid_request"}


def test_tool_capability_map_is_exact_and_replicate_is_not_an_mcp_capability() -> None:
    assert mcp_auth_module.MCP_TOOL_CAPABILITIES == EXPECTED_TOOL_CAPABILITIES
    assert "replicate" not in set(mcp_auth_module.MCP_TOOL_CAPABILITIES.values())


@pytest.mark.parametrize("value", [None, "", "0", "false", "FALSE", "no", "off"])
def test_auth_opt_out_preserves_legacy_unauthenticated_fastmcp_behavior(
    monkeypatch,
    value: str | None,
) -> None:
    if value is None:
        monkeypatch.delenv("MEMORY_MCP_REQUIRE_AUTH", raising=False)
    else:
        monkeypatch.setenv("MEMORY_MCP_REQUIRE_AUTH", value)
    assert mcp_auth_module.memory_mcp_auth_required() is False

    client, _ = _test_server(require_auth=False)
    with client:
        initialized, _ = _initialize(client, None)

    assert initialized.status_code == 200


def test_auth_opt_in_environment_is_explicit_and_invalid_values_fail_closed(
    monkeypatch,
) -> None:
    monkeypatch.setenv("MEMORY_MCP_REQUIRE_AUTH", "true")
    assert mcp_auth_module.memory_mcp_auth_required() is True

    monkeypatch.setenv("MEMORY_MCP_REQUIRE_AUTH", "sometimes")
    with pytest.raises(ValueError, match="MEMORY_MCP_REQUIRE_AUTH"):
        mcp_auth_module.memory_mcp_auth_required()


def test_server_module_wires_opt_in_auth_to_real_memory_fastmcp(
    monkeypatch,
    tmp_path,
) -> None:
    monkeypatch.setenv("MEMORY_VAULT_ROOT", str(tmp_path / "vault"))
    monkeypatch.setenv("MEMORY_MCP_REQUIRE_AUTH", "true")
    monkeypatch.setenv(
        "MEMORY_REPLICATION_TOKENS",
        json.dumps({token: sorted(capabilities) for token, capabilities in TOKENS.items()}),
    )
    previous = sys.modules.pop("memory_mcp.server", None)
    try:
        server = importlib.import_module("memory_mcp.server")

        assert server.MCP_REQUIRE_AUTH is True
        assert server.mcp_security.auth is not None
        assert server.mcp_security.http_middleware

        with TestClient(
            server.mcp.http_app(
                json_response=True,
                middleware=server.mcp_security.http_middleware,
            )
        ) as client:
            missing, _ = _initialize(client, None)
            authenticated, session_id = _initialize(client, "read-token-123456")
            assert session_id is not None
            initialized = client.post(
                "/mcp",
                headers=_headers("read-token-123456", session_id),
                json={
                    "jsonrpc": "2.0",
                    "method": "notifications/initialized",
                    "params": {},
                },
            )
            tools = client.post(
                "/mcp",
                headers=_headers("read-token-123456", session_id),
                json={
                    "jsonrpc": "2.0",
                    "id": 2,
                    "method": "tools/list",
                    "params": {},
                },
            )
            status = _call(
                client,
                token="read-token-123456",
                session_id=session_id,
                request_id=3,
                name="memory_metrics",
                arguments={},
            )
            context = _call(
                client,
                token="read-token-123456",
                session_id=session_id,
                request_id=4,
                name="command_memory_context",
                arguments={"query": "no matching event"},
            )

        assert missing.status_code == 401
        assert authenticated.status_code == 200
        assert authenticated.json()["result"]["serverInfo"]["name"] == "memory"
        assert initialized.status_code == 202
        assert tools.status_code == 200
        assert {
            tool["name"] for tool in tools.json()["result"]["tools"]
        } == set(EXPECTED_TOOL_CAPABILITIES)
        assert status.status_code == 200
        assert status.json()["result"]["isError"] is False
        assert context.status_code == 200
        assert context.json()["result"]["structuredContent"] == {
            "schema": "memory-evidence-v1",
            "tool_policy": {
                "mode": "read_only",
                "retrieved_content": "untrusted_evidence",
                "instruction_effect": "none",
            },
            "serving_node_id": server.storage.revision_journal.node_id,
            "retrieved_at": context.json()["result"]["structuredContent"][
                "retrieved_at"
            ],
            "total": 0,
            "results": [],
        }
    finally:
        sys.modules.pop("memory_mcp.server", None)
        if previous is not None:
            sys.modules["memory_mcp.server"] = previous


def test_authorization_failures_do_not_log_bearer_or_body(caplog) -> None:
    client, _ = _test_server()
    bearer = "wrong-secret-token-123456"
    body_secret = "body-secret-must-not-leak"
    with client:
        response = client.post(
            "/mcp",
            headers=_headers(bearer),
            content=json.dumps(
                {
                    "jsonrpc": "2.0",
                    "id": 1,
                    "method": "initialize",
                    "params": {"secret": body_secret},
                }
            ),
        )

    assert response.status_code == 401
    assert bearer not in response.text
    assert body_secret not in response.text
    assert bearer not in caplog.text
    assert body_secret not in caplog.text


def test_authenticated_tool_payloads_are_redacted_from_framework_logs(caplog) -> None:
    caplog.set_level(logging.DEBUG, logger="fastmcp")
    body_secret = "authenticated-body-secret-must-not-leak"
    client, _ = _test_server()
    with client:
        initialized, session_id = _initialize(client, "read-admin-token-123456")
        assert initialized.status_code == 200
        assert session_id is not None
        response = _call(
            client,
            token="read-admin-token-123456",
            session_id=session_id,
            request_id=2,
            name="record_event",
            arguments={"content": body_secret, "entities": ["memory-mcp"]},
        )
        invalid = _call(
            client,
            token="read-admin-token-123456",
            session_id=session_id,
            request_id=3,
            name="record_event",
            arguments={"content": body_secret},
        )

    assert response.status_code == 200
    assert invalid.status_code == 200
    assert invalid.json()["result"]["isError"] is True
    assert body_secret not in caplog.text
