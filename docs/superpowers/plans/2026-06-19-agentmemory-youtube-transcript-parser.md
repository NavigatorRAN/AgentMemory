# AgentMemory YouTube Transcript Parser Plan

## Goal

Add the offline transcript-text parser needed after YouTube caption track discovery downloads timedtext XML.

## Scope

- Parse YouTube timedtext XML `<text>` nodes into readable transcript lines.
- Decode XML entities through Foundation's XML parser.
- Throw clear errors for empty or malformed transcripts.
- Keep this layer network-free; fetching timedtext data remains a later slice.

## Tasks

- [x] Add failing tests for timedtext parsing, entity decoding, and empty transcripts.
- [x] Implement `YouTubeTranscriptParser`.
- [x] Use Foundation XML parsing without importing `FoundationXML`, which is not exposed in this macOS SwiftPM setup.
- [x] Run targeted transcript parser tests.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
