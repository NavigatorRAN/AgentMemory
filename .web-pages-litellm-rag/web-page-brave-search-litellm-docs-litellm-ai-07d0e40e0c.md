# Brave Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/brave
- Final URL: https://docs.litellm.ai/docs/search/brave
- Canonical URL: https://docs.litellm.ai/docs/search/brave
- Fetched at: 2026-06-23T14:32:58Z
- Content type: text/html; charset=utf-8

## Description

Get started by creating a free API key via https://brave.com/search/api/.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get started by creating a free API key via https://brave.com/search/api/ .
For documentation on other parameters supported by the Brave Search API, visit https://api-dashboard.search.brave.com/api-reference/web/search/post .
LiteLLM Python SDK ​
Brave Search
import os
from litellm import search
os . environ [ "BRAVE_API_KEY" ] = "BSATzx..."
response = search (
query = "Brave browser features" ,
search_provider = "brave" ,
max_results = 5
)
LiteLLM AI Gateway ​
1. Setup config.yaml ​
config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : gpt - 4
api_key : os.environ/OPENAI_API_KEY
search_tools :
- search_tool_name : brave - search
search_provider : brave
api_key : os.environ/BRAVE_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/brave-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{ "query": "Brave browser features", "max_results": 5 }'
LiteLLM Python SDK
LiteLLM AI Gateway
1. Setup config.yaml
2. Start the proxy
3. Test the search endpoint
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
