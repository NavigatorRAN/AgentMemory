# RAG Metadata Filtering Follow-Through

Date: 2026-06-28

This note records the live RAG service patch that completed the Phase 4 metadata-filtering acceptance path for AgentMemory imports. The RAG service on `192.168.1.107` currently runs from `/opt/rag`, which is not a git checkout, so this repository keeps the operational evidence until that service is brought under version control.

## Live State

- RAG retrieval endpoint: `http://192.168.1.107:8005`.
- RAG MCP endpoint: `http://192.168.1.107:8005/mcp`.
- Qdrant collection: `documents`.
- Home Assistant import collection: `home-assistant-docs`.
- Affected live files were backed up to `/opt/rag/backups/20260628T070002Z`.

## Patch Scope

- `/opt/rag/ingest/ingest_one.py`
  - Preserves AgentMemory staged Markdown metadata in Qdrant payloads.
  - Supports both new YAML frontmatter and legacy source-backed bullet provenance.
  - Derives safe defaults for older staged Markdown: `source_handle`, `source_section`, `doc_type`, `language`, `content_hash`, and `chunk_profile`.
- `/opt/rag/ingest/setup_collection.py`
  - Adds payload indexes for AgentMemory metadata fields.
- `/opt/rag/ingest/backfill_frontmatter_payload.py`
  - Idempotently backfills payload metadata for completed queue jobs.
- `/opt/rag/retrieval/retrieve.py`
  - Adds retrieval filters for `source_sections`, `source_urls`, `canonical_urls`, `source_handles`, `content_hashes`, `import_run_ids`, `doc_types`, `languages`, `chunk_profiles`, `wiki_slugs`, and `memory_event_ids`.
- `/opt/rag/retrieval/server.py`
  - Exposes those filters and returned metadata through `/search` and `/docs/{doc_id}`.
- `/opt/rag/retrieval/mcp_server.py`
  - Exposes the same metadata filters and result fields through `search_knowledge_base` and `get_document`.

## Backfill Result

Dry run:

```text
{'jobs_seen': 1722, 'jobs_with_metadata': 1722, 'jobs_updated': 0, 'missing_files': 0, 'missing_doc_id': 0, 'dry_run': 1}
```

Applied run:

```text
{'jobs_seen': 1722, 'jobs_with_metadata': 1722, 'jobs_updated': 1722, 'missing_files': 0, 'missing_doc_id': 0, 'dry_run': 0}
```

The service account did not have permission to run `systemctl restart`, so the affected user-owned Python processes were refreshed and systemd restarted them under the existing units. Qdrant was not restarted.

## Verification

- Direct Qdrant counts:
  - `source_section=docs-automation`: 70 chunks.
  - `source_section=integrations-toon`: 6 chunks.
  - `source_section=voice-control`: 4 chunks.
- HTTP retrieval check:
  - Query: `automation trigger actions`.
  - Filters: `collections=["home-assistant-docs"]`, `source_sections=["docs-automation"]`.
  - Result: 3 Home Assistant automation documentation chunks with `source_url`, `canonical_url`, `source_section`, `chunk_profile`, `language`, and `wiki_slug` populated.
- RAG MCP check:
  - `tools/list` exposes the new metadata filter arguments.
  - `search_knowledge_base` with `source_sections=["docs-automation"]` returned Home Assistant automation docs and metadata.
- Memory MCP wiki check:
  - `get_wiki_page(slug="home-assistant-docs")` returns the Home Assistant documentation anchor.
  - `search_wiki(query="Home Assistant")` and `search_wiki(query="automation")` return the anchor page.

## Gotcha

The current RAG service should be brought into git before deeper changes. Until then, repeatable changes need a backup, copied patch files, compile checks in both virtual environments, a backfill dry run, live backfill, and HTTP/MCP verification.
