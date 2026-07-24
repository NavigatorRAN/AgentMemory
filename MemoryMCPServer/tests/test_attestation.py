from __future__ import annotations

import importlib
import json
import logging
import sys

import pytest
from fastmcp import FastMCP
from starlette.testclient import TestClient

from memory_mcp.attestation import (
    AttestationSecret,
    install_attestation_route,
)
from memory_mcp.auth import RequestGuard


GOLDEN_SECRET = "0123456789abcdef0123456789abcdef"
GOLDEN_NONCE = "0123456789abcdef" * 4
GOLDEN_MAC = "sha256:25000255ceea88f82976f96fc138c761e682715ac239b8c6c33c47c859ad8243"


def _client(
    *,
    secret: AttestationSecret | None,
    identity: str = "node:golden",
    max_body_bytes: int = 256,
    rate_limit: int = 30,
) -> TestClient:
    mcp = FastMCP("test-memory")
    install_attestation_route(
        mcp,
        service="memory",
        identity_provider=lambda: identity,
        secret=secret,
        guard=RequestGuard(
            max_body_bytes=max_body_bytes,
            max_requests=rate_limit,
            window_seconds=60,
        ),
    )
    return TestClient(mcp.http_app(json_response=True))


def test_attestation_route_matches_cross_language_golden_mac_and_exact_shape() -> None:
    with _client(secret=AttestationSecret(GOLDEN_SECRET)) as client:
        response = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            json={"nonce": GOLDEN_NONCE},
        )

    assert response.status_code == 200
    assert response.json() == {
        "service": "memory",
        "identity": "node:golden",
        "nonce": GOLDEN_NONCE,
        "mac": GOLDEN_MAC,
    }


def test_secret_is_explicit_bounded_and_wrong_secret_cannot_match_golden(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.delenv("MEMORY_ATTESTATION_SECRET", raising=False)
    assert AttestationSecret.from_environment("MEMORY_ATTESTATION_SECRET") is None

    monkeypatch.setenv("MEMORY_ATTESTATION_SECRET", "too-short")
    with pytest.raises(ValueError, match="MEMORY_ATTESTATION_SECRET"):
        AttestationSecret.from_environment("MEMORY_ATTESTATION_SECRET")

    wrong = AttestationSecret("fedcba9876543210fedcba9876543210")
    assert wrong.mac("memory", "node:golden", GOLDEN_NONCE) != GOLDEN_MAC


@pytest.mark.parametrize("control", [0x00, 0x01, 0x09, 0x0A, 0x1F, 0x7F])
def test_attestation_secret_rejects_every_ascii_control_character(
    control: int,
) -> None:
    with pytest.raises(ValueError, match="ASCII control"):
        AttestationSecret(b"x" * 16 + bytes([control]) + b"x" * 16)


@pytest.mark.parametrize("boundary", [0x20, 0x7E])
def test_attestation_secret_accepts_printable_ascii_boundaries(boundary: int) -> None:
    secret = AttestationSecret(bytes([boundary]) + b"x" * 31)

    assert "REDACTED" in repr(secret)


def test_unset_secret_fails_closed_without_requiring_bearer() -> None:
    with _client(secret=None) as client:
        response = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            json={"nonce": GOLDEN_NONCE},
        )

    assert response.status_code == 503
    assert response.json() == {"error": "attestation_unavailable"}
    assert "www-authenticate" not in response.headers


@pytest.mark.parametrize(
    ("headers", "body", "status", "error"),
    [
        ({"Content-Type": "text/plain"}, b'{"nonce":"' + b"0" * 64 + b'"}', 415, "unsupported_media_type"),
        ({"Content-Type": "application/json; charset=utf-8"}, b'{"nonce":"' + b"0" * 64 + b'"}', 415, "unsupported_media_type"),
        ({"Content-Type": "application/json"}, b"", 400, "invalid_request"),
        ({"Content-Type": "application/json"}, b"[]", 400, "invalid_request"),
        ({"Content-Type": "application/json"}, b'{"nonce":"ABCDEF"}', 400, "invalid_request"),
        ({"Content-Type": "application/json"}, b'{"nonce":"' + b"0" * 63 + b'"}', 400, "invalid_request"),
        ({"Content-Type": "application/json"}, b'{"nonce":"' + b"0" * 64 + b'","extra":true}', 400, "invalid_request"),
        ({"Content-Type": "application/json"}, b'{"nonce":"' + b"0" * 64 + b'","nonce":"' + b"1" * 64 + b'"}', 400, "invalid_request"),
    ],
)
def test_attestation_rejects_noncanonical_requests(
    headers: dict[str, str],
    body: bytes,
    status: int,
    error: str,
) -> None:
    with _client(secret=AttestationSecret(GOLDEN_SECRET)) as client:
        response = client.post("/attestation", headers=headers, content=body)

    assert response.status_code == status
    assert response.json() == {"error": error}


