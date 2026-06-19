# AgentMemory Review Selection Polish Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make review selection ergonomics better by preferring review items and adding an explicit next-review action.

**Architecture:** Add view-model helpers that keep `selectedItemID` valid, select the first `needsReview` item when available, and move to the next review item after approve/skip/retry/process/load changes. Expose a `Next Review` button in the action bar.

**Tech Stack:** Swift 6, SwiftUI.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selection validation and next-review helpers.
- `Sources/AgentMemoryApp/ContentView.swift`: Add next-review button.
- `README.md`: Document review selection polish.

---

### Task 1: Review Selection Helpers

- [x] **Step 1: Add view model helpers**

Add `selectNextReviewItem()` and `normalizeSelection(preferReview:)`, then call them after snapshot mutations and loads.

- [x] **Step 2: Add UI button**

Add `Next Review` to the action bar.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Polish review selection`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add review selection polish to the current build slice.

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

Commit message: `Document review selection polish`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-selection-polish` and open a draft PR.

---

## Self-Review

Spec coverage: this improves review navigation and selection validity. It does not add keyboard shortcuts or a dedicated review-only list.

Placeholder scan: no placeholder implementation remains.

Type consistency: all selection uses `CaptureItem.ID`.
