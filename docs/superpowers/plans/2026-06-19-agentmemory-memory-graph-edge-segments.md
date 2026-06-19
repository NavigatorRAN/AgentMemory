# AgentMemory Memory Graph Edge Segments Plan

## Goal

Move viewport edge endpoint preparation into core projection logic so SwiftUI can draw graph edges without rebuilding node lookup state.

## Scope

- Add tested viewport edge segment output to `MemoryMCPGraphViewportProjector`.
- Preserve the existing projected nodes and graph edges for inspection.
- Update the Canvas preview to draw projected edge segments directly.
- Document the slice in the README.

## Checklist

- [x] Add viewport edge segment test coverage.
- [x] Implement `MemoryMCPGraphViewportEdgeSegment`.
- [x] Project scene edges into ready-to-draw 2D segments.
- [x] Simplify SwiftUI Canvas edge rendering.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphViewportProjectorTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
