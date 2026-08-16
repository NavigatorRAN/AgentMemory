"""Query layer: recall, search, timeline. Reads from Storage."""
from __future__ import annotations

from collections import defaultdict
from datetime import datetime, timezone
from typing import Any

from .dates import parse_when
from . import metrics
from .storage import Storage, normalize_entity, slugify_title


def _within_window(
    event_date: str | None,
    since_dt: datetime | None,
    until_dt: datetime | None,
) -> bool:
    if not event_date:
        return since_dt is None and until_dt is None
    try:
        ed = datetime.fromisoformat(event_date)
    except ValueError:
        return False
    if ed.tzinfo is None:
        ed = ed.replace(tzinfo=timezone.utc)
    if since_dt and ed < since_dt:
        return False
    if until_dt and ed > until_dt:
        return False
    return True


def _strip_content(ev: dict[str, Any]) -> dict[str, Any]:
    return {k: v for k, v in ev.items() if k != "content"}


def _iso_when(value: str | None) -> str | None:
    if not value:
        return None
    return parse_when(value).isoformat()


def _list_from_line(content: str, prefix: str) -> list[str]:
    for line in content.splitlines():
        if line.startswith(prefix):
            value = line.removeprefix(prefix).strip()
            return [item.strip() for item in value.split(",") if item.strip()]
    return []


def _line_value(content: str, prefix: str) -> str | None:
    for line in content.splitlines():
        if line.startswith(prefix):
            return line.removeprefix(prefix).strip()
    return None


def _summary_from_wiki_event(content: str) -> str:
    lines = content.splitlines()
    if len(lines) < 3:
        return ""
    paragraphs: list[str] = []
    current: list[str] = []
    for line in lines[2:]:
        stripped = line.strip()
        if not stripped:
            if current:
                paragraphs.append(" ".join(current))
                current = []
            continue
        if stripped.startswith(("Local wiki page:", "Refresh reason:", "Entities:", "Tags:", "RAG collections:", "Source URLs:", "# ")):
            break
        current.append(stripped)
    if current:
        paragraphs.append(" ".join(current))
    return paragraphs[0] if paragraphs else ""


def _slug_from_wiki_event(ev: dict[str, Any]) -> str | None:
    for ent in ev.get("entities") or []:
        if isinstance(ent, str) and ent.startswith("wiki:"):
            return ent.split(":", 1)[1]
        if isinstance(ent, str) and ent.startswith("wiki-"):
            return ent.removeprefix("wiki-")
    path = _line_value(ev.get("content") or "", "Local wiki page:")
    if path:
        return path.rsplit("/", 1)[-1].removesuffix(".md")
    return None


def _wiki_page_from_event(ev: dict[str, Any]) -> dict[str, Any] | None:
    tags = ev.get("tags") or []
    entities = ev.get("entities") or []
    if "agentmemory-wiki" not in tags and "agentmemory-wiki" not in entities:
        return None

    content = ev.get("content") or ""
    title_line = content.splitlines()[0] if content.splitlines() else ""
    is_compiled_page = title_line.startswith("Wiki page refreshed:")
    if is_compiled_page:
        title = title_line.removeprefix("Wiki page refreshed:").strip()
    else:
        title = title_line.strip() or "Wiki memory record"
        if len(title) > 160:
            title = title[:157].rstrip() + "..."

    slug = _slug_from_wiki_event(ev)
    if not slug:
        path = ev.get("path")
        if isinstance(path, str) and path:
            slug = PathLikeSlug.from_event_path(path)
        else:
            slug = slugify_title(title)

    path = _line_value(content, "Local wiki page:") or f"wiki/{slug}.md"
    return {
        "slug": slug,
        "title": title,
        "summary": _summary_from_wiki_event(content),
        "body": content,
        "path": path,
        "tags": tags,
        "rag_collections": _list_from_line(content, "RAG collections:"),
        "source_urls": _list_from_line(content, "Source URLs:"),
        "updated_at": ev.get("recorded_at") or ev.get("event_date"),
    }


