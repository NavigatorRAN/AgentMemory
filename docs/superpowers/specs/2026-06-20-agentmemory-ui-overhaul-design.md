# AgentMemory UI Overhaul Design

## Purpose

Refactor the AgentMemory macOS app from a single stacked developer dashboard into a visual, workspace-based product. The current backend slices provide the core ingestion, Memory MCP, RAG, review, and graph data plumbing. The next product step is to make those capabilities understandable and usable.

This design follows the approved visual mockup shown in the local visual companion on 2026-06-20. The key correction is structural: ingestion, search, graph, review, and RAG should be first-class workspaces rather than sections in one long scroll view.

## Product Direction

AgentMemory should feel like a native macOS workbench for managing agent memory.

The main window should use a stable desktop layout:

- A source-list sidebar for primary workspaces.
- A toolbar whose actions change by selected workspace.
- A main workspace area for the selected task.
- An optional inspector for selected item, graph node, community, or backend status details.

The app should stop repeating ingestion controls above each selected capture. It should also remove the long horizontal strip of text buttons that currently overflows available space.

## Primary Workspaces

### Ingestion

The Ingestion workspace is the only place for adding new material.

It should include:

- A large drop zone for files, folders, URLs, text stacks, and YouTube links.
- A queue preview for stacked items.
- Batch controls for starting, pausing, retrying, and scheduling overnight processing.
- Default routing settings visible enough to understand where items will go.
- A morning brief entry point after overnight processing.

Ingestion actions should be grouped. Common actions can be visible, but secondary actions should move into menus or contextual controls.

### Review

The Review workspace should focus on uncertain or low-confidence captures.

It should include:

- A review queue list.
- A focused detail surface for the selected review item.
- The proposed Memory MCP payload.
- Editable title, raw text, outcomes, and tags.
- Contextual actions: approve, edit, skip, retry, export to RAG.

Review should not compete with ingestion controls. Review actions belong to the selected review item only.

### Search

Search needs its own section.

It should support:

- Memory MCP event search.
- Entity recall.
- Entity detail lookup.
- Entity browsing.
- Optional RAG/source retrieval when enabled.

Search results should reveal provenance and navigate to related source archive entries, review items, graph nodes, and Memory MCP records.

### Memory Graph

The graph should be a first-class workspace and the visual center of the app, not a footer at the bottom of the dashboard.

The visual direction is GraphRAG-inspired:

- A large full-workspace graph canvas.
- Many small memory/event/source nodes.
- Larger recurring entity/community nodes.
- Colored communities.
- Faint relationship/evidence links.
- A selected-node or selected-community inspector.
- Modes for map, communities, sources, and evidence paths.

The approved target is closer to an exploratory map of all memories than to the current small node-and-edge preview.

### RAG Queue

RAG gets its own operational workspace.

It should show:

- Remote queue counts from the SSH backend.
- Recent exported jobs.
- Per-job status, chunks, document IDs, and errors.
- Export history.
- Backend connection health.

RAG controls should stay out of the global action belt unless the current workspace or selected capture makes them relevant.

### Settings

Settings remain a separate macOS Settings scene. The main sidebar can link to settings if useful, but configuration fields should not become another noisy main-window panel.

## GraphRAG Direction

Microsoft GraphRAG is not just a graph renderer. It is an indexing and retrieval approach that extracts entities and relationships from text, builds a knowledge graph, creates community hierarchies and summaries, and uses those structures for local/global retrieval.

AgentMemory should adopt GraphRAG concepts in phases:

1. **GraphRAG-like model shape first.** Extend the current graph model to include communities, source chunks, claims or observations, evidence edges, and summary nodes.
2. **Native visualization next.** Build an interactive graph workspace over the app's own Memory MCP and source archive data.
3. **Optional GraphRAG pipeline later.** Evaluate the Microsoft GraphRAG project as an optional backend/indexing pipeline for larger source collections once the local product workflow is stable.

The V1 UI should not block on fully integrating Microsoft GraphRAG. It should prepare the app model and UX for that style of entity/community/evidence graph.

## Navigation And Actions

The current long action row should be replaced by contextual command groups.

Examples:

- Ingestion: `Start Batch`, `Schedule Overnight`, `Pause`, `Retry Failed`, `Import Folder`.
- Review: `Approve`, `Edit`, `Skip`, `Retry`, `Export to RAG`.
- Search: `Search`, `Recall Entity`, `Load Detail`, `Browse`.
- Graph: `Refresh`, `Filter`, `Layout`, `Focus`, `Clear Focus`.
- RAG: `Refresh Stats`, `Refresh Jobs`, `Open Export`, `Retry Export`.

On macOS, these actions can appear in:

- Toolbar groups.
- Menus.
- Context menus.
- Keyboard shortcuts for common commands.
- Inspector buttons when scoped to a selected item.

Button labels must fit. Prefer compact labels, icons where appropriate, menus for secondary actions, and no horizontal overflow.

## Layout Requirements

- Use a native sidebar list with lightweight rows.
- Avoid card-heavy nesting in the root layout.
- Keep each workspace vertically and horizontally bounded.
- Make graph canvas large enough to inspect relationships.
- Use an inspector for selected graph/community/detail metadata.
- Keep text inside buttons from truncating awkwardly.
- Keep primary workflows available without scrolling through unrelated sections.

## Implementation Slices

1. Add a workspace selection model and sidebar navigation.
2. Split the current monolithic `ContentView` into workspace views.
3. Move ingestion controls to `IngestionWorkspaceView`.
4. Move review UI to `ReviewWorkspaceView`.
5. Move Memory MCP search/recall/entity browsing to `SearchWorkspaceView`.
6. Move RAG export/history/status/stats to `RAGWorkspaceView`.
7. Promote the graph to `GraphWorkspaceView` with a full canvas and inspector.
8. Replace the global button belt with contextual toolbar/action groups.
9. Add responsive layout tests or focused view-model tests for workspace selection and action availability.
10. Update README and screenshots after the new UI is in place.

## Testing Strategy

Core logic should continue to use test-first slices.

New tests should cover:

- Workspace selection defaults and transitions.
- Which actions are available per workspace.
- Search and graph state surviving workspace switches.
- Ingestion controls no longer appearing on every selected capture detail.
- Graph selection state driving inspector content.
- RAG stats and job refresh appearing only in the RAG workspace.

Build verification remains:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
./script/build_and_run.sh --verify
```

## Non-Goals For This UI Pass

- Full Microsoft GraphRAG backend integration.
- Share extension implementation.
- Watched folders implementation.
- PDF/image rendering implementation.
- Production-grade graph physics for huge datasets.

Those remain valuable, but this pass is about making the existing backend capabilities feel like the app the user originally pictured.

## Acceptance Criteria

The overhaul is successful when:

- Ingestion is its own page.
- Search is its own page.
- Graph is its own page and feels like a primary visual workspace.
- RAG operations are no longer mixed into the global button strip.
- The long overflowing button row is gone.
- Review actions are contextual to the selected review item.
- The app can be used without scrolling through unrelated controls.
- The graph direction visually resembles a memory/community map rather than a small appended preview.
