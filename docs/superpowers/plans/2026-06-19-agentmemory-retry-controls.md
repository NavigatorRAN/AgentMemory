# AgentMemory Retry Controls Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add review and queue controls to retry failed/skipped captures without manually recreating them.

**Architecture:** Add view-model retry operations that reset failure state and status back to `queued`, then expose selected-item retry and retry-all-failed buttons in the UI. Keep retry policy simple for this slice; exponential backoff and attempt counters remain future work.

**Tech Stack:** Swift 6, SwiftUI.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add retry selected and retry all failed operations.
- `Sources/AgentMemoryApp/ContentView.swift`: Add retry buttons.
- `README.md`: Document retry controls.

---

### Task 1: Retry Operations

- [x] **Step 1: Add view model retry methods**

Add `retrySelectedItem()` and `retryAllFailedItems()`.

- [x] **Step 2: Add UI buttons**

Add `Retry Selected` in review and `Retry Failed` in the main action bar.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add retry controls`

---

### Task 2: Docs And PR

- [x] **Step 1: Update README**

Add retry controls to the current build slice.

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

Commit message: `Document retry controls`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-retry-controls` and open a draft PR.

---

## Self-Review

Spec coverage: this adds manual retry controls for failed/skipped/paused captures. It does not add automatic retry/backoff counters.

Placeholder scan: no placeholder implementation remains.

Type consistency: retry controls mutate `QueueStatus` and clear `failureReason`.
