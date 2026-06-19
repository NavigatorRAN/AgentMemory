# AgentMemory Review Sidebar Filter Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a sidebar filter that lets users switch between all captures and only captures needing review.

**Architecture:** Add a small app-level enum for sidebar filter state and a filtered item list in the view model. Render a segmented picker above the capture list and keep selection normalized when the filter changes.

**Tech Stack:** Swift 6, SwiftUI.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add filter enum, filter state, filtered items, and filter setter.
- `Sources/AgentMemoryApp/ContentView.swift`: Add segmented picker and use filtered items in the list.
- `README.md`: Document review sidebar filter.

---

### Task 1: Review Sidebar Filter

- [x] **Step 1: Add view model filter**

Add `CaptureSidebarFilter`, `sidebarFilter`, `sidebarItems`, and `setSidebarFilter`.

- [x] **Step 2: Add segmented picker**

Render the filter picker in the sidebar and use `sidebarItems`.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add review sidebar filter`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add review sidebar filter to the current build slice.

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

Commit message: `Document review sidebar filter`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-sidebar-filter` and open a draft PR.

---

## Self-Review

Spec coverage: this adds All/Review sidebar filtering. It does not add saved filter preferences or keyboard shortcuts.

Placeholder scan: no placeholder implementation remains.

Type consistency: filter state is app-only and uses existing `CaptureItem` status values.
