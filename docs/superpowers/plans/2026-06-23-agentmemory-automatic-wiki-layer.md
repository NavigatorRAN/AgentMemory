# AgentMemory Automatic Wiki Layer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add an automatic LLM Wiki-style compiled knowledge layer that refreshes during AgentMemory processing and is discoverable by agents already using Memory MCP.

**Architecture:** AgentMemory will materialize wiki pages from completed captures, approved Memory MCP writes, RAG export metadata, batch runs, and durable source handles. Pages are persisted locally as markdown, tracked in the app snapshot, and compact summaries are recorded back into Memory MCP with `agentmemory-wiki` tags/entities so existing agents can retrieve them without changing their workflow. The Memory MCP HTTP client will also support future native `search_wiki` and `get_wiki_page` tools when the server grows that API.

**Tech Stack:** Swift 6, SwiftUI, SwiftPM, XCTest, existing JSON-RPC Memory MCP transport, local markdown files in Application Support.

---

### Task 1: Wiki Domain Model And Persistence

**Files:**
- Modify: `Sources/AgentMemoryCore/Models.swift`
- Modify: `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`
- Create: `Sources/AgentMemoryCore/AgentMemoryWikiPageBuilder.swift`
- Create: `Sources/AgentMemoryCore/AgentMemoryWikiFileStore.swift`
- Test: `Tests/AgentMemoryCoreTests/AgentMemoryWikiTests.swift`

- [x] Add failing tests for wiki page building, older snapshot decoding, and markdown file writing.
- [x] Add `AgentMemoryWikiPage`, `AgentMemoryWikiRefreshRun`, and snapshot arrays with backward-compatible decoding.
- [x] Implement `AgentMemoryWikiPageBuilder` to generate stable pages from completed captures and RAG-exported captures.
- [x] Implement `AgentMemoryWikiFileStore` to write `index.md`, `log.md`, and page markdown.
- [x] Run focused wiki tests.

### Task 2: Memory MCP Wiki Bridge

**Files:**
- Modify: `Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift`
- Modify: `Sources/AgentMemoryCore/MemoryMCPWriter.swift`
- Modify: `Sources/AgentMemoryCore/MemoryMCPHTTPTransport.swift`
- Create: `Sources/AgentMemoryCore/AgentMemoryWikiMemorySyncer.swift`
- Test: `Tests/AgentMemoryCoreTests/MemoryMCPHTTPTransportTests.swift`
- Test: `Tests/AgentMemoryCoreTests/AgentMemoryWikiTests.swift`

- [x] Add failing tests for wiki summary payload tags/entities.
- [x] Add failing tests for optional native `search_wiki` and `get_wiki_page` tool calls.
- [x] Implement wiki payload construction and sync result accounting.
- [x] Implement `searchWiki(query:limit:)` and `getWikiPage(slug:)` in the HTTP transport.
- [x] Run focused Memory MCP and wiki tests.

### Task 3: Automatic App Flow And Wiki Workspace

**Files:**
- Modify: `Sources/AgentMemoryCore/AgentMemoryWorkspace.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`
- Modify: `Sources/AgentMemoryApp/ContentView.swift`
- Create: `Sources/AgentMemoryApp/WikiWorkspaceView.swift`
- Test: `Tests/AgentMemoryCoreTests/AgentMemoryWorkspaceTests.swift`

- [x] Add failing workspace-order test for the new Wiki workspace.
- [x] Add a view model helper that refreshes wiki pages, writes markdown, and syncs to Memory MCP when configured.
- [x] Call automatic wiki refresh after approved memory writes, queued/batch processing, successful RAG exports, and Apple documentation fetches.
- [x] Add a Wiki workspace showing page list, latest refresh, Memory MCP sync status, and selected page preview.
- [x] Run focused workspace tests.

### Task 4: Verification And PR

**Files:**
- Modify docs and README if verification reveals a missing user-facing note.

- [x] Run `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`.
- [x] Run `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`.
- [x] Run `./script/build_and_run.sh --verify`.
- [x] Commit, push, open a PR, and record the substantive implementation event to Memory MCP with agent `CODEX`.
