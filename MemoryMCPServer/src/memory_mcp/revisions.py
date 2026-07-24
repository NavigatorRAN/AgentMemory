"""Canonical replication values for Memory MCP.

Markdown files remain the human-readable source of truth.  These values form
the immutable journal used to exchange and verify changes between nodes.
"""
from __future__ import annotations

import hashlib
import json
import os
import re
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from ulid import ULID


_DIGEST_RE = re.compile(r"^sha256:[0-9a-f]{64}$")
_NODE_RE = re.compile(r"^node:[a-zA-Z0-9][a-zA-Z0-9._-]{0,126}$")
_SUBJECT_TYPES = frozenset({"event", "entity", "tombstone"})
MAX_CANONICAL_BYTES = 4 * 1024 * 1024


def canonical_json_bytes(value: Any) -> bytes:
    """Return deterministic UTF-8 JSON, rejecting unsafe/non-finite values."""
    try:
        encoded = json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            separators=(",", ":"),
            sort_keys=True,
        ).encode("utf-8")
    except (TypeError, ValueError) as error:
        message = str(error)
        if "range" in message or "NaN" in message:
            raise ValueError("canonical values must contain only finite numbers") from error
        raise ValueError("value is not canonical JSON") from error
    if len(encoded) > MAX_CANONICAL_BYTES:
        raise ValueError("canonical value exceeds maximum size")
    return encoded


def sha256_id(value: bytes) -> str:
    """Return the prefixed SHA-256 identifier for *value*."""
    return f"sha256:{hashlib.sha256(value).hexdigest()}"


def _validate_digest(value: str, field: str) -> None:
    if not _DIGEST_RE.fullmatch(value):
        raise ValueError(f"{field} must be a sha256 identifier")


def _validate_node_id(value: str) -> None:
    if not _NODE_RE.fullmatch(value):
        raise ValueError("node_id must be a bounded stable node identifier")


@dataclass(frozen=True)
class ImmutableObject:
    """A content-addressed immutable object."""

    object_id: str
    kind: str
    payload: dict[str, Any]

    @classmethod
    def create(cls, *, kind: str, payload: dict[str, Any]) -> "ImmutableObject":
        if not kind or len(kind) > 64 or not kind.replace("_", "").isalnum():
            raise ValueError("object kind is invalid")
        body = {"schema_version": 1, "kind": kind, "payload": payload}
        return cls(object_id=sha256_id(canonical_json_bytes(body)), kind=kind, payload=payload)

    @classmethod
    def from_dict(cls, value: dict[str, Any]) -> "ImmutableObject":
        object_id = str(value.get("object_id") or "")
        instance = cls.create(
            kind=str(value.get("kind") or ""),
            payload=dict(value.get("payload") or {}),
        )
        if object_id and object_id != instance.object_id:
            raise ValueError("immutable object hash mismatch")
        return instance

    @property
    def canonical_bytes(self) -> bytes:
        return canonical_json_bytes(
            {"schema_version": 1, "kind": self.kind, "payload": self.payload}
        )

    def to_dict(self) -> dict[str, Any]:
        return {
            "object_id": self.object_id,
            "kind": self.kind,
            "payload": self.payload,
        }


