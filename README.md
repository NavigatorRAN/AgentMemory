# AgentMemory

AgentMemory is a planned native macOS app for multimodal ingestion into Agent Memory MCP.

The current design centers on an ingestion hub that can accept mixed source material, classify it, extract useful memory candidates, apply rules and confidence gates, write curated memory to Memory MCP, preserve source provenance locally, and optionally export selected chunks to RAG MCP.

## Current Design

- [Agent Memory Ingestion Hub Design](docs/superpowers/specs/2026-06-19-agent-memory-ingestion-hub-design.md)
- [Original YouTube-First Ingestion Workbench Design](docs/superpowers/specs/2026-06-12-memory-mcp-macos-ingestion-workbench-design.md)

## Product Spine

1. Capture anything through an app inbox, share extension, watched folders, clipboard capture, screenshots, imports, or mixed batch stacks.
2. Classify source type first, then proposed memory outcomes.
3. Route trusted sources with user-defined rules.
4. Auto-write high-confidence events, entities, and links to Memory MCP.
5. Keep ambiguous or inferred items in review.
6. Preserve raw and processed source material locally.
7. Optionally export selected source chunks to RAG MCP.
8. Summarize overnight batches in a morning brief.

## Build

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift run AgentMemory
```

## Current Build Slice

The first build slice is a local SwiftUI foundation:

- Capture inbox preview
- Two-stage source and outcome classification
- Rule routing model
- Confidence gate model
- Processing queue actor
- Local source archive skeleton
- Morning brief builder
- Mock Memory MCP writer
- JSON-backed app snapshot model
- Disk store for queue, rules, source archive metadata, and morning brief history
- Queue restore from persisted capture items
- Interactive add/process/save/reload UI flow
- App view model backed by the JSON disk store
- Drag/drop stack import for files, URLs, and multi-line text
- Source archive metadata attached during processing
- Real file-byte copying into the local source archive
- Memory MCP `record_event` payload builder and writer adapter
- Memory MCP endpoint settings and JSON-RPC HTTP transport
- Toggle-controlled live Memory MCP write path with Settings test write
- Native Memory MCP event search panel
- Native Memory MCP entity recall action
- Native Memory MCP entity detail lookup
- Native Memory MCP entity browsing with prefix filter
- Memory MCP graph projection for events, entities, and mention edges
- 3D-ready Memory MCP graph scene payload with stable node coordinates
- Memory MCP graph focus for selected-node neighborhoods
- Durable overnight batch-run history with latest-run summary and morning brief capture
- Review workflow for `needsReview` captures with proposed Memory MCP payload preview, approve write, and skip
- Review editing for capture title and raw input before approval
- Review outcome editing before approval
- Custom tag editing before approval
- Deterministic review confidence/status explanations
- Review source archive provenance preview
- Bounded archived text source preview in review
- Web page URL ingestion into archived reviewable text
- Manual retry controls for failed/skipped/paused captures
- Review-first selection and next-review navigation
- Sidebar filter for all captures vs review queue
- Per-capture processing attempt history
- Retry budget for exhausted failed captures
- YouTube URL recognition and video metadata for stacked captures
- YouTube caption manifest parsing foundation
- YouTube timedtext transcript parsing foundation
- Queued YouTube transcript fetching into review
- Native capture search across inbox and review filters
- English-preferred YouTube caption selection with fallback
- Selected-capture export into the existing RAG ingestion queue
- Settings-backed RAG export host, user, SSH identity path, collection, and enable toggle
- Settings RAG connection test for the configured SSH queue backend
- Per-capture RAG export job metadata and duplicate-export guard
- Bulk export for completed captures that have not yet been queued to RAG
- Bulk RAG export partial-failure reporting that preserves successful job metadata
- Durable latest RAG export run summary with failure details
- RAG queue job status refresh for recorded exports
- Per-capture persisted RAG queue status, chunks, and document ID
- Latest RAG export status-count summary from refreshed capture metadata

Share extension, watched folders, PDF/image source rendering, automatic retry scheduling, richer YouTube transcript provider controls, expanded Memory MCP recall/entity views, expanded RAG job detail views, and graph rendering are planned next.
