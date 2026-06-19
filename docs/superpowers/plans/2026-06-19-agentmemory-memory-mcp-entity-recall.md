# AgentMemory Memory MCP Entity Recall Plan

## Goal

Add entity-centered recall to the Memory MCP search panel so the app can answer "what do we know about this entity?" in addition to keyword event search.

## Scope

- Call the MCP `recall_for_entity` tool through the existing JSON-RPC session transport.
- Reuse `MemoryMCPSearchEvent` for returned recall rows because the live server returns the same event shape.
- Add a workbench action that recalls events for the entered entity name.

## Checklist

- [x] Add a transport regression test for `recall_for_entity`.
- [x] Implement `MemoryMCPHTTPTransport.recallEvents(forEntity:)`.
- [x] Add app view model recall action and status messages.
- [x] Add `Recall Entity` to the Memory MCP Search panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPHTTPTransportTests/testTransportRecallsEventsForEntity`
- Live read-only schema check confirmed `recall_for_entity` returns wrapped event rows with the same fields as `search_events`.
