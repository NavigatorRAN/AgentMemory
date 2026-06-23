# AgentMemory Local CodeGraphRAG Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a local GraphRAG-inspired codebase understanding layer that builds repo symbol graphs, community summaries, wiki pages, and Memory MCP-compatible routing records for coding agents.

**Architecture:** AgentMemory will include a deterministic `CodeGraphRAG` pipeline inspired by Microsoft GraphRAG: load repo files, split them into analyzable code units, extract symbols and relationships, group them into subsystem communities, and materialize community reports into the existing wiki layer. This first slice does not vendor Microsoft GraphRAG code; it credits the concept and uses local Swift implementations suited to repo onboarding.

**Tech Stack:** Swift 6, SwiftPM, XCTest, SwiftUI, local filesystem scanning, existing wiki/Memory MCP sync infrastructure.

---

### Task 1: Local Code Graph Index

**Files:**
- Create: `Sources/AgentMemoryCore/CodeGraphRAGIndex.swift`
- Create: `Sources/AgentMemoryCore/CodeGraphRAGIndexer.swift`
- Test: `Tests/AgentMemoryCoreTests/CodeGraphRAGTests.swift`

- [x] Add failing tests for scanning Swift, Markdown, and Python fixture files into text units.
- [x] Add failing tests for extracting symbols and containment/import/test relationships.
- [x] Implement deterministic file filtering that skips `.git`, `.build`, `dist`, app bundles, and binary-looking files.
- [x] Implement symbol extraction for Swift declarations, Python classes/functions, Markdown headings, and shell functions.
- [x] Run focused CodeGraphRAG tests.

### Task 2: Communities And Wiki Pages

**Files:**
- Create: `Sources/AgentMemoryCore/CodeGraphRAGCommunityBuilder.swift`
- Create: `Sources/AgentMemoryCore/CodeGraphRAGWikiPageBuilder.swift`
- Test: `Tests/AgentMemoryCoreTests/CodeGraphRAGTests.swift`

- [x] Add failing tests for community grouping by repo subsystem.
- [x] Add failing tests that community reports become `AgentMemoryWikiPage` records tagged `code-graphrag`.
- [x] Implement community summaries with key files, key symbols, relationships, and claim-style notes.
- [x] Implement wiki page generation for repo overview plus one page per community.
- [x] Run focused CodeGraphRAG tests.

### Task 3: App Integration

**Files:**
- Modify: `Sources/AgentMemoryCore/AgentMemoryConfig.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemorySettingsView.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`
- Modify: `Sources/AgentMemoryApp/WikiWorkspaceView.swift`
- Test: `Tests/AgentMemoryCoreTests/AgentMemoryConfigTests.swift`

- [x] Add config defaults for a local CodeGraphRAG repo path and older-config decoding.
- [x] Add a `buildCodeGraphRAGIndex()` view model action that scans the configured repo, writes wiki pages, and syncs through the existing wiki Memory MCP path.
- [x] Add Wiki workspace controls and settings fields for CodeGraphRAG.
- [x] Run focused config tests.

### Task 4: Attribution And Verification

**Files:**
- Create: `docs/code-graphrag-attribution.md`
- Modify: `README.md`
- Modify: this plan file

- [x] Credit Microsoft GraphRAG clearly as conceptual inspiration and link to the docs/repo.
- [x] State that AgentMemory does not vendor Microsoft GraphRAG code in this slice.
- [x] Run `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`.
- [x] Run `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`.
- [x] Run `./script/build_and_run.sh --verify`.
- [x] Commit, push, open a stacked PR, and record the implementation event in Memory MCP.
