# AgentMemory Review Text Source Preview Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Show a bounded inline preview of archived text-like source files during review.

**Architecture:** Add a pure `ArchivedSourcePreviewReader` that reads UTF-8 archived files up to a configurable character limit and reports clear unavailable messages. Surface the selected preview in the review panel below source provenance.

**Tech Stack:** Swift 6, Foundation file IO, SwiftUI, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/ArchivedSourcePreviewReader.swift`: New bounded text preview reader.
- `Tests/AgentMemoryCoreTests/ArchivedSourcePreviewReaderTests.swift`: Read, truncate, and missing-file tests.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selected source preview helper.
- `Sources/AgentMemoryApp/ContentView.swift`: Display archived text preview.
- `README.md`: Document text source preview.

---

### Task 1: Core Text Preview Reader

- [x] **Step 1: Add tests**

Add tests for readable text, truncation, and missing archived files.

- [x] **Step 2: Implement reader**

Add `ArchivedSourcePreviewReader.preview(for:limit:)`.

- [x] **Step 3: Verify focused tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter ArchivedSourcePreviewReaderTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add archived source text preview reader`

---

### Task 2: Review Panel Integration

- [x] **Step 1: Add view model helper**

Expose selected archived source preview text.

- [x] **Step 2: Add UI section**

Display the preview in the review panel.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Show archived text source preview`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add archived text source preview to the current build slice.

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

Commit message: `Document archived text source preview`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-text-source-preview` and open a draft PR.

---

## Self-Review

Spec coverage: this adds inline text previews for archived source files. It does not add PDF/image/video rendering.

Placeholder scan: no placeholder implementation remains.

Type consistency: preview reading uses `ArchivedSource.archivedPath` and returns strings for the existing review panel.
