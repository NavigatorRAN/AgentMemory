# Perplexity AI Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/perplexity
- Final URL: https://docs.litellm.ai/docs/search/perplexity
- Canonical URL: https://docs.litellm.ai/docs/search/perplexity
- Fetched at: 2026-06-23T14:33:06Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//www.perplexity.ai/settings/api

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://www.perplexity.ai/settings/api
LiteLLM Python SDK ​
Perplexity Search
import os
from litellm import search
os . environ [ "PERPLEXITYAI_API_KEY" ] = "pplx-..."
response = search (
query = "latest AI developments" ,
search_provider = "perplexity" ,
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
- search_tool_name : perplexity - search
search_provider : perplexity
api_key : os.environ/PERPLEXITYAI_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/perplexity-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
LiteLLM Python SDK
LiteLLM AI Gateway
1. Setup config.yaml
2. Start the proxy
3. Test the search endpoint
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
