# AgentMemory Web Page Ingestion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a first web/article ingestion path that fetches queued HTTP(S) URL captures into archived text and marks them ready for review.

**Architecture:** Introduce a small `WebPageFetching` protocol and a `WebPageIngestionService` that turns queued URL captures into text snapshots without relying on live network in tests. The service will archive fetched text through the existing source archive, update the capture raw input/display name/source type/status, and leave the item in `needsReview` for the existing review workflow.

**Tech Stack:** Swift 6, Foundation URLSession, Codable snapshot model, XCTest, SwiftUI.

---

## File Structure

- `Sources/AgentMemoryCore/WebPageFetcher.swift`: New fetcher protocol, fetched page model, and URLSession implementation.
- `Sources/AgentMemoryCore/WebPageIngestionService.swift`: New ingestion service for queued URL captures.
- `Tests/AgentMemoryCoreTests/WebPageIngestionServiceTests.swift`: URL ingestion behavior tests using a stub fetcher.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add `fetchQueuedWebPages`.
- `Sources/AgentMemoryApp/ContentView.swift`: Add fetch web pages action.
- `README.md`: Document web page ingestion.

---

### Task 1: Core Web Page Ingestion

- [x] **Step 1: Add tests**

Add tests proving queued HTTP URL captures are fetched, archived, moved to review, and fetch failures mark items failed.

- [x] **Step 2: Implement fetcher and service**

Add `WebPageFetching`, `URLSessionWebPageFetcher`, and `WebPageIngestionService`.

- [x] **Step 3: Verify focused tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter WebPageIngestionServiceTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add web page ingestion service`

---

### Task 2: App Action

- [x] **Step 1: Add view model action**

Add `fetchQueuedWebPages()` using `URLSessionWebPageFetcher`.

- [x] **Step 2: Add UI button**

Add `Fetch Web Pages` to the main action bar.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Expose web page ingestion action`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add web page ingestion to the current build slice.

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

Commit message: `Document web page ingestion`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-web-page-ingestion` and open a draft PR.

---

## Self-Review

Spec coverage: this adds first web/article URL ingestion into reviewable archived text. It does not add full readability extraction, JavaScript rendering, authenticated pages, or YouTube transcripts.

Placeholder scan: no placeholder implementation remains.

Type consistency: fetched pages become `CaptureItem` updates and `ArchivedSource` entries consumed by the existing review workflow.
