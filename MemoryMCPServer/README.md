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
                         .replication/objects + revisions + journal
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
instead of the shared mount when that local path is usable. If service
hardening blocks the working-directory cache, the server falls back to a
transient local cache under `${TMPDIR:-/tmp}/memory-mcp-index` so queries can
still use SQLite without relying on shared-mount locking. For production,
prefer setting `MEMORY_INDEX_ROOT` to a durable local path and allowing that
path in the service sandbox.

Rebuild or inspect it with:

```bash
memory-mcp-index --vault-root /mnt/aishareddrive/family-agents/memory
memory-mcp-index --status
```

If the SQLite cache is missing or unhealthy, query tools fall back to scanning
markdown files and the cache can be rebuilt safely from the vault. Keep the
SQLite cache off CIFS/NFS-style shared mounts when the service sandbox allows a
local cache path. The server also prewarms the derived index in the background
at startup so a transient cache can recover after service restarts.

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

When MCP authentication is enabled, add
`-H "Authorization: Bearer ${MEMORY_MCP_READ_BEARER}"` to every Streamable
HTTP request, including requests that carry an `Mcp-Session-Id`.

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

## MCP bearer authentication

The FastMCP `/mcp` surface retains its legacy unauthenticated behavior unless
`MEMORY_MCP_REQUIRE_AUTH=true` is set. This is an explicit compatibility
switch: unset, empty, `0`, `false`, `no`, and `off` all leave authentication
disabled. Any other unrecognized value stops startup rather than silently
choosing a security mode.

When enabled, `/mcp` reuses the capability sets loaded by `TokenAuthorizer`
from `MEMORY_REPLICATION_TOKENS` and the three compatibility token variables.
Prefer the combined JSON mapping so each credential has an explicit, auditable
capability set:

```bash
export MEMORY_MCP_REQUIRE_AUTH=true
export MEMORY_REPLICATION_TOKENS='{
  "replace-with-random-read-token": ["read"],
  "replace-with-random-read-admin-token": ["read", "admin"],
  "replace-with-random-replication-token": ["replicate"]
}'
```

Tokens must be 16-256 printable ASCII characters without whitespace. Generate
independent random values and load them through the service environment or
secret manager; do not put live values in source control, command histories,
URLs, or application logs.

The MCP capability policy is closed and tool-name based:

| MCP operation | Required capability |
|---|---|
| `initialize`, `ping`, notifications, `tools/list`, and other MCP control operations | `read` |
| `recall_for_entity`, `search_events`, `timeline`, `get_entity`, `list_entities`, `search_wiki`, `get_wiki_page`, `memory_graph`, `memory_metrics` | `read` |
| `record_event`, `upsert_entity`, `link_entities` | `admin` |

`replicate` alone never authorizes an MCP operation. A credential intended to
write through MCP needs both `read` and `admin`: `read` establishes and
operates the Streamable HTTP session, while `admin` authorizes the exact write
tool. Unknown tool names fail closed before FastMCP dispatch. Replication
conflict resolution, tombstones, backup, and restore remain HTTP-only and keep
their existing `admin` requirement.

Missing or invalid bearers return a redacted HTTP `401`; a valid bearer without
the required capability returns `403`. The check runs on every Streamable HTTP
request, not only `initialize`, and FastMCP additionally binds an initialized
session to its credential.

Authenticated MCP requests are bounded before dispatch. The default maximum
body is 262144 bytes, configurable with `MEMORY_MCP_MAX_REQUEST_BYTES` and
hard-capped at 2097152 bytes. JSON-RPC bodies must be a single object with
standard top-level keys, no duplicate keys or non-finite numbers, at most 64
levels, and at most 10000 JSON nodes. Declared and streamed body overruns
return `413`; malformed or out-of-bounds JSON returns a redacted `400`. The
middleware does not log bearer values or request bodies, and authenticated
FastMCP tool-call diagnostics redact arguments and validation details.

## Revision-aware replication

