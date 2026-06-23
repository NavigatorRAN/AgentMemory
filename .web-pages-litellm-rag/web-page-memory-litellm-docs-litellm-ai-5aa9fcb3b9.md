# /memory | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/memory_management
- Final URL: https://docs.litellm.ai/docs/memory_management
- Canonical URL: https://docs.litellm.ai/docs/memory_management
- Fetched at: 2026-06-23T14:24:48Z
- Content type: text/html; charset=utf-8

## Description

CRUD endpoints for storing and retrieving user/team-scoped memory entries on the LiteLLM proxy. Use these to persist conversation context, agent memory, team playbooks, or any key-value data scoped to users and teams.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
CRUD endpoints for storing and retrieving user/team-scoped memory entries on the LiteLLM proxy. Use these to persist conversation context, agent memory, team playbooks, or any key-value data scoped to users and teams.
Overview ​
Feature Supported Notes Create memory ✅ POST /v1/memory List memories ✅ GET /v1/memory with optional filtering Get memory by key ✅ GET /v1/memory/{key} Upsert memory ✅ PUT /v1/memory/{key} Delete memory ✅ DELETE /v1/memory/{key} User-scoped access ✅ Entries scoped to user_id Team-scoped access ✅ Entries scoped to team_id JSON metadata ✅ Arbitrary JSON metadata per entry Pagination ✅ Page-based with configurable page size Key prefix filtering ✅ Redis-style namespace scanning Audit trail ✅ created_by , updated_by with timestamps Supported LiteLLM Versions v1.83.10+
Prerequisites ​
LiteLLM Proxy running with a PostgreSQL database connected
Database migrations applied (the LiteLLM_MemoryTable is created automatically)
Valid API key for authentication
No additional config.yaml entries required. Endpoints are available automatically once the proxy starts with a connected database.
Quick Start ​
Create a Memory Entry ​
curl
Python (httpx)
Create memory
curl -X POST "http://localhost:4000/v1/memory" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"key": "user:123:preferences",
"value": "Prefers concise responses. Timezone: PST.",
"metadata": {"tags": ["preferences", "user-settings"]}
}'
import httpx
client = httpx . Client (
base_url = "http://localhost:4000" ,
headers = { "Authorization" : "Bearer sk-1234" } ,
)
response = client . post ( "/v1/memory" , json = {
"key" : "user:123:preferences" ,
"value" : "Prefers concise responses. Timezone: PST." ,
"metadata" : { "tags" : [ "preferences" , "user-settings" ] } ,
} )
print ( response . json ( ) )
Response:
{
"memory_id" : "a1b2c3d4-e5f6-7890-abcd-ef1234567890" ,
"user_id" : "user-123" ,
"team_id" : "team-abc" ,
"created_at" : "2025-04-21T12:00:00Z" ,
"created_by" : "user-123" ,
"updated_at" : "2025-04-21T12:00:00Z" ,
"updated_by" : "user-123"
}
List Memories ​
List all memories
curl "http://localhost:4000/v1/memory" \
-H "Authorization: Bearer sk-1234"
Filter by key prefix
curl "http://localhost:4000/v1/memory?key_prefix=user:123:" \
Paginate results
curl "http://localhost:4000/v1/memory?page=2&page_size=10" \
List memories
# List all
response = client . get ( "/v1/memory" )
# Filter by key prefix
response = client . get ( "/v1/memory" , params = { "key_prefix" : "user:123:" } )
# Paginate
response = client . get ( "/v1/memory" , params = { "page" : 2 , "page_size" : 10 } )
"memories" : [
] ,
"total" : 1
Get a Memory by Key ​
Get memory by key
curl "http://localhost:4000/v1/memory/user:123:preferences" \
response = client . get ( "/v1/memory/user:123:preferences" )
Update (Upsert) a Memory ​
If the key exists, updates it. If not, creates a new entry.
Upsert memory
curl -X PUT "http://localhost:4000/v1/memory/user:123:preferences" \
"value": "Prefers concise responses. Timezone: EST. Language: English.",
"metadata": {"tags": ["preferences", "user-settings"], "version": 2}
response = client . put ( "/v1/memory/user:123:preferences" , json = {
"value" : "Prefers concise responses. Timezone: EST. Language: English." ,
"metadata" : { "tags" : [ "preferences" , "user-settings" ] , "version" : 2 } ,
Delete a Memory ​
Delete memory
curl -X DELETE "http://localhost:4000/v1/memory/user:123:preferences" \
response = client . delete ( "/v1/memory/user:123:preferences" )
"deleted" : true
API Reference ​
POST /v1/memory ​
Create a new memory entry.
Request Body:
Parameter Type Required Description key string ✅ Globally unique key. Use namespaced keys (e.g., user:123:notes ). value string ✅ Memory content. Typically markdown or plain text. metadata any (JSON) ❌ Optional JSON metadata (dicts, lists, scalars). user_id string ❌ Scope to a user. Defaults to caller's user_id . Admin-only override. team_id string ❌ Scope to a team. Defaults to caller's team_id . Admin-only override.
Response: 201 — Returns the created LiteLLM_MemoryRow .
GET /v1/memory ​
List memory entries visible to the caller.
Query Parameters:
Parameter Type Default Description key string — Filter by exact key match. key_prefix string — Filter by key prefix (e.g., user:123: ). Takes precedence over key . page int 1 Page number (1-indexed). page_size int 50 Items per page (max 500).
Response: 200 — Returns MemoryListResponse with memories array and total count.
GET /v1/memory/{key} ​
Get a single memory entry by key.
Path Parameters:
Parameter Type Description key string The memory key to retrieve.
Response: 200 — Returns the LiteLLM_MemoryRow .
PUT /v1/memory/{key} ​
Upsert a memory entry. Creates the entry if the key doesn't exist; updates it if it does.
Parameter Type Description key string The memory key to create or update.
Parameter Type Required Description value string ✅ (on create) Memory content. Required when creating, optional when updating. metadata any (JSON) ❌ Updated metadata. Omit to preserve existing value. Set to null to clear. user_id string ❌ Only used on create. Admin-only override. team_id string ❌ Only used on create. Admin-only override.
Response: 200 — Returns the created/updated LiteLLM_MemoryRow .
DELETE /v1/memory/{key} ​
Delete a memory entry by key.
Parameter Type Description key string The memory key to delete.
Response: 200 — Returns {"key": "...", "deleted": true} .
Response Object ​
All endpoints that return a memory entry use this schema:
"memory_id" : "string (UUID)" ,
"key" : "string" ,
"value" : "string" ,
"metadata" : "any (JSON) or null" ,
"user_id" : "string or null" ,
"team_id" : "string or null" ,
"created_at" : "datetime" ,
"created_by" : "string" ,
"updated_at" : "datetime" ,
"updated_by" : "string"
Access Control ​
Memory entries are scoped by user_id and team_id , with role-based visibility and write access.
Visibility (Read) ​
Role Can See Proxy Admin All memory entries Regular User Entries where user_id matches their own OR team_id matches their own
Write Access (Update / Delete) ​
Scenario Who Can Write Entry has user_id matching caller Owner can update/delete Entry is team-scoped only (no user_id ) Team admins and org admins only Any entry Proxy admins
info
Team members can read team-scoped entries but only team admins can modify or delete them. This prevents teammates from overwriting each other's entries.
Scoping on Create ​
user_id and team_id default to the caller's identity from their API key
Proxy admins can override user_id / team_id to create entries for other users or teams
Non-admin callers cannot create entries without at least one of user_id or team_id
Key Naming Conventions ​
Keys are globally unique. Use namespaced keys to organize entries:
user:{user_id}:preferences # User preferences
user:{user_id}:context # Conversation context
team:{team_id}:playbook # Team playbook
agent:{agent_id}:memory # Agent memory
project:{project_id}:config # Project configuration
Use key_prefix in the list endpoint to scan all entries in a namespace:
# Get all entries for a user
Error Codes ​
Status Code Meaning 200 Success (GET, PUT, DELETE) 201 Created (POST) 400 Invalid input (missing required fields, empty PUT body, orphan row) 403 Permission denied (write access violation, scope override by non-admin) 404 Key not found or not visible to caller 409 Duplicate key on creation 500 Internal server error (database issues)
Overview
Prerequisites
Quick Start
Create a Memory Entry
List Memories
Get a Memory by Key
Update (Upsert) a Memory
Delete a Memory
API Reference
POST /v1/memory
GET /v1/memory
GET /v1/memory/{key}
PUT /v1/memory/{key}
DELETE /v1/memory/{key}
Response Object
Access Control
Visibility (Read)
Write Access (Update / Delete)
Scoping on Create
Key Naming Conventions
Error Codes
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
