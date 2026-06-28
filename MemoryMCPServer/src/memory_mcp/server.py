"""
memory-mcp: episodic memory MCP server for the family agent stack.

Stores events and entities as markdown files with YAML frontmatter,
served over MCP via FastMCP. Designed to live on web-01 alongside
rag-retrieval, with vault on AISharedDrive.
"""
from __future__ import annotations

import os
import threading
from typing import Any

from fastmcp import FastMCP

from .storage import Storage
from . import queries
from . import metrics

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

VAULT_ROOT = os.environ.get(
    "MEMORY_VAULT_ROOT",
    "/mnt/aishareddrive/family-agents/memory",
)
HOST = os.environ.get("MEMORY_HOST", "0.0.0.0")
PORT = int(os.environ.get("MEMORY_PORT", "8006"))

storage = Storage(VAULT_ROOT)


def _prewarm_query_index() -> None:
    try:
        storage.ensure_query_index()
    except Exception as error:
        metrics.record_index_fallback("startup_index_rebuild", error)


threading.Thread(target=_prewarm_query_index, name="memory-mcp-index-prewarm", daemon=True).start()

# FastMCP 3.x: json_response and transport_security are passed to run()/run_http_async,
# not the constructor. Setting them as env-style kwargs at run time below.
mcp = FastMCP("memory")


# ---------------------------------------------------------------------------
# Tools
# ---------------------------------------------------------------------------

@mcp.tool()
def record_event(
    content: str,
    entities: list[str],
    event_date: str | None = None,
    tags: list[str] | None = None,
    agent: str | None = None,
) -> dict[str, Any]:
    """Record an episodic memory event.

    Use this when something happened that future-you (or future-agents) might
    want to recall: a config change, a decision, a problem and its fix, a
    conversation outcome. NOT for stable knowledge — that goes in entities.

    Args:
        content: The event description in markdown. Be specific about what
            happened, not just the topic. "Rotated LiteLLM open-webui key
            after it leaked in chat history; new key in Vaultwarden" is
            better than "key rotation."
        entities: Names of entities this event involves. Lowercase-hyphenated
            on storage. Create entity stubs as needed via upsert_entity.
        event_date: ISO 8601 timestamp of when the event happened. Defaults
            to now. Use this when recording something after the fact.
        tags: Optional free-form tags ("ops", "security", "decision").
        agent: Identifier of the recording agent (e.g. "hermes", "pauline").

    Returns:
        {"id": ulid, "path": relative_path, "entities": normalized_names}
    """
    with metrics.measure_tool("record_event"):
        return storage.record_event(
            content=content,
            entities=entities,
            event_date=event_date,
            tags=tags or [],
            agent=agent,
        )


@mcp.tool()
def recall_for_entity(
    entity: str,
    since: str | None = None,
    until: str | None = None,
    limit: int = 10,
    include_content: bool = True,
) -> list[dict[str, Any]]:
    """Recall recent events involving an entity, most recent first.

    This is the primary memory query tool. Use it when you need to know
    "what happened with X" or "what did we last do about Y."

    Args:
        entity: Entity name. Case-insensitive; matched against normalized form.
        since: ISO 8601 or relative ("7d", "2w", "1m", "6mo", "1y").
        until: ISO 8601 or relative. Defaults to now.
        limit: Max events to return. Default 10.
        include_content: If False, returns metadata only (saves tokens for
            scanning queries).

    Returns:
        List of events: [{id, event_date, entities, tags, agent, content?}, ...]
    """
    with metrics.measure_tool("recall_for_entity"):
        return queries.recall_for_entity(
            storage,
            entity=entity,
            since=since,
            until=until,
            limit=limit,
            include_content=include_content,
        )


