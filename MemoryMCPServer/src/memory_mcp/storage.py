"""Storage layer: markdown + frontmatter on disk, with an in-memory index."""
from __future__ import annotations

import fcntl
import json
import os
import re
import tempfile
import threading
from contextlib import contextmanager
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Iterator

import frontmatter
from ulid import ULID

from .dates import now_iso, parse_when
from .index import QueryIndex
from .replication import RevisionJournal


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

_NORM_RE = re.compile(r"[^a-z0-9]+")


def normalize_entity(name: str) -> str:
    """Lowercase + hyphenate. 'LiteLLM Router' -> 'litellm-router'."""
    return _NORM_RE.sub("-", name.lower()).strip("-")


def slugify_title(s: str, max_len: int = 60) -> str:
    """For event filenames. Keeps things human-browseable."""
    slug = _NORM_RE.sub("-", s.lower()).strip("-")
    return slug[:max_len] if slug else "event"


def _metadata_iso(value: Any) -> Any:
    if isinstance(value, datetime):
        return value.isoformat()
    return value


# ---------------------------------------------------------------------------
# File locking
# ---------------------------------------------------------------------------

@contextmanager
def _locked(path: Path) -> Iterator[None]:
    """Coarse advisory lock on a file. Cheap insurance against concurrent
    entity writes from multiple agents. Best-effort on filesystems where
    flock is a no-op (most NFS, some SMB)."""
    path.parent.mkdir(parents=True, exist_ok=True)
    path.touch(exist_ok=True)
    with open(path, "rb") as fh:
        try:
            fcntl.flock(fh.fileno(), fcntl.LOCK_EX)
            yield
        finally:
            try:
                fcntl.flock(fh.fileno(), fcntl.LOCK_UN)
            except OSError:
                pass


# ---------------------------------------------------------------------------
# Storage
# ---------------------------------------------------------------------------

