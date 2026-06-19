# AgentMemory Memory Graph Viewport Plan

## Goal

Render the graph data backbone as a first native visual preview while keeping projection logic tested outside SwiftUI.

## Scope

- Project 3D scene coordinates into a padded 2D viewport.
- Handle single-node scenes by centering the node.
- Draw a native SwiftUI Canvas preview with edges and node markers.
- Keep node cards and focus interactions below the preview.

## Checklist

- [x] Add viewport projection tests.
- [x] Implement `MemoryMCPGraphViewportProjector`.
- [x] Draw the projected graph in a SwiftUI Canvas.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphViewportProjectorTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
