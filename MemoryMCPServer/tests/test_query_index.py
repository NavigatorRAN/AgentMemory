from __future__ import annotations

import frontmatter

from memory_mcp import queries
from memory_mcp.storage import Storage


def test_default_index_dir_lives_beside_vault(tmp_path, monkeypatch):
    monkeypatch.delenv("MEMORY_INDEX_ROOT", raising=False)

    storage = Storage(tmp_path)

    assert storage.index_dir == tmp_path / ".index"


def test_configured_index_dir_overrides_default(tmp_path, monkeypatch):
    index_root = tmp_path / "custom-index"
    monkeypatch.setenv("MEMORY_INDEX_ROOT", str(index_root))

    storage = Storage(tmp_path / "vault")

    assert storage.index_dir == index_root


def test_query_index_rebuilds_and_serves_event_queries(tmp_path):
    storage = Storage(tmp_path)
    storage.record_event(
        content="Installed Home Assistant integration docs.",
        entities=["Home Assistant", "Memory MCP"],
        event_date="2026-06-20T12:00:00+00:00",
        tags=["docs", "import"],
        agent="CODEX",
    )
    storage.record_event(
        content="Graph cache tuning for Memory MCP.",
        entities=["Memory MCP"],
        event_date="2026-06-21T12:00:00+00:00",
        tags=["graph"],
        agent="CODEX",
    )

    rebuilt = storage.rebuild_query_index()

    assert rebuilt["events"] == 2
    matches = queries.search_events(storage, "home assistant", entities=None, since=None, limit=5)
    assert [event["content"] for event in matches] == ["Installed Home Assistant integration docs."]

    recall = queries.recall_for_entity(
        storage,
        entity="memory-mcp",
        since=None,
        until=None,
        limit=5,
        include_content=False,
    )
    assert len(recall) == 2
    assert "content" not in recall[0]

    entities = queries.list_entities(storage, prefix=None, type_filter=None)
    memory = next(entity for entity in entities if entity["name"] == "memory-mcp")
    assert memory["event_count"] == 2

    timeline = queries.timeline(storage, entity="memory-mcp", since=None, granularity="day")
    assert timeline[0]["bucket"] == "2026-06-21"
    assert timeline[0]["sample_titles"] == ["Graph cache tuning for Memory MCP."]


def test_query_index_serves_native_and_event_backed_wiki_pages(tmp_path):
    storage = Storage(tmp_path)
    native = frontmatter.Post(
        "# Memory MCP\n\nNative body",
        slug="memory-mcp",
        title="Memory MCP",
        summary="Always-on memory server.",
        tags=["memory"],
        rag_collections=["agentmemory"],
        source_urls=["https://example.invalid/memory"],
        updated_at="2026-06-22T12:00:00+00:00",
    )
    (storage.wiki_dir / "memory-mcp.md").write_text(frontmatter.dumps(native), encoding="utf-8")
    storage.record_event(
        content="\n".join(
            [
                "Wiki page refreshed: Home Assistant Docs",
                "",
                "Home Assistant documentation summary.",
                "",
                "Local wiki page: wiki/home-assistant.md",
                "Tags: agentmemory-wiki",
            ]
        ),
        entities=["agentmemory-wiki", "wiki:home-assistant", "Home Assistant"],
        event_date="2026-06-23T12:00:00+00:00",
        tags=["agentmemory-wiki"],
        agent="CODEX",
    )

    storage.rebuild_query_index()

    search = queries.search_wiki(storage, "home assistant", limit=5)
    assert search[0]["slug"] == "home-assistant"
    assert "body" not in search[0]

    page = queries.get_wiki_page(storage, "memory-mcp")
    assert page["title"] == "Memory MCP"
    assert page["body"].startswith("# Memory MCP")


def test_memory_graph_uses_materialized_cache_and_focuses_query(tmp_path):
    storage = Storage(tmp_path)
    storage.record_event(
        content="Home Assistant docs mention automations.",
        entities=["Home Assistant", "Automation", "Memory MCP"],
        event_date="2026-06-20T12:00:00+00:00",
        tags=["docs"],
        agent="CODEX",
    )
    storage.record_event(
        content="Qdrant RAG metadata design.",
        entities=["Qdrant", "RAG MCP"],
        event_date="2026-06-21T12:00:00+00:00",
        tags=["rag"],
        agent="CODEX",
    )
    storage.rebuild_query_index()

    overview = queries.memory_graph(storage, limit=10)

    assert overview["summary"]["total_node_count"] >= 5
    assert overview["summary"]["returned_node_count"] == len(overview["nodes"])
    assert overview["summary"]["cache_generated_at"] is not None

    focused = queries.memory_graph(storage, query="home-assistant", limit=10)
    node_ids = {node["id"] for node in focused["nodes"]}
    assert "entity:home-assistant" in node_ids
    assert "entity:automation" in node_ids


def test_query_falls_back_to_markdown_when_index_is_unavailable(tmp_path, monkeypatch):
    storage = Storage(tmp_path)
    storage.record_event(
        content="Fallback search should still work.",
        entities=["Fallback"],
        event_date="2026-06-20T12:00:00+00:00",
        tags=[],
        agent="CODEX",
    )

    def fail(*args, **kwargs):
        raise RuntimeError("index unavailable")

    monkeypatch.setattr(storage.query_index, "search_events", fail)
    matches = queries.search_events(storage, "fallback", entities=None, since=None, limit=5)

    assert len(matches) == 1
    assert matches[0]["entities"] == ["fallback"]
