# AgentMemory Memory Graph Selected Marker Plan

## Goal

Make selected Memory MCP graph nodes visually obvious inside the Canvas preview.

## Scope

- Add tested core marker building for projected graph nodes.
- Include base marker radius and optional selected ring radius.
- Draw Canvas nodes from marker data.
- Draw an accent selection ring around the focused node.
- Document the slice in the README.

## Checklist

- [x] Add failing node marker tests.
- [x] Implement `MemoryMCPGraphViewportNodeMarkerBuilder`.
- [x] Draw Canvas nodes from markers.
- [x] Draw selected-node rings in Canvas.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphViewportNodeMarkerBuilderTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