@mcp.tool()
def search_events(
    query: str,
    entities: list[str] | None = None,
    since: str | None = None,
    limit: int = 20,
) -> list[dict[str, Any]]:
    """Plain-text search across event content.

    Use when recall_for_entity isn't enough because you don't know the
    entity name, or you're searching for a phrase across entities.

    Args:
        query: Plain text. Case-insensitive substring match. Not regex.
        entities: Optional entity filter — only return events tagging
            at least one of these.
        since: ISO 8601 or relative window.
        limit: Max results. Default 20.

    Returns:
        List of matching events, most recent first.
    """
    with metrics.measure_tool("search_events"):
        return queries.search_events(
            storage,
            query=query,
            entities=entities,
            since=since,
            limit=limit,
        )


@mcp.tool()
def timeline(
    entity: str,
    since: str | None = None,
    granularity: str = "day",
) -> list[dict[str, Any]]:
    """Bucketed event counts for an entity over time.

    Useful for "show me activity on the Spark this month" without pulling
    every event. granularity is 'day', 'week', or 'month'.

    Returns:
        List of {bucket, event_count, sample_titles} sorted newest-first.
    """
    with metrics.measure_tool("timeline"):
        return queries.timeline(
            storage,
            entity=entity,
            since=since,
            granularity=granularity,
        )


@mcp.tool()
def get_entity(name: str) -> dict[str, Any]:
    """Read an entity's canonical page plus a summary of recent activity.

    Returns the entity markdown body, frontmatter, and the 5 most recent
    events tagging this entity. Use this for "tell me about X" queries.

    Returns:
        {name, display_name, frontmatter, content, recent_events: [...]}
        or {error: "not_found"} if the entity doesn't exist.
    """
    with metrics.measure_tool("get_entity"):
        return queries.get_entity(storage, name)


@mcp.tool()
def upsert_entity(
    name: str,
    content: str | None = None,
    metadata: dict[str, Any] | None = None,
    mode: str = "append",
) -> dict[str, Any]:
    """Create or update an entity's canonical page.

    Entities are stable knowledge ("LiteLLM is a router on web-01...").
    Use record_event for things that happened, upsert_entity for what
    things ARE.

    Args:
        name: Entity name. Will be normalized (lowercase, hyphenated).
        content: Markdown body to write/append.
        metadata: Frontmatter fields to merge in (type, aliases, etc.).
        mode: 'create' (fail if exists), 'append' (add to body), or
            'replace' (overwrite body, merge metadata). Default 'append'.

    Returns:
        {name, path, created: bool, mode}
    """
    with metrics.measure_tool("upsert_entity"):
        return storage.upsert_entity(
            name=name,
            content=content,
            metadata=metadata or {},
            mode=mode,
        )


@mcp.tool()
def list_entities(
    prefix: str | None = None,
    type: str | None = None,
) -> list[dict[str, Any]]:
    """List known entities with their event counts.

    Args:
        prefix: Optional name prefix filter.
        type: Optional frontmatter.type filter (e.g. 'service', 'machine').

    Returns:
        [{name, display_name, type, event_count}, ...]
    """
    with metrics.measure_tool("list_entities"):
        return queries.list_entities(storage, prefix=prefix, type_filter=type)


@mcp.tool()
def link_entities(
    entity_a: str,
    entity_b: str,
    relation: str,
    bidirectional: bool = False,
) -> dict[str, Any]:
    """Record a relationship between two entities as a structured event.

    Examples: link_entities("hermes", "vwhomeserver", "runs_on"),
    link_entities("litellm", "spark", "routes_to").

    Stored as an event with a 'link' tag and 'relation' frontmatter field,
    so it shows up in timelines and recall queries naturally.

    Returns:
        {recorded: True, event_id, path}
    """
    with metrics.measure_tool("link_entities"):
        return storage.record_link(
            entity_a=entity_a,
            entity_b=entity_b,
            relation=relation,
            bidirectional=bidirectional,
        )


