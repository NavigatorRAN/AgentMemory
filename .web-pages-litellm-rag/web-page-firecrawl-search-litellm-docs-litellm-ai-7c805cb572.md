# Firecrawl Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search/firecrawl
- Final URL: https://docs.litellm.ai/docs/search/firecrawl
- Canonical URL: https://docs.litellm.ai/docs/search/firecrawl
- Fetched at: 2026-06-23T14:33:01Z
- Content type: text/html; charset=utf-8

## Description

Get API Key//firecrawl.dev

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Get API Key: https://firecrawl.dev
LiteLLM Python SDK ​
Firecrawl Search
import os
from litellm import search
os . environ [ "FIRECRAWL_API_KEY" ] = "fc-..."
response = search (
query = "latest AI developments" ,
search_provider = "firecrawl" ,
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
- search_tool_name : firecrawl - search
search_provider : firecrawl
api_key : os.environ/FIRECRAWL_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Test the search endpoint ​
Test Request
curl http://0.0.0.0:4000/v1/search/firecrawl-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments",
"max_results": 5
}'
Provider-specific Parameters ​
Firecrawl Search with Provider-specific Parameters
query = "machine learning research" ,
max_results = 10 ,
country = "US" ,
# Firecrawl-specific parameters
sources = [ "web" , "news" ] , # Search multiple sources
categories = [ { "type" : "github" } , { "type" : "research" } ] , # Filter by categories
tbs = "qdr:m" , # Time-based search (past month)
location = "San Francisco,California,United States" , # Geo-targeting
ignoreInvalidURLs = True , # Exclude invalid URLs
scrapeOptions = { # Scraping options for results
"formats" : [ "markdown" ] ,
"onlyMainContent" : True ,
"removeBase64Images" : True
}
Features ​
Firecrawl combines web search with powerful scraping capabilities:
Multiple Sources ​
Search across different sources simultaneously:
web - Web search results (default)
images - Image search results
news - News search results with dates
Category Filtering ​
Filter results by specific categories:
github - Search within GitHub repositories, code, issues, and documentation
research - Search academic and research websites (arXiv, Nature, IEEE, PubMed, etc.)
pdf - Search for PDFs
Time-Based Search ​
Use the tbs parameter to filter by time periods:
qdr:h - Past hour
qdr:d - Past day
qdr:w - Past week
qdr:m - Past month
qdr:y - Past year
Content Scraping ​
Firecrawl automatically scrapes full page content for search results when scrapeOptions is specified. By default, LiteLLM requests markdown format with main content only.
Geo-Targeting ​
Combine location and country parameters for geo-targeted results:
query = "restaurants" ,
country = "DE" ,
location = "Berlin,Germany"
Supported Query Operators ​
Firecrawl supports advanced search operators:
Operator Functionality Example "" Non-fuzzy matches a string of text "Firecrawl" - Excludes certain keywords -bad, -site :example .com site: Only returns results from a specified website site :firecrawl .dev inurl: Only returns results that include a word in the URL inurl :firecrawl allinurl: Only returns results that include multiple words in URL allinurl :git firecrawl intitle: Only returns results with a word in the title intitle :Firecrawl allintitle: Only returns results with multiple words in the title allintitle :firecrawl playground related: Only returns results related to a specific domain related :firecrawl .dev
LiteLLM Python SDK
LiteLLM AI Gateway
1. Setup config.yaml
2. Start the proxy
3. Test the search endpoint
Provider-specific Parameters
Features
Multiple Sources
Category Filtering
Time-Based Search
Content Scraping
Geo-Targeting
Supported Query Operators
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
