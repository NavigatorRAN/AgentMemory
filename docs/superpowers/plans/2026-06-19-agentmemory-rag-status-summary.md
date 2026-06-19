# AgentMemory RAG Status Summary Plan

## Goal

Show summarized refreshed RAG job statuses in the latest RAG export panel.

## Scope

- Add a tested core status-count summary builder.
- Count only exported captures with refreshed remote statuses.
- Display status counts in the latest RAG export UI panel.

## Tasks

- [x] Add failing status summary test.
- [x] Implement `RAGJobStatusSummaryBuilder`.
- [x] Render status counts in the RAG export panel.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGJobStatusSummaryTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (89 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
