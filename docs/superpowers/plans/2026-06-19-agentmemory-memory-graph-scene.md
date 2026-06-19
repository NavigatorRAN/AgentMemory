# AgentMemory Memory Graph Scene Plan

## Goal

Create a deterministic 3D-ready scene payload for the future graph renderer.

## Scope

- Convert the tested Memory MCP graph projection into scene nodes with x/y/z coordinates.
- Keep entity nodes at one depth and event nodes forward on the z-axis.
- Preserve graph edges for the renderer.
- Surface scene readiness and node coordinates in the current app graph panel.

## Checklist

- [x] Add scene-builder tests for stable sorted 3D coordinates.
- [x] Implement `MemoryMCPGraphSceneBuilder`.
- [x] Expose the scene payload from the view model.
- [x] Show scene counts and coordinates in the graph panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphSceneBuilderTests`