class PathLikeSlug:
    @staticmethod
    def from_event_path(path: str) -> str:
        name = path.rsplit("/", 1)[-1].removesuffix(".md")
        # Event filenames begin with a date and ULID suffix; keep the human
        # slug after that prefix when present.
        parts = name.split("-", 2)
        if len(parts) == 3 and parts[0].isdigit() and parts[1].isalnum():
            return parts[2]
        return slugify_title(name)


def _iter_wiki_pages(storage: Storage) -> list[dict[str, Any]]:
    pages: dict[str, dict[str, Any]] = {}

    for page in storage.iter_wiki_pages():
        pages[page["slug"]] = page

    event_pages: list[dict[str, Any]] = []
    for ev in storage.iter_events():
        page = _wiki_page_from_event(ev)
        if page:
            event_pages.append(page)

    event_pages.sort(key=lambda p: p.get("updated_at") or "", reverse=True)
    for page in event_pages:
        pages.setdefault(page["slug"], page)

    return list(pages.values())


def _matches_wiki_query(page: dict[str, Any], needle: str) -> bool:
    if not needle:
        return True
    haystack = "\n".join([
        str(page.get("slug") or ""),
        str(page.get("title") or ""),
        str(page.get("summary") or ""),
        str(page.get("body") or ""),
        " ".join(page.get("tags") or []),
        " ".join(page.get("rag_collections") or []),
    ]).lower()
    return needle in haystack


# ---------------------------------------------------------------------------
# Tool implementations
# ---------------------------------------------------------------------------

def recall_for_entity(
    storage: Storage,
    entity: str,
    since: str | None,
    until: str | None,
    limit: int,
    include_content: bool,
) -> list[dict[str, Any]]:
    target = normalize_entity(entity)
    since_dt = parse_when(since) if since else None
    until_dt = parse_when(until) if until else None
    try:
        storage.ensure_query_index()
        return storage.query_index.recall_for_entity(
            entity=target,
            since=_iso_when(since),
            until=_iso_when(until),
            limit=limit,
            include_content=include_content,
        )
    except Exception as error:
        metrics.record_index_fallback("recall_for_entity", error)

    matches: list[dict[str, Any]] = []
    for ev in storage.iter_events():
        if target not in (ev.get("entities") or []):
            continue
        if not _within_window(ev.get("event_date"), since_dt, until_dt):
            continue
        matches.append(ev)

    matches.sort(key=lambda e: e.get("event_date") or "", reverse=True)
    matches = matches[:limit]
    if not include_content:
        matches = [_strip_content(e) for e in matches]
    return matches


def search_events(
    storage: Storage,
    query: str,
    entities: list[str] | None,
    since: str | None,
    limit: int,
) -> list[dict[str, Any]]:
    needle = query.lower().strip()
    if not needle:
        return []

    targets = {normalize_entity(e) for e in entities} if entities else None
    since_dt = parse_when(since) if since else None
    try:
        storage.ensure_query_index()
        return storage.query_index.search_events(
            query=query,
            entities=sorted(targets) if targets else None,
            since=_iso_when(since),
            limit=limit,
        )
    except Exception as error:
        metrics.record_index_fallback("search_events", error)

    matches: list[dict[str, Any]] = []
    for ev in storage.iter_events():
        if targets is not None:
            if not (set(ev.get("entities") or []) & targets):
                continue
        if not _within_window(ev.get("event_date"), since_dt, None):
            continue
        haystack = (ev.get("content") or "").lower()
        if needle in haystack:
            matches.append(ev)

    matches.sort(key=lambda e: e.get("event_date") or "", reverse=True)
    return matches[:limit]


def _projected_memory_record(event: dict[str, Any]) -> dict[str, Any] | None:
    metadata = event.get("projection_metadata")
    if not isinstance(metadata, dict):
        return None

    source_event_id = metadata.get("source_event_id") or event.get("source_event_id")
    source_created_at = metadata.get("source_created_at") or event.get("event_date")
    required_strings = {
        "memory_key": metadata.get("memory_key"),
        "status": metadata.get("status"),
        "scope": metadata.get("scope"),
        "owner_id": metadata.get("owner_id"),
        "source_event_id": source_event_id,
        "source_created_at": source_created_at,
    }
    if any(not isinstance(value, str) or not value for value in required_strings.values()):
        return None
    supersedes = metadata.get("supersedes", [])
    if not isinstance(supersedes, list) or any(
        not isinstance(value, str) or not value for value in supersedes
    ):
        return None
    if required_strings["scope"] not in {"command-team-shared", "specialist-private"}:
        return None
    try:
        parse_when(required_strings["source_created_at"])
    except ValueError:
        return None

    return {
        **event,
        **metadata,
        **required_strings,
        "supersedes": supersedes,
    }


