# AgentMemory Memory MCP Entity List Plan

## Goal

Let the app browse known Memory MCP entities so the user does not need to know the exact entity name before recalling or opening details.

## Scope

- Call the MCP `list_entities` tool through the existing JSON-RPC session transport.
- Decode compact entity summary rows.
- Add a `Browse Entities` action using the current field as an optional prefix filter.
- Render entity summary rows in the Memory MCP panel.

## Checklist

- [x] Add a transport regression test for `list_entities`.
- [x] Implement `MemoryMCPHTTPTransport.listEntities(prefix:type:)`.
- [x] Add `MemoryMCPEntitySummary`.
- [x] Add app view model entity-list state and action.
- [x] Render entity browse results in the Memory MCP panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPHTTPTransportTests/testTransportListsEntities`
- Live read-only schema check confirmed `list_entities` returns wrapped summary rows with `name`, `display_name`, `type`, `event_count`, and optional `last_event_date`.
