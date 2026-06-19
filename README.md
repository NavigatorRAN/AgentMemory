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