def _memory_visible(
    record: dict[str, Any],
    owner_id: str,
    team_id: str | None,
    specialist_id: str | None,
) -> bool:
    if record["owner_id"] != owner_id:
        return False
    if record["scope"] == "command-team-shared":
        return bool(team_id) and record.get("team_id") == team_id
    return bool(specialist_id) and record.get("specialist_id") == specialist_id


def _has_supersession_cycle(records: list[dict[str, Any]]) -> bool:
    identifiers = {record["source_event_id"] for record in records}
    edges = {
        record["source_event_id"]: [
            target for target in record["supersedes"] if target in identifiers
        ]
        for record in records
    }
    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(identifier: str) -> bool:
        if identifier in visiting:
            return True
        if identifier in visited:
            return False
        visiting.add(identifier)
        if any(visit(target) for target in edges[identifier]):
            return True
        visiting.remove(identifier)
        visited.add(identifier)
        return False

    return any(visit(identifier) for identifier in edges)


def recall_active_memory(
    storage: Storage,
    query: str,
    owner_id: str,
    team_id: str | None,
    specialist_id: str | None,
    limit: int,
    as_of: str | None,
) -> dict[str, list[dict[str, Any]]]:
    """Return visible active memory leaves while retaining journal history."""
    cutoff = parse_when(as_of) if as_of else None
    all_records: list[dict[str, Any]] = []
    diagnostics: list[dict[str, Any]] = []
    for event in storage.iter_events():
        if event.get("projection_event_type") != "command_experience":
            continue
        record = _projected_memory_record(event)
        if record is None:
            diagnostics.append(
                {
                    "code": "invalid_projection_metadata",
                    "event_id": event.get("id"),
                }
            )
            continue
        if cutoff and parse_when(record["source_created_at"]) > cutoff:
            continue
        all_records.append(record)

    all_by_id = {record["source_event_id"]: record for record in all_records}
    visible = [
        record
        for record in all_records
        if _memory_visible(record, owner_id, team_id, specialist_id)
    ]
    visible_ids = {record["source_event_id"] for record in visible}
    by_key: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for record in visible:
        by_key[record["memory_key"]].append(record)

    records: list[dict[str, Any]] = []
    needle = query.strip().lower()
    for memory_key, lineage in by_key.items():
        bad_reference = next(
            (
                target
                for record in lineage
                for target in record["supersedes"]
                if target not in visible_ids
            ),
            None,
        )
        if bad_reference is not None:
            diagnostics.append(
                {
                    "code": "invisible_supersession_reference",
                    "memory_key": memory_key,
                    "source_event_id": bad_reference,
                    "reference_exists": bad_reference in all_by_id,
                }
            )
            continue
        if _has_supersession_cycle(lineage):
            diagnostics.append(
                {"code": "supersession_cycle", "memory_key": memory_key}
            )
            continue

        superseded = {
            target for record in lineage for target in record["supersedes"]
        }
        for record in lineage:
            if record["status"] != "active":
                continue
            if record["source_event_id"] in superseded:
                continue
            haystack = f"{record['memory_key']}\n{record.get('content', '')}".lower()
            if needle and needle not in haystack:
                continue
            records.append(record)

    records.sort(key=lambda record: record["source_created_at"], reverse=True)
    return {"records": records[: max(0, limit)], "diagnostics": diagnostics}


def recall_memory_history(
    storage: Storage,
    memory_key: str,
    owner_id: str,
    limit: int,
) -> list[dict[str, Any]]:
    """Return a memory lineage without hiding inactive or superseded records."""
    records = []
    for event in storage.iter_events():
        if event.get("projection_event_type") != "command_experience":
            continue
        record = _projected_memory_record(event)
        if record is None:
            continue
        if record["memory_key"] == memory_key and record["owner_id"] == owner_id:
            records.append(record)
    records.sort(key=lambda record: record["source_created_at"], reverse=True)
    return records[: max(0, limit)]


