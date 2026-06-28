"""Derived SQLite query index for the markdown memory vault.

The markdown vault remains the source of truth. This module maintains a
rebuildable cache for fast search, entity recall, wiki lookup, and graph
overview queries.
"""
from __future__ import annotations

import json
import sqlite3
import time
from collections.abc import Iterable
from pathlib import Path
from typing import Any


SCHEMA_VERSION = 1


class QueryIndexError(RuntimeError):
    """Raised when the derived index cannot satisfy a query."""


def _json(value: Any) -> str:
    return json.dumps(value or [], sort_keys=True)


def _loads(value: str | None) -> list[Any]:
    if not value:
        return []
    try:
        loaded = json.loads(value)
    except json.JSONDecodeError:
        return []
    return loaded if isinstance(loaded, list) else []


def _event_title(content: str) -> str:
    return (content or "").strip().split("\n", 1)[0][:160]


def _bucket_for_date(event_date: str | None, granularity: str) -> str | None:
    if not event_date:
        return None
    if granularity == "day":
        return event_date[:10]
    if granularity == "month":
        return event_date[:7]
    if granularity == "week":
        from datetime import datetime

        parsed = datetime.fromisoformat(event_date)
        iso = parsed.isocalendar()
        return f"{iso.year}-W{iso.week:02d}"
    raise ValueError(f"granularity must be day|week|month, got {granularity!r}")


