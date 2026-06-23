# DataForSEO Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/dataforseo
- Final URL: https://docs.litellm.ai/docs/search/dataforseo
- Canonical URL: https://docs.litellm.ai/docs/search/dataforseo
- Fetched at: 2026-06-23T14:32:59Z
- Content type: text/html; charset=utf-8

## Description

Get API Access: DataForSEO

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Access: DataForSEO
Setup ​
Go to DataForSEO and create an account
Navigate to your account dashboard
Generate API credentials:
You'll receive a login (username)
You'll receive a password
Set up your environment variables:
DATAFORSEO_LOGIN - Your DataForSEO login/username
DATAFORSEO_PASSWORD - Your DataForSEO password
LiteLLM Python SDK ​
DataForSEO Search
import os
from litellm import search
os . environ [ "DATAFORSEO_LOGIN" ] = "your-login"
os . environ [ "DATAFORSEO_PASSWORD" ] = "your-password"
response = search (
query = "latest AI developments" ,
search_provider = "dataforseo" ,
max_results = 10
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
- search_tool_name : dataforseo - search
search_provider : dataforseo
api_key : "os.environ/DATAFORSEO_LOGIN:os.environ/DATAFORSEO_PASSWORD"
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/dataforseo-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 10
}'
Provider-specific Parameters ​
DataForSEO Search with Provider-specific Parameters
query = "AI developments" ,
max_results = 10 ,
# DataForSEO-specific parameters
country = "United States" , # Country name for location_name
language_code = "en" , # Language code
depth = 20 , # Number of results (max 700)
device = "desktop" , # Device type ('desktop', 'mobile', 'tablet')
os = "windows" # Operating system
Setup
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
