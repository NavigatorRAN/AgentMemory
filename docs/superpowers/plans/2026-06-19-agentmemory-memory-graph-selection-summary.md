# AgentMemory Memory Graph Selection Summary Plan

## Goal

Make selected Memory MCP graph focus readable by showing the selected node label and relationship count instead of exposing only raw node IDs.

## Scope

- Add tested core selection summary building.
- Expose the selected graph summary through the app view model.
- Render selected node label, subtitle, and connected relationship count in the graph panel.
- Document the slice in the README.

## Checklist

- [x] Add failing selected summary tests.
- [x] Implement `MemoryMCPGraphSelectionSummaryBuilder`.
- [x] Expose selected graph summary in the view model.
- [x] Replace raw selected-node ID copy in the graph panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphSelectionSummaryBuilderTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
