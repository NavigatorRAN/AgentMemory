# AgentMemory Review Source Preview Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Show source archive provenance for the selected review capture.

**Architecture:** Expose the selected capture's `ArchivedSource` from the view model and show archived path, original path, source type, and byte size in the review panel. Keep actual file rendering out of scope for this slice.

**Tech Stack:** Swift 6, SwiftUI.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selected archived source helper.
- `Sources/AgentMemoryApp/ContentView.swift`: Add source provenance panel.
- `README.md`: Document review source provenance preview.

---

### Task 1: Source Provenance Panel

- [x] **Step 1: Add view model helper**

Add `selectedArchivedSource`.

- [x] **Step 2: Add review panel section**

Show archived path, original path, source type, and byte size when source archive metadata exists.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Show review source provenance`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add review source provenance preview to the current build slice.

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

Commit message: `Document review source preview`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-source-preview` and open a draft PR.

---

## Self-Review

Spec coverage: this adds review-time source provenance visibility. It does not render source files inline.

Placeholder scan: no placeholder implementation remains.

Type consistency: view model exposes `ArchivedSource?` from the selected capture ID.
