"""Opt-in authentication and request bounds for FastMCP Streamable HTTP."""
from __future__ import annotations

import hashlib
import json
import logging
import math
import os
from dataclasses import dataclass
from types import MappingProxyType
from typing import Any, Final

from fastmcp.server.auth import AccessToken, TokenVerifier
from starlette.middleware import Middleware
from starlette.responses import JSONResponse
from starlette.types import ASGIApp, Message, Receive, Scope, Send

from .auth import AuthenticationError, RequestLimitError, TokenAuthorizer


MAX_MCP_JSON_DEPTH: Final = 64
MAX_MCP_JSON_NODES: Final = 10_000
MAX_MCP_BODY_BYTES: Final = 2 * 1024 * 1024
MCP_TOOL_CAPABILITIES: Final = MappingProxyType(
    {
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
)


class MemoryMcpTokenVerifier(TokenVerifier):
    """Adapt replication bearer capabilities to FastMCP authentication."""

    def __init__(self, authorizer: TokenAuthorizer):
        super().__init__(required_scopes=[])
        self._authorizer = authorizer

    async def verify_token(self, token: str) -> AccessToken | None:
        try:
            capabilities = self._authorizer.authenticate_token(token)
        except AuthenticationError:
            return None
        token_fingerprint = hashlib.sha256(token.encode("utf-8")).hexdigest()[:16]
        return AccessToken(
            token=token,
            client_id=f"memory-mcp-{token_fingerprint}",
            scopes=sorted(capabilities),
            claims={},
        )


class _FastMcpPayloadRedactionFilter(logging.Filter):
    """Remove request-derived values from FastMCP framework records."""

    def filter(self, record: logging.LogRecord) -> bool:
        message = str(record.msg)
        arguments = record.args if isinstance(record.args, tuple) else ()
        if (
            record.name == "fastmcp.server.mixins.mcp_operations"
            and "Handler called:" in message
            and " with %s" in message
            and arguments
        ):
            record.msg = message.replace(" with %s", " [arguments redacted]")
            record.args = arguments[:1]
        elif (
            record.name == "fastmcp.server.server"
            and message == "Invalid arguments for tool %r: %s"
            and arguments
        ):
            record.msg = "Invalid arguments for tool %r: [details redacted]"
            record.args = arguments[:1]
        if (
            record.name == "fastmcp.server.server"
            and message.startswith("Error calling tool ")
        ):
            record.exc_info = None
            record.exc_text = None
        return True


def _install_fastmcp_log_redaction() -> None:
    for name in (
        "fastmcp.server.mixins.mcp_operations",
        "fastmcp.server.server",
    ):
        logger = logging.getLogger(name)
        if not any(
            isinstance(item, _FastMcpPayloadRedactionFilter)
            for item in logger.filters
        ):
            logger.addFilter(_FastMcpPayloadRedactionFilter())


def memory_mcp_auth_required() -> bool:
    """Read the explicit MCP auth opt-in, rejecting ambiguous values."""
    value = os.environ.get("MEMORY_MCP_REQUIRE_AUTH")
    if value is None:
        return False
    normalized = value.strip().lower()
    if normalized in {"", "0", "false", "no", "off"}:
        return False
    if normalized in {"1", "true", "yes", "on"}:
        return True
    raise ValueError("MEMORY_MCP_REQUIRE_AUTH must be a boolean")


def _bounded_json(value: Any) -> bool:
    nodes = 0
    stack: list[tuple[Any, int]] = [(value, 0)]
    while stack:
        current, depth = stack.pop()
        nodes += 1
        if nodes > MAX_MCP_JSON_NODES or depth > MAX_MCP_JSON_DEPTH:
            return False
        if current is None or isinstance(current, (str, bool, int)):
            continue
        if isinstance(current, float):
            if not math.isfinite(current):
                return False
            continue
        if isinstance(current, list):
            stack.extend((item, depth + 1) for item in current)
            continue
        if isinstance(current, dict) and all(
            isinstance(key, str) for key in current
        ):
            stack.extend((item, depth + 1) for item in current.values())
            continue
        return False
    return True


def _json_rpc_capability(value: Any) -> str | None:
    if (
        not isinstance(value, dict)
        or not set(value).issubset({"jsonrpc", "id", "method", "params"})
        or value.get("jsonrpc") != "2.0"
        or not isinstance(value.get("method"), str)
        or not 1 <= len(value["method"]) <= 128
        or any(ord(character) < 32 for character in value["method"])
        or not _bounded_json(value)
    ):
        raise RequestLimitError("invalid_request", 400)
    request_id = value.get("id")
    if isinstance(request_id, bool) or (
        request_id is not None
        and not isinstance(request_id, (str, int))
    ):
        raise RequestLimitError("invalid_request", 400)
    if isinstance(request_id, str) and len(request_id) > 256:
        raise RequestLimitError("invalid_request", 400)
    if isinstance(request_id, int) and abs(request_id) > (2**53 - 1):
        raise RequestLimitError("invalid_request", 400)
    params = value.get("params", {})
    if not isinstance(params, dict):
        raise RequestLimitError("invalid_request", 400)
    if value["method"] != "tools/call":
        return "read"
    if (
        not set(params).issubset({"name", "arguments", "_meta"})
        or not isinstance(params.get("name"), str)
        or not isinstance(params.get("arguments", {}), dict)
    ):
        raise RequestLimitError("invalid_request", 400)
    return MCP_TOOL_CAPABILITIES.get(params["name"])


def _json_object_without_duplicates(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError("duplicate JSON key")
        value[key] = item
    return value


def _reject_non_finite_json(_: str) -> Any:
    raise ValueError("non-finite JSON number")


async def _read_bounded_body(
    receive: Receive,
    *,
    max_body_bytes: int,
) -> bytes:
    body = bytearray()
    while True:
        message = await receive()
        if message["type"] == "http.disconnect":
            raise RequestLimitError("invalid_request", 400)
        if message["type"] != "http.request":
            continue
        chunk = message.get("body", b"")
        if len(body) + len(chunk) > max_body_bytes:
            raise RequestLimitError("payload_too_large", 413)
        body.extend(chunk)
        if not message.get("more_body", False):
            return bytes(body)


class MemoryMcpHttpMiddleware:
    """Bound and authorize every request to the Streamable HTTP MCP surface."""

    def __init__(
        self,
        app: ASGIApp,
        *,
        authorizer: TokenAuthorizer,
        max_body_bytes: int = MAX_MCP_BODY_BYTES,
    ):
        self._app = app
        self._authorizer = authorizer
        self._max_body_bytes = max(1, min(int(max_body_bytes), MAX_MCP_BODY_BYTES))

    @staticmethod
    def _headers(scope: Scope, name: bytes) -> list[str]:
        return [
            value.decode("latin-1")
            for key, value in scope.get("headers", [])
            if key.lower() == name
        ]

    @staticmethod
    async def _error(
        scope: Scope,
        receive: Receive,
        send: Send,
        *,
        code: str,
        status_code: int,
    ) -> None:
        headers = {"Cache-Control": "no-store"}
        if status_code == 401:
            headers["WWW-Authenticate"] = "Bearer"
        await JSONResponse(
            {"error": code},
            status_code=status_code,
            headers=headers,
        )(scope, receive, send)

    async def __call__(self, scope: Scope, receive: Receive, send: Send) -> None:
        if scope["type"] != "http" or scope.get("path") not in {"/mcp", "/mcp/"}:
            await self._app(scope, receive, send)
            return

        authorization_values = self._headers(scope, b"authorization")
        authorization = (
            authorization_values[0] if len(authorization_values) == 1 else None
        )
        try:
            capabilities = self._authorizer.authenticate(authorization)
        except AuthenticationError:
            await self._error(
                scope,
                receive,
                send,
                code="unauthorized",
                status_code=401,
            )
            return

        required_capability = "read"
        replay_body: bytes | None = None
        if str(scope.get("method", "")).upper() == "POST":
            content_lengths = self._headers(scope, b"content-length")
            if len(content_lengths) > 1:
                await self._error(
                    scope,
                    receive,
                    send,
                    code="invalid_request",
                    status_code=400,
                )
                return
            if content_lengths:
                try:
                    content_length = int(content_lengths[0])
                except ValueError:
                    content_length = -1
                if content_length < 0:
                    await self._error(
                        scope,
                        receive,
                        send,
                        code="invalid_request",
                        status_code=400,
                    )
                    return
                if content_length > self._max_body_bytes:
                    await self._error(
                        scope,
                        receive,
                        send,
                        code="payload_too_large",
                        status_code=413,
                    )
                    return
            try:
                replay_body = await _read_bounded_body(
                    receive,
                    max_body_bytes=self._max_body_bytes,
                )
                value = json.loads(
                    replay_body,
                    object_pairs_hook=_json_object_without_duplicates,
                    parse_constant=_reject_non_finite_json,
                )
                required_capability = _json_rpc_capability(value)
            except (UnicodeDecodeError, ValueError):
                await self._error(
                    scope,
                    receive,
                    send,
                    code="invalid_request",
                    status_code=400,
                )
                return
            except RequestLimitError as error:
                await self._error(
                    scope,
                    receive,
                    send,
                    code=error.code,
                    status_code=error.status_code,
                )
                return

        if (
            required_capability is None
            or "read" not in capabilities
            or required_capability not in capabilities
        ):
            await self._error(
                scope,
                receive,
                send,
                code="forbidden",
                status_code=403,
            )
            return

        if replay_body is None:
            await self._app(scope, receive, send)
            return

        delivered = False

        async def replay_receive() -> Message:
            nonlocal delivered
            if not delivered:
                delivered = True
                return {
                    "type": "http.request",
                    "body": replay_body,
                    "more_body": False,
                }
            return await receive()

        await self._app(scope, replay_receive, send)


@dataclass(frozen=True)
class FastMcpSecurity:
    auth: TokenVerifier | None
    http_middleware: list[Middleware]


def build_fastmcp_security(
    authorizer: TokenAuthorizer,
    *,
    require_auth: bool,
    max_body_bytes: int = MAX_MCP_BODY_BYTES,
) -> FastMcpSecurity:
    """Build matching FastMCP authentication and HTTP capability enforcement."""
    if not require_auth:
        return FastMcpSecurity(auth=None, http_middleware=[])
    _install_fastmcp_log_redaction()
    return FastMcpSecurity(
        auth=MemoryMcpTokenVerifier(authorizer),
        http_middleware=[
            Middleware(
                MemoryMcpHttpMiddleware,
                authorizer=authorizer,
                max_body_bytes=max_body_bytes,
            )
        ],
    )