@mcp.tool()
def search_wiki(
    query: str,
    limit: int = 20,
) -> list[dict[str, Any]]:
    """Search compiled wiki pages and AgentMemory wiki refresh records.

    Use this before broad event search when you want durable synthesized
    knowledge such as codebase maps, framework briefings, or project wiki
    pages. Searches native vault wiki pages plus AgentMemory records tagged
    `agentmemory-wiki`.

    Args:
        query: Plain text query. Empty query returns recent wiki pages.
        limit: Max pages to return. Default 20.

    Returns:
        List of {slug, title, summary, path, tags, rag_collections,
        source_urls, updated_at} without full page body.
    """
    with metrics.measure_tool("search_wiki"):
        return queries.search_wiki(storage, query=query, limit=limit)


@mcp.tool()
def get_wiki_page(slug: str) -> dict[str, Any]:
    """Read a compiled wiki page by slug.

    Args:
        slug: Page slug, for example `foundation-models` or
            `codegraphrag-agentmemory-overview`.

    Returns:
        {slug, title, summary, body, path, tags, rag_collections, source_urls,
        updated_at} or {error: "not_found"}.
    """
    with metrics.measure_tool("get_wiki_page"):
        return queries.get_wiki_page(storage, slug=slug)


@mcp.tool()
def memory_graph(
    query: str | None = None,
    limit: int = 200,
) -> dict[str, Any]:
    """Build a lightweight graph of entities, wiki pages, and relationships.

    With no query, returns a capped overview graph. With a query, returns
    matching nodes plus their immediate neighbors so agents can inspect the
    surrounding memory context.

    Args:
        query: Optional plain-text filter for entity/wiki node labels.
        limit: Max nodes to return. Default 200.

    Returns:
        {nodes: [...], edges: [...], summary: {node_count, edge_count, query}}.
    """
    with metrics.measure_tool("memory_graph"):
        return queries.memory_graph(storage, query=query, limit=limit)


@mcp.tool()
def memory_metrics() -> dict[str, Any]:
    """Return lightweight Memory MCP tool latency counters.

    This intentionally excludes raw memory content. Use it to spot slow tools,
    index fallback symptoms, and graph cache regressions.
    """
    snapshot = metrics.snapshot()
    index_status: dict[str, Any] = {
        "index_dir": str(storage.index_dir),
        "db_path": str(storage.query_index.db_path),
        "db_exists": storage.query_index.db_path.exists(),
        "index_dir_writable": os.access(storage.index_dir, os.W_OK),
    }
    try:
        index_status["ready"] = storage.query_index.is_ready()
        with storage.query_index.connect(readonly=True) as conn:
            for table in ("events", "wiki_pages", "entities", "graph_nodes", "graph_edges"):
                row = conn.execute(f"SELECT COUNT(*) AS count FROM {table}").fetchone()
                index_status[f"{table}_count"] = row["count"] if row else 0
            generated = conn.execute(
                "SELECT value FROM meta WHERE key = 'graph_cache_generated_at'"
            ).fetchone()
            stale = conn.execute(
                "SELECT value FROM meta WHERE key = 'graph_stale'"
            ).fetchone()
            index_status["graph_cache_generated_at"] = generated["value"] if generated else None
            index_status["graph_stale"] = stale["value"] if stale else None
    except Exception as error:
        index_status["ready"] = False
        index_status["error_type"] = type(error).__name__
        index_status["error"] = str(error)[:500]
    snapshot["index"] = index_status
    return snapshot


# ---------------------------------------------------------------------------
# Entrypoint
# ---------------------------------------------------------------------------

def main() -> None:
    """Run the server over streamable HTTP.

    FastMCP 3.x dropped the `transport_security` kwarg from run(). The
    default behaviour is permissive enough for a home-network deployment
    (no DNS rebinding middleware applied unless you add it explicitly via
    http_app() + middleware). If you ever want strict allowlisting, switch
    to mcp.http_app() and wrap with TransportSecurityMiddleware before
    serving with uvicorn directly.

    json_response=True keeps responses as JSON (not SSE chunks), which
    is what the LiteLLM MCP gateway expects.
    """
    mcp.run(
        transport="http",
        host=HOST,
        port=PORT,
        json_response=True,
    )


if __name__ == "__main__":
    main()
