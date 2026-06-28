# Memory MCP Optimization Phases 3B-5

This branch continues the Memory MCP optimization plan after Phase 3A.

## Implemented

- Importer schema validation for state records and staged RAG frontmatter.
- Memory event IDs from `record_event` are captured into importer state and patched into local staged RAG markdown when available.
- App-originated RAG exports now include YAML frontmatter with collection, source type, source section, document type, language, capture ID, content hash, and detected source URL.
- Live eval runner at `script/evaluate_memory_mcp.py` writes JSON and markdown reports and can record a concise CODEX summary event.
- Deployment smoke checks now include `memory_metrics` and fail when the derived query index is visible but not ready.

## Current Eval

Latest live eval report files:

- `.memory-mcp-eval-report.json`
- `.memory-mcp-eval-report.md`

The first integrated run against `http://192.168.1.26:8006/mcp` passed 5 of 5 checks and recorded Memory MCP event `01KW6FVAT6FXAGSMXNY6GYBGD0`.

## Optional Adapters

External tools remain optional adapters:

- Crawl4AI-style behavior is still implemented natively in the importer first.
- Chonkie should only be added if the native chunk profiles show retrieval-quality weakness.
- Marker remains an external worker/container candidate for PDF/Office conversion because of licensing/model-weight considerations.

## Operating Notes

Markdown remains canonical. SQLite/FTS and graph caches are derived and rebuildable. In production, prefer a durable local `MEMORY_INDEX_ROOT` that is allowed by the systemd sandbox. The no-sudo fallback uses a transient local cache and background prewarm to avoid slow full markdown scans after restart.
