# MCP Deployment Guide | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/mcp_deployment
- Final URL: https://docs.litellm.ai/docs/mcp_deployment
- Canonical URL: https://docs.litellm.ai/docs/mcp_deployment
- Fetched at: 2026-06-23T14:24:35Z
- Content type: text/html; charset=utf-8

## Description

How to deploy LiteLLM as a central gateway for LLMs, MCP servers, and agents.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
How to deploy LiteLLM as a central gateway for LLMs, MCP servers, and agents.
The core idea ​
LiteLLM is a single control plane for three resource types:
Resource Registered as LLM model_list in config or via API MCP Server mcp_servers in config or via UI Agent A2A routes
All three share the same auth (LiteLLM API key), rate limiting, and usage dashboard — a central catalog without separate registries.
Deployment topologies ​
Option A: Single gateway (recommended) ​
One LiteLLM instance handles LLM routing, MCP tool calls, and A2A agent invocations.
Agents / AI clients
│
▼
┌───────────────────────────────────┐
│ LiteLLM Gateway │
│ /v1/chat/completions (LLMs) │
│ /mcp (tools) │
│ /a2a (agents) │
└───────┬───────┬──────────┬────────┘
│ │ │
OpenAI MCP servers Downstream
Bedrock (internal) agents
Azure (public)
One service, one config, one set of API keys. Use the public internet filter to control which MCP servers are visible to external callers (Claude Desktop, ChatGPT) vs. internal-only.
config.yaml
general_settings :
master_key : os.environ/LITELLM_MASTER_KEY
store_model_in_db : true
mcp_internal_ip_ranges :
- "10.0.0.0/8"
- "172.16.0.0/12"
- "192.168.0.0/16"
- "100.64.0.0/10" # VPN/Tailscale range
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
mcp_servers :
- server_name : internal - db
url : http : //db - mcp.internal : 8000/mcp
transport : http
available_on_public_internet : false # internal callers only
- server_name : web - search
url : https : //mcp.exa.ai/mcp
available_on_public_internet : true # visible to ChatGPT / Claude Desktop
Option B: Separate LLM gateway and MCP gateway ​
Split into two LiteLLM deployments: one for LLM routing (no internet exposure), one for MCP serving (optionally internet-facing).
Internal AI clients External AI clients
│ (ChatGPT, Claude Desktop)
│ │
▼ ▼
┌────────────────────┐ ┌────────────────────────┐
│ LLM Gateway │ │ MCP Gateway │
│ (no public port) │ │ (port 443 / public) │
│ /v1/chat/... │ │ /mcp │
└────────┬───────────┘ └──────────┬─────────────┘
LLM providers MCP servers
(OpenAI, Bedrock, …) (internal + public)
LLM API keys stay behind the firewall. A compromise of the MCP gateway does not expose them. Use this when external MCP access is needed but LLM credentials must stay fully private.
Central catalog ​
LiteLLM exposes all resource types through standard endpoints:
Endpoint Returns GET /v1/models All registered LLMs GET /v1/mcp/server All MCP servers GET /mcp All MCP tools (across all servers) GET /.well-known/agent.json A2A agent card
MCP registry (opt-in) — expose a discovery endpoint for Claude Desktop / Cursor:
enable_mcp_registry : true
Claude Desktop config
{
"mcpServers" : {
"litellm" : {
"url" : "https://your-litellm.example.com/mcp" ,
"headers" : { "Authorization" : "Bearer sk-..." }
}
Security considerations ​
The open-port problem ​
If you expose LiteLLM's port to the internet (for Claude Desktop / ChatGPT), /v1/chat/completions is also reachable externally. LLM credentials stay protected by key auth, but be deliberate about this.
Mitigations:
Separate deployments (Option B) — the LLM gateway never gets a public port
Firewall — block /v1/chat/completions from public IPs at the network layer
Short-lived scoped keys — limit blast radius if a key leaks
MCP servers can reach the public internet ​
When you register an external MCP URL (e.g. https://mcp.exa.ai/mcp ), LiteLLM makes outbound requests to it on every tool call. Check that your network policy allows it and that your security team is comfortable with data leaving the perimeter.
For air-gapped networks: only register MCP servers inside your perimeter and leave available_on_public_internet: false (the default).
Access controls ​
By default all authenticated callers can call all MCP tools. Use these to restrict:
Control Where Per-key tool access Key-level MCP permissions Per-team tool access Team-level MCP permissions Hide internal servers from external callers available_on_public_internet Verify requests came through LiteLLM MCP Zero Trust (JWT) Block sensitive data in responses MCP Guardrails
Related ​
MCP Overview
Public Internet Filter
MCP Access Control
MCP Zero Trust
MCP Guardrails
The core idea
Deployment topologies
Option A: Single gateway (recommended)
Option B: Separate LLM gateway and MCP gateway
Central catalog
Security considerations
The open-port problem
MCP servers can reach the public internet
Access controls
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