@dataclass(frozen=True)
class MemoryRevision:
    """An immutable subject revision with explicit parents."""

    revision_id: str
    node_id: str
    subject_type: str
    subject_id: str
    object_id: str
    parent_ids: tuple[str, ...]
    created_at: str

    @classmethod
    def create(
        cls,
        *,
        node_id: str,
        subject_type: str,
        subject_id: str,
        object_id: str,
        parent_ids: list[str] | tuple[str, ...],
        created_at: str,
    ) -> "MemoryRevision":
        _validate_node_id(node_id)
        if subject_type not in _SUBJECT_TYPES:
            raise ValueError("unsupported revision subject_type")
        if not subject_id or len(subject_id) > 256:
            raise ValueError("revision subject_id is invalid")
        if subject_type == "event":
            try:
                ULID.from_str(subject_id)
            except (TypeError, ValueError) as error:
                raise ValueError("event subject_id must be a ULID") from error
        _validate_digest(object_id, "object_id")
        parents = tuple(sorted(set(parent_ids)))
        if len(parents) > 32:
            raise ValueError("revision has too many parents")
        for parent_id in parents:
            _validate_digest(parent_id, "parent_id")
        if not created_at or len(created_at) > 64:
            raise ValueError("created_at is invalid")
        body = {
            "schema_version": 1,
            "node_id": node_id,
            "subject_type": subject_type,
            "subject_id": subject_id,
            "object_id": object_id,
            "parent_ids": list(parents),
            "created_at": created_at,
        }
        return cls(
            revision_id=sha256_id(canonical_json_bytes(body)),
            node_id=node_id,
            subject_type=subject_type,
            subject_id=subject_id,
            object_id=object_id,
            parent_ids=parents,
            created_at=created_at,
        )

    @classmethod
    def from_dict(cls, value: dict[str, Any]) -> "MemoryRevision":
        revision_id = str(value.get("revision_id") or "")
        created = cls.create(
            node_id=str(value.get("node_id") or ""),
            subject_type=str(value.get("subject_type") or ""),
            subject_id=str(value.get("subject_id") or ""),
            object_id=str(value.get("object_id") or ""),
            parent_ids=list(value.get("parent_ids") or []),
            created_at=str(value.get("created_at") or ""),
        )
        if not revision_id:
            return created
        return cls(
            revision_id=revision_id,
            node_id=created.node_id,
            subject_type=created.subject_type,
            subject_id=created.subject_id,
            object_id=created.object_id,
            parent_ids=created.parent_ids,
            created_at=created.created_at,
        )

    def verify(self) -> bool:
        expected = type(self).create(
            node_id=self.node_id,
            subject_type=self.subject_type,
            subject_id=self.subject_id,
            object_id=self.object_id,
            parent_ids=self.parent_ids,
            created_at=self.created_at,
        )
        return self.revision_id == expected.revision_id

    def to_dict(self) -> dict[str, Any]:
        return {
            "revision_id": self.revision_id,
            "node_id": self.node_id,
            "subject_type": self.subject_type,
            "subject_id": self.subject_id,
            "object_id": self.object_id,
            "parent_ids": list(self.parent_ids),
            "created_at": self.created_at,
        }


@dataclass(frozen=True)
class NodeIdentity:
    """A stable node identifier persisted beside the revision journal."""

    node_id: str

    @classmethod
    def load_or_create(
        cls,
        root: str | Path,
        *,
        configured_node_id: str | None = None,
    ) -> "NodeIdentity":
        base = Path(root) / ".replication"
        path = base / "node.json"
        if path.exists():
            try:
                stored = json.loads(path.read_text(encoding="utf-8"))
                node_id = str(stored["node_id"])
            except (OSError, KeyError, TypeError, json.JSONDecodeError) as error:
                raise ValueError("stored node identity is invalid") from error
            _validate_node_id(node_id)
            if configured_node_id and configured_node_id != node_id:
                raise ValueError("configured node_id does not match stored identity")
            return cls(node_id=node_id)

        node_id = configured_node_id or f"node:{str(ULID()).lower()}"
        _validate_node_id(node_id)
        base.mkdir(parents=True, exist_ok=True)
        _atomic_write(path, canonical_json_bytes({"node_id": node_id}) + b"\n", mode=0o600)
        return cls(node_id=node_id)


def _atomic_write(path: Path, value: bytes, *, mode: int = 0o600) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        os.fchmod(descriptor, mode)
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(value)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    except Exception:
        try:
            os.close(descriptor)
        except OSError:
            pass
        try:
            os.unlink(temporary)
        except OSError:
            pass
        raise
