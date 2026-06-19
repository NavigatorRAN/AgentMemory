# AgentMemory Memory Graph Hit Testing Plan

## Goal

Let visual learners focus the Memory MCP graph directly from the Canvas preview instead of relying only on node cards.

## Scope

- Add tested core hit detection for projected graph nodes.
- Choose the nearest node within a bounded tap radius.
- Wire Canvas taps to focus a hit node or clear focus on empty space.
- Document the slice in the README.

## Checklist

- [x] Add failing hit-tester tests.
- [x] Implement `MemoryMCPGraphViewportHitTester`.
- [x] Wire Canvas tap gestures to graph focus.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPGraphViewportHitTesterTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed: `./script/build_and_run.sh --verify`
