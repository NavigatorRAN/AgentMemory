# AgentMemory RAG Queue Client Plan

## Goal

Add the first native bridge from AgentMemory into the existing RAG ingestion backend without depending on the Streamlit UI.

## Backend Contract Found

- RAG UI: `http://192.168.1.107:8501`
- RAG MCP search endpoint: `http://192.168.1.107:8005/mcp/`
- Ingest app path: `/opt/rag/ingest`
- Staging directory: `/opt/rag/uploads-staging`
- Queue function: `queue_db.enqueue(source_path, collection, tags)`
- Worker: `/opt/rag/ingest/ingest_worker.py`
- Supported staged extensions include `.md` and `.txt`.
- SSH key required from this Mac: `~/.ssh/id_rsa_hermes`

## Scope

- Convert selected captures into Markdown RAG documents.
- Stage documents to the RAG host over `scp`.
- Enqueue staged files by calling `queue_db.enqueue(...)` over `ssh`.
- Add a selected-capture `Export RAG` app action.
- Keep collection fixed to `agentmemory` for this first slice.

## Tasks

- [x] Add failing tests for export document creation and queue writer behavior.
- [x] Implement `RAGExportDocument`, `RAGQueueExportBuilder`, and `RAGQueueWriter`.
- [x] Add failing test for SSH transport command contract.
- [x] Implement `RAGSSHQueueTransport`.
- [x] Wire selected-capture RAG export into the app.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
- Passed: SSH smoke check for `/opt/rag/uploads-staging`
- Passed: remote `/opt/rag/ingest/.venv/bin/python -c "import queue_db"`
