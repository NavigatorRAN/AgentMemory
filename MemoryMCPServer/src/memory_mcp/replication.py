"""Immutable revision journal and conflict-safe replication for Memory MCP."""
from __future__ import annotations

import base64
import fcntl
import json
import os
import re
import tempfile
import threading
from contextlib import contextmanager
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import TYPE_CHECKING, Any, Iterator

import frontmatter
from ulid import ULID

from .dates import now_iso, parse_when
from .auth import AuthenticationError, RequestGuard, RequestLimitError, TokenAuthorizer
from .contracts import to_buzz_memory_revision, to_buzz_replication_envelope
from .revisions import (
    ImmutableObject,
    MemoryRevision,
    NodeIdentity,
    canonical_json_bytes,
    sha256_id,
)

if TYPE_CHECKING:
    from .index import QueryIndex
    from .storage import Storage


MAX_PAGE_ITEMS = 200
MAX_ENVELOPE_BYTES = 2 * 1024 * 1024
MAX_BACKUP_BYTES = 16 * 1024 * 1024
MAX_BACKUP_FILES = 10_000
_NORM_RE = re.compile(r"[^a-z0-9]+")


class ConflictError(RuntimeError):
    """Raised when a stable subject needs explicit conflict resolution."""


class RevisionJournal:
    """Canonical append-only journal beside a Markdown vault."""

    def __init__(
        self,
        root: str | Path,
        *,
        storage: "Storage | None" = None,
        node_id: str | None = None,
        max_items: int = MAX_PAGE_ITEMS,
        max_envelope_bytes: int = MAX_ENVELOPE_BYTES,
        tombstone_retention_days: int = 90,
    ):
        self.root = Path(root)
        self.storage = storage
        self.replication_dir = self.root / ".replication"
        self.objects_dir = self.replication_dir / "objects"
        self.revisions_dir = self.replication_dir / "revisions"
        self.backups_dir = self.replication_dir / "backups"
        self.trash_dir = self.replication_dir / "trash"
        self.journal_path = self.replication_dir / "journal.jsonl"
        self.heads_path = self.replication_dir / "heads.json"
        self.conflicts_path = self.replication_dir / "conflicts.json"
        self.acks_path = self.replication_dir / "acknowledgements.json"
        self.backfill_path = self.replication_dir / "backfill.json"
        self.lock_path = self.replication_dir / "journal.lock"
        self.max_items = max(1, min(int(max_items), MAX_PAGE_ITEMS))
        self.max_envelope_bytes = max(1024, min(int(max_envelope_bytes), MAX_ENVELOPE_BYTES))
        self.tombstone_retention_days = max(1, min(int(tombstone_retention_days), 3650))
        self._thread_lock = threading.RLock()
        for directory in (
            self.objects_dir,
            self.revisions_dir,
            self.backups_dir,
            self.trash_dir,
        ):
            directory.mkdir(parents=True, exist_ok=True)
        self.lock_path.touch(exist_ok=True)
        self.identity = NodeIdentity.load_or_create(self.root, configured_node_id=node_id)
        for path in (self.heads_path, self.conflicts_path, self.acks_path):
            if not path.exists():
                self._write_json(path, {})
        if not self.journal_path.exists():
            self.journal_path.touch(mode=0o600)

    @property
    def node_id(self) -> str:
        return self.identity.node_id

    @property
    def revision_count(self) -> int:
        return len(self._journal_entries())

    def object_path(self, object_id: str) -> Path:
        self._validate_digest(object_id)
        digest = object_id.removeprefix("sha256:")
        return self.objects_dir / digest[:2] / f"{digest}.json"

    def revision_path(self, revision_id: str) -> Path:
        self._validate_digest(revision_id)
        digest = revision_id.removeprefix("sha256:")
        return self.revisions_dir / digest[:2] / f"{digest}.json"

    def store_object(self, value: ImmutableObject) -> bool:
        path = self.object_path(value.object_id)
        encoded = value.canonical_bytes
        if path.exists():
            if path.read_bytes() != encoded:
                raise ValueError("immutable object collision")
            return False
        self._atomic_write(path, encoded)
        return True

    def get_object(self, object_id: str) -> ImmutableObject:
        path = self.object_path(object_id)
        if not path.exists():
            raise ValueError("referenced object is missing")
        try:
            body = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as error:
            raise ValueError("stored object is invalid") from error
        value = ImmutableObject.create(kind=str(body["kind"]), payload=dict(body["payload"]))
        if value.object_id != object_id:
            raise ValueError("stored object hash mismatch")
        return value

    def get_revision(self, revision_id: str) -> MemoryRevision:
        path = self.revision_path(revision_id)
        if not path.exists():
            raise ValueError("revision is missing")
        try:
            value = MemoryRevision.from_dict(json.loads(path.read_text(encoding="utf-8")))
        except (OSError, ValueError, TypeError, json.JSONDecodeError) as error:
            raise ValueError("stored revision is invalid") from error
        if value.revision_id != revision_id or not value.verify():
            raise ValueError("stored revision hash mismatch")
        return value

    def capture_event(
        self,
        event: dict[str, Any],
        markdown: str,
        *,
        created_at: str | None = None,
    ) -> MemoryRevision:
        value = ImmutableObject.create(
            kind="event",
            payload={
                "id": event["id"],
                "event_date": event.get("event_date"),
                "recorded_at": event.get("recorded_at"),
                "entities": list(event.get("entities") or []),
                "tags": list(event.get("tags") or []),
                "agent": event.get("agent"),
                "content": event.get("content") or "",
                "markdown": markdown,
            },
        )
        if created_at is not None:
            existing = self._find_revision_for_object(
                "event",
                str(event["id"]),
                value.object_id,
            )
            if existing is not None:
                return existing
        parents = self._heads().get(self._subject_key("event", str(event["id"])), [])
        revision = MemoryRevision.create(
            node_id=self.node_id,
            subject_type="event",
            subject_id=str(event["id"]),
            object_id=value.object_id,
            parent_ids=parents,
            created_at=created_at or now_iso(),
        )
        self.accept_revision(revision, value, materialize=False)
        return revision

    def ensure_entity_writable(self, name: str) -> None:
        key = self._subject_key("entity", name)
        if key in self._load_json(self.conflicts_path):
            raise ConflictError("entity has unresolved replication conflict")

    def capture_entity(
        self,
        entity: dict[str, Any],
        *,
        created_at: str | None = None,
    ) -> MemoryRevision:
        name = self._normalize_entity(str(entity["name"]))
        self.ensure_entity_writable(name)
        value = ImmutableObject.create(
            kind="entity",
            payload={
                "name": name,
                "content": entity.get("content") or "",
                "frontmatter": dict(entity.get("frontmatter") or {}),
            },
        )
        if created_at is not None:
            existing = self._find_revision_for_object("entity", name, value.object_id)
            if existing is not None:
                return existing
        parents = self._heads().get(self._subject_key("entity", name), [])
        revision = MemoryRevision.create(
            node_id=self.node_id,
            subject_type="entity",
            subject_id=name,
            object_id=value.object_id,
            parent_ids=parents,
            created_at=created_at or now_iso(),
        )
        self.accept_revision(revision, value, materialize=False)
        return revision

    def backfill_existing(self) -> dict[str, Any]:
        """Journal legacy Markdown exactly once without rewriting canonical files."""
        if self.backfill_path.exists():
            return self._load_json(self.backfill_path)

        events = entities = 0
        for path in sorted((self.root / "events").rglob("*.md")):
            if path.is_symlink():
                raise ValueError("legacy event path is a symlink")
            markdown = path.read_text(encoding="utf-8")
            try:
                post = frontmatter.loads(markdown)
                event_id = str(post.metadata["id"])
                event_date = self._iso_text(post.metadata["event_date"])
                recorded_at = self._iso_text(
                    post.metadata.get("recorded_at") or post.metadata["event_date"]
                )
            except (KeyError, TypeError, ValueError) as error:
                raise ValueError(f"legacy event is invalid: {path.name}") from error
            event = {
                "id": event_id,
                "event_date": event_date,
                "recorded_at": recorded_at,
                "entities": list(post.metadata.get("entities") or []),
                "tags": list(post.metadata.get("tags") or []),
                "agent": post.metadata.get("agent"),
                "content": post.content,
            }
            self.capture_event(event, markdown, created_at=recorded_at)
            events += 1

        for path in sorted((self.root / "entities").glob("*.md")):
            if path.is_symlink():
                raise ValueError("legacy entity path is a symlink")
            try:
                post = frontmatter.load(path)
                name = self._normalize_entity(
                    str(post.metadata.get("entity") or path.stem)
                )
                frontmatter_value = self._canonical_value(dict(post.metadata))
                first_seen = self._iso_text(
                    post.metadata.get("first_seen") or "1970-01-01T00:00:00+00:00"
                )
            except (TypeError, ValueError) as error:
                raise ValueError(f"legacy entity is invalid: {path.name}") from error
            self.capture_entity(
                {
                    "name": name,
                    "content": post.content,
                    "frontmatter": frontmatter_value,
                },
                created_at=first_seen,
            )
            entities += 1

        marker = {
            "schema_version": 1,
            "event_count": events,
            "entity_count": entities,
        }
        self._write_json(self.backfill_path, marker)
        return marker

    def accept_revision(
        self,
        revision: MemoryRevision,
        value: ImmutableObject,
        *,
        materialize: bool = True,
    ) -> dict[str, Any]:
        with self._locked():
            return self._accept_revision_locked(
                revision,
                value,
                materialize=materialize,
            )

    def _accept_revision_locked(
        self,
        revision: MemoryRevision,
        value: ImmutableObject,
        *,
        materialize: bool,
    ) -> dict[str, Any]:
        """Accept and verify a revision while the journal lock is already held."""
        if not revision.verify():
            raise ValueError("revision hash mismatch")
        if value.object_id != revision.object_id:
            raise ValueError("revision object hash mismatch")
        existing = self.revision_path(revision.revision_id)
        if existing.exists():
            stored = self.get_revision(revision.revision_id)
            if stored != revision:
                raise ValueError("revision collision")
            return {"status": "duplicate", "revision_id": revision.revision_id}
        missing = [
            parent_id
            for parent_id in revision.parent_ids
            if not self.revision_path(parent_id).exists()
        ]
        if missing:
            raise ValueError("revision parent is missing")
        self.store_object(value)
        self._atomic_write(
            self.revision_path(revision.revision_id),
            canonical_json_bytes(revision.to_dict()),
        )
        sequence = self._append_journal(revision.revision_id)
        outcome = self._merge_heads(revision, value, materialize=materialize)
        return {
            "status": outcome,
            "revision_id": revision.revision_id,
            "sequence": sequence,
        }

    def export_envelope(self, *, cursor: int = 0, limit: int = 50) -> dict[str, Any]:
        if cursor < 0:
            raise ValueError("cursor must not be negative")
        bounded_limit = max(1, min(int(limit), self.max_items))
        entries = [
            item
            for item in self._journal_entries()
            if item["sequence"] > cursor
            and self.get_revision(item["revision_id"]).node_id == self.node_id
        ]
        selected: list[dict[str, Any]] = []
        objects: dict[str, dict[str, Any]] = {}
        contracts: list[dict[str, Any]] = []
        for entry in entries[:bounded_limit]:
            revision = self.get_revision(entry["revision_id"])
            item = revision.to_dict()
            item["sequence"] = entry["sequence"]
            value = self.get_object(revision.object_id)
            contract = to_buzz_replication_envelope(
                to_buzz_memory_revision(
                    revision,
                    value,
                    cursor=entry["sequence"],
                )
            )
            candidate_objects = {**objects, revision.object_id: value.to_dict()}
            candidate_revisions = [*selected, item]
            candidate_contracts = [*contracts, contract]
            candidate = {
                "schema_version": 1,
                "source_node_id": self.node_id,
                "from_cursor": cursor,
                "to_cursor": entry["sequence"],
                "has_more": len(entries) > len(candidate_revisions),
                "revisions": candidate_revisions,
                "objects": candidate_objects,
                "contracts": candidate_contracts,
            }
            if len(canonical_json_bytes(candidate)) > self.max_envelope_bytes:
                if not selected:
                    raise ValueError("replication object exceeds envelope bound")
                break
            selected = candidate_revisions
            objects = candidate_objects
            contracts = candidate_contracts
        to_cursor = selected[-1]["sequence"] if selected else cursor
        envelope = {
            "schema_version": 1,
            "source_node_id": self.node_id,
            "from_cursor": cursor,
            "to_cursor": to_cursor,
            "has_more": any(item["sequence"] > to_cursor for item in entries),
            "revisions": selected,
            "objects": objects,
            "contracts": contracts,
        }
        envelope["envelope_id"] = sha256_id(canonical_json_bytes(envelope))
        return envelope

    def import_envelope(self, envelope: dict[str, Any]) -> dict[str, Any]:
        encoded = canonical_json_bytes(envelope)
        if len(encoded) > self.max_envelope_bytes:
            raise ValueError("replication envelope exceeds body bound")
        supplied_envelope_id = str(envelope.get("envelope_id") or "")
        unsigned_envelope = dict(envelope)
        unsigned_envelope.pop("envelope_id", None)
        if supplied_envelope_id != sha256_id(canonical_json_bytes(unsigned_envelope)):
            raise ValueError("replication envelope hash mismatch")
        if envelope.get("schema_version") != 1:
            raise ValueError("unsupported replication envelope schema")
        source_node_id = str(envelope.get("source_node_id") or "")
        if not source_node_id.startswith("node:"):
            raise ValueError("source node identity is invalid")
        revisions = list(envelope.get("revisions") or [])
        objects = dict(envelope.get("objects") or {})
        if len(revisions) > self.max_items:
            raise ValueError("replication page exceeds item bound")
        sequences = [int(item.get("sequence", -1)) for item in revisions]
        if sequences != sorted(sequences) or len(sequences) != len(set(sequences)):
            raise ValueError("replication revisions are not deterministically ordered")
        from_cursor = int(envelope.get("from_cursor") or 0)
        to_cursor = int(envelope.get("to_cursor") or 0)
        if sequences and (
            sequences[0] <= from_cursor
            or sequences[-1] != to_cursor
        ):
            raise ValueError("replication cursor range is invalid")
        if not sequences and from_cursor != to_cursor:
            raise ValueError("empty replication cursor range is invalid")
        prepared: list[tuple[MemoryRevision, ImmutableObject]] = []
        available_parents: dict[str, MemoryRevision] = {}
        for path in self.revisions_dir.rglob("*.json"):
            revision_id = f"sha256:{path.stem}"
            available_parents[revision_id] = self.get_revision(revision_id)
        for item in revisions:
            revision = MemoryRevision.from_dict(item)
            if revision.node_id != source_node_id:
                raise ValueError("revision node does not match envelope source")
            object_data = objects.get(revision.object_id)
            if not isinstance(object_data, dict):
                raise ValueError("replication object is missing")
            value = ImmutableObject.from_dict(object_data)
            self._validate_revision_object(revision, value)
            for parent_id in revision.parent_ids:
                parent = available_parents.get(parent_id)
                if parent is None:
                    raise ValueError("revision parent is missing or out of order")
                if (
                    parent.subject_type != revision.subject_type
                    or parent.subject_id != revision.subject_id
                ):
                    raise ValueError("revision parent belongs to a different subject")
            if value.kind == "tombstone" and revision.parent_ids:
                parent_objects = {
                    available_parents[parent_id].object_id
                    for parent_id in revision.parent_ids
                }
                if value.payload.get("prior_object_id") not in parent_objects:
                    raise ValueError("tombstone prior object does not match its parents")
            self._validate_materialization(revision, value)
            available_parents[revision.revision_id] = revision
            prepared.append((revision, value))

        accepted = duplicates = conflicts = 0
        for revision, value in prepared:
            result = self.accept_revision(revision, value)
            if result["status"] == "duplicate":
                duplicates += 1
            else:
                accepted += 1
                if result["status"] == "conflict":
                    conflicts += 1
        return {
            "source_node_id": source_node_id,
            "accepted": accepted,
            "duplicates": duplicates,
            "conflicts": conflicts,
            "cursor": int(envelope.get("to_cursor") or 0),
        }

    def _validate_revision_object(
        self,
        revision: MemoryRevision,
        value: ImmutableObject,
    ) -> None:
        """Validate subject/object identity before an import can persist bytes."""
        if value.kind == "tombstone":
            target_type = str(value.payload.get("target_type") or "")
            target_id = str(value.payload.get("target_id") or "")
            if (
                target_type != revision.subject_type
                or self._normalize_subject(target_type, target_id) != revision.subject_id
            ):
                raise ValueError("tombstone target does not match revision subject")
            try:
                parse_when(str(value.payload["deleted_at"]))
                parse_when(str(value.payload["retain_until"]))
                self._validate_digest(str(value.payload["prior_object_id"]))
            except (KeyError, TypeError, ValueError) as error:
                raise ValueError("tombstone metadata is invalid") from error
            return

        if revision.subject_type == "event":
            if value.kind != "event":
                raise ValueError("event revision requires an event object")
            if str(value.payload.get("id") or "") != revision.subject_id:
                raise ValueError("event object identity does not match revision subject")
            try:
                ULID.from_str(revision.subject_id)
                parse_when(str(value.payload["event_date"]))
            except (KeyError, TypeError, ValueError) as error:
                raise ValueError("event object metadata is invalid") from error
            if not isinstance(value.payload.get("markdown"), str):
                raise ValueError("event object markdown is invalid")
            return

        if revision.subject_type != "entity":
            raise ValueError("unsupported replication subject")
        if value.kind == "entity":
            if self._normalize_entity(str(value.payload.get("name") or "")) != revision.subject_id:
                raise ValueError("entity object identity does not match revision subject")
            frontmatter_value = value.payload.get("frontmatter")
            if not isinstance(frontmatter_value, dict):
                raise ValueError("entity object frontmatter is invalid")
            declared = frontmatter_value.get("entity")
            if declared is not None and self._normalize_entity(str(declared)) != revision.subject_id:
                raise ValueError("entity frontmatter identity does not match revision subject")
            if not isinstance(value.payload.get("content"), str):
                raise ValueError("entity object content is invalid")
            return
        raise ValueError("entity revision object kind is invalid")

    def _validate_materialization(
        self,
        revision: MemoryRevision,
        value: ImmutableObject,
    ) -> None:
        """Preflight every canonical write/delete before journal mutation."""
        if value.kind == "event":
            try:
                post = frontmatter.loads(str(value.payload["markdown"]))
            except Exception as error:
                raise ValueError("event materialization markdown is invalid") from error
            if (
                str(post.metadata.get("id") or "") != revision.subject_id
                or str(post.metadata.get("event_date") or "")
                != str(value.payload.get("event_date") or "")
                or post.content != str(value.payload.get("content") or "")
                or list(post.metadata.get("entities") or [])
                != list(value.payload.get("entities") or [])
                or list(post.metadata.get("tags") or [])
                != list(value.payload.get("tags") or [])
                or post.metadata.get("agent") != value.payload.get("agent")
            ):
                raise ValueError("event materialization does not match object payload")
            path = self._event_path(value.payload)
            current_heads = self._heads().get(
                self._subject_key("event", revision.subject_id),
                [],
            )
            if (
                path.exists()
                and path.read_text(encoding="utf-8") != str(value.payload["markdown"])
                and (
                    not current_heads
                    or not set(current_heads).issubset(set(revision.parent_ids))
                )
            ):
                raise ValueError("event materialization collides with canonical file")
        elif value.kind == "entity":
            path = self.root / "entities" / f"{revision.subject_id}.md"
            if path.is_symlink():
                raise ValueError("entity materialization target is a symlink")
        elif value.kind == "tombstone":
            self._validate_revision_object(revision, value)

    def acknowledge(self, peer_node_id: str, cursor: int) -> dict[str, Any]:
        if not peer_node_id.startswith("node:") or len(peer_node_id) > 132:
            raise ValueError("peer node identity is invalid")
        latest = self._journal_entries()[-1]["sequence"] if self._journal_entries() else 0
        if cursor < 0 or cursor > latest:
            raise ValueError("acknowledgement cursor is outside the journal")
        with self._locked():
            acknowledgements = self._load_json(self.acks_path)
            cursor = max(int(acknowledgements.get(peer_node_id, 0)), int(cursor))
            acknowledgements[peer_node_id] = cursor
            self._write_json(self.acks_path, acknowledgements)
        return {"peer_node_id": peer_node_id, "cursor": cursor}

    def acknowledged_cursor(self, peer_node_id: str) -> int:
        return int(self._load_json(self.acks_path).get(peer_node_id, 0))

    def list_conflicts(self) -> list[dict[str, Any]]:
        conflicts = list(self._load_json(self.conflicts_path).values())
        return sorted(conflicts, key=lambda item: (item["subject_type"], item["subject_id"]))

    def conflict_page(self, *, cursor: int = 0, limit: int = 50) -> dict[str, Any]:
        if cursor < 0:
            raise ValueError("cursor must not be negative")
        bounded_limit = max(1, min(int(limit), self.max_items))
        conflicts = self.list_conflicts()
        selected = conflicts[cursor:cursor + bounded_limit]
        next_offset = cursor + len(selected)
        has_more = next_offset < len(conflicts)
        return {
            "conflicts": selected,
            "next_cursor": str(next_offset) if has_more else None,
            "has_more": has_more,
        }

    def conflict_for(self, subject_type: str, subject_id: str) -> dict[str, Any] | None:
        return self._load_json(self.conflicts_path).get(
            self._subject_key(subject_type, subject_id)
        )

    def resolve_conflict(
        self,
        *,
        subject_type: str,
        subject_id: str,
        chosen_revision_id: str,
    ) -> dict[str, Any]:
        key = self._subject_key(subject_type, subject_id)
        conflict = self._load_json(self.conflicts_path).get(key)
        if not conflict:
            raise ValueError("conflict not found")
        if chosen_revision_id not in conflict["revision_ids"]:
            raise ValueError("chosen revision is not a conflict branch")
        chosen = self.get_revision(chosen_revision_id)
        value = self.get_object(chosen.object_id)
        revision = MemoryRevision.create(
            node_id=self.node_id,
            subject_type=subject_type,
            subject_id=self._normalize_subject(subject_type, subject_id),
            object_id=value.object_id,
            parent_ids=list(conflict["revision_ids"]),
            created_at=now_iso(),
        )
        self.accept_revision(revision, value)
        return revision.to_dict()

    def tombstone(self, subject_type: str, subject_id: str) -> dict[str, Any]:
        if subject_type not in {"entity", "event"}:
            raise ValueError("only events and entities can be tombstoned")
        subject_id = self._normalize_subject(subject_type, subject_id)
        key = self._subject_key(subject_type, subject_id)
        heads = self._heads().get(key, [])
        if not heads:
            raise ValueError("subject not found")
        current_revision = self.get_revision(heads[-1])
        current = self.get_object(current_revision.object_id)
        if current.kind == "tombstone":
            return {
                "revision_id": current_revision.revision_id,
                "deleted_at": str(current.payload["deleted_at"]),
                "retain_until": str(current.payload["retain_until"]),
            }
        deleted_at = datetime.now(timezone.utc)
        retain_until = deleted_at + timedelta(days=self.tombstone_retention_days)
        value = ImmutableObject.create(
            kind="tombstone",
            payload={
                "target_type": subject_type,
                "target_id": subject_id,
                "deleted_at": deleted_at.isoformat(),
                "retain_until": retain_until.isoformat(),
                "prior_object_id": current.object_id,
            },
        )
        revision = MemoryRevision.create(
            node_id=self.node_id,
            subject_type=subject_type,
            subject_id=subject_id,
            object_id=value.object_id,
            parent_ids=heads,
            created_at=now_iso(),
        )
        self.accept_revision(revision, value)
        return {
            "revision_id": revision.revision_id,
            "deleted_at": deleted_at.isoformat(),
            "retain_until": retain_until.isoformat(),
        }

    def create_backup(self) -> dict[str, Any]:
        files: dict[str, str] = {}
        total = 0
        for top in ("events", "entities", "wiki"):
            directory = self.root / top
            if not directory.exists():
                continue
            for path in sorted(directory.rglob("*.md")):
                if path.is_symlink() or not path.is_file():
                    raise ValueError("backup source contains unsupported file")
                data = path.read_bytes()
                total += len(data)
                if len(files) >= MAX_BACKUP_FILES or total > MAX_BACKUP_BYTES:
                    raise ValueError("backup exceeds configured bound")
                files[str(path.relative_to(self.root))] = base64.b64encode(data).decode("ascii")
        backup_id = str(ULID()).lower()
        manifest = {
            "schema_version": 1,
            "backup_id": backup_id,
            "created_at": now_iso(),
            "node_id": self.node_id,
            "files": files,
        }
        manifest["digest"] = sha256_id(canonical_json_bytes(manifest))
        self._write_json(self.backups_dir / f"{backup_id}.json", manifest)
        return {
            "backup_id": backup_id,
            "file_count": len(files),
            "byte_count": total,
            "digest": manifest["digest"],
        }

    def restore_backup(self, backup_id: str) -> dict[str, Any]:
        if not re.fullmatch(r"[0-9a-hjkmnp-tv-z]{26}", backup_id):
            raise ValueError("backup_id is invalid")
        path = self.backups_dir / f"{backup_id}.json"
        if not path.exists():
            raise ValueError("backup not found")
        stored_manifest = self._load_json(path)
        digest = stored_manifest.get("digest")
        manifest = dict(stored_manifest)
        manifest.pop("digest", None)
        if digest != sha256_id(canonical_json_bytes(manifest)):
            raise ValueError("backup digest mismatch")
        prepared: list[
            tuple[Path, bytes, tuple[str, str, ImmutableObject] | None]
        ] = []
        total = 0
        for relative, encoded in dict(manifest.get("files") or {}).items():
            target = self._safe_vault_path(relative)
            data = base64.b64decode(encoded, validate=True)
            total += len(data)
            if len(prepared) >= MAX_BACKUP_FILES or total > MAX_BACKUP_BYTES:
                raise ValueError("backup exceeds configured bound")
            revision_value: tuple[str, str, ImmutableObject] | None = None
            if target.parent == self.root / "entities":
                post = frontmatter.loads(data.decode("utf-8"))
                subject_id = self._normalize_entity(target.stem)
                declared = post.metadata.get("entity")
                if (
                    declared is not None
                    and self._normalize_entity(str(declared)) != subject_id
                ):
                    raise ValueError("backup entity identity does not match path")
                value = ImmutableObject.create(
                    kind="entity",
                    payload={
                        "name": subject_id,
                        "content": post.content,
                        "frontmatter": self._canonical_value(dict(post.metadata)),
                    },
                )
                revision_value = ("entity", subject_id, value)
            elif (self.root / "events") in target.parents:
                post = frontmatter.loads(data.decode("utf-8"))
                subject_id = str(post.metadata["id"])
                value = ImmutableObject.create(
                    kind="event",
                    payload={
                        "id": subject_id,
                        "event_date": self._iso_text(post.metadata["event_date"]),
                        "recorded_at": self._iso_text(
                            post.metadata.get("recorded_at")
                            or post.metadata["event_date"]
                        ),
                        "entities": self._canonical_value(
                            list(post.metadata.get("entities") or [])
                        ),
                        "tags": self._canonical_value(
                            list(post.metadata.get("tags") or [])
                        ),
                        "agent": self._canonical_value(post.metadata.get("agent")),
                        "content": post.content,
                        "markdown": data.decode("utf-8"),
                    },
                )
                if self._event_path(value.payload) != target:
                    raise ValueError("backup event identity does not match path")
                revision_value = ("event", subject_id, value)
            prepared.append((target, data, revision_value))

        state_paths = (self.journal_path, self.heads_path, self.conflicts_path)
        with self._locked():
            canonical_before = {
                target: target.read_bytes() if target.exists() else None
                for target, _, _ in prepared
            }
            state_before = {state: state.read_bytes() for state in state_paths}
            objects_before = set(self.objects_dir.rglob("*.json"))
            revisions_before = set(self.revisions_dir.rglob("*.json"))
            try:
                for target, data, _ in prepared:
                    self._atomic_write(target, data, mode=0o644)
                for target, data, revision_value in prepared:
                    if revision_value is None or canonical_before[target] == data:
                        continue
                    subject_type, subject_id, value = revision_value
                    parents = self._heads().get(
                        self._subject_key(subject_type, subject_id),
                        [],
                    )
                    revision = MemoryRevision.create(
                        node_id=self.node_id,
                        subject_type=subject_type,
                        subject_id=subject_id,
                        object_id=value.object_id,
                        parent_ids=parents,
                        created_at=now_iso(),
                    )
                    self._validate_revision_object(revision, value)
                    self._accept_revision_locked(
                        revision,
                        value,
                        materialize=False,
                    )
            except Exception:
                try:
                    for target, prior in canonical_before.items():
                        if prior is None:
                            target.unlink(missing_ok=True)
                        else:
                            self._atomic_write(target, prior, mode=0o644)
                    for state, prior in state_before.items():
                        self._atomic_write(state, prior)
                    for created in set(self.objects_dir.rglob("*.json")) - objects_before:
                        created.unlink()
                    for created in set(self.revisions_dir.rglob("*.json")) - revisions_before:
                        created.unlink()
                except Exception as rollback_error:
                    raise RuntimeError("backup restore rollback failed") from rollback_error
                raise

        if self.storage is not None:
            self.storage._invalidate_index()
            try:
                self.storage.rebuild_query_index()
            except Exception:
                pass
        return {"backup_id": backup_id, "restored_files": len(prepared)}

    def readiness(self) -> dict[str, Any]:
        return {
            "status": "ready",
            "schema_version": 1,
            "node_id": self.node_id,
            "revision_count": self.revision_count,
            "conflict_count": len(self.list_conflicts()),
            "max_page_items": self.max_items,
            "max_envelope_bytes": self.max_envelope_bytes,
            "markdown_canonical": True,
            "sqlite_derived": True,
        }

    def manifest(self) -> dict[str, Any]:
        """Return a content-addressed manifest of the canonical journal state."""
        entries = self._journal_entries()
        body = {
            "schema_version": 1,
            "node_id": self.node_id,
            "journal_cursor": entries[-1]["sequence"] if entries else 0,
            "journal_digest": sha256_id(self.journal_path.read_bytes()),
            "revision_count": len(entries),
            "object_count": sum(1 for _ in self.objects_dir.rglob("*.json")),
            "conflict_count": len(self.list_conflicts()),
            "tombstone_count": sum(
                1
                for entry in entries
                if self.get_object(
                    self.get_revision(entry["revision_id"]).object_id
                ).kind == "tombstone"
            ),
        }
        return {"manifest_id": sha256_id(canonical_json_bytes(body)), **body}

    def project_into_index(self, query_index: "QueryIndex") -> None:
        objects = []
        for path in sorted(self.objects_dir.rglob("*.json")):
            body = json.loads(path.read_text(encoding="utf-8"))
            value = ImmutableObject.create(kind=body["kind"], payload=body["payload"])
            objects.append(value.to_dict())
        revisions = []
        for entry in self._journal_entries():
            value = self.get_revision(entry["revision_id"]).to_dict()
            value["sequence"] = entry["sequence"]
            revisions.append(value)
        tombstones = []
        for revision in revisions:
            value = self.get_object(revision["object_id"])
            if value.kind == "tombstone":
                tombstones.append(
                    {
                        "revision_id": revision["revision_id"],
                        **value.payload,
                    }
                )
        query_index.rebuild_replication_projection(
            objects=objects,
            revisions=revisions,
            conflicts=self.list_conflicts(),
            cursors=[
                {"peer_node_id": peer, "cursor": cursor}
                for peer, cursor in self._load_json(self.acks_path).items()
            ],
            tombstones=tombstones,
        )

    def _merge_heads(
        self,
        revision: MemoryRevision,
        value: ImmutableObject,
        *,
        materialize: bool,
    ) -> str:
        key = self._subject_key(revision.subject_type, revision.subject_id)
        heads = self._heads()
        current = list(heads.get(key, []))
        if not current:
            heads[key] = [revision.revision_id]
            self._write_json(self.heads_path, heads)
            if materialize:
                self._materialize(revision, value)
            return "accepted"

        if revision.revision_id in current:
            return "duplicate"
        if all(self._is_ancestor(head, revision.revision_id) for head in current):
            heads[key] = [revision.revision_id]
            self._write_json(self.heads_path, heads)
            self._clear_conflict(key)
            if materialize:
                self._materialize(revision, value)
            return "accepted"
        if any(self._is_ancestor(revision.revision_id, head) for head in current):
            return "accepted"

        next_heads = [
            head for head in current
            if not self._is_ancestor(head, revision.revision_id)
        ]
        next_heads.append(revision.revision_id)
        heads[key] = sorted(set(next_heads))
        self._write_json(self.heads_path, heads)
        self._write_conflict(revision.subject_type, revision.subject_id, heads[key])
        return "conflict"

    def _write_conflict(
        self,
        subject_type: str,
        subject_id: str,
        revision_ids: list[str],
    ) -> None:
        branches = []
        payloads = []
        for revision_id in revision_ids:
            revision = self.get_revision(revision_id)
            value = self.get_object(revision.object_id)
            branches.append(
                {
                    "revision_id": revision_id,
                    "node_id": revision.node_id,
                    "object_id": revision.object_id,
                    "created_at": revision.created_at,
                    "object_kind": value.kind,
                }
            )
            payloads.append(value.payload)
        conflict = {
            "subject_type": subject_type,
            "subject_id": subject_id,
            "revision_ids": sorted(revision_ids),
            "branches": sorted(branches, key=lambda item: item["revision_id"]),
            "conflicted_fields": self._conflicted_fields(payloads),
            "detected_at": now_iso(),
        }
        conflicts = self._load_json(self.conflicts_path)
        conflicts[self._subject_key(subject_type, subject_id)] = conflict
        self._write_json(self.conflicts_path, conflicts)
        if self.storage is not None and subject_type == "entity":
            self.storage._index_entity_path(
                self.root / "entities" / f"{self._normalize_entity(subject_id)}.md"
            )

    def _clear_conflict(self, key: str) -> None:
        conflicts = self._load_json(self.conflicts_path)
        if key in conflicts:
            del conflicts[key]
            self._write_json(self.conflicts_path, conflicts)

    @staticmethod
    def _conflicted_fields(payloads: list[dict[str, Any]]) -> list[str]:
        if len(payloads) < 2:
            return []
        fields: list[str] = []
        if len({canonical_json_bytes(item.get("content")) for item in payloads}) > 1:
            fields.append("content")
        metadata_keys = sorted(
            set().union(*(set(dict(item.get("frontmatter") or {})) for item in payloads))
        )
        for key in metadata_keys:
            values = {
                canonical_json_bytes(dict(item.get("frontmatter") or {}).get(key))
                for item in payloads
            }
            if len(values) > 1:
                fields.append(f"metadata.{key}")
        return fields

    def _materialize(self, revision: MemoryRevision, value: ImmutableObject) -> None:
        if value.kind == "tombstone":
            self._materialize_tombstone(value)
        elif revision.subject_type == "event" and value.kind == "event":
            self._materialize_event(value)
        elif revision.subject_type == "entity" and value.kind == "entity":
            self._materialize_entity(revision.subject_id, value)
        else:
            raise ValueError("object kind does not match revision subject")
        if self.storage is not None:
            self.storage._invalidate_index()
            if revision.subject_type == "event" and value.kind == "event":
                event = dict(value.payload)
                event["path"] = str(self._event_path(value.payload).relative_to(self.root / "events"))
                self.storage._index_event_record(event)
            elif revision.subject_type == "entity" and value.kind == "entity":
                self.storage._index_entity_path(
                    self.root / "entities" / f"{self._normalize_entity(revision.subject_id)}.md"
                )

    def _materialize_event(self, value: ImmutableObject) -> None:
        path = self._event_path(value.payload)
        if path.exists():
            if path.read_text(encoding="utf-8") == str(value.payload["markdown"]):
                return
        self._atomic_write(path, str(value.payload["markdown"]).encode("utf-8"), mode=0o644)
        for entity in value.payload.get("entities") or []:
            if self.storage is not None:
                self.storage._ensure_entity_stub(str(entity))

    def _event_path(self, payload: dict[str, Any]) -> Path:
        event_id = str(payload["id"])
        ULID.from_str(event_id)
        when = parse_when(str(payload["event_date"]))
        slug = self._slugify(str(payload.get("content") or "").split("\n", 1)[0])
        relative = Path(
            f"{when.year:04d}/{when.month:02d}/"
            f"{when.day:02d}-{event_id[-8:].lower()}-{slug}.md"
        )
        return self.root / "events" / relative

    def _materialize_entity(
        self,
        subject_id: str,
        value: ImmutableObject,
    ) -> None:
        name = self._normalize_entity(subject_id)
        payload = value.payload
        metadata = dict(payload.get("frontmatter") or {})
        metadata["entity"] = name
        post = frontmatter.Post(str(payload.get("content") or ""), **metadata)
        path = self.root / "entities" / f"{name}.md"
        self._atomic_write(path, frontmatter.dumps(post).encode("utf-8"), mode=0o644)

    def _materialize_tombstone(self, value: ImmutableObject) -> None:
        subject_type = str(value.payload["target_type"])
        subject_id = str(value.payload["target_id"])
        if subject_type == "entity":
            path = self.root / "entities" / f"{self._normalize_entity(subject_id)}.md"
        else:
            path = self._find_event_path(subject_id)
        if path and path.exists():
            trash = self.trash_dir / f"{str(ULID()).lower()}-{path.name}"
            trash.parent.mkdir(parents=True, exist_ok=True)
            os.replace(path, trash)

    def _find_event_path(self, event_id: str) -> Path | None:
        suffix = event_id[-8:].lower()
        return next((path for path in (self.root / "events").rglob(f"*-{suffix}-*.md")), None)

    def _is_ancestor(self, ancestor_id: str, descendant_id: str) -> bool:
        if ancestor_id == descendant_id:
            return True
        pending = [descendant_id]
        visited: set[str] = set()
        while pending:
            current = pending.pop()
            if current in visited:
                continue
            visited.add(current)
            try:
                revision = self.get_revision(current)
            except ValueError:
                continue
            if ancestor_id in revision.parent_ids:
                return True
            pending.extend(revision.parent_ids)
        return False

    def _find_revision_for_object(
        self,
        subject_type: str,
        subject_id: str,
        object_id: str,
    ) -> MemoryRevision | None:
        normalized = self._normalize_subject(subject_type, subject_id)
        for entry in self._journal_entries():
            revision = self.get_revision(entry["revision_id"])
            if (
                revision.subject_type == subject_type
                and revision.subject_id == normalized
                and revision.object_id == object_id
            ):
                return revision
        return None

    def _heads(self) -> dict[str, list[str]]:
        return {
            str(key): list(value)
            for key, value in self._load_json(self.heads_path).items()
        }

    def _append_journal(self, revision_id: str) -> int:
        entries = self._journal_entries()
        sequence = entries[-1]["sequence"] + 1 if entries else 1
        line = canonical_json_bytes({"sequence": sequence, "revision_id": revision_id}) + b"\n"
        with open(self.journal_path, "ab") as handle:
            handle.write(line)
            handle.flush()
            os.fsync(handle.fileno())
        return sequence

    def _journal_entries(self) -> list[dict[str, Any]]:
        entries: list[dict[str, Any]] = []
        if not self.journal_path.exists():
            return entries
        for line in self.journal_path.read_text(encoding="utf-8").splitlines():
            if not line:
                continue
            try:
                item = json.loads(line)
                sequence = int(item["sequence"])
                revision_id = str(item["revision_id"])
                self._validate_digest(revision_id)
            except (KeyError, TypeError, ValueError, json.JSONDecodeError) as error:
                raise ValueError("revision journal is corrupt") from error
            if sequence != len(entries) + 1:
                raise ValueError("revision journal sequence is corrupt")
            entries.append({"sequence": sequence, "revision_id": revision_id})
        return entries

    @contextmanager
    def _locked(self) -> Iterator[None]:
        with self._thread_lock:
            with open(self.lock_path, "rb") as handle:
                fcntl.flock(handle.fileno(), fcntl.LOCK_EX)
                try:
                    yield
                finally:
                    fcntl.flock(handle.fileno(), fcntl.LOCK_UN)

    @staticmethod
    def _validate_digest(value: str) -> None:
        if not re.fullmatch(r"sha256:[0-9a-f]{64}", value):
            raise ValueError("invalid digest")

    @classmethod
    def _normalize_entity(cls, value: str) -> str:
        normalized = _NORM_RE.sub("-", value.lower()).strip("-")
        if not normalized or len(normalized) > 200:
            raise ValueError("entity name is invalid")
        return normalized

    @classmethod
    def _normalize_subject(cls, subject_type: str, subject_id: str) -> str:
        if subject_type == "entity":
            return cls._normalize_entity(subject_id)
        if subject_type == "event":
            ULID.from_str(subject_id)
            return subject_id
        raise ValueError("subject type is invalid")

    @classmethod
    def _subject_key(cls, subject_type: str, subject_id: str) -> str:
        return f"{subject_type}:{cls._normalize_subject(subject_type, subject_id)}"

    @staticmethod
    def _slugify(value: str) -> str:
        slug = _NORM_RE.sub("-", value.lower()).strip("-")
        return slug[:60] if slug else "event"

    @classmethod
    def _canonical_value(cls, value: Any) -> Any:
        if isinstance(value, datetime):
            return value.isoformat()
        if isinstance(value, dict):
            return {str(key): cls._canonical_value(item) for key, item in value.items()}
        if isinstance(value, list):
            return [cls._canonical_value(item) for item in value]
        if isinstance(value, tuple):
            return [cls._canonical_value(item) for item in value]
        return value

    @staticmethod
    def _iso_text(value: Any) -> str:
        if isinstance(value, datetime):
            return value.isoformat()
        return str(value)

    def _safe_vault_path(self, relative: str) -> Path:
        path = Path(relative)
        if path.is_absolute() or ".." in path.parts or not path.parts:
            raise ValueError("backup contains unsafe path")
        if path.parts[0] not in {"events", "entities", "wiki"}:
            raise ValueError("backup path is outside canonical vault")
        target = self.root / path
        if not target.resolve(strict=False).is_relative_to(self.root.resolve()):
            raise ValueError("backup path escapes vault")
        return target

    @staticmethod
    def _load_json(path: Path) -> dict[str, Any]:
        if not path.exists():
            return {}
        try:
            value = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as error:
            raise ValueError(f"invalid journal state: {path.name}") from error
        if not isinstance(value, dict):
            raise ValueError(f"invalid journal state: {path.name}")
        return value

    def _write_json(self, path: Path, value: dict[str, Any]) -> None:
        self._atomic_write(path, canonical_json_bytes(value) + b"\n")

    @staticmethod
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


