# AgentMemory Memory Graph Focus Plan

## Goal

Let the graph reduce to a selected node's immediate neighborhood so the future visual graph can support inspection and learning rather than only whole-graph overviews.

## Scope

- Add a focus builder that returns the selected node, directly connected neighbors, and connecting edges.
- Return the whole graph when no node is selected or the selected node is stale.
- Add graph focus state to the app view model.
- Let graph node cards focus the panel and provide a clear-focus action.

## Checklist

- [x] Add focus-builder tests for nil, selected, and unknown selection.
- [x] Implement `MemoryMCPGraphFocusBuilder`.
- [x] Add graph focus state and actions to the view model.
- [x] Wire graph node cards and clear focus into the app UI.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphFocusBuilderTests`
