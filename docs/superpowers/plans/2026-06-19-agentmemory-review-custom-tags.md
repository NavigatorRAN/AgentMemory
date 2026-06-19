# AgentMemory Review Custom Tags Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let users add custom tags to a reviewed capture before approving the Memory MCP write.

**Architecture:** Add `customTags` to `CaptureItem` with backward-compatible decoding, include custom tags in Memory MCP payloads, and expose comma-separated tag editing in the review panel. Keep tag normalization conservative by trimming blanks and preserving user-entered tag text.

**Tech Stack:** Swift 6, Codable migration, SwiftUI, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/Models.swift`: Add `CaptureItem.customTags` and backward-compatible decode.
- `Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift`: Include custom tags in payload tags.
- `Tests/AgentMemoryCoreTests/ReviewCustomTagsTests.swift`: Custom tag payload and old JSON decode tests.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add custom tag edit helpers.
- `Sources/AgentMemoryApp/ContentView.swift`: Add custom tag text field in review panel.
- `README.md`: Document custom tag editing.

---

### Task 1: Custom Tag Model And Payload

- [x] **Step 1: Add tests**

Add tests for custom tags appearing in Memory MCP payload tags and older capture JSON decoding with no `customTags`.

- [x] **Step 2: Add model and payload support**

Add `customTags` to `CaptureItem` and include them in `MemoryMCPPayloadBuilder`.

- [x] **Step 3: Verify focused tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter ReviewCustomTagsTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add custom tags to reviewed captures`

---

### Task 2: Custom Tag Review UI

- [x] **Step 1: Add view model helpers**

Add comma-separated custom tag edit helpers for the selected capture.

- [x] **Step 2: Add review text field**

Add a custom tags text field in the review panel.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Expose custom tag review editing`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add custom tag editing to the current build slice.

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

Commit message: `Document review custom tags`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-custom-tags` and open a draft PR.

---

## Self-Review

Spec coverage: this adds custom tag editing and persisted custom tags for reviewed captures. It does not add tag autocomplete, validation against existing Memory MCP entities, or source previews.

Placeholder scan: no placeholder implementation remains.

Type consistency: custom tags are stored on `CaptureItem.customTags`, included in payload tags, and edited through the selected review capture.
