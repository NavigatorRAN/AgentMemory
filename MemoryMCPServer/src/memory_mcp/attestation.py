"""Nonce-HMAC server proof for Buzz Command service admission."""
from __future__ import annotations

import hashlib
import hmac
import json
import os
import re
from collections.abc import Callable
from dataclasses import dataclass
from typing import Any, Final

from .auth import RequestGuard, RequestLimitError


ATTESTATION_CONTEXT: Final = "buzz-command-attestation-v1"
MAX_ATTESTATION_BODY_BYTES: Final = 256
MAX_ATTESTATION_SECRET_BYTES: Final = 1024
MAX_ATTESTATION_IDENTITY_BYTES: Final = 512
_NONCE_RE: Final = re.compile(r"^[0-9a-f]{64}$")


@dataclass(frozen=True, repr=False)
class AttestationSecret:
    """Validated secret material whose representation is always redacted."""

    _value: bytes

    def __init__(self, value: str | bytes):
        encoded = value.encode("utf-8") if isinstance(value, str) else bytes(value)
        if (
            not 32 <= len(encoded) <= MAX_ATTESTATION_SECRET_BYTES
            or any(byte < 0x20 or byte == 0x7F for byte in encoded)
        ):
            raise ValueError(
                "attestation secret must contain 32-1024 bytes "
                "without ASCII control characters"
            )
        object.__setattr__(self, "_value", encoded)

    @classmethod
    def from_environment(cls, name: str) -> "AttestationSecret | None":
        """Load only an explicitly configured secret, without a fallback."""
        value = os.environ.get(name)
        if value is None or value == "":
            return None
        try:
            return cls(value)
        except ValueError as error:
            raise ValueError(
                f"{name} must contain 32-1024 bytes without ASCII control characters"
            ) from error

    def __repr__(self) -> str:
        return "AttestationSecret([REDACTED])"

    def sha256_digest(self) -> bytes:
        """Return a fixed-length digest for credential-separation checks."""
        return hashlib.sha256(self._value).digest()

    def mac(self, service: str, identity: str, nonce: str) -> str:
        """Return the v1 HMAC over the exact NUL-delimited transcript."""
        _validate_service(service)
        _validate_identity(identity)
        if not _NONCE_RE.fullmatch(nonce):
            raise ValueError("nonce must be 64 lowercase hexadecimal characters")
        transcript = (
            f"{ATTESTATION_CONTEXT}\0{service}\0{identity}\0{nonce}".encode("utf-8")
        )
        digest = hmac.new(self._value, transcript, hashlib.sha256).hexdigest()
        return f"sha256:{digest}"


def _validate_service(service: str) -> None:
    if service not in {"memory", "rag"}:
        raise ValueError("attestation service is invalid")


def _validate_identity(identity: str) -> None:
    if (
        not isinstance(identity, str)
        or not identity
        or len(identity.encode("utf-8")) > MAX_ATTESTATION_IDENTITY_BYTES
        or any(ord(character) < 33 or ord(character) > 126 for character in identity)
    ):
        raise ValueError("attestation identity is invalid")


def _object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError("duplicate JSON member")
        result[key] = value
    return result


def _reject_non_finite_json(_: str) -> Any:
    raise ValueError("non-finite JSON number")


async def _read_request(request: Any, max_body_bytes: int) -> dict[str, str]:
    if request.headers.get("content-type") != "application/json":
        raise RequestLimitError("unsupported_media_type", 415)
    content_lengths = request.headers.getlist("content-length")
    if len(content_lengths) > 1:
        raise RequestLimitError("invalid_request", 400)
    if content_lengths:
        try:
            content_length = int(content_lengths[0])
        except ValueError as error:
            raise RequestLimitError("invalid_request", 400) from error
        if content_length < 0:
            raise RequestLimitError("invalid_request", 400)
        if content_length > max_body_bytes:
            raise RequestLimitError("payload_too_large", 413)

    body = bytearray()
    async for chunk in request.stream():
        if len(body) + len(chunk) > max_body_bytes:
            raise RequestLimitError("payload_too_large", 413)
        body.extend(chunk)
    try:
        value = json.loads(
            bytes(body),
            object_pairs_hook=_object_without_duplicates,
            parse_constant=_reject_non_finite_json,
        )
    except (UnicodeDecodeError, ValueError, json.JSONDecodeError) as error:
        raise RequestLimitError("invalid_request", 400) from error
    if (
        not isinstance(value, dict)
        or set(value) != {"nonce"}
        or not isinstance(value["nonce"], str)
        or not _NONCE_RE.fullmatch(value["nonce"])
    ):
        raise RequestLimitError("invalid_request", 400)
    return value


def install_attestation_route(
    mcp: Any,
    *,
    service: str,
    identity_provider: Callable[[], str],
    secret: AttestationSecret | None,
    guard: RequestGuard,
) -> None:
    """Register the unauthenticated, rate-limited server-proof route."""
    from starlette.requests import Request
    from starlette.responses import JSONResponse

    _validate_service(service)
    max_body_bytes = min(guard.max_body_bytes, MAX_ATTESTATION_BODY_BYTES)

    @mcp.custom_route("/attestation", methods=["POST"])
    async def attestation(request: Request) -> JSONResponse:
        client = request.client.host if request.client else "unknown"
        try:
            guard.check_rate(f"{client}:/attestation")
        except RequestLimitError as error:
            return JSONResponse({"error": error.code}, status_code=error.status_code)
        if secret is None:
            return JSONResponse(
                {"error": "attestation_unavailable"},
                status_code=503,
                headers={"Cache-Control": "no-store"},
            )
        try:
            value = await _read_request(request, max_body_bytes)
            identity = identity_provider()
            _validate_identity(identity)
            return JSONResponse(
                {
                    "service": service,
                    "identity": identity,
                    "nonce": value["nonce"],
                    "mac": secret.mac(service, identity, value["nonce"]),
                },
                headers={"Cache-Control": "no-store"},
            )
        except RequestLimitError as error:
            return JSONResponse({"error": error.code}, status_code=error.status_code)
        except (OSError, RuntimeError, TypeError, ValueError):
            return JSONResponse(
                {"error": "attestation_unavailable"},
                status_code=503,
                headers={"Cache-Control": "no-store"},
            )
