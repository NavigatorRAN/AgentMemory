"""Capability authentication and request bounds for replication APIs."""
from __future__ import annotations

import hashlib
import hmac
import json
import os
import threading
import time
from collections import defaultdict, deque
from dataclasses import dataclass
from typing import Any


class AuthenticationError(RuntimeError):
    """A redacted authentication failure."""

    def __init__(self, *, forbidden: bool = False):
        super().__init__("unauthorized")
        self.forbidden = forbidden


class RequestLimitError(RuntimeError):
    """A request bound violation safe to map to a generic HTTP error."""

    def __init__(self, code: str, status_code: int):
        super().__init__(code)
        self.code = code
        self.status_code = status_code


class TokenAuthorizer:
    """Verify bearer tokens in constant time and preserve capability boundaries."""

    def __init__(self, tokens: dict[str, set[str] | list[str] | tuple[str, ...]]):
        prepared: list[tuple[bytes, frozenset[str]]] = []
        for token, capabilities in tokens.items():
            if not isinstance(token, str) or not 16 <= len(token) <= 256:
                raise ValueError("replication tokens must be 16-256 characters")
            capability_set = frozenset(str(item) for item in capabilities)
            if not capability_set or not capability_set <= {"read", "replicate", "admin"}:
                raise ValueError("replication token capabilities are invalid")
            prepared.append(
                (hashlib.sha256(token.encode("utf-8")).digest(), capability_set)
            )
        self._tokens = tuple(prepared)

    @classmethod
    def from_environment(cls) -> "TokenAuthorizer":
        """Load explicit tokens without inventing a compatibility credential."""
        tokens: dict[str, set[str]] = {}
        combined = os.environ.get("MEMORY_REPLICATION_TOKENS")
        if combined:
            try:
                value = json.loads(combined)
            except json.JSONDecodeError as error:
                raise ValueError("MEMORY_REPLICATION_TOKENS must be JSON") from error
            if not isinstance(value, dict):
                raise ValueError("MEMORY_REPLICATION_TOKENS must be an object")
            for token, capabilities in value.items():
                if not isinstance(capabilities, list):
                    raise ValueError("replication token capabilities must be arrays")
                tokens[str(token)] = {str(item) for item in capabilities}
        for capability, variable in (
            ("read", "MEMORY_REPLICATION_READ_TOKEN"),
            ("replicate", "MEMORY_REPLICATION_REPLICATE_TOKEN"),
            ("admin", "MEMORY_REPLICATION_ADMIN_TOKEN"),
        ):
            token = os.environ.get(variable)
            if token:
                tokens.setdefault(token, set()).add(capability)
        return cls(tokens)

    def require(self, authorization: str | None, capability: str) -> dict[str, str]:
        if capability not in {"read", "replicate", "admin"}:
            raise ValueError("unknown capability")
        presented = hashlib.sha256(b"").digest()
        header_valid = False
        if isinstance(authorization, str) and authorization.startswith("Bearer "):
            candidate = authorization[7:]
            if candidate and len(candidate) <= 256 and "\x00" not in candidate:
                presented = hashlib.sha256(candidate.encode("utf-8")).digest()
                header_valid = True

        matched_capabilities: frozenset[str] = frozenset()
        matched = False
        for expected, capabilities in self._tokens:
            equal = hmac.compare_digest(presented, expected)
            if equal:
                matched = True
                matched_capabilities = capabilities
        if not header_valid or not matched:
            raise AuthenticationError()
        if capability not in matched_capabilities:
            raise AuthenticationError(forbidden=True)
        return {"capability": capability}


@dataclass
class RequestGuard:
    """Bound JSON bodies and requests per caller/window."""

    max_body_bytes: int = 2 * 1024 * 1024
    max_requests: int = 120
    window_seconds: int = 60

    def __post_init__(self) -> None:
        self.max_body_bytes = max(1, min(int(self.max_body_bytes), 2 * 1024 * 1024))
        self.max_requests = max(1, min(int(self.max_requests), 10_000))
        self.window_seconds = max(1, min(int(self.window_seconds), 3600))
        self._requests: dict[str, deque[float]] = defaultdict(deque)
        self._lock = threading.Lock()

    def check_rate(self, key: str) -> None:
        now = time.monotonic()
        threshold = now - self.window_seconds
        with self._lock:
            bucket = self._requests[key]
            while bucket and bucket[0] <= threshold:
                bucket.popleft()
            if len(bucket) >= self.max_requests:
                raise RequestLimitError("rate_limited", 429)
            bucket.append(now)

    async def read_json(
        self,
        request: Any,
        *,
        allowed_keys: set[str],
    ) -> dict[str, Any]:
        content_length = request.headers.get("content-length")
        if content_length:
            try:
                if int(content_length) > self.max_body_bytes:
                    raise RequestLimitError("payload_too_large", 413)
            except ValueError as error:
                raise RequestLimitError("invalid_request", 400) from error
        body = bytearray()
        async for chunk in request.stream():
            if len(body) + len(chunk) > self.max_body_bytes:
                raise RequestLimitError("payload_too_large", 413)
            body.extend(chunk)
        if not body:
            value: Any = {}
        else:
            try:
                value = json.loads(bytes(body))
            except (UnicodeDecodeError, json.JSONDecodeError) as error:
                raise RequestLimitError("invalid_request", 400) from error
        if not isinstance(value, dict) or not set(value).issubset(allowed_keys):
            raise RequestLimitError("invalid_request", 400)
        return value
