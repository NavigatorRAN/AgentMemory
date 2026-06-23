# Siyuan | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-siyuan
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-siyuan
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-siyuan
- Fetched at: 2026-06-23T14:20:34Z
- Content type: text/html; charset=utf-8

## Description

SiYuan Note API for searching, reading, creating, and managing blocks and documents in a self-hosted knowledge base via curl

## Extracted Text

Skip to main content
On this page
SiYuan Note API for searching, reading, creating, and managing blocks and documents in a self-hosted knowledge base via curl.
Skill metadata ​
Source Optional — install with hermes skills install official/productivity/siyuan Path optional-skills/productivity/siyuan Version 1.0.0 Author FEUAZUR License MIT Platforms linux, macos, windows Tags SiYuan , Notes , Knowledge Base , PKM , API Related skills obsidian , notion
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
SiYuan Note API
Use the SiYuan kernel API via curl to search, read, create, update, and delete blocks and documents in a self-hosted knowledge base. No extra tools needed -- just curl and an API token.
Prerequisites ​
Install and run SiYuan (desktop or Docker)
Get your API token: Settings > About > API token
Store it in ${HERMES_HOME:-~/.hermes}/.env :
SIYUAN_TOKEN=your_token_here
SIYUAN_URL=http://127.0.0.1:6806
SIYUAN_URL defaults to http://127.0.0.1:6806 if not set.
API Basics ​
All SiYuan API calls are POST with JSON body . Every request follows this pattern:
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/..." \
-H "Authorization: Token $SIYUAN_TOKEN " \
-H "Content-Type: application/json" \
-d '{"param": "value"}'
Responses are JSON with this structure:
{ "code" : 0 , "msg" : "" , "data" : { ... } }
code: 0 means success. Any other value is an error -- check msg for details.
ID format: SiYuan IDs look like 20210808180117-6v0mkxr (14-digit timestamp + 7 alphanumeric chars).
Quick Reference ​
Operation Endpoint Full-text search /api/search/fullTextSearchBlock SQL query /api/query/sql Read block /api/block/getBlockKramdown Read children /api/block/getChildBlocks Get path /api/filetree/getHPathByID Get attributes /api/attr/getBlockAttrs List notebooks /api/notebook/lsNotebooks List documents /api/filetree/listDocsByPath Create notebook /api/notebook/createNotebook Create document /api/filetree/createDocWithMd Append block /api/block/appendBlock Update block /api/block/updateBlock Rename document /api/filetree/renameDocByID Set attributes /api/attr/setBlockAttrs Delete block /api/block/deleteBlock Delete document /api/filetree/removeDocByID Export as Markdown /api/export/exportMdContent
Common Operations ​
Search (Full-Text) ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/search/fullTextSearchBlock" \
-d '{"query": "meeting notes", "page": 0}' | jq '.data.blocks[:5]'
Search (SQL) ​
Query the blocks database directly. Only SELECT statements are safe.
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/query/sql" \
-d '{"stmt": "SELECT id, content, type, box FROM blocks WHERE content LIKE ' \ ' '%keyword%' \ ' ' AND type=' \ ' 'p' \ ' ' LIMIT 20"}' | jq '.data'
Useful columns: id , parent_id , root_id , box (notebook ID), path , content , type , subtype , created , updated .
Read Block Content ​
Returns block content in Kramdown (Markdown-like) format.
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/block/getBlockKramdown" \
-d '{"id": "20210808180117-6v0mkxr"}' | jq '.data.kramdown'
Read Child Blocks ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/block/getChildBlocks" \
-d '{"id": "20210808180117-6v0mkxr"}' | jq '.data'
Get Human-Readable Path ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/filetree/getHPathByID" \
Get Block Attributes ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/attr/getBlockAttrs" \
List Notebooks ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/notebook/lsNotebooks" \
-d '{}' | jq '.data.notebooks[] | {id, name, closed}'
List Documents in a Notebook ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/filetree/listDocsByPath" \
-d '{"notebook": "NOTEBOOK_ID", "path": "/"}' | jq '.data.files[] | {id, name}'
Create a Document ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/filetree/createDocWithMd" \
-d '{
"notebook": "NOTEBOOK_ID",
"path": "/Meeting Notes/2026-03-22",
"markdown": "# Meeting Notes\n\n- Discussed project timeline\n- Assigned tasks"
}' | jq '.data'
Create a Notebook ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/notebook/createNotebook" \
-d '{"name": "My New Notebook"}' | jq '.data.notebook.id'
Append Block to Document ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/block/appendBlock" \
"parentID": "DOCUMENT_OR_BLOCK_ID",
"data": "New paragraph added at the end.",
"dataType": "markdown"
Also available: /api/block/prependBlock (same params, inserts at the beginning) and /api/block/insertBlock (uses previousID instead of parentID to insert after a specific block).
Update Block Content ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/block/updateBlock" \
"id": "BLOCK_ID",
"data": "Updated content here.",
Rename a Document ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/filetree/renameDocByID" \
-d '{"id": "DOCUMENT_ID", "title": "New Title"}'
Set Block Attributes ​
Custom attributes must be prefixed with custom- :
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/attr/setBlockAttrs" \
"attrs": {
"custom-status": "reviewed",
"custom-priority": "high"
}
}'
Delete a Block ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/block/deleteBlock" \
-d '{"id": "BLOCK_ID"}'
To delete a whole document: use /api/filetree/removeDocByID with {"id": "DOC_ID"} .
To delete a notebook: use /api/notebook/removeNotebook with {"notebook": "NOTEBOOK_ID"} .
Export Document as Markdown ​
curl -s -X POST " ${SIYUAN_URL :- http : / / 127.0.0.1 : 6806} /api/export/exportMdContent" \
-d '{"id": "DOCUMENT_ID"}' | jq -r '.data.content'
Block Types ​
Common type values in SQL queries:
Type Description d Document (root block) p Paragraph h Heading l List i List item c Code block m Math block t Table b Blockquote s Super block html HTML block
Pitfalls ​
All endpoints are POST -- even read-only operations. Do not use GET.
SQL safety : only use SELECT queries. INSERT/UPDATE/DELETE/DROP are dangerous and should never be sent.
ID validation : IDs match the pattern YYYYMMDDHHmmss-xxxxxxx . Reject anything else.
Error responses : always check code != 0 in responses before processing data .
Large documents : block content and export results can be very large. Use LIMIT in SQL and pipe through jq to extract only what you need.
Notebook IDs : when working with a specific notebook, get its ID first via lsNotebooks .
Alternative: MCP Server ​
If you prefer a native integration instead of curl, install the SiYuan MCP server:
# In ~/.hermes/config.yaml under mcp_servers:
mcp_servers :
siyuan :
command : npx
args : [ "-y" , "@porkll/siyuan-mcp" ]
env :
SIYUAN_TOKEN : "your_token"
SIYUAN_URL : "http://127.0.0.1:6806"
Skill metadata
Reference: full SKILL.md
Prerequisites
API Basics
Quick Reference
Common Operations
Search (Full-Text)
Search (SQL)
Read Block Content
Read Child Blocks
Get Human-Readable Path
Get Block Attributes
List Notebooks
List Documents in a Notebook
Create a Document
Create a Notebook
Append Block to Document
Update Block Content
Rename a Document
Set Block Attributes
Delete a Block
Export Document as Markdown
Block Types
Pitfalls
Alternative: MCP Server
