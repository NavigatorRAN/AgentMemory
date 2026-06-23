# Cursor Cloud Agents | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/cursor
- Final URL: https://docs.litellm.ai/docs/pass_through/cursor
- Canonical URL: https://docs.litellm.ai/docs/pass_through/cursor
- Fetched at: 2026-06-23T14:25:51Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for the Cursor Cloud Agents API — launch and manage cloud agents that work on your repositories, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for the Cursor Cloud Agents API — launch and manage cloud agents that work on your repositories, in native format (no translation).
Feature Supported Notes Cost Tracking ✅ Logged as $0.00 (subscription-based, no per-request pricing) Logging ✅ All requests logged with operation classification End-user Tracking ❌ Tell us if you need this Streaming ❌ Cursor API does not use streaming
Just replace https://api.cursor.com with LITELLM_PROXY_BASE_URL/cursor 🚀
Supported endpoints:
Endpoint Method Description /v0/agents GET List agents /v0/agents POST Launch an agent /v0/agents/{id} GET Agent status /v0/agents/{id} DELETE Delete an agent /v0/agents/{id}/conversation GET Agent conversation /v0/agents/{id}/followup POST Add follow-up /v0/agents/{id}/stop POST Stop an agent /v0/me GET API key info /v0/models GET List models /v0/repositories GET List GitHub repositories
Quick Start ​
1. Add Cursor API Key on the UI ​
Navigate to Models + Endpoints → LLM Credentials and click Add Credential . Select Cursor from the provider dropdown — you'll see the Cursor logo. Enter your API key from cursor.com/settings .
2. Launch a Cursor Agent ​
curl -X POST http://0.0.0.0:4000/cursor/v0/agents \
-H "Authorization: Bearer <your-litellm-key>" \
-H "Content-Type: application/json" \
-d '{
"prompt": {
"text": "Add a README.md with installation instructions"
},
"source": {
"repository": "https://github.com/your-org/your-repo",
"ref": "main"
"target": {
"autoCreatePr": true
}
}'
Expected Response:
{
"id" : "bc_abc123" ,
"name" : "Add README Documentation" ,
"status" : "CREATING" ,
"source" : {
"repository" : "https://github.com/your-org/your-repo" ,
"ref" : "main"
} ,
"target" : {
"branchName" : "cursor/add-readme-1234" ,
"url" : "https://cursor.com/agents?id=bc_abc123" ,
"autoCreatePr" : true
"createdAt" : "2024-01-15T10:30:00Z"
3. View Logs ​
Navigate to Logs in the sidebar. Filter by "cursor" to see your agent requests. Each request shows the operation type (e.g., cursor/cursor:agent:create ), status, duration, and cost.
Click on any log entry to see full request details including provider, API base, and metadata.
Examples ​
Anything after http://0.0.0.0:4000/cursor is treated as a provider-specific route, and handled accordingly.
Original Endpoint Replace With https://api.cursor.com http://0.0.0.0:4000/cursor (LITELLM_PROXY_BASE_URL) -u YOUR_API_KEY: (Basic Auth) -H "Authorization: Bearer <your-litellm-key>" (LiteLLM Virtual Key)
List Available Models ​
curl http://0.0.0.0:4000/cursor/v0/models \
-H "Authorization: Bearer <your-litellm-key>"
Check Agent Status ​
curl http://0.0.0.0:4000/cursor/v0/agents/bc_abc123 \
List All Agents ​
curl http://0.0.0.0:4000/cursor/v0/agents \
Add Follow-up to Agent ​
curl -X POST http://0.0.0.0:4000/cursor/v0/agents/bc_abc123/followup \
"text": "Also add a section about troubleshooting"
Stop an Agent ​
curl -X POST http://0.0.0.0:4000/cursor/v0/agents/bc_abc123/stop \
Delete an Agent ​
curl -X DELETE http://0.0.0.0:4000/cursor/v0/agents/bc_abc123 \
Get API Key Info ​
curl http://0.0.0.0:4000/cursor/v0/me \
Related ​
Cursor Cloud Agents API Docs
Pass-through Endpoints Overview
Virtual Keys
Quick Start
1. Add Cursor API Key on the UI
2. Launch a Cursor Agent
3. View Logs
Examples
List Available Models
Check Agent Status
List All Agents
Add Follow-up to Agent
Stop an Agent
Delete an Agent
Get API Key Info
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
