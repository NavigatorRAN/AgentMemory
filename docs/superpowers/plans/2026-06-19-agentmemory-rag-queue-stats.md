# AgentMemory RAG Queue Stats Plan

## Goal

Expose live RAG queue health from the SSH backend so AgentMemory can show remote queue counts without relying on the Streamlit UI.

## Scope

- Add typed RAG queue stats data.
- Fetch `queue_db.stats()` over SSH using the existing ingest-directory `cd` pattern.
- Add an app action to refresh remote queue stats.
- Show the latest remote queue counts in the RAG panel.
- Document the slice in the README.

## Checklist

- [x] Add failing SSH transport stats test.
- [x] Implement `RAGQueueStats` and `fetchQueueStats()`.
- [x] Add view-model state and refresh action.
- [x] Show queue stats in the RAG panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter RAGQueueExportTests/testSSHTransportFetchesRAGQueueStats`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
