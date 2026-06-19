# AgentMemory RAG Job Status Plan

## Goal

Let the app query the RAG backend for statuses of recorded RAG queue jobs.

## Scope

- Read RAG job statuses from the remote `queue.db` over the existing SSH bridge.
- Parse job ID, status, error, attempts, chunks upserted, and document ID.
- Add a toolbar action to refresh statuses for recorded capture exports.
- Show a concise status-count summary in the app status line.

## Backend Notes

- Remote `sqlite3` CLI is not installed on `192.168.1.107`; use Python `sqlite3`.
- Queue table is `jobs`.
- Observed live statuses on 2026-06-19: `cancelled`, `done`, `failed`.

## Tasks

- [x] Add failing SSH job-status parser test.
- [x] Implement `RAGQueueJobStatus` and `fetchJobStatuses`.
- [x] Add app action and toolbar button for refreshing recorded RAG jobs.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGQueueExportTests/testSSHTransportFetchesRAGJobStatuses`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (87 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
- Passed live SSH smoke check against latest RAG job status.
