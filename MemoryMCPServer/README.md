# memory-mcp

Episodic memory MCP server for the family agent stack. Stores events and
entities as plain markdown files with YAML frontmatter, served over MCP
via FastMCP.

Designed to run on `web-01` alongside `rag-retrieval`, with the vault on
AISharedDrive so it survives any one machine going down. The two services
divide labour:

- **`rag-retrieval` (port 8005):** stable knowledge — "what is this thing?"
- **`memory-mcp` (port 8006):** episodic memory — "what happened with this thing?"

## Why this exists

Agents need to remember what's been done across sessions, but the existing
RAG service is the wrong shape for that — it's tuned for semantic recall
over indexed docs, not for "show me the last 5 things that happened with
Spark." This is the missing tool: timestamped event log + lightweight
entity pages, queryable by entity, time, or text.

The vault is plain markdown so you can also browse it in Obsidian when
you want to. Obsidian doesn't need to be running for agents to work —
the storage is just files.

## Architecture

```
Hermes ──┐
Pauline ─┼──> LiteLLM gateway ──> memory-mcp (web-01:8006)
Spock ───┘                              │
                                        ▼
                       /mnt/aishareddrive/family-agents/memory/
                         events/YYYY/MM/<ulid>-<slug>.md
                         entities/<name>.md
                         wiki/<slug>.md
                         .index/entities.json
```

## Tools

| Tool | Purpose |
|---|---|
| `record_event` | Log something that happened. Tag with entities. |
| `recall_for_entity` | "What's the last N events involving X?" — primary recall. |
| `search_events` | Plain-text search across event content. |
| `timeline` | Bucketed event counts by day/week/month for an entity. |
| `get_entity` | Read entity page + 5 most recent events. |
| `upsert_entity` | Create/update canonical entity page. |
| `list_entities` | List known entities with event counts. |
| `link_entities` | Record a relationship between two entities. |
| `search_wiki` | Search synthesized wiki pages and AgentMemory wiki refresh records. |
| `get_wiki_page` | Read a compiled wiki page by slug. |
| `memory_graph` | Return a lightweight graph of entities, wiki pages, and relationships. |

Use `search_wiki` before broad event search when an agent needs compiled,
durable knowledge such as a codebase map, framework briefing, or project wiki
page. Use `search_events` / `recall_for_entity` for the chronological event
trail and operational history.

## Derived SQLite index

Markdown remains the source of truth. The server maintains a rebuildable local
SQLite query cache for faster event search, entity recall, wiki search, and
materialized graph responses. If `MEMORY_INDEX_ROOT` is unset, NAS-style vault
paths under `/mnt/` or `/Volumes/` use the server working directory `.index/`
instead of the shared mount.

Rebuild or inspect it with:

```bash
memory-mcp-index --vault-root /mnt/aishareddrive/family-agents/memory
memory-mcp-index --status
```

If the SQLite cache is missing or unhealthy, query tools fall back to scanning
markdown files and the cache can be rebuilt safely from the vault. Keep the
SQLite cache off CIFS/NFS-style shared mounts.

## File format

**Events** (`events/2026/04/28-abc123-litellm-key-rotation.md`):

```markdown
---
id: 01HXXXXXXXXXXXXXXXXX
event_date: 2026-04-28T14:30:00+10:00
recorded_at: 2026-04-28T14:32:11+10:00
entities: [litellm, web-01]
tags: [security, key-rotation]
agent: hermes
---

Rotated the open-webui virtual key after it leaked in chat history.
New key stored in Vaultwarden under...
```

**Entities** (`entities/litellm.md`):

```markdown
---
entity: litellm
display_name: LiteLLM
type: service
aliases: [litellm-router]
first_seen: 2026-03-12T00:00:00+00:00
---

# LiteLLM

Router service on web-01. Admin UI at https://litellm.home.arpa/ui.
```

**Wiki pages** (`wiki/foundation-models.md`) are optional native compiled
knowledge pages. AgentMemory can also sync wiki pages as normal events tagged
`agentmemory-wiki`; the native wiki tools search both forms so existing
records remain discoverable.

## Deployment

On `web-01`:

```bash
git clone <repo> /tmp/memory-mcp
cd /tmp/memory-mcp
./scripts/install.sh
```

This creates `/opt/memory-mcp` with a venv, installs the package, sets up
the vault directory structure, installs the systemd unit, and starts it.

Verify:

```bash
sudo systemctl status memory-mcp
curl -s http://localhost:8006/mcp -X POST \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"smoke","version":"0.1"}}}'
```

This repository also includes `scripts/deploy.sh`, which stages the tracked
package, backs up `/opt/memory-mcp`, installs the package, restarts
`memory-mcp.service`, and runs `scripts/smoke_check.py`.

## LiteLLM integration

Add to `config.yaml`:

```yaml
mcp_servers:
  rag_knowledge_base:
    url: http://web-01:8005/mcp/
    description: "Deep knowledge / documentation retrieval"
  agent_memory:
    url: http://web-01:8006/mcp
    description: "Episodic memory: what we've done, recent events, entity context"
```

Note the trailing-slash difference: the FastMCP HTTP transport mounts at
`/mcp` (no trailing slash on this server) — the `/mcp/` redirects work but
generate a 307 round-trip. Save the bytes.

The descriptions matter — they're what the model sees when picking tools.
Make the boundary obvious (knowledge vs. events) or you'll get agents
querying memory for documentation.

## Caddy (optional)

If you want a friendly hostname:

```
memory.home.arpa {
    reverse_proxy localhost:8006
}
```

## Hermes integration (direct, no LiteLLM)

In `~/.hermes/config.yaml`:

```yaml
mcp_servers:
  agent_memory:
    type: http
    url: http://web-01:8006/mcp
```

## Configuration

| Env var | Default | Purpose |
|---|---|---|
| `MEMORY_VAULT_ROOT` | `/mnt/aishareddrive/family-agents/memory` | Where to read/write |
| `MEMORY_HOST` | `0.0.0.0` | Bind address |
| `MEMORY_PORT` | `8006` | Bind port |

## Development

```bash
pip install -e ".[dev]"
pytest
python -m memory_mcp.server  # runs on 0.0.0.0:8006
```

## Design notes / things to know

**Entity name normalization.** `LiteLLM`, `litellm`, `LiteLLM Router` all
collapse to lowercase-hyphenated form on storage. Display name is preserved
in the entity frontmatter. Get this right early — retrofitting is annoying.

**ULID-based event IDs.** Sortable by time, collision-safe under concurrent
writes from multiple agents. No DB needed.

**No semantic search.** This is deliberate. If you want "things conceptually
similar to X," that's the RAG service. Memory is for "things tagged with X."
If you find yourself wanting embeddings here, that's a signal the boundary
is being eroded — push back to thoughtful entity tagging instead.

**Derived indexing.** SQLite under the configured `.index/` is a query cache,
not source of truth. If the database is stale or corrupt, delete/rebuild it
with `memory-mcp-index`; the markdown vault remains authoritative. Keep this
cache on local disk, not the shared vault mount.

**Auth is currently off.** Same posture as rag-retrieval — home-network
trusted. To add auth, the easiest path is bearer tokens via FastMCP's auth
hooks, with LiteLLM injecting the token from a virtual key.

**Pauline's `2nd-brain` skill overlap.** This service supersedes the durable
storage half of `2nd-brain`. Recommended migration path: rewrite the skill
to call `record_event` / `upsert_entity` rather than writing files directly.
The Gmail nightly sync should write to memory-mcp via MCP too.
