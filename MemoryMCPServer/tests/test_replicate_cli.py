from __future__ import annotations

import json
import warnings

from fastmcp import FastMCP
import httpx
import pytest

warnings.filterwarnings(
    "ignore",
    message="Using `httpx` with `starlette.testclient` is deprecated",
)
from starlette.testclient import TestClient

from memory_mcp.auth import RequestGuard, TokenAuthorizer
from memory_mcp.replicate_cli import main
from memory_mcp.replication import install_replication_routes
from memory_mcp.revisions import canonical_json_bytes
from memory_mcp.storage import Storage


LOCAL_URL = "http://127.0.0.1:18006"
REMOTE_URL = "http://[::1]:28006"
TOKENS = {
    "MEMORY_LOCAL_READ_TOKEN": "local-read-secret",
    "MEMORY_LOCAL_REPLICATE_TOKEN": "local-replicate-secret",
    "MEMORY_REMOTE_READ_TOKEN": "remote-read-secret",
    "MEMORY_REMOTE_REPLICATE_TOKEN": "remote-replicate-secret",
}


class ReplicationNetwork:
    def __init__(self, local: Storage, remote: Storage):
        self.nodes = {
            "127.0.0.1:18006": (
                local,
                TOKENS["MEMORY_LOCAL_READ_TOKEN"],
                TOKENS["MEMORY_LOCAL_REPLICATE_TOKEN"],
            ),
            "[::1]:28006": (
                remote,
                TOKENS["MEMORY_REMOTE_READ_TOKEN"],
                TOKENS["MEMORY_REMOTE_REPLICATE_TOKEN"],
            ),
        }
        self.fail_once: tuple[str, str] | None = None
        self.fail_after_import = False

    def handler(self, request: httpx.Request) -> httpx.Response:
        storage, read_token, replicate_token = self.nodes[request.url.netloc.decode()]
        path = request.url.path
        token = request.headers.get("authorization", "").removeprefix("Bearer ")
        required = read_token if path == "/replication/readiness" else replicate_token
        if token != required:
            return httpx.Response(
                401,
                json={"error": f"unauthorized:{token}"},
                request=request,
            )
        if self.fail_once == (request.url.netloc.decode(), path):
            self.fail_once = None
            raise httpx.ConnectError("secret transport detail", request=request)

        body = json.loads(request.content or b"{}")
        journal = storage.revision_journal
        if path == "/replication/readiness":
            payload = journal.readiness()
        elif path == "/replication/ack":
            payload = journal.acknowledge(
                body["peer_node_id"],
                int(body["cursor"]),
            )
        elif path == "/replication/export":
            payload = journal.export_envelope(
                cursor=int(body["cursor"]),
                limit=int(body["limit"]),
            )
        elif path == "/replication/import":
            payload = journal.import_envelope(body["envelope"])
            if self.fail_after_import:
                self.fail_after_import = False
                raise httpx.ConnectError("response lost after import", request=request)
        else:
            raise AssertionError(f"unexpected path: {path}")
        return httpx.Response(200, json=payload, request=request)

    def client(self) -> httpx.Client:
        return httpx.Client(transport=httpx.MockTransport(self.handler))


class InstalledRouteTransport(httpx.BaseTransport):
    """Route HTTPX requests through actual installed FastMCP route apps."""

    def __init__(self, clients: dict[str, TestClient]):
        self.clients = clients
        self.import_body_sizes: list[int] = []

    def handle_request(self, request: httpx.Request) -> httpx.Response:
        body = request.read()
        if request.url.path == "/replication/import":
            self.import_body_sizes.append(len(body))
        response = self.clients[request.url.netloc.decode()].request(
            request.method,
            request.url.raw_path.decode(),
            headers=dict(request.headers),
            content=body,
        )
        return httpx.Response(
            response.status_code,
            headers=response.headers,
            content=response.content,
            request=request,
        )


def _installed_client(
    storage: Storage,
    *,
    read_token: str,
    replicate_token: str,
    max_body_bytes: int,
) -> TestClient:
    mcp = FastMCP("replicate-cli-route-test")
    install_replication_routes(
        mcp,
        storage,
        TokenAuthorizer(
            {
                read_token: {"read"},
                replicate_token: {"replicate"},
            }
        ),
        RequestGuard(max_body_bytes=max_body_bytes),
    )
    return TestClient(mcp.http_app(json_response=True))


