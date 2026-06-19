# AgentMemory Review Outcome Editing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let users correct proposed memory outcomes for a selected review capture before approval.

**Architecture:** Add view-model helpers that toggle `MemoryOutcome` values on the selected capture and render outcome toggles in the review panel. The existing Memory MCP payload preview will update from the edited capture.

**Tech Stack:** Swift 6, SwiftUI, Observation.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selected outcome checks and toggles.
- `Sources/AgentMemoryApp/ContentView.swift`: Add outcome toggle controls in the review panel.
- `README.md`: Document review outcome editing.

---

### Task 1: Outcome Editing Controls

- [x] **Step 1: Add view model helpers**

Add `selectedItemHasOutcome` and `setSelectedItemOutcome`.

- [x] **Step 2: Add review outcome toggles**

Render all `MemoryOutcome` values as toggles inside the review panel.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add review outcome editing`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add outcome editing to the current build slice.

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

Commit message: `Document review outcome editing`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-outcome-editing` and open a draft PR.

---

## Self-Review

Spec coverage: this adds outcome correction to the review workflow. It does not add custom tag editing, confidence explanations, or source previews.

Placeholder scan: no placeholder implementation remains.

Type consistency: UI toggles mutate `CaptureItem.proposedOutcomes`, which already drives Memory MCP payload tags and content.
