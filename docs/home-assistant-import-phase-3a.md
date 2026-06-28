# Home Assistant Import Phase 3A

Phase 3A keeps Memory MCP concise and treats staged RAG markdown as the detailed
documentation layer. The importer now emits stable source handles, source
sections, import run IDs, content hashes, chunk profiles, and frontmatter for
new staged RAG files.

## Audit Existing Outputs

Use this to inspect the current Home Assistant run without importing or writing
new Memory MCP records:

```bash
python3 script/import_web_pages_to_memory.py \
  --audit-only \
  --collection home-assistant-docs \
  --state .web-pages-home-assistant-state.json \
  --log .web-pages-home-assistant.log.jsonl \
  --rag-dir .web-pages-home-assistant-rag \
  --audit-output .web-pages-home-assistant-audit.json \
  --wiki-output docs/home-assistant-import-wiki.md \
  --wiki-title "Home Assistant Documentation Import"
```

Legacy runs may show complete page counts but missing Phase 3A metadata. That is
expected for imports created before the metadata/frontmatter contract existed.

## Verify Live Retrieval

Use the Home Assistant verifier after an import or metadata refresh:

```bash
python3 script/verify_home_assistant_import.py \
  --include-rag-stats \
  --write-wiki docs/home-assistant-import-wiki.md \
  --output .web-pages-home-assistant-verification.json
```

Add `--record-event` after reviewing the output to save a concise verification
event into Memory MCP with `agent="CODEX"`.

## Metadata Contract

State records should include:

- `source_handle`
- `source_section`
- `content_hash`
- `chunk_profile`
- `import_run_id`
- `rag_path`

RAG markdown frontmatter should include:

- `source_url`
- `final_url`
- `canonical_url`
- `source_handle`
- `source_section`
- `collection`
- `doc_type`
- `language`
- `import_run_id`
- `content_hash`
- `chunk_profile`

The markdown vault and import state remain the durable local evidence. RAG
queue writes are rebuildable from the staged markdown.
