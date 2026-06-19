# AgentMemory Review Editing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let users edit a selected review capture's title and raw input before approving or skipping it.

**Architecture:** Keep edits directly on the persisted snapshot model so the Memory MCP payload preview always reflects the current selected capture. Add explicit save-edits behavior and compact edit controls inside the review panel.

**Tech Stack:** Swift 6, SwiftUI, Observation.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selected item mutation helpers and save-review-edits action.
- `Sources/AgentMemoryApp/ContentView.swift`: Replace static title/raw display with editable controls for the selected item.
- `README.md`: Document review editing.

---

### Task 1: Editable Review Fields

- [x] **Step 1: Add view model mutation helpers**

Add selected item title/raw input setters and a save-review-edits action.

- [x] **Step 2: Add editable review controls**

Use bindings in `ContentView` so title and raw input edits update the selected capture and the payload preview.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add review editing controls`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add review title/raw input editing to the current build slice.

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

Commit message: `Document review editing`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-editing` and open a draft PR.

---

## Self-Review

Spec coverage: this adds practical review editing for title and raw input before approval. It does not yet add tag/outcome editing, source file rendering, or confidence explanations.

Placeholder scan: no placeholder implementation steps remain.

Type consistency: edits mutate `CaptureItem.displayName` and `CaptureItem.rawInput`, which are already used by the Memory MCP payload builder.
