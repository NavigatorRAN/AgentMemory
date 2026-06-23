# A2A Agent Authentication Headers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/a2a_agent_headers
- Final URL: https://docs.litellm.ai/docs/a2a_agent_headers
- Canonical URL: https://docs.litellm.ai/docs/a2a_agent_headers
- Fetched at: 2026-06-23T14:22:28Z
- Content type: text/html; charset=utf-8

## Description

Forward authentication credentials (Bearer tokens, API keys, etc.) from clients to backend A2A agents.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Forward authentication credentials (Bearer tokens, API keys, etc.) from clients to backend A2A agents.
Overview ​
When LiteLLM proxies a request to a backend A2A agent, the agent may require its own authentication headers. There are three ways to supply them:
Method Who configures How it works Static headers Admin (UI / API) Always sent, regardless of client request Forward client headers Admin (UI / API) Header names to extract from client request and forward Convention-based Client (no admin config) Client sends x-a2a-{agent_name}-{header} — automatically routed
All three methods can be combined. Static headers always win on key conflicts.
Method 1 — Static Headers ​
Admin-configured headers that are always sent to the backend agent. Use this for server-to-server tokens or internal credentials that clients should never see or override.
UI
REST API
Go to Agents in the LiteLLM dashboard.
Create or edit an agent.
Open the Authentication Headers panel.
Under Static Headers , click Add Static Header and fill in the header name and value.
curl -X POST http://localhost:4000/v1/agents \
-H "Authorization: Bearer sk-admin" \
-H "Content-Type: application/json" \
-d '{
"agent_name": "my-agent",
"agent_card_params": { ... },
"static_headers": {
"Authorization": "Bearer internal-server-token",
"X-Internal-Service": "litellm-proxy"
}
}'
To update an existing agent:
curl -X PATCH http://localhost:4000/v1/agents/{agent_id} \
"Authorization": "Bearer new-token"
Client call — no special headers needed:
curl -X POST http://localhost:4000/a2a/my-agent \
-H "Authorization: Bearer sk-client-key" \
"jsonrpc": "2.0", "id": "1", "method": "message/send",
"params": { "message": { "role": "user", "parts": [{"kind": "text", "text": "Hello"}], "messageId": "msg-1" } }
The backend agent receives Authorization: Bearer internal-server-token without the client ever knowing the value.
Method 2 — Forward Client Headers ​
Admin specifies a list of header names . When the client sends a request that includes those headers, LiteLLM extracts their values and forwards them to the backend agent. The client controls the values; the admin controls which headers are eligible to be forwarded.
Under Forward Client Headers , type header names and press Enter (e.g. x-api-key , Authorization ).
"extra_headers": ["x-api-key", "x-user-token"]
Client call — include the forwarded headers:
-H "x-api-key: user-secret-value" \
-d '{ ... }'
The backend agent receives x-api-key: user-secret-value .
note
Header name matching is case-insensitive . If the client sends X-API-Key and extra_headers lists x-api-key , they match.
Method 3 — Convention-Based Forwarding ​
Clients can forward headers to a specific agent without any admin pre-configuration by using the naming convention:
x-a2a-{agent_name_or_id}-{header_name}: value
LiteLLM parses these headers automatically and routes them to the matching agent only.
Examples:
Client header sent Agent name/ID Forwarded as x-a2a-my-agent-authorization: Bearer tok my-agent authorization: Bearer tok x-a2a-my-agent-x-api-key: secret my-agent x-api-key: secret x-a2a-abc123-authorization: Bearer tok agent ID abc123 authorization: Bearer tok
-H "x-a2a-my-agent-authorization: Bearer agent-specific-token" \
The x-a2a-other-agent-authorization header sent in the same request is not forwarded to my-agent — it is silently ignored.
Matches both agent name and agent ID
Both the human-readable name (e.g. my-agent ) and the UUID (e.g. abc123-... ) are valid. Use whichever is convenient for the client.
Merge Precedence ​
When multiple methods supply the same header name, static headers win :
dynamic (forwarded/convention) → merged ← static (overlays, wins)
Example:
Source Authorization value Client sends (via extra_headers or convention) Bearer client-token Admin-configured static_headers Bearer server-token What the backend agent receives Bearer server-token
This ensures admin-controlled credentials cannot be overridden by client requests.
Combining All Three Methods ​
# Register agent with static + forwarded headers
"X-Internal-Token": "secret123"
},
"extra_headers": ["x-user-id"]
# Client call using all three mechanisms
-H "x-user-id: user-42" \
-H "x-a2a-my-agent-x-request-id: req-abc" \
The backend agent receives:
X-Internal-Token: secret123 ← static header (always)
x-user-id: user-42 ← forwarded (in extra_headers)
x-request-id: req-abc ← convention-based (x-a2a-my-agent-*)
X-LiteLLM-Trace-Id: <uuid> ← LiteLLM internal
X-LiteLLM-Agent-Id: <agent-id> ← LiteLLM internal
Header Isolation ​
Each agent invocation uses an isolated HTTP connection. Headers configured for agent A are never sent to agent B, even if both agents are running and receiving requests simultaneously.
API Reference ​
POST /v1/agents / PATCH /v1/agents/{agent_id} ​
Field Type Description static_headers object {"Header-Name": "value"} — always forwarded extra_headers string[] Header names to extract from client request and forward
Agent Response ​
Both fields are returned in GET /v1/agents and GET /v1/agents/{agent_id} :
{
"agent_id" : "..." ,
"agent_name" : "my-agent" ,
"static_headers" : { "X-Internal-Token" : "secret123" } ,
"extra_headers" : [ "x-user-id" ] ,
...
caution
static_headers values are stored in the database and returned by the API. Treat them as you would any credential — do not store sensitive long-lived tokens here if your API is publicly accessible. Consider using short-lived tokens or environment-injected secrets instead.
Overview
Method 1 — Static Headers
Method 2 — Forward Client Headers
Method 3 — Convention-Based Forwarding
Merge Precedence
Combining All Three Methods
Header Isolation
API Reference
POST /v1/agents / PATCH /v1/agents/{agent_id}
Agent Response
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
