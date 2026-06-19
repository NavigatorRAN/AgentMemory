# Agent Memory Ingestion Hub Design

## Purpose

Build a native macOS app that acts as a multimodal ingestion hub for Agent Memory MCP. The app should accept mixed source material, classify it, extract useful memory candidates, apply rules and confidence gates, write curated agent memory to Memory MCP, preserve source provenance locally, and optionally export selected chunks to RAG MCP.

This spec supersedes the earlier YouTube-first ingestion workbench direction. YouTube and transcripts remain important source types, but they are one adapter inside a broader capture and batch-processing system.

## Product Shape

The app is a capture and review center for agent memory. Its primary job is to move messy external material into structured, high-signal memory without requiring every item to be manually processed in chat.

The main product surfaces are:

- Universal capture inbox for text, URLs, files, folders, images, screenshots, clipboard items, and mixed batches.
- Processing queue for stacked overnight ingestion.
- Rules and confidence gates for trusted routing and auto-write behavior.
- Review queue for uncertain, low-confidence, failed, or inferred items.
- Source archive for original and processed source material.
- Memory browser for saved events, entities, and links.
- Graph view for newly created and existing relationships.
- Morning brief for completed overnight batches.

## Core Workflow

1. Capture one item or a stack of mixed items.
2. Classify each item by source type.
3. Route each item using user-defined rules where available.
4. Extract text, metadata, structure, visual content, and provenance.
5. Propose memory outcomes such as events, entities, links, decisions, gotchas, tasks, or reference notes.
6. Apply confidence gates and source-specific policies.
7. Auto-write high-confidence approved classes to Memory MCP.
8. Keep inferred, ambiguous, low-confidence, or failed items in the review queue.
9. Preserve original and processed source material in the local source archive.
10. Optionally export selected source chunks to RAG MCP.
11. Summarize completed batches in a morning brief.

## Capture Surfaces

The v1 app should support a full capture suite:

- In-app inbox with drag and drop, paste, URL entry, file picker, and folder import.
- macOS share extension for sending URLs, files, images, and text from other apps.
- Watched folders for automated intake.
- Clipboard capture for recent text, URLs, and images.
- Screenshot and import shortcuts.
- Batch stack import for dropping a mixed pile of data and processing it unattended.

Batch stack import is a core requirement. The app should support long-running queues that can process overnight, survive app restarts where practical, and produce a useful summary when the user returns.

## Two-Stage Classification

The app uses two-stage classification.

First, classify source type:

- URL or web page.
- Video or audio transcript.
- PDF or document.
- Image or screenshot.
- Plain text or note.
- Code snippet, terminal log, or troubleshooting artifact.
- Email, calendar, or task-like item when provided through supported capture paths.
- Folder or mixed batch.

Second, classify proposed memory outcome:

- Event: something happened, changed, failed, or was fixed.
- Entity: stable knowledge about a person, service, repo, machine, app, project, or workflow.
- Link: relationship between entities or between a source and memory record.
- Decision: a choice made and its rationale.
- Gotcha: a failure mode, trap, constraint, or recovery path.
- Task: follow-up action or unresolved work.
- Reference: useful source-backed material that should be preserved but not over-promoted into durable memory.

The user should be able to see both classifications before or after writing, depending on the confidence policy and source rules.

## Organization Model

The app uses a hybrid organization model.

Memory MCP remains organized around events, entities, and links. The app adds human-facing navigation through projects, workspaces, source collections, capture batches, and saved searches.

A single captured item may belong to multiple views. For example, a screenshot may appear in a batch, a project, a source collection, the review queue, and the graph change summary while still writing only one curated set of Memory MCP records.

## Automation Model

The v1 app should support confidence-gated auto-write plus user-defined rules.

Confidence gates decide whether an extracted memory candidate is safe to write automatically, needs review, or should be ignored. Auto-written items must have clear provenance and a supported outcome class.

Rules let the user define trusted routing and processing behavior. Examples:

- URLs matching a WWDC pattern go to a chosen workspace and receive video/article processing.
- Screenshots from a chosen app become project notes with OCR and visual description.
- Terminal logs become troubleshooting event candidates.
- PDFs in a watched folder are archived locally, summarized, and offered for optional RAG export.
- Captures from a trusted workspace can auto-write grounded decisions and gotchas.

Rules should be visible, editable, disableable, and testable against a sample item before they run over a large stack.

## Batch Queue

The batch queue should support:

- Mixed item stacks.
- Per-item source classification.
- Dependency-aware processing where needed, such as extracting files from folders before classifying children.
- Pause, resume, cancel, retry, and reprocess actions.
- Per-item status: queued, classifying, extracting, analyzing, writing memory, exporting to RAG, complete, needs review, failed, or skipped.
- Durable processing state for long-running overnight jobs.
- Rate-limit and failure backoff.
- A clear boundary between completed auto-writes and pending review items.

The queue should never lose source material or reviewed decisions because one item fails.

## Morning Brief

After a stacked overnight ingestion run, the app should produce a hybrid morning brief:

- Batch digest: number of items processed, skipped, failed, written to Memory MCP, and exported to RAG.
- Memory summary: new events, entities, links, decisions, gotchas, and tasks.
- Exceptions: failures, unsupported sources, permission issues, low-confidence items, and ambiguous inferred links.
- Review queue: items that need user approval or correction.
- Graph changes: newly created entities, strengthened relationships, newly linked projects, and isolated nodes.
- Source archive summary: what raw/processed sources were stored locally.

The morning brief is the trust surface for unattended ingestion.

## Source Archive And RAG

The app keeps original or processed source material locally by default. Memory MCP records should include source references, timestamps, file paths, hashes, URLs, or other provenance pointers where available.

Memory MCP is the curated source of truth for high-signal agent memory.

RAG MCP is optional. The app can export selected chunks when source-heavy retrieval is useful, but RAG export failure must not block Memory MCP writes. The app should track which source chunks were exported and how they map back to local archived sources and Memory MCP records.

## Graph And Search

The graph view should show relationships among source collections, projects, captured items, entities, events, links, and inferred candidates. It should distinguish saved Memory MCP links from inferred or review-needed links.

Search should cover:

- Local source archive metadata.
- Capture batches.
- Review items.
- Saved Memory MCP records.
- Graph nodes and relationships.
- Optional RAG-backed source retrieval when enabled.

Search results should reveal provenance and let the user navigate to the source, Memory MCP record, graph node, or review item.

## Error Handling

Failures should be visible but not catastrophic.

The app should preserve source material and processing state when classification, extraction, Memory MCP writes, or RAG export fail. Failed items should include a plain-language reason and a retry path.

Common failure classes:

- Unsupported source type.
- Missing permission.
- File unreadable or moved.
- Network unavailable.
- Transcript unavailable.
- OCR or extraction failed.
- Memory MCP unreachable.
- RAG MCP unreachable.
- Confidence too low for auto-write.
- Rule conflict or no matching route.

## Testing Strategy

Use fixtures for mixed capture stacks, source classification, outcome classification, rule matching, confidence gates, Memory MCP write payloads, RAG export payloads, graph changes, and morning brief generation.

The first end-to-end test should process a mixed batch containing a URL, PDF, screenshot, text note, terminal log, and video transcript fixture. It should verify source archiving, classification, rule routing, auto-written high-confidence memory, review-held uncertain items, optional RAG export, and the morning brief.

UI verification should cover:

- Dropping a mixed stack into the inbox.
- Watching queue status progress.
- Pausing and resuming a batch.
- Opening the morning brief.
- Navigating from a brief item to source archive, review item, graph node, and Memory MCP record.

## Open Implementation Choices

The implementation plan should resolve:

- Native macOS app structure and whether the graph renderer is native, embedded web, or hybrid.
- Local database and source archive layout.
- Rule schema and conflict handling.
- Confidence scoring representation.
- Memory MCP payload conventions for multimodal provenance.
- RAG MCP chunk schema and export handshake.
- Which adapters are implemented first for screenshots, PDFs, URLs, videos, logs, and notes.
