# Tavily Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/tavily
- Final URL: https://docs.litellm.ai/docs/search/tavily
- Canonical URL: https://docs.litellm.ai/docs/search/tavily
- Fetched at: 2026-06-23T14:33:10Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//tavily.com

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://tavily.com
LiteLLM Python SDK ​
Tavily Search
import os
from litellm import search
os . environ [ "TAVILY_API_KEY" ] = "tvly-..."
response = search (
query = "latest AI developments" ,
search_provider = "tavily" ,
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
- search_tool_name : tavily - search
search_provider : tavily
api_key : os.environ/TAVILY_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/tavily-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
Provider-specific Parameters ​
Tavily Search with Provider-specific Parameters
query = "latest tech news" ,
max_results = 5 ,
# Tavily-specific parameters
topic = "news" , # 'general', 'news', 'finance'
search_depth = "advanced" , # 'basic', 'advanced'
include_answer = True , # Include AI-generated answer
include_raw_content = True # Include raw HTML content
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
