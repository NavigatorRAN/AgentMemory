# AgentMemory Live Memory MCP Enablement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Wire the saved Memory MCP settings into processing so live writes can be enabled deliberately, with a controlled Settings test write.

**Architecture:** Add a core writer resolver that keeps mock writes as the default and only builds `MemoryMCPWriter` when live writes are enabled and the endpoint is valid. The app view model will construct processing services from the latest config at processing time and expose a Settings action that sends a small `record_event` test payload through the configured endpoint.

**Tech Stack:** Swift 6, SwiftUI Settings scene, Codable config, URLSession transport, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/AgentMemoryConfig.swift`: Add endpoint URL and display-agent helpers.
- `Sources/AgentMemoryCore/MemoryWriterResolver.swift`: New resolver for mock vs live writer selection.
- `Tests/AgentMemoryCoreTests/MemoryWriterResolverTests.swift`: Resolver safety and payload tests.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Build processing service from current config and add Settings test-write action.
- `Sources/AgentMemoryApp/AgentMemorySettingsView.swift`: Add test-write button and status text.
- `README.md`: Document that live Memory MCP writes can be enabled from Settings.

---

### Task 1: Core Writer Resolver

- [x] **Step 1: Add failing resolver tests**

Create tests proving disabled config returns the mock writer, enabled invalid endpoints throw, and enabled valid endpoints sends through the supplied transport.

- [x] **Step 2: Implement config helpers and resolver**

Add `memoryMCPEndpointURL`, `resolvedAgentName`, and `MemoryWriterResolver`.

- [x] **Step 3: Verify resolver tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryWriterResolverTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Wire Memory MCP writer resolver`

---

### Task 2: App Wiring And Settings Test Write

- [x] **Step 1: Update view model**

Make processing build its `CaptureProcessingService` from the current config each time, and add `testMemoryMCPConnection()`.

- [x] **Step 2: Update Settings view**

Add a test-write button and keep the status readable inside Settings.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Enable live Memory MCP settings path`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add the live Memory MCP settings path to the current build slice.

- [x] **Step 2: Mark plan complete**

Change completed checklist items in this plan from `- [ ]` to `- [x]`.

- [x] **Step 3: Final verification**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: all tests pass and the build succeeds.

- [x] **Step 4: Commit docs**

Commit message: `Document live Memory MCP enablement`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-live-memory-mcp-enable` and open a draft PR.

---

## Self-Review

Spec coverage: this slice wires the existing Settings config into processing, adds endpoint validation, and provides one controlled test write. It does not add overnight retry queues, transcript ingestion, RAG export, or graph rendering.

Placeholder scan: no implementation placeholders remain; future subsystems are explicitly out of scope.

Type consistency: app code will use `AgentMemoryConfig` and `MemoryWriterResolver` from core, with mock writer as the default path.
