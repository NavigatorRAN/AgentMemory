# AgentMemory Review Confidence Explanations Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Explain why a capture needs review using confidence, outcomes, source type, and failure status.

**Architecture:** Add a small pure core `ReviewExplanationBuilder` with tests, then surface its output in the review panel for the selected capture. Keep explanations deterministic for now so they are stable and auditable.

**Tech Stack:** Swift 6, SwiftUI, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/ReviewExplanationBuilder.swift`: New deterministic explanation builder.
- `Tests/AgentMemoryCoreTests/ReviewExplanationBuilderTests.swift`: Confidence and status explanation tests.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Add selected review explanation helper.
- `Sources/AgentMemoryApp/ContentView.swift`: Display review explanation panel.
- `README.md`: Document confidence explanations.

---

### Task 1: Explanation Builder

- [x] **Step 1: Add tests**

Add tests for low confidence, link outcome, unknown source, and failed status explanations.

- [x] **Step 2: Implement builder**

Add `ReviewExplanationBuilder.explanations(for:)`.

- [x] **Step 3: Verify focused tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter ReviewExplanationBuilderTests`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Add review confidence explanations`

---

### Task 2: Review Panel Integration

- [x] **Step 1: Add view model helper**

Expose selected review explanations.

- [x] **Step 2: Add UI section**

Display explanation rows in the review panel.

- [x] **Step 3: Verify build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 4: Commit**

Commit message: `Show review explanations`

---

### Task 3: Docs And PR

- [x] **Step 1: Update README**

Add review confidence explanations to the current build slice.

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

Commit message: `Document review confidence explanations`

- [x] **Step 5: Push and open PR**

Push `codex/agentmemory-review-confidence-explanations` and open a draft PR.

---

## Self-Review

Spec coverage: this explains the review gate for selected captures. It does not add model-generated rationales or source previews.

Placeholder scan: no placeholder implementation remains.

Type consistency: explanations are generated from `CaptureItem` and displayed through the selected item view-model helper.
