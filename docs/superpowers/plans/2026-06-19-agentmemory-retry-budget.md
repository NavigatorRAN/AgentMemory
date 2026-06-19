# AgentMemory Retry Budget Plan

## Goal

Prevent overnight processing from repeatedly re-queuing captures that have already failed enough times, while keeping manual retry behavior clear and auditable.

## Scope

- Add a core retry policy with a default maximum attempt count.
- Allow retry for recoverable statuses only.
- Block exhausted selected retries with a plain-language message.
- Let bulk retry queue eligible failed captures and report exhausted failures.
- Disable the selected retry button when the selected capture is not retryable.

## Tasks

- [x] Add failing tests for retry eligibility and exhausted retry limits.
- [x] Implement `RetryPolicy` in `AgentMemoryCore`.
- [x] Wire selected and bulk retry actions through the policy.
- [x] Disable retry UI when the selected item is not retryable.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
