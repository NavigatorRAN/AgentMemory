# AgentMemory Attempt History Plan

## Goal

Make overnight and retry processing easier to audit by recording per-capture processing attempts and showing that metadata during review.

## Scope

- Add backward-compatible `CaptureItem` attempt metadata.
- Increment attempts when queued items start processing.
- Preserve old snapshot decoding when attempt fields are absent.
- Surface attempt count and last attempt time in the review detail panel.

## Tasks

- [x] Add failing tests for legacy decode and processing attempt recording.
- [x] Add `attemptCount` and `lastAttemptAt` to `CaptureItem`.
- [x] Increment attempt metadata from `ProcessingQueue.processNext()`.
- [x] Display attempts in the selected capture metadata grid.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
