# Search tools (Admin UI) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/ui_search_tools
- Final URL: https://docs.litellm.ai/docs/proxy/ui_search_tools
- Canonical URL: https://docs.litellm.ai/docs/proxy/ui_search_tools
- Fetched at: 2026-06-23T14:32:27Z
- Content type: text/html; charset=utf-8

## Description

Control which teams and virtual keys may call each configured web search integration (/v1/search) and see team/key level usage visibility within LiteLLM's spend dashboard.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Control which teams and virtual keys may call each configured web search integration ( /v1/search ) and see team/key level usage visibility within LiteLLM's spend dashboard.
Step 1: Register tools ​
Search tools page → create tool (name + provider + credentials).
Step 2: Team allowlist ​
Teams → create/edit team → open Search Tool Settings → add tool(s) to the team.
Step 3: Key (optional stricter list) ​
Virtual keys → generate/update for that team → Search Tool Settings must stay inside the team list (if team list is non-empty).
Step 4: Call search ​
curl -sS -X POST "http://localhost:4000/v1/search/YOUR_SEARCH_TOOL_NAME" \
-H "Authorization: Bearer YOUR_VIRTUAL_KEY" \
-H "Content-Type: application/json" \
-d '{"query": "hello world", "max_results": 5}'
Step 5: See spend ​
Logs → filter Team ID + Public model / search tool = search_tool_name → Cost column.
Related ​
Search providers & YAML
Proxy config ( search_tools row)
Step 1: Register tools
Step 2: Team allowlist
Step 3: Key (optional stricter list)
Step 4: Call search
Step 5: See spend
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
