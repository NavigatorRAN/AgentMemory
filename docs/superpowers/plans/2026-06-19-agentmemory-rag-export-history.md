# AgentMemory RAG Export History Plan

## Goal

Persist a durable RAG export run summary so overnight export results remain visible after the transient status line changes.

## Scope

- Add `RAGExportRun` history to snapshots.
- Preserve decoding for older snapshots without RAG export history.
- Append a run after bulk RAG export.
- Show the latest RAG export summary and failures in the main UI.

## Tasks

- [x] Add failing snapshot round-trip and compatibility tests.
- [x] Add `RAGExportRun` and snapshot storage.
- [x] Append RAG export history from the bulk export action.
- [x] Add latest RAG export UI panel.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (86 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
