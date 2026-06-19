# AgentMemory RAG Settings Plan

## Goal

Move the first RAG export bridge from hard-coded backend values to saved app settings.

## Scope

- Extend `AgentMemoryConfig` with RAG export settings.
- Preserve backward-compatible config decoding.
- Derive `RAGSSHQueueConfig` from saved settings and expand `~`.
- Gate the Export RAG action behind an enabled setting.
- Expose RAG host, user, SSH identity path, collection, and enable toggle in Settings.

## Tasks

- [x] Add failing config tests for defaults, validation, and SSH config derivation.
- [x] Extend `AgentMemoryConfig`.
- [x] Use saved RAG settings in selected-capture export.
- [x] Add RAG settings controls.
- [x] Run full verification.
- [x] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` (81 tests, 0 failures)
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
