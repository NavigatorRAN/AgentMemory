# AgentMemory YouTube ID Parser Plan

## Goal

Prepare YouTube transcript ingestion by giving the app a reliable, tested way to recognize common YouTube URL forms and carry video metadata into stacked captures.

## Scope

- Parse standard watch URLs, short share URLs, and Shorts URLs.
- Reject non-YouTube URLs even when they have YouTube-like query parameters.
- Use the parser from `SourceClassifier`.
- Use the parser and classifier when building text-stack captures.
- Route manual single-capture entry through the same builder path.

## Tasks

- [x] Add failing tests for YouTube video ID parsing.
- [x] Implement `YouTubeVideoIDParser`.
- [x] Add failing test for YouTube stack item metadata.
- [x] Use the parser and source classifier in `CaptureStackBuilder`.
- [x] Use the parser from `SourceClassifier`.
- [x] Route manual add through `CaptureStackBuilder`.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
