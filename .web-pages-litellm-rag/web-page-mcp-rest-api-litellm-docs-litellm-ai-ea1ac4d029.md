# MCP REST API | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/mcp_rest_api
- Final URL: https://docs.litellm.ai/docs/mcp_rest_api
- Canonical URL: https://docs.litellm.ai/docs/mcp_rest_api
- Fetched at: 2026-06-23T14:24:41Z
- Content type: text/html; charset=utf-8

## Description

Guide to call MCP tools directly over HTTP.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Guide to call MCP tools directly over HTTP.
Use this when you already know which tool to run. For LLM-driven tool use, see Using your MCP .
Base URL: http://localhost:4000 (replace with your LiteLLM proxy URL)
Auth: LiteLLM API key on every request:
-H "Authorization: Bearer sk-1234"
# or
-H "x-litellm-api-key: sk-1234"
Endpoints ​
Method Path Purpose GET /v1/mcp/server List MCP servers (get server_id / server_name ) GET /mcp-rest/tools/list List tools (all servers, or one server) POST /mcp-rest/tools/call Execute a tool
These routes are separate from the JSON-RPC MCP transport at /mcp or /{server_name}/mcp used by Claude Desktop and Cursor.
Tool naming ​
LiteLLM registers tools from multiple MCP servers. Tool names in requests follow one of two patterns:
Pattern When to use Example Prefixed Global tool list, or self-contained tool id places_api-getPlaces Unprefixed + server_id Per-server tool list server_id: places_api , name: getPlaces
Prefix format: {server_prefix}{separator}{upstream_tool_name}
Default separator is - (hyphen).
Override with env var MCP_TOOL_PREFIX_SEPARATOR on the proxy.
With LITELLM_USE_SHORT_MCP_TOOL_PREFIX=true , the prefix is a 3-character id instead of the server name (same {prefix}{separator}{tool} shape).
The proxy calls the upstream MCP server with the unprefixed tool name (e.g. getPlaces ), not the full prefixed string.
1. List MCP servers ​
curl -s http://localhost:4000/v1/mcp/server \
-H "Authorization: Bearer sk-1234" | jq .
Use server_id or server_name from the response in later calls. Both work as server_id in /mcp-rest/* .
2. List tools ​
All servers ​
curl -s http://localhost:4000/mcp-rest/tools/list \
Tool name values are often unprefixed (e.g. getPlaces ) with mcp_info.server_name indicating the server. For tools/call , either:
use prefixed name : places_api-getPlaces , or
use unprefixed name + server_id : getPlaces + places_api .
One server (recommended for discovery) ​
server_id accepts UUID, server_name , or alias.
curl -s "http://localhost:4000/mcp-rest/tools/list?server_id=places_api" \
Returns unprefixed upstream names (e.g. getPlaces , ping ).
3. Call a tool ​
Request body ​
Field Required Type Description server_id Yes string UUID, server_name , or alias name Yes string Prefixed or unprefixed tool name (see above) arguments Recommended object Tool parameters; use {} when none. If omitted, the proxy treats it as {} . Do not pass null .
Optional JSON-RPC fields ( jsonrpc , method , id ) are ignored by the REST handler; you may include them for client compatibility.
Works: prefixed name + server UUID ​
curl -s -X POST http://localhost:4000/mcp-rest/tools/call \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"server_id": "17a4490465f74d3696caf12b30220166",
"name": "places_api-getPlaces",
"arguments": {}
}' | jq .
Works: unprefixed name + server name ​
"server_id": "places_api",
"name": "getPlaces",
"arguments": { "query": "coffee" }
Works: x-litellm-api-key header ​
-H "x-litellm-api-key: sk-1234" \
"server_id": "order_status_mcp",
"name": "order_status_mcp-order_status",
"arguments": { "orderId": "ord1234" }
What does not work ​
Missing server_id ​
# 400 missing_parameter
-d '{ "name": "places_api-getPlaces", "arguments": {} }'
arguments: null ​
# 500 — arguments must be a JSON object, not null
"arguments": null
}'
Fix: use "arguments": {} or omit the field entirely.
Wrong separator in tool name (underscore instead of hyphen) ​
Default separator is - , not _ .
# Tool not found or wrong routing
"name": "places_api_getPlaces",
Fix: use places_api-getPlaces , or set MCP_TOOL_PREFIX_SEPARATOR to match your naming convention.
Tool belongs to a different server than server_id ​
# 403 tool_server_mismatch
Response:
{
"detail" : {
"error" : "tool_server_mismatch" ,
"message" : "Tool 'places_api-getPlaces' belongs to MCP server 'places_api' but request specified server_id for 'order_status_mcp'."
}
Invalid or unknown server_id ​
# 404 server_not_found (unknown name/uuid)
"server_id": "serverid1",
"name": "some-tool",
# 403 access_denied (server exists but key cannot access it)
Placeholder server ids from customer examples ​
Strings like "serverid1" / "serverid2" are not valid unless you created servers with those exact ids. Run GET /v1/mcp/server and copy a real server_id or use server_name .
Quick reference ​
List tools
Call tool
# All servers
# One server
curl -s "http://localhost:4000/mcp-rest/tools/list?server_id=MY_SERVER" \
"server_id": "MY_SERVER",
"name": "MY_SERVER-tool_name",
Related docs ​
Using your MCP — Responses API, Cursor, OpenAI SDK (LLM-driven MCP)
MCP Overview — Gateway setup and JSON-RPC /mcp route
MCP OAuth — OAuth-protected MCP servers
MCP Zero Trust — JWT signing for upstream MCP servers
MCP Troubleshooting — Connectivity and auth issues
Endpoints
Tool naming
1. List MCP servers
2. List tools
All servers
One server (recommended for discovery)
3. Call a tool
Request body
Works: prefixed name + server UUID
Works: unprefixed name + server name
Works: x-litellm-api-key header
What does not work
Missing server_id
arguments: null
Wrong separator in tool name (underscore instead of hyphen)
Tool belongs to a different server than server_id
Invalid or unknown server_id
Placeholder server ids from customer examples
Quick reference
Related docs
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
