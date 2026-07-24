"""Replicate Memory MCP revisions between authenticated loopback HTTP nodes."""
from __future__ import annotations

import argparse
import ipaddress
import json
import os
import sys
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Any, TextIO
from urllib.parse import urlsplit

import httpx


MAX_RESPONSE_BYTES = 2 * 1024 * 1024
MAX_PAGES = 10_000
TOKEN_ENVIRONMENTS = {
    "local_read": "MEMORY_LOCAL_READ_TOKEN",
    "local_replicate": "MEMORY_LOCAL_REPLICATE_TOKEN",
    "remote_read": "MEMORY_REMOTE_READ_TOKEN",
    "remote_replicate": "MEMORY_REMOTE_REPLICATE_TOKEN",
}


class ReplicationCLIError(RuntimeError):
    """A bounded diagnostic that never includes response bodies or credentials."""

    def __init__(self, code: str, *, usage: bool = False):
        super().__init__(code)
        self.code = code
        self.usage = usage


@dataclass(frozen=True)
class Node:
    url: str
    read_token: str
    replicate_token: str


def _loopback_origin(value: str) -> str:
    try:
        parsed = urlsplit(value)
        address = ipaddress.ip_address(parsed.hostname or "")
        port = parsed.port
    except ValueError as error:
        raise ReplicationCLIError("invalid_endpoint", usage=True) from error
    if (
        parsed.scheme != "http"
        or not address.is_loopback
        or port is None
        or parsed.username is not None
        or parsed.password is not None
        or parsed.path not in {"", "/"}
        or parsed.query
        or parsed.fragment
    ):
        raise ReplicationCLIError("invalid_endpoint", usage=True)
    host = f"[{address.compressed}]" if address.version == 6 else address.compressed
    return f"http://{host}:{port}"


def _token(environment: Mapping[str, str], name: str) -> str:
    value = environment.get(name)
    if not value:
        raise ReplicationCLIError("missing_credentials", usage=True)
    return value


def _request_json(
    client: httpx.Client,
    node: Node,
    method: str,
    path: str,
    *,
    capability: str,
    timeout: float,
    payload: dict[str, Any] | None = None,
) -> dict[str, Any]:
    token = node.read_token if capability == "read" else node.replicate_token
    try:
        with client.stream(
            method,
            f"{node.url}{path}",
            headers={
                "Authorization": f"Bearer {token}",
                "Accept": "application/json",
            },
            json=payload,
            timeout=timeout,
            follow_redirects=False,
        ) as response:
            if response.status_code in {401, 403}:
                raise ReplicationCLIError("authentication_failed")
            if 300 <= response.status_code < 400:
                raise ReplicationCLIError("redirect_refused")
            if not 200 <= response.status_code < 300:
                raise ReplicationCLIError("remote_request_failed")
            content_length = response.headers.get("content-length")
            if content_length:
                try:
                    if int(content_length) > MAX_RESPONSE_BYTES:
                        raise ReplicationCLIError("response_too_large")
                except ValueError as error:
                    raise ReplicationCLIError("invalid_response") from error
            body = bytearray()
            for chunk in response.iter_bytes():
                if len(body) + len(chunk) > MAX_RESPONSE_BYTES:
                    raise ReplicationCLIError("response_too_large")
                body.extend(chunk)
    except httpx.HTTPError as error:
        raise ReplicationCLIError("remote_unavailable") from error
    try:
        value = json.loads(bytes(body))
    except (UnicodeDecodeError, json.JSONDecodeError) as error:
        raise ReplicationCLIError("invalid_response") from error
    if not isinstance(value, dict):
        raise ReplicationCLIError("invalid_response")
    return value


def _readiness(client: httpx.Client, node: Node, timeout: float) -> dict[str, Any]:
    value = _request_json(
        client,
        node,
        "GET",
        "/replication/readiness",
        capability="read",
        timeout=timeout,
    )
    node_id = value.get("node_id")
    if (
        value.get("status") != "ready"
        or value.get("schema_version") != 1
        or not isinstance(node_id, str)
        or not node_id.startswith("node:")
    ):
        raise ReplicationCLIError("invalid_response")
    return value


def _integer(value: Any) -> int:
    if isinstance(value, bool) or not isinstance(value, int):
        raise ReplicationCLIError("invalid_response")
    return value


