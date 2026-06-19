# AgentMemory RAG Export Status Plan

## Goal

Persist RAG export metadata on captures so queued jobs are visible and accidental duplicate exports are harder.

## Scope

- Add persisted per-capture RAG export metadata.
- Preserve decoding for older captures without export metadata.
- Record job ID, export time, and collection after selected-capture export.
- Disable selected-capture export once an item already has a RAG job.
- Surface export status in the review/detail panel.

## Tasks

- [x] Add failing capture persistence tests for RAG export status.
- [x] Add `RAGExportStatus` to `CaptureItem`.
- [x] Record export metadata after successful RAG queue enqueue.
- [x] Show export metadata in the capture detail panel.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (83 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
