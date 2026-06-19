# AgentMemory YouTube Caption Manifest Plan

## Goal

Move YouTube transcript ingestion closer by isolating the fragile watch-page parsing step behind a tested caption-manifest parser.

## Scope

- Extract embedded `captionTracks` JSON arrays from YouTube watch-page HTML.
- Decode caption base URLs, language codes, and display names.
- Support escaped JSON forms seen in embedded player responses.
- Fail clearly when a watch page has no caption tracks.
- Keep this slice network-free; actual transcript fetching is a later layer.

## Tasks

- [x] Add failing tests for manifest parsing, escaped JSON, and missing captions.
- [x] Implement `YouTubeCaptionManifestParser`.
- [x] Add `YouTubeCaptionTrack` model and parser errors.
- [x] Run targeted parser tests.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
