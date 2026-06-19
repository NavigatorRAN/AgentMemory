# AgentMemory YouTube Transcript Service Plan

## Goal

Connect the YouTube URL parser, caption manifest parser, and timedtext parser into a queued-ingestion service that can turn YouTube URLs into reviewable transcript captures.

## Scope

- Add an injectable YouTube transcript fetcher protocol.
- Add a URLSession-backed fetcher for app use.
- Build `YouTubeTranscriptIngestionService` for queued YouTube captures.
- Convert successful transcript fetches into `.needsReview` video captures with source provenance.
- Archive transformed transcript captures.
- Mark transcript failures as failed with a clear reason.
- Add a SwiftUI action button to fetch queued YouTube transcripts.

## Tasks

- [x] Add failing service tests for success, failure, and ignored non-YouTube captures.
- [x] Implement fetcher protocol and URLSession-backed fetcher.
- [x] Implement `YouTubeTranscriptIngestionService`.
- [x] Wire `fetchQueuedYouTubeTranscripts()` into the app view model.
- [x] Add a toolbar button for YouTube transcript fetching.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
