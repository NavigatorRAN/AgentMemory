# Memory Management | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/memory
- Final URL: https://docs.litellm.ai/docs/proxy/memory
- Canonical URL: https://docs.litellm.ai/docs/proxy/memory
- Fetched at: 2026-06-23T14:31:24Z
- Content type: text/html; charset=utf-8

## Description

Store user preferences and feedback so your LLM remembers them across sessions. Scoped per user and team, with built-in access control.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Store user preferences and feedback so your LLM remembers them across sessions. Scoped per user and team, with built-in access control.
Requires: LiteLLM v1.83.10+ with PostgreSQL connected. No config changes needed.
Create ​
curl
Python
curl -X POST "http://localhost:4000/v1/memory" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"key": "user:preferences",
"value": "Prefers concise responses. Timezone: PST.",
"metadata": {"version": 1}
}'
import httpx
client = httpx . Client (
base_url = "http://localhost:4000" ,
headers = { "Authorization" : "Bearer sk-1234" } ,
)
client . post ( "/v1/memory" , json = {
"key" : "user:preferences" ,
"value" : "Prefers concise responses. Timezone: PST." ,
"metadata" : { "version" : 1 } ,
} )
Read ​
curl "http://localhost:4000/v1/memory/user:preferences" \
-H "Authorization: Bearer sk-1234"
Update ​
curl -X PUT "http://localhost:4000/v1/memory/user:preferences" \
-d '{"value": "Prefers concise responses. Timezone: EST."}'
List ​
# All entries
curl "http://localhost:4000/v1/memory" \
# By prefix
curl "http://localhost:4000/v1/memory?key_prefix=user:" \
Delete ​
curl -X DELETE "http://localhost:4000/v1/memory/user:preferences" \
Access Control ​
Scoping is automatic based on the API key.
Role Reads Writes User Own + team entries Own entries only Team admin Own + team entries Own + team entries Proxy admin All All
Key Naming ​
Keys are globally unique. Use prefixes to namespace and query:
user:preferences → per-user settings
team:playbook:onboarding → shared team resources
agent:memory:scratchpad → agent working memory
Example: Per-user memory in a Slack bot ​
Partition memory by Slack workspace and user so each person's preferences are isolated.
Key format: slack:{team_id}:{user_id}
LITELLM_BASE = "http://localhost:4000"
LITELLM_KEY = "sk-1234"
def memory_key ( team_id : str , user_id : str ) - > str :
return f"slack: { team_id } : { user_id } "
async def get_preferences ( team_id : str , user_id : str ) - > str :
"""Read saved preferences. Returns "" if none exist."""
key = memory_key ( team_id , user_id )
async with httpx . AsyncClient ( ) as client :
r = await client . get (
f" { LITELLM_BASE } /v1/memory/ { key } " ,
headers = { "Authorization" : f"Bearer { LITELLM_KEY } " } ,
if r . status_code == 404 :
return ""
return r . json ( ) . get ( "value" , "" )
async def save_preference ( team_id : str , user_id : str , note : str ) :
"""Append a preference. PUT upserts — creates or updates."""
existing = await get_preferences ( team_id , user_id )
# Store as bullet list
bullets = [ b for b in existing . split ( "\n" ) if b . strip ( ) ]
bullets . append ( f"- { note } " )
await client . put (
json = { "value" : "\n" . join ( bullets ) } ,
Inject into your system prompt each turn:
prefs = await get_preferences ( team_id , user_id )
messages = [
{ "role" : "system" , "content" : f"""You are a helpful assistant.
SAVED USER PREFERENCES:
{ prefs }
Follow these unless the current message contradicts them.""" } ,
{ "role" : "user" , "content" : user_message } ,
]
Query all preferences for a workspace:
curl "http://localhost:4000/v1/memory?key_prefix=slack:T024BE7LD:" \
Metadata ​
Attach any JSON to an entry:
{
"key" : "agent:findings" ,
"value" : "Q1 API usage up 15%..." ,
"metadata" : { "tags" : [ "research" ] , "confidence" : 0.92 }
}
API Reference ​
Full request/response schemas, parameters, and error codes: /memory endpoint reference .
Create
Read
Update
List
Delete
Access Control
Key Naming
Example: Per-user memory in a Slack bot
Metadata
API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
