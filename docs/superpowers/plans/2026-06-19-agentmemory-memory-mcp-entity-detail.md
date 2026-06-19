# AgentMemory Memory MCP Entity Detail Plan

## Goal

Show the canonical Memory MCP entity page in the app, not just matching or recalled event rows.

## Scope

- Call the MCP `get_entity` tool through the existing JSON-RPC session transport.
- Decode entity frontmatter, canonical content, path, and metadata-only recent events.
- Add an `Entity Detail` action to the Memory MCP Search panel.
- Render the entity card above recent event rows.

## Checklist

- [x] Add a transport regression test for `get_entity`.
- [x] Implement `MemoryMCPHTTPTransport.getEntity(named:)`.
- [x] Add entity detail and recent-event models.
- [x] Add app view model entity-detail state and action.
- [x] Render canonical entity details in the Memory MCP panel.
- [x] Document the slice in the README.

## Verification

- Passed: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPHTTPTransportTests/testTransportGetsEntityDetail`
- Live read-only schema check confirmed `get_entity` returns `structuredContent` containing `name`, `display_name`, `frontmatter`, `content`, `path`, and `recent_events`.
