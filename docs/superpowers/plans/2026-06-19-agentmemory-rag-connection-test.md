# AgentMemory RAG Connection Test Plan

## Goal

Let the app verify the configured RAG queue backend before exporting captures.

## Scope

- Add a RAG SSH connection check that validates the remote staging directory.
- Validate the remote ingest environment can import `queue_db`.
- Expose a Settings button for the check.
- Keep export behavior unchanged.

## Tasks

- [x] Add failing transport test for the remote connection check.
- [x] Implement `RAGSSHQueueTransport.checkConnection()`.
- [x] Add Settings action for testing the configured RAG backend.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGQueueExportTests/testSSHTransportChecksRemoteRAGQueueConnection`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (82 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
- Passed live SSH smoke check: staging directory exists and `queue_db` imports successfully.