def _run(
    operation: str,
    network: ReplicationNetwork,
    capsys,
    *,
    page_size: int = 50,
    environment: dict[str, str] | None = None,
):
    with network.client() as client:
        exit_code = main(
            [
                operation,
                "--local-url",
                LOCAL_URL,
                "--remote-url",
                REMOTE_URL,
                "--page-size",
                str(page_size),
            ],
            environ=environment or TOKENS,
            client=client,
        )
    captured = capsys.readouterr()
    payload = json.loads(captured.out or captured.err)
    return exit_code, payload, captured


def _record(storage: Storage, content: str) -> None:
    storage.record_event(
        content=content,
        entities=["memory-mcp"],
        event_date="2026-07-24T10:00:00+00:00",
        tags=["replication"],
        agent="CODEX",
    )


@pytest.mark.parametrize(
    "endpoint",
    [
        "https://127.0.0.1:8006",
        "http://localhost:8006",
        "http://192.168.1.26:8006",
        "http://user:secret@127.0.0.1:8006",
        "http://127.0.0.1:8006/replication",
        "http://127.0.0.1:8006?token=secret",
    ],
)
def test_cli_rejects_every_endpoint_except_a_literal_loopback_http_origin(
    tmp_path,
    capsys,
    endpoint,
):
    network = ReplicationNetwork(
        Storage(tmp_path / "local", node_id="node:local"),
        Storage(tmp_path / "remote", node_id="node:remote"),
    )
    with network.client() as client:
        exit_code = main(
            [
                "pull",
                "--local-url",
                endpoint,
                "--remote-url",
                REMOTE_URL,
            ],
            environ=TOKENS,
            client=client,
        )

    diagnostic = capsys.readouterr()
    assert exit_code == 2
    assert diagnostic.out == ""
    assert json.loads(diagnostic.err)["error"] == "invalid_endpoint"
    assert "secret" not in diagnostic.err


def test_pull_transfers_pages_and_tombstones_from_remote_to_local(tmp_path, capsys):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    remote.upsert_entity("temporary", "Delete me", {}, "create")
    _record(remote, "Remote event")
    remote.revision_journal.tombstone("entity", "temporary")
    network = ReplicationNetwork(local, remote)

    exit_code, payload, _ = _run("pull", network, capsys, page_size=1)

    assert exit_code == 0
    assert payload == {
        "accepted": 3,
        "conflicts": 0,
        "duplicates": 0,
        "from_cursor": 0,
        "last_success": payload["last_success"],
        "objects": 3,
        "operation": "pull",
        "pages": 3,
        "source_node_id": "node:remote",
        "status": "ok",
        "target_conflict_count": 0,
        "target_node_id": "node:local",
        "to_cursor": 3,
        "tombstones": 1,
    }
    assert local.read_entity("temporary") is None
    assert [event["content"] for event in local.iter_events()] == ["Remote event"]
    assert remote.revision_journal.acknowledged_cursor("node:local") == 3


def test_push_transfers_local_writes_to_remote(tmp_path, capsys):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    _record(local, "Local event")
    network = ReplicationNetwork(local, remote)

    exit_code, payload, _ = _run("push", network, capsys)

    assert exit_code == 0
    assert payload["source_node_id"] == "node:local"
    assert payload["target_node_id"] == "node:remote"
    assert payload["accepted"] == 1
    assert next(remote.iter_events())["content"] == "Local event"


def test_sync_resumes_from_the_durable_source_acknowledgement(tmp_path, capsys):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    for index in range(3):
        _record(remote, f"Event {index}")
    first = remote.revision_journal.export_envelope(cursor=0, limit=1)
    local.revision_journal.import_envelope(first)
    remote.revision_journal.acknowledge("node:local", first["to_cursor"])
    network = ReplicationNetwork(local, remote)

    exit_code, payload, _ = _run("pull", network, capsys, page_size=1)

    assert exit_code == 0
    assert payload["from_cursor"] == 1
    assert payload["to_cursor"] == 3
    assert payload["accepted"] == 2
    assert len(list(local.iter_events())) == 3