def timeline(
    storage: Storage,
    entity: str,
    since: str | None,
    granularity: str,
) -> list[dict[str, Any]]:
    if granularity not in ("day", "week", "month"):
        raise ValueError(f"granularity must be day|week|month, got {granularity!r}")

    target = normalize_entity(entity)
    since_dt = parse_when(since) if since else None
    try:
        storage.ensure_query_index()
        return storage.query_index.timeline(
            entity=target,
            since=_iso_when(since),
            granularity=granularity,
        )
    except Exception as error:
        metrics.record_index_fallback("timeline", error)

    buckets: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for ev in storage.iter_events():
        if target not in (ev.get("entities") or []):
            continue
        if not _within_window(ev.get("event_date"), since_dt, None):
            continue
        ed = ev.get("event_date")
        if not ed:
            continue
        try:
            dt = datetime.fromisoformat(ed)
        except ValueError:
            continue
        if granularity == "day":
            key = dt.strftime("%Y-%m-%d")
        elif granularity == "week":
            iso = dt.isocalendar()
            key = f"{iso.year}-W{iso.week:02d}"
        else:
            key = dt.strftime("%Y-%m")
        buckets[key].append(ev)

    result = []
    for key in sorted(buckets.keys(), reverse=True):
        evs = buckets[key]
        # Sample titles: first line of content, up to 3 events.
        samples = [
            (e.get("content") or "").strip().split("\n", 1)[0][:80]
            for e in evs[:3]
        ]
        result.append({
            "bucket": key,
            "event_count": len(evs),
            "sample_titles": samples,
        })
    return result


def get_entity(storage: Storage, name: str) -> dict[str, Any]:
    entity = storage.read_entity(name)
    if entity is None:
        return {"error": "not_found", "name": normalize_entity(name)}

    recent = recall_for_entity(
        storage,
        entity=entity["name"],
        since=None,
        until=None,
        limit=5,
        include_content=False,
    )
    entity["recent_events"] = recent
    return entity


def list_entities(
    storage: Storage,
    prefix: str | None,
    type_filter: str | None,
) -> list[dict[str, Any]]:
    try:
        storage.ensure_query_index()
        return storage.query_index.list_entities(
            prefix=normalize_entity(prefix) if prefix else None,
            type_filter=type_filter,
        )
    except Exception as error:
        metrics.record_index_fallback("list_entities", error)

    index = storage.get_entity_index()
    out = []
    for name, info in index.items():
        if prefix and not name.startswith(normalize_entity(prefix)):
            continue
        if type_filter and info.get("type") != type_filter:
            continue
        out.append(info)
    out.sort(key=lambda x: (-(x.get("event_count") or 0), x["name"]))
    return out


def search_wiki(storage: Storage, query: str, limit: int = 20) -> list[dict[str, Any]]:
    """Search native wiki pages and AgentMemory wiki refresh events."""
    try:
        storage.ensure_query_index()
        return storage.query_index.search_wiki(query=query, limit=limit)
    except Exception as error:
        metrics.record_index_fallback("search_wiki", error)

    needle = query.lower().strip()
    matches = [
        page for page in _iter_wiki_pages(storage)
        if _matches_wiki_query(page, needle)
    ]
    matches.sort(key=lambda p: (p.get("updated_at") or "", p.get("title") or ""), reverse=True)
    return [
        {k: v for k, v in page.items() if k != "body"}
        for page in matches[:limit]
    ]


def get_wiki_page(storage: Storage, slug: str) -> dict[str, Any]:
    """Read a native or event-backed wiki page by slug."""
    target = normalize_entity(slug)
    try:
        storage.ensure_query_index()
        page = storage.query_index.get_wiki_page(slug=target)
        if page:
            return page
    except Exception as error:
        metrics.record_index_fallback("get_wiki_page", error)

    for page in _iter_wiki_pages(storage):
        if normalize_entity(page.get("slug") or "") == target:
            return page
    return {"error": "not_found", "slug": target}


