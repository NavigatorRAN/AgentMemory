# SearXNG Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/searxng
- Final URL: https://docs.litellm.ai/docs/search/searxng
- Canonical URL: https://docs.litellm.ai/docs/search/searxng
- Fetched at: 2026-06-23T14:33:08Z
- Content type: text/html; charset=utf-8

## Description

Open Source//github.com/searxng/searxng

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Open Source: https://github.com/searxng/searxng
Public Instances: https://searx.space/
Overview ​
SearXNG is a free, open-source metasearch engine that aggregates results from multiple search engines while protecting user privacy. It can be self-hosted or used via public instances.
Note: SearXNG returns a fixed number of results per page (~20 by default) and does not support limiting results via the API. The max_results parameter is not directly supported by SearXNG.
LiteLLM Python SDK ​
SearXNG Search
import os
from litellm import search
# Set your SearXNG instance URL (REQUIRED)
os . environ [ "SEARXNG_API_BASE" ] = "https://serxng-deployment-production.up.railway.app"
response = search (
query = "latest AI developments" ,
search_provider = "searxng" ,
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
- search_tool_name : searxng - search
search_provider : searxng
api_base : https : //serxng - deployment - production.up.railway.app
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/searxng-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 10
}'
Provider-specific Parameters ​
SearXNG Search with Provider-specific Parameters
# REQUIRED: Set your SearXNG instance URL
query = "machine learning research" ,
max_results = 10 ,
# SearXNG-specific parameters
categories = "general,science" , # Comma-separated categories
engines = "google,duckduckgo,bing" , # Comma-separated engines
language = "en" , # Language code
pageno = 1 , # Page number
time_range = "month" # Time filter: day, month, year
Features ​
SearXNG provides powerful metasearch capabilities:
Multiple Search Engines ​
Aggregate results from multiple search engines simultaneously:
Google, DuckDuckGo, Bing, Brave
Wikipedia, Startpage
And many more
Categories ​
Search within specific categories:
general - General web search
science - Scientific articles and papers
images - Image search
news - News articles
videos - Video content
music - Music and audio
files - File search
it - IT and technology
map - Maps and location
Time-Based Filtering ​
Filter results by time range:
day - Past day
month - Past month
year - Past year
Privacy-Focused ​
No user tracking
No cookies required
No profiling
No ads
Language Support ​
Support for 60+ languages with the language parameter.
Self-Hosting ​
SearXNG can be self-hosted for complete control.
Quick Deploy ​
Use our pre-configured deployment repository for easy setup:
Fork and Deploy: github.com/BerriAI/serxng-deployment
This repository includes:
Docker and Docker Compose setup
JSON API format pre-configured
Ready to deploy
Manual Installation ​
See the official SearXNG installation instructions for detailed setup.
Important: When you install SearXNG, the only active output format by default is the HTML format. You need to activate the JSON format to use the API.
Add the following to your settings.yml file:
search :
formats :
- html
- json
Then restart SearXNG:
# Using Docker
docker run -d -p 8080:8080 \
-v $(pwd)/settings.yml:/etc/searxng/settings.yml:ro \
-e SEARXNG_BASE_URL=http://localhost:8080 \
searxng/searxng
# Then configure LiteLLM to use your instance
export SEARXNG_API_BASE=http://localhost:8080
Configuration ​
Setting API Base URL (Required) ​
You must specify a SearXNG instance URL either via environment variable or in the search call:
# Option 1: Environment variable (Recommended)
os . environ [ "SEARXNG_API_BASE" ] = "https://your-instance.com"
query = "AI developments" ,
search_provider = "searxng"
# Option 2: Pass directly in search call
api_base = "https://your-instance.com"
Note: There is no default instance URL. You must choose either a public instance or self-host your own.
Optional Authentication ​
Some SearXNG instances may require authentication:
# Set API key if required
os . environ [ "SEARXNG_API_KEY" ] = "your-api-key"
Cost ​
SearXNG is completely free:
Open source - No licensing costs
Self-hosted - Only infrastructure costs
Public instances - Usually free, check instance policies
Advanced Usage ​
Custom Engine Selection ​
query = "Python tutorials" ,
engines = "stackoverflow,github,reddit" , # Only search these engines
categories = "it"
Multi-Category Search ​
query = "climate change" ,
categories = "general,science,news" , # Search multiple categories
time_range = "month"
Pagination ​
# Get page 1
page1 = search (
query = "AI research" ,
pageno = 1
# Get page 2
page2 = search (
pageno = 2
Response Format ​
SearXNG returns results in the standard LiteLLM search format:
{
"object" : "search" ,
"results" : [
"title" : "Example Result" ,
"url" : "https://example.com" ,
"snippet" : "This is the content snippet from the search result..." ,
"date" : "2024-01-15" ,
"last_updated" : null
}
]
Troubleshooting ​
Test Your Instance First ​
If LiteLLM with searxng search provider is not working, test your SearXNG instance directly with curl:
# Test if JSON API is working
curl -s "https://your-searxng-instance.com/search?q=test&format=json" | head -50
# Example with specific instance
curl -s "https://serxng-deployment-production.up.railway.app/search?q=test&format=json" | head -50
Expected response : JSON with search results
If you get HTML : JSON format is not enabled in the instance's settings.yml
No Results ​
If you get no results:
Try different engines : Specify engines parameter
Broaden categories : Use multiple categories
Adjust language : Set appropriate language parameter
JSON Format Not Enabled ​
If you get HTML instead of JSON:
Test with curl : Use the curl command above to verify JSON output
Self-host your own instance : Use our deployment repo with JSON pre-configured
Check instance configuration : Not all public instances have JSON enabled
Enable JSON manually : Add to settings.yml :
Overview
LiteLLM Python SDK
LiteLLM AI Gateway
1. Setup config.yaml
2. Start the proxy
3. Test the search endpoint
Provider-specific Parameters
Features
Multiple Search Engines
Categories
Time-Based Filtering
Privacy-Focused
Language Support
Self-Hosting
Quick Deploy
Manual Installation
Configuration
Setting API Base URL (Required)
Optional Authentication
Cost
Advanced Usage
Custom Engine Selection
Multi-Category Search
Pagination
Response Format
Troubleshooting
Test Your Instance First
No Results
JSON Format Not Enabled
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
