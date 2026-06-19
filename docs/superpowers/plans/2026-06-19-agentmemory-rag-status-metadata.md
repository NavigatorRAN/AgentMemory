# AgentMemory RAG Status Metadata Plan

## Goal

Persist refreshed RAG queue status on each exported capture so job state remains visible after refresh.

## Scope

- Extend `RAGExportStatus` with optional remote queue metadata.
- Preserve decoding for older `ragExport` JSON.
- Update capture metadata when refreshing RAG job statuses.
- Show remote status, chunks, and doc ID in the capture detail panel.

## Tasks

- [x] Add failing persistence and compatibility tests.
- [x] Extend `RAGExportStatus` with remote status fields.
- [x] Persist status refresh results onto captures.
- [x] Update RAG export detail summary.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (88 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