class QueryIndex:
    def __init__(self, index_dir: Path):
        self.index_dir = index_dir
        self.db_path = index_dir / "memory.sqlite3"
        self.index_dir.mkdir(parents=True, exist_ok=True)
        self._fts_available: bool | None = None

    def connect(self, *, readonly: bool = False) -> sqlite3.Connection:
        if readonly:
            if not self.db_path.exists():
                raise QueryIndexError(f"query index missing: {self.db_path}")
            conn = sqlite3.connect(f"{self.db_path.resolve().as_uri()}?mode=ro", uri=True)
            conn.row_factory = sqlite3.Row
            conn.execute("PRAGMA query_only=ON")
            return conn
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        conn.execute("PRAGMA busy_timeout=5000")
        if str(self.db_path).startswith(("/mnt/", "/Volumes/")):
            conn.execute("PRAGMA journal_mode=DELETE")
        else:
            conn.execute("PRAGMA journal_mode=WAL")
        conn.execute("PRAGMA synchronous=NORMAL")
        conn.execute("PRAGMA foreign_keys=ON")
        self.ensure_schema(conn)
        return conn

    def ensure_schema(self, conn: sqlite3.Connection) -> None:
        conn.executescript(
            """
            CREATE TABLE IF NOT EXISTS meta (
                key TEXT PRIMARY KEY,
                value TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS events (
                id TEXT PRIMARY KEY,
                event_date TEXT,
                recorded_at TEXT,
                agent TEXT,
                content TEXT NOT NULL,
                path TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS event_entities (
                event_id TEXT NOT NULL,
                entity TEXT NOT NULL,
                PRIMARY KEY (event_id, entity)
            );
            CREATE INDEX IF NOT EXISTS idx_event_entities_entity
                ON event_entities(entity, event_id);
            CREATE TABLE IF NOT EXISTS event_tags (
                event_id TEXT NOT NULL,
                tag TEXT NOT NULL,
                PRIMARY KEY (event_id, tag)
            );
            CREATE INDEX IF NOT EXISTS idx_event_tags_tag
                ON event_tags(tag, event_id);
            CREATE TABLE IF NOT EXISTS entities (
                name TEXT PRIMARY KEY,
                display_name TEXT NOT NULL,
                type TEXT NOT NULL,
                content TEXT NOT NULL DEFAULT '',
                path TEXT NOT NULL DEFAULT '',
                event_count INTEGER NOT NULL DEFAULT 0,
                last_event_date TEXT
            );
            CREATE INDEX IF NOT EXISTS idx_entities_type_name
                ON entities(type, name);
            CREATE TABLE IF NOT EXISTS wiki_pages (
                slug TEXT PRIMARY KEY,
                title TEXT NOT NULL,
                summary TEXT NOT NULL DEFAULT '',
                body TEXT NOT NULL DEFAULT '',
                path TEXT NOT NULL DEFAULT '',
                tags_json TEXT NOT NULL DEFAULT '[]',
                rag_collections_json TEXT NOT NULL DEFAULT '[]',
                source_urls_json TEXT NOT NULL DEFAULT '[]',
                updated_at TEXT,
                native INTEGER NOT NULL DEFAULT 0
            );
            CREATE TABLE IF NOT EXISTS graph_nodes (
                id TEXT PRIMARY KEY,
                label TEXT NOT NULL,
                kind TEXT NOT NULL,
                entity TEXT,
                slug TEXT,
                type TEXT,
                tags_json TEXT NOT NULL DEFAULT '[]',
                event_count INTEGER NOT NULL DEFAULT 0
            );
            CREATE TABLE IF NOT EXISTS graph_edges (
                source TEXT NOT NULL,
                target TEXT NOT NULL,
                relation TEXT NOT NULL,
                weight INTEGER NOT NULL DEFAULT 1,
                PRIMARY KEY (source, target, relation)
            );
            CREATE INDEX IF NOT EXISTS idx_graph_edges_source
                ON graph_edges(source);
            CREATE INDEX IF NOT EXISTS idx_graph_edges_target
                ON graph_edges(target);
            """
        )
        conn.execute(
            "INSERT OR REPLACE INTO meta(key, value) VALUES('schema_version', ?)",
            (str(SCHEMA_VERSION),),
        )
        self._ensure_fts(conn)
        conn.commit()

    def _ensure_fts(self, conn: sqlite3.Connection) -> bool:
        if self._fts_available is False:
            return False
        try:
            conn.execute(
                "CREATE VIRTUAL TABLE IF NOT EXISTS event_fts "
                "USING fts5(id UNINDEXED, content)"
            )
            conn.execute(
                "CREATE VIRTUAL TABLE IF NOT EXISTS wiki_fts "
                "USING fts5(slug UNINDEXED, title, summary, body)"
            )
            self._fts_available = True
            return True
        except sqlite3.DatabaseError:
            self._fts_available = False
            return False

    def is_ready(self) -> bool:
        if not self.db_path.exists():
            return False
        try:
            with self.connect(readonly=True) as conn:
                row = conn.execute(
                    "SELECT value FROM meta WHERE key = 'rebuilt_at'"
                ).fetchone()
                return row is not None
        except sqlite3.DatabaseError:
            return False

    def rebuild(
        self,
        *,
        events: Iterable[dict[str, Any]],
        entities: Iterable[dict[str, Any]],
        wiki_pages: Iterable[dict[str, Any]],
    ) -> dict[str, Any]:
        with self.connect() as conn:
            conn.executescript(
                """
                DELETE FROM graph_edges;
                DELETE FROM graph_nodes;
                DELETE FROM wiki_pages;
                DELETE FROM event_tags;
                DELETE FROM event_entities;
                DELETE FROM events;
                DELETE FROM entities;
                """
            )
            if self._ensure_fts(conn):
                conn.execute("DELETE FROM event_fts")
                conn.execute("DELETE FROM wiki_fts")

            event_count = 0
            for event in events:
                self.index_event(event, conn=conn, refresh_graph=False, refresh_counts=False)
                event_count += 1

            entity_count = 0
            for entity in entities:
                self.index_entity(entity, conn=conn, refresh_counts=False)
                entity_count += 1
            self.refresh_entity_counts(conn)

            wiki_count = 0
            for page in wiki_pages:
                self.index_wiki_page(page, conn=conn, native=bool(page.get("native")))
                wiki_count += 1

            graph = self.refresh_graph_cache(conn)
            now = str(time.time())
            conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('rebuilt_at', ?)", (now,))
            conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_cache_generated_at', ?)", (now,))
            conn.commit()
            return {
                "events": event_count,
                "entities": entity_count,
                "wiki_pages": wiki_count,
                "graph_nodes": graph["nodes"],
                "graph_edges": graph["edges"],
                "db_path": str(self.db_path),
            }

    def index_event(
        self,
        event: dict[str, Any],
        *,
        conn: sqlite3.Connection | None = None,
        refresh_graph: bool = True,
        refresh_counts: bool = True,
    ) -> None:
        owns_conn = conn is None
        if conn is None:
            conn = self.connect()
        try:
            event_id = str(event.get("id") or "")
            if not event_id:
                return
            content = str(event.get("content") or "")
            conn.execute(
                """
                INSERT OR REPLACE INTO events(id, event_date, recorded_at, agent, content, path)
                VALUES (?, ?, ?, ?, ?, ?)
                """,
                (
                    event_id,
                    event.get("event_date"),
                    event.get("recorded_at"),
                    event.get("agent"),
                    content,
                    str(event.get("path") or ""),
                ),
            )
            conn.execute("DELETE FROM event_entities WHERE event_id = ?", (event_id,))
            conn.execute("DELETE FROM event_tags WHERE event_id = ?", (event_id,))
            for entity in event.get("entities") or []:
                if entity:
                    conn.execute(
                        "INSERT OR IGNORE INTO event_entities(event_id, entity) VALUES (?, ?)",
                        (event_id, str(entity)),
                    )
                    conn.execute(
                        """
                        INSERT OR IGNORE INTO entities(name, display_name, type)
                        VALUES (?, ?, 'unknown')
                        """,
                        (str(entity), str(entity)),
                    )
            for tag in event.get("tags") or []:
                if tag:
                    conn.execute(
                        "INSERT OR IGNORE INTO event_tags(event_id, tag) VALUES (?, ?)",
                        (event_id, str(tag)),
                    )
            if self._ensure_fts(conn):
                conn.execute("DELETE FROM event_fts WHERE id = ?", (event_id,))
                conn.execute("INSERT INTO event_fts(id, content) VALUES (?, ?)", (event_id, content))
            if refresh_counts:
                self.refresh_entity_counts(conn)
            if refresh_graph:
                self.mark_graph_stale(conn)
            if owns_conn:
                conn.commit()
        finally:
            if owns_conn:
                conn.close()

    def index_entity(
        self,
        entity: dict[str, Any],
        *,
        conn: sqlite3.Connection | None = None,
        refresh_counts: bool = True,
    ) -> None:
        owns_conn = conn is None
        if conn is None:
            conn = self.connect()
        try:
            name = str(entity.get("name") or "")
            if not name:
                return
            conn.execute(
                """
                INSERT INTO entities(name, display_name, type, content, path)
                VALUES (?, ?, ?, ?, ?)
                ON CONFLICT(name) DO UPDATE SET
                    display_name = excluded.display_name,
                    type = excluded.type,
                    content = excluded.content,
                    path = excluded.path
                """,
                (
                    name,
                    str(entity.get("display_name") or name),
                    str(entity.get("type") or "unknown"),
                    str(entity.get("content") or ""),
                    str(entity.get("path") or ""),
                ),
            )
            if refresh_counts:
                self.refresh_entity_counts(conn)
            self.mark_graph_stale(conn)
            if owns_conn:
                conn.commit()
        finally:
            if owns_conn:
                conn.close()

    def index_wiki_page(
        self,
        page: dict[str, Any],
        *,
        conn: sqlite3.Connection | None = None,
        native: bool = False,
    ) -> None:
        owns_conn = conn is None
        if conn is None:
            conn = self.connect()
        try:
            slug = str(page.get("slug") or "")
            if not slug:
                return
            title = str(page.get("title") or slug)
            summary = str(page.get("summary") or "")
            body = str(page.get("body") or "")
            conn.execute(
                """
                INSERT OR REPLACE INTO wiki_pages(
                    slug, title, summary, body, path, tags_json,
                    rag_collections_json, source_urls_json, updated_at, native
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                (
                    slug,
                    title,
                    summary,
                    body,
                    str(page.get("path") or ""),
                    _json(page.get("tags") or []),
                    _json(page.get("rag_collections") or []),
                    _json(page.get("source_urls") or []),
                    page.get("updated_at"),
                    1 if native else 0,
                ),
            )
            if self._ensure_fts(conn):
                conn.execute("DELETE FROM wiki_fts WHERE slug = ?", (slug,))
                conn.execute(
                    "INSERT INTO wiki_fts(slug, title, summary, body) VALUES (?, ?, ?, ?)",
                    (slug, title, summary, body),
                )
            self.mark_graph_stale(conn)
            if owns_conn:
                conn.commit()
        finally:
            if owns_conn:
                conn.close()

    def refresh_entity_counts(self, conn: sqlite3.Connection) -> None:
        conn.execute(
            """
            UPDATE entities
            SET event_count = (
                    SELECT COUNT(*) FROM event_entities ee WHERE ee.entity = entities.name
                ),
                last_event_date = (
                    SELECT MAX(e.event_date)
                    FROM event_entities ee
                    JOIN events e ON e.id = ee.event_id
                    WHERE ee.entity = entities.name
                )
            """
        )

    def mark_graph_stale(self, conn: sqlite3.Connection) -> None:
        conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_stale', '1')")

    def ensure_graph_cache(self) -> None:
        with self.connect(readonly=True) as conn:
            row = conn.execute("SELECT value FROM meta WHERE key = 'graph_stale'").fetchone()
            stale = bool(row and row["value"] == "1")
        if stale:
            with self.connect() as conn:
                graph = self.refresh_graph_cache(conn)
                now = str(time.time())
                conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_cache_generated_at', ?)", (now,))
                conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_stale', '0')")
                conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_node_count', ?)", (str(graph["nodes"]),))
                conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_edge_count', ?)", (str(graph["edges"]),))
                conn.commit()

    def refresh_graph_cache(self, conn: sqlite3.Connection) -> dict[str, int]:
        conn.execute("DELETE FROM graph_edges")
        conn.execute("DELETE FROM graph_nodes")
        for row in conn.execute("SELECT * FROM entities"):
            conn.execute(
                """
                INSERT OR REPLACE INTO graph_nodes(
                    id, label, kind, entity, type, event_count
                )
                VALUES (?, ?, 'entity', ?, ?, ?)
                """,
                (
                    f"entity:{row['name']}",
                    row["display_name"] or row["name"],
                    row["name"],
                    row["type"],
                    row["event_count"] or 0,
                ),
            )
        for row in conn.execute("SELECT * FROM wiki_pages"):
            conn.execute(
                """
                INSERT OR REPLACE INTO graph_nodes(
                    id, label, kind, slug, tags_json
                )
                VALUES (?, ?, 'wiki', ?, ?)
                """,
                (
                    f"wiki:{row['slug']}",
                    row["title"],
                    row["slug"],
                    row["tags_json"] or "[]",
                ),
            )

        event_rows = conn.execute(
            """
            SELECT e.id, COALESCE(GROUP_CONCAT(ee.entity, '\n'), '') AS entities,
                   COALESCE(GROUP_CONCAT(et.tag, '\n'), '') AS tags
            FROM events e
            LEFT JOIN event_entities ee ON ee.event_id = e.id
            LEFT JOIN event_tags et ON et.event_id = e.id
            GROUP BY e.id
            """
        ).fetchall()
        for row in event_rows:
            entities = sorted({item for item in (row["entities"] or "").split("\n") if item})
            tags = {item for item in (row["tags"] or "").split("\n") if item}
            event_entities = [e for e in entities if not e.startswith(("wiki:", "wiki-"))]
            relation = "co_occurs"
            if "link" in tags:
                relation = next((tag for tag in tags if tag != "link"), relation)
            for idx, source in enumerate(event_entities):
                for target in event_entities[idx + 1:]:
                    self._add_graph_edge(conn, f"entity:{source}", f"entity:{target}", relation)

        for page in conn.execute("SELECT slug, tags_json FROM wiki_pages"):
            tags = set(_loads(page["tags_json"]))
            if "agentmemory-wiki" not in tags:
                continue
            wiki_id = f"wiki:{page['slug']}"
            for edge in conn.execute(
                """
                SELECT DISTINCT ee.entity
                FROM event_entities ee
                JOIN events e ON e.id = ee.event_id
                JOIN event_tags et ON et.event_id = e.id
                WHERE et.tag = 'agentmemory-wiki'
                """
            ):
                entity = edge["entity"]
                if entity != "agentmemory-wiki" and not entity.startswith(("wiki:", "wiki-")):
                    self._add_graph_edge(conn, f"entity:{entity}", wiki_id, "documents")

        nodes = conn.execute("SELECT COUNT(*) AS count FROM graph_nodes").fetchone()["count"]
        edges = conn.execute("SELECT COUNT(*) AS count FROM graph_edges").fetchone()["count"]
        conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_stale', '0')")
        conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_node_count', ?)", (str(nodes),))
        conn.execute("INSERT OR REPLACE INTO meta(key, value) VALUES('graph_edge_count', ?)", (str(edges),))
        return {"nodes": int(nodes), "edges": int(edges)}

    def _add_graph_edge(self, conn: sqlite3.Connection, source: str, target: str, relation: str) -> None:
        if source == target:
            return
        if target < source:
            source, target = target, source
        conn.execute(
            """
            INSERT INTO graph_edges(source, target, relation, weight)
            VALUES (?, ?, ?, 1)
            ON CONFLICT(source, target, relation) DO UPDATE SET
                weight = weight + 1
            """,
            (source, target, relation),
        )

    def search_events(
        self,
        *,
        query: str,
        entities: list[str] | None,
        since: str | None,
        limit: int,
    ) -> list[dict[str, Any]]:
        needle = query.lower().strip()
        if not needle:
            return []
        with self.connect(readonly=True) as conn:
            clauses = ["INSTR(LOWER(e.content), ?) > 0"]
            params: list[Any] = [needle]
            if since:
                clauses.append("e.event_date >= ?")
                params.append(since)
            entity_filter = ""
            if entities:
                placeholders = ", ".join("?" for _ in entities)
                entity_filter = (
                    "AND EXISTS (SELECT 1 FROM event_entities filter_ee "
                    f"WHERE filter_ee.event_id = e.id AND filter_ee.entity IN ({placeholders}))"
                )
                params.extend(entities)
            params.append(limit)
            rows = conn.execute(
                f"""
                SELECT e.*
                FROM events e
                WHERE {' AND '.join(clauses)}
                {entity_filter}
                ORDER BY e.event_date DESC
                LIMIT ?
                """,
                params,
            ).fetchall()
            return [self._event_from_row(conn, row) for row in rows]

    def recall_for_entity(
        self,
        *,
        entity: str,
        since: str | None,
        until: str | None,
        limit: int,
        include_content: bool,
    ) -> list[dict[str, Any]]:
        with self.connect(readonly=True) as conn:
            clauses = ["ee.entity = ?"]
            params: list[Any] = [entity]
            if since:
                clauses.append("e.event_date >= ?")
                params.append(since)
            if until:
                clauses.append("e.event_date <= ?")
                params.append(until)
            params.append(limit)
            rows = conn.execute(
                f"""
                SELECT e.*
                FROM events e
                JOIN event_entities ee ON ee.event_id = e.id
                WHERE {' AND '.join(clauses)}
                ORDER BY e.event_date DESC
                LIMIT ?
                """,
                params,
            ).fetchall()
            events = [self._event_from_row(conn, row) for row in rows]
            if include_content:
                return events
            return [{k: v for k, v in event.items() if k != "content"} for event in events]

    def timeline(self, *, entity: str, since: str | None, granularity: str) -> list[dict[str, Any]]:
        with self.connect(readonly=True) as conn:
            clauses = ["ee.entity = ?"]
            params: list[Any] = [entity]
            if since:
                clauses.append("e.event_date >= ?")
                params.append(since)
            rows = conn.execute(
                f"""
                SELECT e.event_date, e.content
                FROM events e
                JOIN event_entities ee ON ee.event_id = e.id
                WHERE {' AND '.join(clauses)}
                ORDER BY e.event_date DESC
                """,
                params,
            ).fetchall()
        buckets: dict[str, list[str]] = {}
        for row in rows:
            bucket = _bucket_for_date(row["event_date"], granularity)
            if not bucket:
                continue
            buckets.setdefault(bucket, []).append(_event_title(row["content"]))
        return [
            {"bucket": key, "event_count": len(values), "sample_titles": values[:3]}
            for key, values in sorted(buckets.items(), reverse=True)
        ]

    def list_entities(self, *, prefix: str | None, type_filter: str | None) -> list[dict[str, Any]]:
        with self.connect(readonly=True) as conn:
            clauses: list[str] = []
            params: list[Any] = []
            if prefix:
                clauses.append("name LIKE ?")
                params.append(f"{prefix}%")
            if type_filter:
                clauses.append("type = ?")
                params.append(type_filter)
            where = f"WHERE {' AND '.join(clauses)}" if clauses else ""
            rows = conn.execute(
                f"""
                SELECT name, display_name, type, event_count, last_event_date
                FROM entities
                {where}
                ORDER BY event_count DESC, name ASC
                """,
                params,
            ).fetchall()
            return [dict(row) for row in rows]

    def search_wiki(self, *, query: str, limit: int) -> list[dict[str, Any]]:
        needle = query.lower().strip()
        with self.connect(readonly=True) as conn:
            if needle:
                rows = conn.execute(
                    """
                    SELECT *
                    FROM wiki_pages
                    WHERE INSTR(LOWER(slug || '\n' || title || '\n' || summary || '\n' || body || '\n' || tags_json || '\n' || rag_collections_json), ?) > 0
                    ORDER BY COALESCE(updated_at, '') DESC, title DESC
                    LIMIT ?
                    """,
                    (needle, limit),
                ).fetchall()
            else:
                rows = conn.execute(
                    """
                    SELECT *
                    FROM wiki_pages
                    ORDER BY COALESCE(updated_at, '') DESC, title DESC
                    LIMIT ?
                    """,
                    (limit,),
                ).fetchall()
            return [self._wiki_from_row(row, include_body=False) for row in rows]

    def get_wiki_page(self, *, slug: str) -> dict[str, Any] | None:
        with self.connect(readonly=True) as conn:
            row = conn.execute(
                "SELECT * FROM wiki_pages WHERE slug = ?",
                (slug,),
            ).fetchone()
            return self._wiki_from_row(row, include_body=True) if row else None

    def memory_graph(self, *, query: str | None, limit: int) -> dict[str, Any]:
        self.ensure_graph_cache()
        with self.connect(readonly=True) as conn:
            total_nodes = conn.execute("SELECT COUNT(*) AS count FROM graph_nodes").fetchone()["count"]
            total_edges = conn.execute("SELECT COUNT(*) AS count FROM graph_edges").fetchone()["count"]
            if query:
                needle = f"%{query.lower().strip()}%"
                matched_rows = conn.execute(
                    """
                    SELECT id FROM graph_nodes
                    WHERE LOWER(id || '\n' || label || '\n' || kind || '\n' || COALESCE(entity, '') || '\n' || COALESCE(slug, '') || '\n' || COALESCE(type, '') || '\n' || tags_json) LIKE ?
                    """,
                    (needle,),
                ).fetchall()
                matched = {row["id"] for row in matched_rows}
                adjacent = set(matched)
                if matched:
                    placeholders = ", ".join("?" for _ in matched)
                    edge_rows = conn.execute(
                        f"""
                        SELECT source, target
                        FROM graph_edges
                        WHERE source IN ({placeholders}) OR target IN ({placeholders})
                        """,
                        [*matched, *matched],
                    ).fetchall()
                    for edge in edge_rows:
                        adjacent.add(edge["source"])
                        adjacent.add(edge["target"])
                nodes = self._graph_nodes(conn, ids=adjacent, limit=limit)
            else:
                nodes = self._graph_nodes(conn, ids=None, limit=limit)
            kept = {node["id"] for node in nodes}
            edges = self._graph_edges(conn, kept)
            cache_row = conn.execute(
                "SELECT value FROM meta WHERE key = 'graph_cache_generated_at'"
            ).fetchone()
            return {
                "nodes": nodes,
                "edges": edges,
                "summary": {
                    "node_count": len(nodes),
                    "edge_count": len(edges),
                    "returned_node_count": len(nodes),
                    "returned_edge_count": len(edges),
                    "total_node_count": int(total_nodes),
                    "total_edge_count": int(total_edges),
                    "truncated": int(total_nodes) > len(nodes) if not query else len(nodes) >= limit,
                    "cache_generated_at": cache_row["value"] if cache_row else None,
                    "query": query,
                },
            }

    def _graph_nodes(
        self,
        conn: sqlite3.Connection,
        *,
        ids: set[str] | None,
        limit: int,
    ) -> list[dict[str, Any]]:
        params: list[Any] = []
        where = ""
        if ids is not None:
            if not ids:
                return []
            placeholders = ", ".join("?" for _ in ids)
            where = f"WHERE id IN ({placeholders})"
            params.extend(sorted(ids))
        params.append(limit)
        rows = conn.execute(
            f"""
            SELECT *
            FROM graph_nodes
            {where}
            ORDER BY CASE kind WHEN 'entity' THEN 0 ELSE 1 END,
                     event_count DESC,
                     label ASC
            LIMIT ?
            """,
            params,
        ).fetchall()
        nodes: list[dict[str, Any]] = []
        for row in rows:
            node = {
                "id": row["id"],
                "label": row["label"],
                "kind": row["kind"],
                "event_count": row["event_count"],
            }
            if row["entity"]:
                node["entity"] = row["entity"]
            if row["slug"]:
                node["slug"] = row["slug"]
            if row["type"]:
                node["type"] = row["type"]
            tags = _loads(row["tags_json"])
            if tags:
                node["tags"] = tags
            nodes.append(node)
        return nodes

    def _graph_edges(self, conn: sqlite3.Connection, kept: set[str]) -> list[dict[str, Any]]:
        if not kept:
            return []
        placeholders = ", ".join("?" for _ in kept)
        rows = conn.execute(
            f"""
            SELECT source, target, relation, weight
            FROM graph_edges
            WHERE source IN ({placeholders}) AND target IN ({placeholders})
            ORDER BY weight DESC, source ASC, target ASC
            """,
            [*sorted(kept), *sorted(kept)],
        ).fetchall()
        return [dict(row) for row in rows]

    def _event_from_row(self, conn: sqlite3.Connection, row: sqlite3.Row) -> dict[str, Any]:
        event_id = row["id"]
        entities = [
            item["entity"]
            for item in conn.execute(
                "SELECT entity FROM event_entities WHERE event_id = ? ORDER BY entity",
                (event_id,),
            )
        ]
        tags = [
            item["tag"]
            for item in conn.execute(
                "SELECT tag FROM event_tags WHERE event_id = ? ORDER BY tag",
                (event_id,),
            )
        ]
        return {
            "id": row["id"],
            "event_date": row["event_date"],
            "recorded_at": row["recorded_at"],
            "entities": entities,
            "tags": tags,
            "agent": row["agent"],
            "content": row["content"],
            "path": row["path"],
        }

    def _wiki_from_row(self, row: sqlite3.Row, *, include_body: bool) -> dict[str, Any]:
        page = {
            "slug": row["slug"],
            "title": row["title"],
            "summary": row["summary"],
            "path": row["path"],
            "tags": _loads(row["tags_json"]),
            "rag_collections": _loads(row["rag_collections_json"]),
            "source_urls": _loads(row["source_urls_json"]),
            "updated_at": row["updated_at"],
        }
        if include_body:
            page["body"] = row["body"]
        return page
