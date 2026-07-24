"""Exact Buzz Command Console v1 wire adapters.

The replication journal uses a storage-oriented internal schema.  Task 4 and
Task 6 consumers must use these adapters, whose output has the exact closed
shape accepted by Buzz's ``parseMemoryRevision`` and
``parseReplicationEnvelope`` functions.
"""
from __future__ import annotations

import math
from datetime import datetime
from typing import Any

from .revisions import ImmutableObject, MemoryRevision, canonical_json_bytes, sha256_id


BUZZ_MEMORY_REVISION_KEYS = frozenset(
    {
        "kind",
        "version",
        "classification",
        "entityId",
        "eventId",
        "parentRevisionIds",
        "nodeId",
        "timestamp",
        "hashes",
        "tombstone",
        "cursor",
        "content",
    }
)
BUZZ_REPLICATION_ENVELOPE_KEYS = frozenset(
    {
        "kind",
        "version",
        "classification",
        "entityId",
        "eventId",
        "parentRevisionIds",
        "nodeId",
        "timestamp",
        "hashes",
        "tombstone",
        "cursor",
        "payload",
    }
)
_HASH_KEYS = frozenset({"content", "revision"})
_ENVELOPE_HASH_KEYS = frozenset({"payload", "envelope"})
MAX_BUZZ_JSON_DEPTH = 64
MAX_BUZZ_JSON_NODES = 10_000


def to_buzz_memory_revision(
    revision: MemoryRevision,
    value: ImmutableObject,
    *,
    cursor: int,
) -> dict[str, Any]:
    """Adapt an internal revision to Buzz's exact ``MemoryRevision`` shape."""
    tombstone = value.kind == "tombstone"
    adapted = {
        "kind": "memory-revision",
        "version": 1,
        "classification": "OFFICIAL",
        "entityId": revision.subject_id,
        "eventId": revision.revision_id,
        "parentRevisionIds": list(revision.parent_ids),
        "nodeId": revision.node_id,
        "timestamp": revision.created_at,
        "hashes": {
            "content": value.object_id,
            "revision": revision.revision_id,
        },
        "tombstone": tombstone,
        "cursor": str(cursor),
        "content": None if tombstone else value.payload,
    }
    if not validate_buzz_memory_revision(adapted):
        raise ValueError("internal revision cannot be represented by Buzz contract v1")
    return adapted


def to_buzz_replication_envelope(
    payload: dict[str, Any],
) -> dict[str, Any]:
    """Wrap a Buzz memory revision in its exact resumable envelope shape."""
    if not validate_buzz_memory_revision(payload):
        raise ValueError("invalid Buzz memory revision payload")
    envelope_event_id = f"replication:{payload['eventId']}:{payload['cursor']}"
    basis = {
        "kind": "replication-envelope",
        "version": 1,
        "classification": payload["classification"],
        "entityId": payload["entityId"],
        "eventId": envelope_event_id,
        "parentRevisionIds": [payload["eventId"]],
        "nodeId": payload["nodeId"],
        "timestamp": payload["timestamp"],
        "hashes": {"payload": payload["hashes"]["revision"]},
        "tombstone": payload["tombstone"],
        "cursor": payload["cursor"],
        "payload": payload,
    }
    envelope = {
        **basis,
        "hashes": {
            "payload": payload["hashes"]["revision"],
            "envelope": sha256_id(canonical_json_bytes(basis)),
        },
    }
    if not validate_buzz_replication_envelope(envelope):
        raise ValueError("failed to build Buzz replication envelope")
    return envelope