def test_retry_after_lost_import_response_is_duplicate_and_then_acknowledged(
    tmp_path,
    capsys,
):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    _record(remote, "Delivered before response loss")
    network = ReplicationNetwork(local, remote)
    network.fail_after_import = True

    failed, error, captured = _run("pull", network, capsys)

    assert failed == 1
    assert error["error"] == "remote_unavailable"
    assert "secret" not in captured.err
    assert len(list(local.iter_events())) == 1
    assert remote.revision_journal.acknowledged_cursor("node:local") == 0

    retried, payload, _ = _run("pull", network, capsys)

    assert retried == 0
    assert payload["accepted"] == 0
    assert payload["duplicates"] == 1
    assert remote.revision_journal.acknowledged_cursor("node:local") == 1


def test_interrupted_export_leaves_cursor_and_target_unchanged_then_resumes(
    tmp_path,
    capsys,
):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    _record(remote, "Not delivered during interruption")
    network = ReplicationNetwork(local, remote)
    network.fail_once = ("[::1]:28006", "/replication/export")

    failed, _, _ = _run("pull", network, capsys)

    assert failed == 1
    assert list(local.iter_events()) == []
    assert remote.revision_journal.acknowledged_cursor("node:local") == 0

    retried, payload, _ = _run("pull", network, capsys)

    assert retried == 0
    assert payload["accepted"] == 1


def test_divergent_entity_revision_is_reported_as_a_visible_conflict(tmp_path, capsys):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    remote.upsert_entity("course", "Shared base", {}, "create")
    base = remote.revision_journal.export_envelope(cursor=0, limit=10)
    local.revision_journal.import_envelope(base)
    remote.revision_journal.acknowledge("node:local", base["to_cursor"])
    local.upsert_entity("course", "Local branch", {}, "replace")
    remote.upsert_entity("course", "Remote branch", {}, "replace")
    network = ReplicationNetwork(local, remote)

    exit_code, payload, _ = _run("push", network, capsys)

    assert exit_code == 0
    assert payload["conflicts"] == 1
    assert payload["target_conflict_count"] == 1
    assert remote.revision_journal.conflict_for("entity", "course") is not None


def test_authentication_failure_and_server_body_are_redacted(tmp_path, capsys):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    network = ReplicationNetwork(local, remote)
    environment = {**TOKENS, "MEMORY_REMOTE_READ_TOKEN": "wrong-super-secret"}

    exit_code, payload, captured = _run(
        "pull",
        network,
        capsys,
        environment=environment,
    )

    assert exit_code == 1
    assert payload == {
        "error": "authentication_failed",
        "operation": "pull",
        "status": "error",
    }
    assert "wrong-super-secret" not in captured.err
    assert "unauthorized:" not in captured.err


def test_entry_point_exports_only_pages_that_fit_the_installed_import_route(
    tmp_path,
    capsys,
):
    local = Storage(tmp_path / "local", node_id="node:local")
    remote = Storage(tmp_path / "remote", node_id="node:remote")
    for index in range(4):
        _record(remote, f"Boundary event {index}: " + "x" * 200)

    unbounded = remote.revision_journal.export_envelope(cursor=0, limit=50)
    request_limit = len(canonical_json_bytes(unbounded))
    assert 1024 < request_limit < 2 * 1024 * 1024
    local.revision_journal.max_envelope_bytes = request_limit
    remote.revision_journal.max_envelope_bytes = request_limit

    with (
        _installed_client(
            local,
            read_token=TOKENS["MEMORY_LOCAL_READ_TOKEN"],
            replicate_token=TOKENS["MEMORY_LOCAL_REPLICATE_TOKEN"],
            max_body_bytes=request_limit,
        ) as local_client,
        _installed_client(
            remote,
            read_token=TOKENS["MEMORY_REMOTE_READ_TOKEN"],
            replicate_token=TOKENS["MEMORY_REMOTE_REPLICATE_TOKEN"],
            max_body_bytes=request_limit,
        ) as remote_client,
    ):
        transport = InstalledRouteTransport(
            {
                "127.0.0.1:18006": local_client,
                "[::1]:28006": remote_client,
            }
        )
        with httpx.Client(transport=transport) as client:
            exit_code = main(
                [
                    "pull",
                    "--local-url",
                    LOCAL_URL,
                    "--remote-url",
                    REMOTE_URL,
                ],
                environ=TOKENS,
                client=client,
            )

    captured = capsys.readouterr()
    assert exit_code == 0, captured.err
    payload = json.loads(captured.out)
    assert payload["accepted"] == 4
    assert payload["pages"] >= 2
    assert transport.import_body_sizes
    assert max(transport.import_body_sizes) <= request_limit