def test_attestation_enforces_streaming_body_and_rate_bounds() -> None:
    secret = AttestationSecret(GOLDEN_SECRET)
    with _client(secret=secret, max_body_bytes=96) as client:
        oversized = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            content=b'{"nonce":"' + b"0" * 64 + b'","padding":"' + b"x" * 96 + b'"}',
        )
        chunked = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            content=iter([b'{"nonce":"', b"0" * 64, b'","padding":"', b"x" * 96, b'"}']),
        )
    with _client(secret=secret, rate_limit=1) as client:
        first = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            json={"nonce": GOLDEN_NONCE},
        )
        limited = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            json={"nonce": "0" * 64},
        )

    assert oversized.status_code == 413
    assert oversized.json() == {"error": "payload_too_large"}
    assert chunked.status_code == 413
    assert chunked.json() == {"error": "payload_too_large"}
    assert first.status_code == 200
    assert limited.status_code == 429
    assert limited.json() == {"error": "rate_limited"}


def test_attestation_failures_and_secret_repr_never_expose_secret(
    caplog: pytest.LogCaptureFixture,
) -> None:
    caplog.set_level(logging.DEBUG)
    secret = AttestationSecret(GOLDEN_SECRET)
    with _client(secret=secret) as client:
        response = client.post(
            "/attestation",
            headers={"Content-Type": "application/json"},
            content=b'{"nonce":"not-valid"}',
        )

    assert response.status_code == 400
    assert GOLDEN_SECRET not in response.text
    assert GOLDEN_SECRET not in caplog.text
    assert GOLDEN_SECRET not in repr(secret)


def test_real_memory_server_exposes_attestation_with_stable_node_identity(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path,
) -> None:
    monkeypatch.setenv("MEMORY_VAULT_ROOT", str(tmp_path / "vault"))
    monkeypatch.setenv("MEMORY_NODE_ID", "node:real-route")
    monkeypatch.setenv("MEMORY_ATTESTATION_SECRET", GOLDEN_SECRET)
    monkeypatch.setenv("MEMORY_MCP_REQUIRE_AUTH", "true")
    monkeypatch.setenv(
        "MEMORY_REPLICATION_TOKENS",
        json.dumps({"read-token-123456": ["read"]}),
    )
    previous = sys.modules.pop("memory_mcp.server", None)
    try:
        server = importlib.import_module("memory_mcp.server")
        with TestClient(
            server.mcp.http_app(
                json_response=True,
                middleware=server.mcp_security.http_middleware,
            )
        ) as client:
            response = client.post(
                "/attestation",
                headers={"Content-Type": "application/json"},
                json={"nonce": GOLDEN_NONCE},
            )
    finally:
        sys.modules.pop("memory_mcp.server", None)
        if previous is not None:
            sys.modules["memory_mcp.server"] = previous

    assert response.status_code == 200
    assert response.json()["identity"] == "node:real-route"
    assert set(response.json()) == {"service", "identity", "nonce", "mac"}


@pytest.mark.parametrize(
    ("variable", "value"),
    [
        (
            "MEMORY_REPLICATION_TOKENS",
            json.dumps({GOLDEN_SECRET: ["read"]}),
        ),
        ("MEMORY_REPLICATION_READ_TOKEN", GOLDEN_SECRET),
        ("MEMORY_REPLICATION_REPLICATE_TOKEN", GOLDEN_SECRET),
        ("MEMORY_REPLICATION_ADMIN_TOKEN", GOLDEN_SECRET),
    ],
)
def test_real_memory_server_rejects_attestation_secret_reused_as_any_bearer(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path,
    variable: str,
    value: str,
) -> None:
    monkeypatch.setenv("MEMORY_VAULT_ROOT", str(tmp_path / "vault"))
    monkeypatch.setenv("MEMORY_ATTESTATION_SECRET", GOLDEN_SECRET)
    for token_variable in (
        "MEMORY_REPLICATION_TOKENS",
        "MEMORY_REPLICATION_READ_TOKEN",
        "MEMORY_REPLICATION_REPLICATE_TOKEN",
        "MEMORY_REPLICATION_ADMIN_TOKEN",
    ):
        monkeypatch.delenv(token_variable, raising=False)
    monkeypatch.setenv(variable, value)
    previous = sys.modules.pop("memory_mcp.server", None)
    try:
        with pytest.raises(ValueError, match="independent") as failure:
            importlib.import_module("memory_mcp.server")
    finally:
        sys.modules.pop("memory_mcp.server", None)
        if previous is not None:
            sys.modules["memory_mcp.server"] = previous

    assert GOLDEN_SECRET not in str(failure.value)
