# Exa AI Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/exa_ai
- Final URL: https://docs.litellm.ai/docs/search/exa_ai
- Canonical URL: https://docs.litellm.ai/docs/search/exa_ai
- Fetched at: 2026-06-23T14:33:00Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//exa.ai

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://exa.ai
LiteLLM Python SDK ​
Exa AI Search
import os
from litellm import search
os . environ [ "EXA_API_KEY" ] = "exa-..."
response = search (
query = "latest AI developments" ,
search_provider = "exa_ai" ,
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
- search_tool_name : exa - search
search_provider : exa_ai
api_key : os.environ/EXA_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/exa-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
Provider-specific Parameters ​
Exa AI Search with Provider-specific Parameters
query = "AI research papers" ,
max_results = 10 ,
search_domain_filter = [ "arxiv.org" ] ,
# Exa-specific parameters
type = "neural" , # 'neural', 'keyword', or 'auto'
contents = { "text" : True } , # Request text content
use_autoprompt = True # Enable Exa's autoprompt
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