def replicate(
    operation: str,
    *,
    local: Node,
    remote: Node,
    page_size: int,
    timeout: float,
    client: httpx.Client,
) -> dict[str, Any]:
    """Replicate one direction and acknowledge only fully imported pages."""
    if operation == "pull":
        source, target = remote, local
    elif operation == "push":
        source, target = local, remote
    else:
        raise ReplicationCLIError("invalid_operation", usage=True)

    source_ready = _readiness(client, source, timeout)
    target_ready = _readiness(client, target, timeout)
    source_node_id = str(source_ready["node_id"])
    target_node_id = str(target_ready["node_id"])
    if source_node_id == target_node_id:
        raise ReplicationCLIError("node_identity_collision")

    acknowledged = _request_json(
        client,
        source,
        "POST",
        "/replication/ack",
        capability="replicate",
        timeout=timeout,
        payload={"peer_node_id": target_node_id, "cursor": 0},
    )
    if acknowledged.get("peer_node_id") != target_node_id:
        raise ReplicationCLIError("invalid_response")
    cursor = _integer(acknowledged.get("cursor"))
    if cursor < 0:
        raise ReplicationCLIError("invalid_response")
    from_cursor = cursor
    totals = {
        "accepted": 0,
        "duplicates": 0,
        "conflicts": 0,
        "objects": 0,
        "tombstones": 0,
        "pages": 0,
    }

    for _ in range(MAX_PAGES):
        envelope = _request_json(
            client,
            source,
            "POST",
            "/replication/export",
            capability="replicate",
            timeout=timeout,
            payload={"cursor": cursor, "limit": page_size},
        )
        try:
            envelope_source = str(envelope["source_node_id"])
            envelope_from = _integer(envelope["from_cursor"])
            envelope_to = _integer(envelope["to_cursor"])
            revisions = envelope["revisions"]
            objects = envelope["objects"]
            has_more = envelope["has_more"]
        except (KeyError, TypeError, ValueError) as error:
            raise ReplicationCLIError("invalid_response") from error
        if (
            envelope_source != source_node_id
            or envelope_from != cursor
            or envelope_to < cursor
            or not isinstance(revisions, list)
            or not isinstance(objects, dict)
            or not isinstance(has_more, bool)
            or (has_more and envelope_to == cursor)
            or (revisions and envelope_to == cursor)
        ):
            raise ReplicationCLIError("invalid_response")
        if not revisions:
            if has_more:
                raise ReplicationCLIError("invalid_response")
            break

        imported = _request_json(
            client,
            target,
            "POST",
            "/replication/import",
            capability="replicate",
            timeout=timeout,
            payload={"envelope": envelope},
        )
        try:
            if str(imported["source_node_id"]) != source_node_id:
                raise ReplicationCLIError("invalid_response")
            accepted = _integer(imported["accepted"])
            duplicates = _integer(imported["duplicates"])
            conflicts = _integer(imported["conflicts"])
            imported_cursor = _integer(imported["cursor"])
        except KeyError as error:
            raise ReplicationCLIError("invalid_response") from error
        if (
            min(accepted, duplicates, conflicts) < 0
            or accepted + duplicates != len(revisions)
            or conflicts > accepted
            or imported_cursor != envelope_to
        ):
            raise ReplicationCLIError("invalid_response")

        acknowledged = _request_json(
            client,
            source,
            "POST",
            "/replication/ack",
            capability="replicate",
            timeout=timeout,
            payload={"peer_node_id": target_node_id, "cursor": envelope_to},
        )
        if (
            acknowledged.get("peer_node_id") != target_node_id
            or _integer(acknowledged.get("cursor")) != envelope_to
        ):
            raise ReplicationCLIError("invalid_response")

        totals["accepted"] += accepted
        totals["duplicates"] += duplicates
        totals["conflicts"] += conflicts
        totals["objects"] += len(objects)
        totals["tombstones"] += sum(
            1
            for value in objects.values()
            if isinstance(value, dict) and value.get("kind") == "tombstone"
        )
        totals["pages"] += 1
        cursor = envelope_to
        if not has_more:
            break
    else:
        raise ReplicationCLIError("page_limit_exceeded")

    target_after = _readiness(client, target, timeout)
    if str(target_after["node_id"]) != target_node_id:
        raise ReplicationCLIError("node_identity_changed")
    return {
        "status": "ok",
        "operation": operation,
        "source_node_id": source_node_id,
        "target_node_id": target_node_id,
        "from_cursor": from_cursor,
        "to_cursor": cursor,
        **totals,
        "target_conflict_count": _integer(target_after.get("conflict_count")),
        "last_success": datetime.now(timezone.utc).isoformat(),
    }


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("operation", choices=("pull", "push"))
    parser.add_argument("--local-url", required=True)
    parser.add_argument("--remote-url", required=True)
    parser.add_argument("--page-size", type=int, default=50)
    parser.add_argument("--timeout", type=float, default=30.0)
    return parser


def main(
    argv: Sequence[str] | None = None,
    *,
    environ: Mapping[str, str] | None = None,
    client: httpx.Client | None = None,
    stdout: TextIO | None = None,
    stderr: TextIO | None = None,
) -> int:
    """Run the loopback-only replication CLI."""
    args = _parser().parse_args(argv)
    output = stdout or sys.stdout
    errors = stderr or sys.stderr
    environment = os.environ if environ is None else environ
    owned_client = client is None
    operation = str(args.operation)
    try:
        if not 1 <= args.page_size <= 200 or not 0 < args.timeout <= 300:
            raise ReplicationCLIError("invalid_bounds", usage=True)
        local_url = _loopback_origin(args.local_url)
        remote_url = _loopback_origin(args.remote_url)
        if local_url == remote_url:
            raise ReplicationCLIError("endpoint_collision", usage=True)
        local = Node(
            url=local_url,
            read_token=_token(environment, TOKEN_ENVIRONMENTS["local_read"]),
            replicate_token=_token(
                environment,
                TOKEN_ENVIRONMENTS["local_replicate"],
            ),
        )
        remote = Node(
            url=remote_url,
            read_token=_token(environment, TOKEN_ENVIRONMENTS["remote_read"]),
            replicate_token=_token(
                environment,
                TOKEN_ENVIRONMENTS["remote_replicate"],
            ),
        )
        active_client = client or httpx.Client(trust_env=False, follow_redirects=False)
        result = replicate(
            operation,
            local=local,
            remote=remote,
            page_size=args.page_size,
            timeout=args.timeout,
            client=active_client,
        )
    except ReplicationCLIError as error:
        print(
            json.dumps(
                {
                    "status": "error",
                    "operation": operation,
                    "error": error.code,
                },
                sort_keys=True,
            ),
            file=errors,
        )
        return 2 if error.usage else 1
    finally:
        if owned_client and "active_client" in locals():
            active_client.close()
    print(json.dumps(result, sort_keys=True), file=output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