class Storage:
    """Filesystem-backed event/entity store.

    Layout:
        <root>/events/YYYY/MM/<ulid>-<slug>.md
        <root>/entities/<name>.md
        <root>/.index/entities.json
    """

    def __init__(
        self,
        root: str | Path,
        *,
        node_id: str | None = None,
        max_replication_items: int = 200,
        max_replication_bytes: int = 2 * 1024 * 1024,
        tombstone_retention_days: int = 90,
    ):
        self.root = Path(root)
        self.events_dir = self.root / "events"
        self.entities_dir = self.root / "entities"
        self.wiki_dir = self.root / "wiki"
        self.index_dir = self._default_index_dir(self.root)
        self._index_lock = threading.Lock()
        self._index_cache: dict[str, Any] | None = None
        self._index_cache_mtime: float = 0.0
        self.query_index = QueryIndex(self.index_dir)

        for d in (self.events_dir, self.entities_dir, self.wiki_dir, self.index_dir):
            d.mkdir(parents=True, exist_ok=True)
        self.revision_journal = RevisionJournal(
            self.root,
            storage=self,
            node_id=node_id,
            max_items=max_replication_items,
            max_envelope_bytes=max_replication_bytes,
            tombstone_retention_days=tombstone_retention_days,
        )
        self.revision_journal.backfill_existing()

    def _default_index_dir(self, root: Path) -> Path:
        configured = os.environ.get("MEMORY_INDEX_ROOT")
        if configured:
            return Path(configured)
        root_text = str(root)
        if root_text.startswith(("/mnt/", "/Volumes/")):
            local_index = Path.cwd() / ".index"
            if self._index_dir_is_usable(local_index):
                return local_index
            transient_index = Path(os.environ.get("TMPDIR") or "/tmp") / "memory-mcp-index"
            if self._index_dir_is_usable(transient_index):
                return transient_index
            return root / ".index"
        return root / ".index"

    @staticmethod
    def _index_dir_is_usable(path: Path) -> bool:
        if path.exists():
            return os.access(path, os.R_OK | os.W_OK | os.X_OK)
        parent = path.parent
        return parent.exists() and os.access(parent, os.W_OK | os.X_OK)

    # --- event writes -----------------------------------------------------

    def record_event(
        self,
        content: str,
        entities: list[str],
        event_date: str | None,
        tags: list[str],
        agent: str | None,
    ) -> dict[str, Any]:
        ulid = str(ULID())
        when = parse_when(event_date) if event_date else datetime.now(timezone.utc)
        normalized = [normalize_entity(e) for e in entities if e.strip()]

        # Filename: events/YYYY/MM/DD-<ulid-suffix>-<slug>.md
        # First line of content makes a decent slug.
        first_line = content.strip().split("\n", 1)[0]
        slug = slugify_title(first_line)
        rel = Path(
            f"{when.year:04d}/{when.month:02d}/"
            f"{when.day:02d}-{ulid[-8:].lower()}-{slug}.md"
        )
        path = self.events_dir / rel

        post = frontmatter.Post(
            content,
            id=ulid,
            event_date=when.isoformat(),
            recorded_at=now_iso(),
            entities=normalized,
            tags=tags,
            agent=agent,
        )
        path.parent.mkdir(parents=True, exist_ok=True)
        rendered = frontmatter.dumps(post)
        with _locked(path):
            self._atomic_write_text(path, rendered)

        # Ensure entity stubs exist so list_entities sees them.
        for ent in normalized:
            self._ensure_entity_stub(ent)

        self._invalidate_index()
        event = {
            "id": ulid,
            "event_date": when.isoformat(),
            "recorded_at": post.metadata.get("recorded_at"),
            "entities": normalized,
            "tags": tags,
            "agent": agent,
            "content": content,
            "path": str(rel),
        }
        self._index_event_record(event)
        self.revision_journal.capture_event(event, rendered)
        return {
            "id": ulid,
            "path": str(rel),
            "entities": normalized,
        }

    def record_link(
        self,
        entity_a: str,
        entity_b: str,
        relation: str,
        bidirectional: bool,
    ) -> dict[str, Any]:
        a, b = normalize_entity(entity_a), normalize_entity(entity_b)
        arrow = "<->" if bidirectional else "->"
        content = f"{a} {arrow} {b} ({relation})"
        result = self.record_event(
            content=content,
            entities=[a, b],
            event_date=None,
            tags=["link", relation],
            agent=None,
        )
        return {
            "recorded": True,
            "event_id": result["id"],
            "path": result["path"],
            "relation": relation,
            "bidirectional": bidirectional,
        }

    # --- entity writes ----------------------------------------------------

    def _ensure_entity_stub(self, name: str) -> None:
        """Create an empty entity page if none exists. Touch only —
        no overwrite of existing content."""
        path = self.entities_dir / f"{name}.md"
        if path.exists():
            return
        post = frontmatter.Post(
            "",
            entity=name,
            display_name=name,
            type="unknown",
            first_seen=now_iso(),
            aliases=[],
        )
        with _locked(path):
            if not path.read_text(encoding="utf-8").strip():
                path.write_text(frontmatter.dumps(post), encoding="utf-8")

    def upsert_entity(
        self,
        name: str,
        content: str | None,
        metadata: dict[str, Any],
        mode: str,
    ) -> dict[str, Any]:
        if mode not in ("create", "append", "replace"):
            raise ValueError(f"mode must be create|append|replace, got {mode!r}")

        normalized = normalize_entity(name)
        path = self.entities_dir / f"{normalized}.md"
        self.revision_journal.ensure_entity_writable(normalized)

        # An entity is "really" existing only if it has non-empty body content.
        # Auto-stubs (created by record_event) have empty bodies and should
        # not block a subsequent 'create' from filling them in.
        existed_with_content = False
        if path.exists():
            try:
                existing_post = frontmatter.load(path)
                existed_with_content = bool(existing_post.content.strip())
            except Exception:
                existed_with_content = False

        if mode == "create" and existed_with_content:
            return {
                "name": normalized,
                "path": str(path.relative_to(self.root)),
                "created": False,
                "error": "already_exists",
            }

        with _locked(path):
            if path.exists():
                try:
                    post = frontmatter.load(path)
                except Exception:
                    post = frontmatter.Post("")
            else:
                post = frontmatter.Post(
                    "",
                    entity=normalized,
                    display_name=name,
                    type="unknown",
                    first_seen=now_iso(),
                    aliases=[],
                )

            # Make sure required keys exist on stubs being filled in.
            post.metadata.setdefault("entity", normalized)
            post.metadata.setdefault("display_name", name)
            post.metadata.setdefault("type", "unknown")
            post.metadata.setdefault("first_seen", now_iso())
            post.metadata.setdefault("aliases", [])

            # Merge metadata (shallow). Lists get unioned, scalars overwritten.
            for k, v in metadata.items():
                if k in post.metadata and isinstance(post.metadata[k], list) \
                        and isinstance(v, list):
                    merged = list({*post.metadata[k], *v})
                    post.metadata[k] = merged
                else:
                    post.metadata[k] = v

            if content is not None:
                if mode == "append" and post.content.strip():
                    post.content = post.content.rstrip() + "\n\n" + content
                else:  # replace, create, or append-to-empty
                    post.content = content

            self._atomic_write_text(path, frontmatter.dumps(post))

        self._invalidate_index()
        self._index_entity_path(path)
        stored = self.read_entity(normalized, include_conflicts=True)
        if stored is not None:
            self.revision_journal.capture_entity(stored)
        return {
            "name": normalized,
            "path": str(path.relative_to(self.root)),
            "created": not existed_with_content,
            "mode": mode,
        }

    # --- reads ------------------------------------------------------------

    def read_entity(
        self,
        name: str,
        *,
        include_conflicts: bool = False,
    ) -> dict[str, Any] | None:
        normalized = normalize_entity(name)
        path = self.entities_dir / f"{normalized}.md"
        if not path.exists():
            return None
        post = frontmatter.load(path)
        result: dict[str, Any] = {
            "name": normalized,
            "display_name": post.metadata.get("display_name", normalized),
            "frontmatter": dict(post.metadata),
            "content": post.content,
            "path": str(path.relative_to(self.root)),
        }
        conflict = self.revision_journal.conflict_for("entity", normalized)
        if conflict and not include_conflicts:
            fields = list(conflict.get("conflicted_fields") or [])
            for field in fields:
                if field == "content":
                    result.pop("content", None)
                elif field.startswith("metadata."):
                    metadata_key = field.removeprefix("metadata.")
                    result["frontmatter"].pop(metadata_key, None)
                    if metadata_key in {"display_name", "type"}:
                        result.pop(metadata_key, None)
            result["conflicted_fields"] = fields
            result["conflict"] = {
                "revision_ids": list(conflict.get("revision_ids") or []),
                "detected_at": conflict.get("detected_at"),
            }
        return result

    def iter_entities(self) -> Iterator[dict[str, Any]]:
        for ent_path in self.entities_dir.glob("*.md"):
            try:
                post = frontmatter.load(ent_path)
            except Exception:
                continue
            name = ent_path.stem
            result: dict[str, Any] = {
                "name": name,
                "display_name": post.metadata.get("display_name", name),
                "type": post.metadata.get("type", "unknown"),
                "content": post.content,
                "path": str(ent_path.relative_to(self.root)),
            }
            conflict = self.revision_journal.conflict_for("entity", name)
            if conflict:
                for field in conflict.get("conflicted_fields") or []:
                    if field == "content":
                        result.pop("content", None)
                    elif field == "metadata.display_name":
                        result.pop("display_name", None)
                    elif field == "metadata.type":
                        result.pop("type", None)
            yield result

    def iter_events(self) -> Iterator[dict[str, Any]]:
        """Stream all events as parsed dicts. Used by query layer.
        For ~10k events this is fine; switch to SQLite index if it bites."""
        for path in self.events_dir.rglob("*.md"):
            try:
                post = frontmatter.load(path)
            except Exception:
                continue  # skip corrupt files; don't take down recall
            yield {
                "id": post.metadata.get("id"),
                "event_date": post.metadata.get("event_date"),
                "recorded_at": post.metadata.get("recorded_at"),
                "entities": post.metadata.get("entities", []),
                "tags": post.metadata.get("tags", []),
                "agent": post.metadata.get("agent"),
                "content": post.content,
                "path": str(path.relative_to(self.root)),
            }

    def iter_wiki_pages(self) -> Iterator[dict[str, Any]]:
        """Stream native wiki markdown pages from <root>/wiki.

        AgentMemory can sync wiki pages as events for compatibility, but the
        server also supports durable native wiki pages under the shared vault.
        """
        for path in self.wiki_dir.rglob("*.md"):
            if path.name in {"index.md", "log.md"}:
                continue
            try:
                post = frontmatter.load(path)
            except Exception:
                continue
            slug = str(post.metadata.get("slug") or path.stem)
            yield {
                "slug": slug,
                "title": post.metadata.get("title") or post.metadata.get("display_name") or slug,
                "summary": post.metadata.get("summary") or "",
                "body": post.content,
                "path": str(path.relative_to(self.root)),
                "tags": post.metadata.get("tags", []),
                "rag_collections": post.metadata.get("rag_collections", []),
                "source_urls": post.metadata.get("source_urls", []),
                "updated_at": _metadata_iso(
                    post.metadata.get("updated_at") or post.metadata.get("refreshed_at")
                ),
            }

    def ensure_query_index(self) -> None:
        if not self.query_index.is_ready():
            self.rebuild_query_index()

    def rebuild_query_index(self) -> dict[str, Any]:
        # Imported lazily to avoid a module import cycle: queries imports Storage
        # for public type annotations and legacy filesystem fallback paths.
        from .queries import _wiki_page_from_event

        events = list(self.iter_events())
        wiki_pages: list[dict[str, Any]] = []
        seen_slugs: set[str] = set()
        for page in self.iter_wiki_pages():
            page = dict(page)
            page["native"] = True
            wiki_pages.append(page)
            seen_slugs.add(page["slug"])
        event_pages: list[dict[str, Any]] = []
        for ev in events:
            page = _wiki_page_from_event(ev)
            if page and page["slug"] not in seen_slugs:
                page = dict(page)
                page["native"] = False
                event_pages.append(page)
                seen_slugs.add(page["slug"])
        indexed_entities = []
        for entity in self.iter_entities():
            indexed_entities.append(
                {
                    **entity,
                    "display_name": entity.get("display_name", ""),
                    "type": entity.get("type", ""),
                    "content": entity.get("content", ""),
                }
            )
        result = self.query_index.rebuild(
            events=events,
            entities=indexed_entities,
            wiki_pages=[*wiki_pages, *event_pages],
        )
        self.revision_journal.project_into_index(self.query_index)
        result["memory_revisions"] = self.revision_journal.revision_count
        return result

    @staticmethod
    def _atomic_write_text(path: Path, value: str) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        descriptor, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
        try:
            with os.fdopen(descriptor, "w", encoding="utf-8") as handle:
                handle.write(value)
                handle.flush()
                os.fsync(handle.fileno())
            os.replace(temporary, path)
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

    def _index_event_record(self, event: dict[str, Any]) -> None:
        try:
            self.query_index.index_event(event)
            from .queries import _wiki_page_from_event

            page = _wiki_page_from_event(event)
            if page:
                self.query_index.index_wiki_page(page, native=False)
        except Exception:
            # The SQLite index is only a rebuildable cache. Markdown writes
            # must stay successful even if indexing is temporarily unhealthy.
            pass

    def _index_entity_path(self, path: Path) -> None:
        try:
            name = path.stem
            projected = self.read_entity(name)
            if projected is None:
                return
            self.query_index.index_entity(
                {
                    "name": name,
                    "display_name": projected.get("display_name", ""),
                    "type": projected.get("frontmatter", {}).get("type", ""),
                    "content": projected.get("content", ""),
                    "path": str(path.relative_to(self.root)),
                }
            )
        except Exception:
            pass

    # --- index ------------------------------------------------------------

    def _index_path(self) -> Path:
        return self.index_dir / "entities.json"

    def _invalidate_index(self) -> None:
        with self._index_lock:
            self._index_cache = None
            try:
                self._index_path().unlink()
            except FileNotFoundError:
                pass
            except OSError:
                # The legacy JSON entity index is only a cache. Some deployed
                # paths may be read-only while the SQLite cache remains usable;
                # memory writes must not fail just because this cache cannot be
                # removed.
                pass

    def get_entity_index(self) -> dict[str, dict[str, Any]]:
        """{normalized_name: {event_count, last_event_date, type}}"""
        with self._index_lock:
            idx_path = self._index_path()
            if self._index_cache is not None and idx_path.exists() \
                    and idx_path.stat().st_mtime == self._index_cache_mtime:
                return self._index_cache  # type: ignore[return-value]

            index: dict[str, dict[str, Any]] = {}

            # Seed from entity files (so empty entities show up).
            for ent_path in self.entities_dir.glob("*.md"):
                try:
                    projected = self.read_entity(ent_path.stem)
                except Exception:
                    continue
                name = ent_path.stem
                index[name] = {
                    "name": name,
                    "event_count": 0,
                    "last_event_date": None,
                }
                if projected is not None:
                    if "display_name" in projected:
                        index[name]["display_name"] = projected["display_name"]
                    projected_type = projected.get("frontmatter", {}).get("type")
                    if projected_type is not None:
                        index[name]["type"] = projected_type

            # Tally events.
            for ev in self.iter_events():
                ed = ev.get("event_date")
                for ent in ev.get("entities") or []:
                    bucket = index.setdefault(ent, {
                        "name": ent,
                        "display_name": ent,
                        "type": "unknown",
                        "event_count": 0,
                        "last_event_date": None,
                    })
                    bucket["event_count"] += 1
                    if ed and (
                        bucket["last_event_date"] is None
                        or ed > bucket["last_event_date"]
                    ):
                        bucket["last_event_date"] = ed

            try:
                idx_path.write_text(json.dumps(index, indent=2), encoding="utf-8")
                self._index_cache_mtime = idx_path.stat().st_mtime
            except OSError:
                pass

            self._index_cache = index
            return index