New events and entity writes also create immutable content-addressed objects
and canonical `MemoryRevision` records under `.replication/`. Markdown remains
the readable authority and SQLite remains a rebuildable projection. Events
merge automatically and duplicate delivery is idempotent. Entity revisions
name their parents: descendants advance, while divergent branches create a
visible conflict without last-write-wins. Existing unattended entity reads
remove conflicted content/metadata fields until an explicit resolution joins
every branch parent.

Every export page includes a `contracts` array containing the exact closed Buzz
Command Console v1 `ReplicationEnvelope` shape. Task 4 and Task 6 consumers
must consume that array; `revisions` and `objects` are the internal
storage/transport representation. The adapter uses `OFFICIAL` classification by
default. `hashes.content` is the immutable object digest,
`hashes.revision`/`hashes.payload` identify the canonical internal revision,
and `hashes.envelope` covers the canonical envelope basis before that digest is
inserted. Adapter representability uses the same bounded-JSON budget as Buzz:
maximum depth 64 and 10,000 total JSON nodes, in addition to the canonical byte
limit.

Replication administration is HTTP-only. Routes are streaming-body bounded,
rate limited, and always require an application bearer token:

| Route | Capability |
|---|---|
| `GET /replication/readiness`, `/replication/manifest`, `/replication/conflicts` | `read` |
| `POST /replication/export`, `/replication/import`, `/replication/ack` | `replicate` |
| `POST /replication/conflicts/resolve`, `/replication/tombstones`, `/replication/backups`, `/replication/restore` | `admin` |

No replication route accepts a caller-supplied filesystem path. Backup and
restore use opaque server-owned IDs. Authentication and validation errors are
redacted. Conflict listing accepts bounded `cursor` and `limit` query
parameters and returns `next_cursor` plus `has_more`.
Restoring changed event/entity Markdown appends a descendant revision whose
object exactly matches the restored bytes; a failed multi-file restore rolls
back both canonical files and journal state.

## Configuration

| Env var | Default | Purpose |
|---|---|---|
| `MEMORY_VAULT_ROOT` | `/mnt/aishareddrive/family-agents/memory` | Where to read/write |
| `MEMORY_HOST` | `0.0.0.0` | Bind address |
| `MEMORY_PORT` | `8006` | Bind port |
| `MEMORY_NODE_ID` | generated once | Stable `node:<id>` identity |
| `MEMORY_MCP_REQUIRE_AUTH` | `false` | Opt in to bearer authentication for FastMCP `/mcp` |
| `MEMORY_MCP_MAX_REQUEST_BYTES` | `262144` | Authenticated MCP request-body limit; hard max 2097152 |
| `MEMORY_REPLICATION_READ_TOKEN` | unset | Read capability bearer |
| `MEMORY_REPLICATION_REPLICATE_TOKEN` | unset | Replicate capability bearer |
| `MEMORY_REPLICATION_ADMIN_TOKEN` | unset | Admin capability bearer |
| `MEMORY_REPLICATION_TOKENS` | unset | JSON token-to-capability mapping |
| `MEMORY_REPLICATION_MAX_ITEMS` | `200` | Maximum revisions per page |
| `MEMORY_REPLICATION_MAX_BYTES` | `2097152` | Maximum request/envelope bytes |
| `MEMORY_REPLICATION_RATE_LIMIT` | `120` | Requests per caller/route/minute |
| `MEMORY_TOMBSTONE_RETENTION_DAYS` | `90` | Tombstone retention evidence |

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

**Replication auth is mandatory.** The original memory MCP tools retain the
deployment's temporary compatibility posture, but replication has no MCP tool
surface. Every replication HTTP route requires an explicit capability token;
network location never grants replication authority.

**Pauline's `2nd-brain` skill overlap.** This service supersedes the durable
storage half of `2nd-brain`. Recommended migration path: rewrite the skill
to call `record_event` / `upsert_entity` rather than writing files directly.
The Gmail nightly sync should write to memory-mcp via MCP too.
