# AgentMemory Memory Graph Projection Plan

## Goal

Create the tested graph data backbone that can feed the future 3D graph renderer.

## Scope

- Build graph nodes from Memory MCP events and entities.
- Build mention edges between event nodes and entity nodes.
- Deduplicate entity nodes across search, recall, entity detail, and browse results.
- Surface a first Memory Graph summary in the app.

## Checklist

- [x] Add graph projection tests for Memory MCP event and entity inputs.
- [x] Implement `MemoryMCPGraph`, node, edge, and builder types.
- [x] Expose the current Memory MCP graph projection from the view model.
- [x] Replace the static graph placeholder with graph counts and node cards.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphBuilderTests`