def validate_buzz_memory_revision(value: Any) -> bool:
    """Mirror Buzz's exact-shape v1 parser for cross-repository fixtures."""
    if not isinstance(value, dict) or set(value) != BUZZ_MEMORY_REVISION_KEYS:
        return False
    if (
        value.get("kind") != "memory-revision"
        or value.get("version") != 1
        or value.get("classification") not in {"PUBLIC", "OFFICIAL"}
        or not _text(value.get("entityId"))
        or not _text(value.get("eventId"))
        or not _text(value.get("nodeId"))
        or not _rfc3339(value.get("timestamp"))
        or not isinstance(value.get("tombstone"), bool)
        or not _text(value.get("cursor"))
        or value["tombstone"] != (value.get("content") is None)
    ):
        return False
    parents = value.get("parentRevisionIds")
    hashes = value.get("hashes")
    if (
        not isinstance(parents, list)
        or any(not _text(item) for item in parents)
        or not isinstance(hashes, dict)
        or set(hashes) != _HASH_KEYS
        or not _hash(hashes.get("content"))
        or not _hash(hashes.get("revision"))
    ):
        return False
    return _is_bounded_json(value.get("content"))


def validate_buzz_replication_envelope(value: Any) -> bool:
    """Mirror Buzz's exact-shape v1 envelope parser."""
    if not isinstance(value, dict) or set(value) != BUZZ_REPLICATION_ENVELOPE_KEYS:
        return False
    payload = value.get("payload")
    hashes = value.get("hashes")
    parents = value.get("parentRevisionIds")
    if (
        value.get("kind") != "replication-envelope"
        or value.get("version") != 1
        or value.get("classification") not in {"PUBLIC", "OFFICIAL"}
        or not _text(value.get("entityId"))
        or not _text(value.get("eventId"))
        or not _text(value.get("nodeId"))
        or not _rfc3339(value.get("timestamp"))
        or not isinstance(value.get("tombstone"), bool)
        or not _text(value.get("cursor"))
        or not isinstance(parents, list)
        or any(not _text(item) for item in parents)
        or not isinstance(hashes, dict)
        or set(hashes) != _ENVELOPE_HASH_KEYS
        or not _hash(hashes.get("payload"))
        or not _hash(hashes.get("envelope"))
        or not validate_buzz_memory_revision(payload)
    ):
        return False
    return bool(
        value["entityId"] == payload["entityId"]
        and value["nodeId"] == payload["nodeId"]
        and value["tombstone"] == payload["tombstone"]
        and payload["eventId"] in parents
        and hashes["payload"] == payload["hashes"]["revision"]
        and (
            value["classification"] == "OFFICIAL"
            or payload["classification"] == "PUBLIC"
        )
    )


def _text(value: Any) -> bool:
    return isinstance(value, str) and bool(value) and len(value) <= 4096


def _hash(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 71
        and value.startswith("sha256:")
        and all(character in "0123456789abcdef" for character in value[7:])
    )


def _rfc3339(value: Any) -> bool:
    if not isinstance(value, str) or "T" not in value:
        return False
    try:
        parsed = datetime.fromisoformat(value.replace("Z", "+00:00"))
    except ValueError:
        return False
    return parsed.tzinfo is not None


def _is_bounded_json(root: Any) -> bool:
    """Mirror Buzz ``cloneBoundedJson`` depth and node accounting exactly."""
    def primitive(value: Any) -> bool:
        if value is None or isinstance(value, (str, bool)):
            return True
        if isinstance(value, (int, float)) and not isinstance(value, bool):
            try:
                return math.isfinite(value)
            except OverflowError:
                return False
        return False

    if primitive(root):
        try:
            canonical_json_bytes(root)
        except ValueError:
            return False
        return True
    if not isinstance(root, (list, dict)):
        return False

    seen = {id(root)}
    stack: list[tuple[list[Any] | dict[str, Any], int]] = [(root, 0)]
    nodes = 1
    while stack:
        value, depth = stack.pop()
        if isinstance(value, list):
            items = value
        else:
            if any(not isinstance(key, str) for key in value):
                return False
            items = list(value.values())
        if nodes + len(items) > MAX_BUZZ_JSON_NODES:
            return False
        nodes += len(items)
        for item in items:
            child_depth = depth + 1
            if child_depth > MAX_BUZZ_JSON_DEPTH:
                return False
            if primitive(item):
                continue
            if not isinstance(item, (list, dict)) or id(item) in seen:
                return False
            seen.add(id(item))
            stack.append((item, child_depth))
    try:
        canonical_json_bytes(root)
    except ValueError:
        return False
    return True
