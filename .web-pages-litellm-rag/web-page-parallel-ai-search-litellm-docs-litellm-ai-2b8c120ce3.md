# Parallel AI Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/parallel_ai
- Final URL: https://docs.litellm.ai/docs/search/parallel_ai
- Canonical URL: https://docs.litellm.ai/docs/search/parallel_ai
- Fetched at: 2026-06-23T14:33:05Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//www.parallel.ai

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://www.parallel.ai
LiteLLM Python SDK ​
Parallel AI Search
import os
from litellm import search
os . environ [ "PARALLEL_AI_API_KEY" ] = "..."
response = search (
query = "latest AI developments" ,
search_provider = "parallel_ai" ,
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
- search_tool_name : parallel - search
search_provider : parallel_ai
api_key : os.environ/PARALLEL_AI_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/parallel-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
Provider-specific Parameters ​
Parallel AI Search with Provider-specific Parameters
query = "latest developments in quantum computing" ,
max_results = 5 ,
# Parallel AI-specific parameters
processor = "pro" , # 'base' or 'pro'
max_chars_per_result = 500 # Max characters per result
LiteLLM Python SDK
LiteLLM AI Gateway
1. Setup config.yaml
2. Start the proxy
3. Test the search endpoint
Provider-specific Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