def install_replication_routes(
    mcp: Any,
    storage: "Storage",
    authorizer: TokenAuthorizer,
    guard: RequestGuard,
) -> None:
    """Register bounded authenticated HTTP routes on a FastMCP server."""
    from starlette.requests import Request
    from starlette.responses import JSONResponse

    def authorize(request: Request, capability: str) -> JSONResponse | None:
        client = request.client.host if request.client else "unknown"
        try:
            guard.check_rate(f"{client}:{request.url.path}")
            authorizer.require(request.headers.get("authorization"), capability)
        except AuthenticationError as error:
            return JSONResponse(
                {"error": "unauthorized"},
                status_code=403 if error.forbidden else 401,
            )
        except RequestLimitError as error:
            return JSONResponse({"error": error.code}, status_code=error.status_code)
        return None

    async def body(
        request: Request,
        allowed_keys: set[str],
    ) -> tuple[dict[str, Any] | None, JSONResponse | None]:
        try:
            return await guard.read_json(request, allowed_keys=allowed_keys), None
        except RequestLimitError as error:
            return None, JSONResponse({"error": error.code}, status_code=error.status_code)

    def invalid() -> JSONResponse:
        return JSONResponse({"error": "invalid_request"}, status_code=400)

    @mcp.custom_route("/replication/readiness", methods=["GET"])
    async def replication_readiness(request: Request) -> JSONResponse:
        denied = authorize(request, "read")
        if denied:
            return denied
        return JSONResponse(storage.revision_journal.readiness())

    @mcp.custom_route("/replication/manifest", methods=["GET"])
    async def replication_manifest(request: Request) -> JSONResponse:
        denied = authorize(request, "read")
        if denied:
            return denied
        return JSONResponse(storage.revision_journal.manifest())

    @mcp.custom_route("/replication/export", methods=["POST"])
    async def replication_export(request: Request) -> JSONResponse:
        denied = authorize(request, "replicate")
        if denied:
            return denied
        value, error = await body(request, {"cursor", "limit"})
        if error:
            return error
        try:
            return JSONResponse(
                storage.revision_journal.export_envelope(
                    cursor=int((value or {}).get("cursor", 0)),
                    limit=int((value or {}).get("limit", 50)),
                )
            )
        except (TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/import", methods=["POST"])
    async def replication_import(request: Request) -> JSONResponse:
        denied = authorize(request, "replicate")
        if denied:
            return denied
        value, error = await body(request, {"envelope"})
        if error:
            return error
        try:
            envelope = (value or {})["envelope"]
            if not isinstance(envelope, dict):
                raise ValueError("invalid envelope")
            return JSONResponse(storage.revision_journal.import_envelope(envelope))
        except (ConflictError, KeyError, TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/ack", methods=["POST"])
    async def replication_ack(request: Request) -> JSONResponse:
        denied = authorize(request, "replicate")
        if denied:
            return denied
        value, error = await body(request, {"peer_node_id", "cursor"})
        if error:
            return error
        try:
            return JSONResponse(
                storage.revision_journal.acknowledge(
                    str((value or {})["peer_node_id"]),
                    int((value or {})["cursor"]),
                )
            )
        except (KeyError, TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/conflicts", methods=["GET"])
    async def replication_conflicts(request: Request) -> JSONResponse:
        denied = authorize(request, "read")
        if denied:
            return denied
        try:
            return JSONResponse(
                storage.revision_journal.conflict_page(
                    cursor=int(request.query_params.get("cursor", "0")),
                    limit=int(request.query_params.get("limit", "50")),
                )
            )
        except (TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/conflicts/resolve", methods=["POST"])
    async def replication_resolve(request: Request) -> JSONResponse:
        denied = authorize(request, "admin")
        if denied:
            return denied
        value, error = await body(
            request,
            {"subject_type", "subject_id", "chosen_revision_id"},
        )
        if error:
            return error
        try:
            return JSONResponse(
                storage.revision_journal.resolve_conflict(
                    subject_type=str((value or {})["subject_type"]),
                    subject_id=str((value or {})["subject_id"]),
                    chosen_revision_id=str((value or {})["chosen_revision_id"]),
                )
            )
        except (KeyError, TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/tombstones", methods=["POST"])
    async def replication_tombstone(request: Request) -> JSONResponse:
        denied = authorize(request, "admin")
        if denied:
            return denied
        value, error = await body(request, {"subject_type", "subject_id"})
        if error:
            return error
        try:
            return JSONResponse(
                storage.revision_journal.tombstone(
                    str((value or {})["subject_type"]),
                    str((value or {})["subject_id"]),
                ),
                status_code=201,
            )
        except (KeyError, TypeError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/backups", methods=["POST"])
    async def replication_backup(request: Request) -> JSONResponse:
        denied = authorize(request, "admin")
        if denied:
            return denied
        _, error = await body(request, set())
        if error:
            return error
        try:
            return JSONResponse(storage.revision_journal.create_backup(), status_code=201)
        except (OSError, ValueError):
            return invalid()

    @mcp.custom_route("/replication/restore", methods=["POST"])
    async def replication_restore(request: Request) -> JSONResponse:
        denied = authorize(request, "admin")
        if denied:
            return denied
        value, error = await body(request, {"backup_id"})
        if error:
            return error
        try:
            return JSONResponse(
                storage.revision_journal.restore_backup(str((value or {})["backup_id"]))
            )
        except (KeyError, OSError, TypeError, ValueError):
            return invalid()
