# AgentMemory Review Workflow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `needsReview` captures into a usable review workflow with selection, proposed Memory MCP preview, approve-write, and skip actions.

**Architecture:** Add review operations to `AgentMemoryViewModel` so UI actions mutate and persist snapshot state through the same writer resolver used by processing. Add a dedicated review panel in `ContentView` showing the selected item, raw input, metadata, proposed payload preview, and action buttons.

**Tech Stack:** Swift 6, SwiftUI, Observation, XCTest.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selection, review payload preview, approve, skip, and review-item helpers.
- `Sources/AgentMemoryApp/ContentView.swift`: Add selectable sidebar rows and review panel.
- `Tests/AgentMemoryCoreTests/ReviewWorkflowTests.swift`: Core payload preview regression coverage through `MemoryMCPPayloadBuilder`.
- `README.md`: Document review workflow.

---

### Task 1: Review Payload Preview Coverage

- [x] **Step 1: Add preview test**

Create a test that proves reviewed items can produce a user-readable Memory MCP payload preview with raw input, source type, outcomes, and confidence.

- [x] **Step 2: Verify focused test**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter ReviewWorkflowTests`

Expected: PASS.

- [x] **Step 3: Commit**

Commit message: `Cover review payload preview`

---

### Task 2: Review UI And Actions

- [x] **Step 1: Add view model review operations**

Add selected item state, review filtering, payload preview, approve, and skip.

- [x] **Step 2: Add review panel**

Make sidebar rows selectable and add a `Review Capture` panel with approve/skip actions.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add review workflow UI`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add review workflow to the current build slice.

- [x] **Step 2: Mark plan complete**

Change completed checklist items in this plan from `- [ ]` to `- [x]`.

- [x] **Step 3: Final verification**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
./script/build_and_run.sh --verify
```

Expected: all tests pass, app builds, and launch script verifies the process.

- [x] **Step 4: Commit docs**

Commit message: `Document review workflow`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-workflow` and open a draft PR.

---

## Self-Review

Spec coverage: this implements a first review workflow for `needsReview` captures and proposed Memory MCP payload preview. It does not add rich editing, source file rendering, transcript extraction, or graph visualization.

Placeholder scan: future work is explicitly out of scope rather than left as incomplete behavior.

Type consistency: review actions operate on `CaptureItem.id`, update `QueueStatus`, and use the existing Memory MCP payload builder and writer resolver.
