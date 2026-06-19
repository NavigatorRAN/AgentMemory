# AgentMemory Bulk RAG Export Plan

## Goal

Let users queue reviewed/completed captures into the RAG backend in one action.

## Scope

- Add a core batch exporter for completed captures.
- Skip captures that are not complete or already have RAG export metadata.
- Record job metadata for exported captures.
- Expose an app action for exporting all completed, unexported captures.

## Tasks

- [x] Add failing batch exporter test.
- [x] Implement `RAGBatchExporter`.
- [x] Add app action and toolbar button for completed-capture RAG export.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGQueueExportTests/testBatchExporterExportsOnlyCompletedUnexportedCaptures`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (84 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
