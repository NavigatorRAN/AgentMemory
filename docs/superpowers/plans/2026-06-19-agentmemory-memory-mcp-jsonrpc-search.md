# AgentMemory Memory MCP JSON-RPC Search Plan

## Goal

Replace the provisional Memory MCP HTTP shim with the real MCP JSON-RPC HTTP session flow and add a native app surface for searching saved memory events.

## Scope

- Initialize an MCP HTTP session with `initialize`.
- Send `notifications/initialized` with the returned `mcp-session-id`.
- Call `tools/call` for `record_event` and `search_events`.
- Decode `search_events` wrapped `structuredContent.result` events.
- Add a simple Memory MCP search panel to the main workbench.

## Checklist

- [x] Add transport tests for JSON-RPC `record_event` sessions.
- [x] Add transport tests for wrapped `search_events` results.
- [x] Implement the MCP JSON-RPC session handshake in `MemoryMCPHTTPTransport`.
- [x] Add `MemoryMCPSearchEvent`.
- [x] Add app search query/result state and action.
- [x] Render Memory MCP search results in the workbench.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPHTTPTransportTests`
- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`
- Passed read-only live smoke: initialize Memory MCP, send initialized notification, and call `search_events` for one result.

## Notes

The Agent Memory MCP server requires `Accept: application/json`, `Content-Type: application/json`, and the JSON-RPC MCP session handshake. Posting a simplified `{ "tool": "...", "payload": ... }` body is not the server contract.
