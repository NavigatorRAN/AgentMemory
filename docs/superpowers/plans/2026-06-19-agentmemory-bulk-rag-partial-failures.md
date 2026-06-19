# AgentMemory Bulk RAG Partial Failure Plan

## Goal

Make bulk RAG export safer for unattended runs by preserving successful job metadata when later captures fail.

## Scope

- Report per-capture batch export failures.
- Keep successful `ragExport` metadata in the returned item list.
- Separate skipped captures from failed exports.
- Surface failed count in the app status line.

## Tasks

- [x] Add failing partial-failure batch export test.
- [x] Add `RAGBatchExportFailure` and failed count reporting.
- [x] Catch per-capture export errors while continuing the batch.
- [x] Update app status to include failed count.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGQueueExportTests/testBatchExporterKeepsSuccessfulMetadataWhenLaterItemFails`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (85 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
