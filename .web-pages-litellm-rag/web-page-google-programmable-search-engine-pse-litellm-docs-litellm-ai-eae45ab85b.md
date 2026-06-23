# Google Programmable Search Engine (PSE) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/google_pse
- Final URL: https://docs.litellm.ai/docs/search/google_pse
- Canonical URL: https://docs.litellm.ai/docs/search/google_pse
- Fetched at: 2026-06-23T14:33:02Z
- Content type: text/html; charset=utf-8

## Description

Get API Key: Google Cloud Console

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: Google Cloud Console
Create Search Engine: Programmable Search Engine
Setup ​
Go to Google Developers Programmable Search Engine and log in or create an account
Click the Add button in the control panel
Enter a search engine name and configure properties:
Choose which sites to search (entire web or specific sites)
Set language and other preferences
Verify you're not a robot
Click Create button
Once created, you'll see:
Search engine ID (cx) - Copy this for GOOGLE_PSE_ENGINE_ID
Instructions to get your API key
Generate API key:
Go to Google Cloud Console - Credentials
Create a new API key or use existing one
Enable Custom Search API for your project
Copy the API key for GOOGLE_PSE_API_KEY
LiteLLM Python SDK ​
Google PSE Search
import os
from litellm import search
os . environ [ "GOOGLE_PSE_API_KEY" ] = "AIza..."
os . environ [ "GOOGLE_PSE_ENGINE_ID" ] = "your-search-engine-id"
response = search (
query = "latest AI developments" ,
search_provider = "google_pse" ,
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
- search_tool_name : google - search
search_provider : google_pse
api_key : os.environ/GOOGLE_PSE_API_KEY
search_engine_id : os.environ/GOOGLE_PSE_ENGINE_ID
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/google-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 10
}'
Provider-specific Parameters ​
Google PSE Search with Provider-specific Parameters
query = "latest AI research papers" ,
max_results = 10 ,
search_domain_filter = [ "arxiv.org" ] ,
# Google PSE-specific parameters (use actual Google PSE API parameter names)
dateRestrict = "m6" , # 'm6' = last 6 months, 'd7' = last 7 days
lr = "lang_en" , # Language restriction (e.g., 'lang_en', 'lang_es')
safe = "active" , # Search safety level ('active' or 'off')
exactTerms = "machine learning" , # Phrase that all documents must contain
fileType = "pdf" # File type to restrict results to
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
