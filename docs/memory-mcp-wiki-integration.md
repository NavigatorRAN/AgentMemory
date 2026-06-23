# Memory MCP Wiki Integration

AgentMemory now treats the wiki as a materialized retrieval layer:

1. Completed captures and RAG-backed captures are compiled into local markdown pages under the app support `Wiki` directory.
2. Each refresh updates `index.md`, `log.md`, and one markdown file per wiki page.
3. When `wikiMemorySyncEnabled` is true, each page summary is written back to Memory MCP through the existing `record_event` tool.

## Existing-Agent Compatibility

The compatibility path uses Memory MCP tools that already exist:

- `search_events` can find wiki refresh records with the `agentmemory-wiki` tag.
- `recall_for_entity` can retrieve pages through entities such as `agentmemory-wiki`, `wiki:foundation-models`, and the page slug.
- `get_entity` can show accumulated wiki refresh records for those entities.

This means agents that already use Memory MCP do not need an immediate tool change to discover wiki pages. They should search or recall `agentmemory-wiki` when they want compiled knowledge before falling back to source-heavy RAG retrieval.

## Native Tool Contract

The AgentMemory client also supports these optional Memory MCP tools:

### `search_wiki`

Arguments:

```json
{
  "query": "Foundation Models",
  "limit": 20
}
```

Structured content:

```json
{
  "result": [
    {
      "slug": "foundation-models",
      "title": "Foundation Models",
      "summary": "Compiled notes.",
      "path": "Wiki/foundation-models.md",
      "tags": ["agentmemory-wiki"],
      "rag_collections": ["apple-developer-docs"],
      "updated_at": "2026-06-23T12:00:00Z"
    }
  ]
}
```

### `get_wiki_page`

Arguments:

```json
{
  "slug": "foundation-models"
}
```

Structured content:

```json
{
  "slug": "foundation-models",
  "title": "Foundation Models",
  "summary": "Compiled notes.",
  "body": "# Foundation Models\n\n...",
  "path": "Wiki/foundation-models.md",
  "tags": ["agentmemory-wiki"],
  "rag_collections": ["apple-developer-docs"],
  "source_urls": ["https://developer.apple.com/documentation/foundationmodels"],
  "updated_at": "2026-06-23T12:00:00Z"
}
```

The current app does not require these native tools to exist, but the live Memory MCP server on `192.168.1.26:8006` now exposes them. Existing agents can keep using the compatibility path, while newer clients should prefer `search_wiki` and `get_wiki_page` for compiled knowledge retrieval.

### `memory_graph`

Arguments:

```json
{
  "query": "agentmemory",
  "limit": 200
}
```

Structured content:

```json
{
  "nodes": [
    {
      "id": "entity:agentmemory",
      "label": "agentmemory",
      "kind": "entity",
      "event_count": 123
    }
  ],
  "edges": [
    {
      "source": "entity:agentmemory",
      "target": "wiki:codegraphrag-agentmemory-overview",
      "relation": "documents",
      "weight": 1
    }
  ],
  "summary": {
    "node_count": 25,
    "edge_count": 65,
    "query": "agentmemory"
  }
}
```

With no query, `memory_graph` returns a capped overview graph. With a query, it returns matching nodes plus immediate neighbors for focused graph exploration.
