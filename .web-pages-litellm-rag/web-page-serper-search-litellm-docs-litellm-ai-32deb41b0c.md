# Serper Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/serper
- Final URL: https://docs.litellm.ai/docs/search/serper
- Canonical URL: https://docs.litellm.ai/docs/search/serper
- Fetched at: 2026-06-23T14:33:09Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//serper.dev

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://serper.dev
LiteLLM Python SDK ​
Serper Search
import os
from litellm import search
os . environ [ "SERPER_API_KEY" ] = "your-api-key"
response = search (
query = "latest AI developments" ,
search_provider = "serper" ,
max_results = 5
)
LiteLLM AI Gateway ​
1. Setup config.yaml ​
config.yaml
model_list :
- model_name : gpt - 5
litellm_params :
model : gpt - 5
api_key : os.environ/OPENAI_API_KEY
search_tools :
- search_tool_name : serper - search
search_provider : serper
api_key : os.environ/SERPER_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/serper-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
Provider-specific Parameters ​
Serper Search with Provider-specific Parameters
query = "latest tech news" ,
max_results = 10 ,
# Serper-specific parameters
gl = "us" , # Country/geolocation code
hl = "en" , # Language code
autocorrect = False , # Disable autocorrect
tbs = "qdr:d" , # Time filter: past day ('qdr:h' hour, 'qdr:w' week, 'qdr:m' month)
page = 2 # Page number
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
