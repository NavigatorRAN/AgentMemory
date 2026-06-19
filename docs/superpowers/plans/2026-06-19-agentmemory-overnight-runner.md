# AgentMemory Overnight Runner Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a durable overnight batch-run foundation so stacked queued captures leave a persisted run summary and morning brief after processing.

**Architecture:** Extend the snapshot model with backward-compatible `BatchRun` history, add a processing-service method that processes all queued captures and appends one batch run plus a morning brief, and expose the action in the app UI. This keeps the current foreground processing model while creating the persistence shape needed for later true overnight/background execution.

**Tech Stack:** Swift 6, Codable snapshot migration, SwiftUI, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/Models.swift`: Add `BatchRunStatus`, `BatchRun`, and backward-compatible snapshot decoding.
- `Sources/AgentMemoryCore/CaptureProcessingService.swift`: Add `processQueuedBatch`.
- `Tests/AgentMemoryCoreTests/OvernightBatchRunnerTests.swift`: Batch-run and old snapshot decoding tests.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add `runQueuedBatch`.
- `Sources/AgentMemoryApp/ContentView.swift`: Add the batch-run button and latest run summary.
- `README.md`: Document overnight batch-run history.

---

### Task 1: Durable Batch Run Model

- [x] **Step 1: Add tests**

Add tests for old snapshot JSON decoding without `batchRuns`, and for processing a queued batch into a persisted `BatchRun`.

- [x] **Step 2: Add model and service**

Add `BatchRun` to the snapshot with custom decoding defaults, and add `CaptureProcessingService.processQueuedBatch`.

- [x] **Step 3: Verify tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter OvernightBatchRunnerTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add overnight batch run history`

---

### Task 2: App UI Wiring

- [x] **Step 1: Add view model action**

Add `runQueuedBatch()` that invokes `processQueuedBatch`, saves, and reports status.

- [x] **Step 2: Add UI controls**

Add a `Run Overnight Batch` action and a latest batch summary panel.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Expose overnight batch runner`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add overnight batch-run history to the current build slice.

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

Commit message: `Document overnight batch runner`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-overnight-runner` and open a draft PR.

---

## Self-Review

Spec coverage: this implements a durable overnight-run history and morning brief generation for queued stacks. It does not yet add OS background scheduling, retry/backoff controls, or transcript/web adapters.

Placeholder scan: all out-of-scope work is named explicitly rather than left as placeholders.

Type consistency: snapshot migration, batch-run summaries, and app UI all use the same `BatchRun` model.