def memory_graph(
    storage: Storage,
    query: str | None = None,
    limit: int = 200,
) -> dict[str, Any]:
    """Build a lightweight entity/wiki graph from events and wiki pages."""
    try:
        storage.ensure_query_index()
        return storage.query_index.memory_graph(query=query, limit=limit)
    except Exception as error:
        metrics.record_index_fallback("memory_graph", error)

    nodes: dict[str, dict[str, Any]] = {}
    edges: dict[tuple[str, str, str], dict[str, Any]] = {}

    def add_entity_node(name: str) -> str:
        normalized = normalize_entity(name)
        node_id = f"entity:{normalized}"
        nodes.setdefault(node_id, {
            "id": node_id,
            "label": normalized,
            "kind": "entity",
            "entity": normalized,
            "event_count": 0,
        })
        return node_id

    def add_edge(source: str, target: str, relation: str, weight: int = 1) -> None:
        if source == target:
            return
        key = (source, target, relation)
        if key not in edges:
            edges[key] = {
                "source": source,
                "target": target,
                "relation": relation,
                "weight": 0,
            }
        edges[key]["weight"] += weight

    for name, info in storage.get_entity_index().items():
        node_id = add_entity_node(name)
        nodes[node_id]["event_count"] = info.get("event_count") or 0
        nodes[node_id]["type"] = info.get("type")

    for ev in storage.iter_events():
        raw_entities = [e for e in ev.get("entities") or [] if e]
        event_entities = [
            normalize_entity(e) for e in raw_entities
            if not str(e).startswith(("wiki:", "wiki-"))
        ]
        entity_ids = [add_entity_node(e) for e in event_entities if not e.startswith("wiki:")]
        for idx, source in enumerate(entity_ids):
            for target in entity_ids[idx + 1:]:
                relation = "co_occurs"
                tags = ev.get("tags") or []
                if "link" in tags and len(tags) > 1:
                    relation = tags[1]
                add_edge(source, target, relation)

        page = _wiki_page_from_event(ev)
        if page:
            wiki_id = f"wiki:{page['slug']}"
            nodes.setdefault(wiki_id, {
                "id": wiki_id,
                "label": page["title"],
                "kind": "wiki",
                "slug": page["slug"],
                "tags": page.get("tags") or [],
            })
            for ent in event_entities:
                if ent == "agentmemory-wiki":
                    continue
                add_edge(f"entity:{ent}", wiki_id, "documents")

    for page in storage.iter_wiki_pages():
        wiki_id = f"wiki:{page['slug']}"
        nodes.setdefault(wiki_id, {
            "id": wiki_id,
            "label": page["title"],
            "kind": "wiki",
            "slug": page["slug"],
            "tags": page.get("tags") or [],
        })

    if query:
        needle = query.lower().strip()
        matching = {
            node_id for node_id, node in nodes.items()
            if needle in " ".join(str(value) for value in node.values()).lower()
        }
        adjacent = set(matching)
        for edge in edges.values():
            if edge["source"] in matching or edge["target"] in matching:
                adjacent.add(edge["source"])
                adjacent.add(edge["target"])
        nodes = {node_id: node for node_id, node in nodes.items() if node_id in adjacent}
        edges = {
            key: edge for key, edge in edges.items()
            if edge["source"] in nodes and edge["target"] in nodes
        }

    sorted_nodes = sorted(
        nodes.values(),
        key=lambda n: (n.get("kind") != "entity", -(n.get("event_count") or 0), n.get("label") or ""),
    )[:limit]
    kept = {node["id"] for node in sorted_nodes}
    sorted_edges = [
        edge for edge in edges.values()
        if edge["source"] in kept and edge["target"] in kept
    ]
    sorted_edges.sort(key=lambda e: (-(e.get("weight") or 0), e["source"], e["target"]))

    return {
        "nodes": sorted_nodes,
        "edges": sorted_edges,
        "summary": {
            "node_count": len(sorted_nodes),
            "edge_count": len(sorted_edges),
            "returned_node_count": len(sorted_nodes),
            "returned_edge_count": len(sorted_edges),
            "total_node_count": len(nodes),
            "total_edge_count": len(edges),
            "truncated": len(nodes) > len(sorted_nodes),
            "cache_generated_at": None,
            "query": query,
        },
    }
