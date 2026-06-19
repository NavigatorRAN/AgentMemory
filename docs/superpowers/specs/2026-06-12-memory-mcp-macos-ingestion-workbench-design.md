# Memory MCP macOS Ingestion Workbench Design

## Purpose

Build a native macOS app for turning visual learning material, especially YouTube videos, into high-signal Memory MCP data. The app should help the user collect several videos into research projects, fetch transcripts, visualize concepts and relationships, save trustworthy memories automatically, and optionally export selected transcript chunks to the RAG MCP server.

The first version is an ingestion workbench. Search/recall and 3D graph exploration are included, but they support ingestion rather than replacing it as the main product.

## Product Shape

The app is project-based from day one. A project represents a research topic such as a WWDC26 workflow investigation. Each project can contain multiple YouTube video URLs, transcript fetch status, transcript-derived concepts, candidate memories, saved Memory MCP events/entities, inferred graph relationships, and optional RAG export selections.

The primary workspace is a split view:

- Left side: transcript timeline grouped by video, chapter, timestamp, and extracted learning moments.
- Right side: project graph showing concepts, entities, videos, transcript sections, saved memories, and inferred relationships.

Selecting a transcript section highlights related graph nodes. Selecting a graph node reveals the supporting timestamped transcript evidence. This keeps the graph useful for visual learning while grounding every durable save in provenance.

## Core Workflow

1. Create or open a research project.
2. Add one or more YouTube URLs.
3. Fetch transcripts using a transcript-capable local skill, adapter, or service.
4. Segment transcripts into timestamped sections and candidate learning moments.
5. Extract entities, explicit facts, decisions, actions, gotchas, and possible relationships.
6. Render a project graph alongside the transcript timeline.
7. Auto-save high-confidence items to Memory MCP.
8. Place inferred or ambiguous relationships into review.
9. Optionally export selected transcript chunks to RAG MCP.
10. Search saved memories and navigate back to their source video/timestamp.

## Save Model

Memory MCP is the curated source of truth.

The app can auto-save transcript-grounded facts, explicit decisions, actions, and gotchas when each item has clear timestamped evidence. Auto-saved records must include source video metadata and transcript timestamps where available.

Inferred relationships should not be silently saved as durable memory. They may appear in the graph and review queue, but the user must approve them unless the transcript directly supports the relationship.

RAG MCP is an optional export target. Selected transcript chunks can be exported for richer source-heavy retrieval, but RAG export is not required for Memory MCP ingestion to succeed.

## Main Components

### SwiftUI macOS Shell

The app owns the project list, video queue, transcript timeline, graph workspace, review panels, search surface, and settings. It should feel like a native macOS research tool rather than a web dashboard.

### Project Store

A local project database stores project metadata, video URLs, transcript fetch status, extracted sections, graph nodes/edges, review state, Memory MCP record IDs, and optional RAG export status.

The store should preserve enough local state that a user can close and reopen a project without losing review progress.

### Transcript Adapter

The transcript adapter accepts a YouTube URL and returns transcript text with timestamps where possible. It should support pluggable implementations because transcript fetching may come from existing skills, local utilities, or future services.

Failure states must be explicit: unavailable transcript, authentication needed, rate limit, unsupported video, malformed URL, or transcript available only through manual import.

### Analysis Pipeline

The analysis pipeline converts transcript sections into candidate memory items and graph relationships. It should separate source-grounded items from inferred relationships so confidence gates remain explainable.

### Memory MCP Client

The Memory MCP client writes approved or auto-approved events and entities using the existing MCP memory tools. Each write should identify the app or agent consistently and attach source provenance.

### RAG MCP Export Adapter

The RAG adapter exports selected transcript chunks when the user chooses to build a RAG corpus for a project. Export status should be visible per video and per chunk group.

### Graph Renderer

The graph renderer shows project-level relationships across videos, entities, transcript sections, saved memories, and inferred links. The first design can start with a native or embedded graph view, but the interaction model must support selection, highlighting, filtering, and evidence lookup.

The long-term goal is a 3D graph. The first implementation should choose a graph technology that does not block that path.

## Search And Recall

Search supports:

- Project-local search across videos, transcripts, extracted concepts, saved memories, and review items.
- Memory MCP recall for saved entities/events.
- Navigation from search result to graph node, transcript timestamp, and Memory MCP record where available.

Search is not the primary product surface in v1, but it must be good enough to answer "what did I learn from this project?" and "where did this saved memory come from?"

## Error Handling

Transcript fetch failures should remain attached to the video queue with a clear status and retry action.

Memory MCP write failures should keep items in a pending state so the user does not lose reviewed work.

RAG export failures should not block Memory MCP saves.

Ambiguous or low-confidence extraction should move to review rather than failing the whole ingest.

## Testing Strategy

Use small fixtures for transcript segmentation, confidence classification, graph construction, Memory MCP write payloads, and RAG export payloads.

The first end-to-end test should cover a project with two videos, mocked transcripts, generated graph relationships, auto-saved grounded items, review-held inferred links, and optional RAG export.

UI verification should cover the split timeline/graph selection loop: selecting a transcript section highlights graph nodes, and selecting a graph node shows timestamped evidence.

## Open Implementation Choices

The design still needs implementation decisions for:

- Native graph technology versus embedded web graph renderer.
- Exact local project database format.
- Which transcript-capable skill or utility becomes the first adapter.
- Memory MCP payload conventions for video provenance.
- RAG MCP chunk schema and export handshake.

These choices should be resolved in the implementation plan before coding begins.
