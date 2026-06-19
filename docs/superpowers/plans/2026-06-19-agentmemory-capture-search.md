# AgentMemory Capture Search Plan

## Goal

Add native search over the app's capture database so large overnight stacks remain navigable after ingestion.

## Scope

- Add a core `CaptureSearch` helper.
- Search display names, raw input, source type, status, proposed outcomes, custom tags, and failure reasons.
- Preserve stable item order.
- Compose search with the existing All/Review sidebar filter.
- Add a sidebar search field and normalize selection when the query changes.

## Tasks

- [x] Add failing tests for blank query, title/raw matches, and metadata matches.
- [x] Implement `CaptureSearch`.
- [x] Add sidebar search query state.
- [x] Apply search to `sidebarItems`.
- [x] Add sidebar search field.
- [x] Run full verification.
- [ ] Push branch and open draft PR.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
