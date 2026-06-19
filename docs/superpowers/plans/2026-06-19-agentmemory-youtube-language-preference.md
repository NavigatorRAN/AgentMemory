# AgentMemory YouTube Language Preference Plan

## Goal

Make YouTube transcript fetching more useful for overnight stacks by preferring English caption tracks when a video exposes multiple languages.

## Scope

- Add a preferred language option to `YouTubeTranscriptIngestionService`.
- Default the preferred language to `en`.
- Fall back to the first caption track when the preferred language is unavailable.
- Keep app wiring unchanged for now; it receives the default English preference.

## Tasks

- [x] Add failing test for English preference when English is not the first caption track.
- [x] Implement preferred language selection with fallback.
- [x] Run targeted service tests.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
