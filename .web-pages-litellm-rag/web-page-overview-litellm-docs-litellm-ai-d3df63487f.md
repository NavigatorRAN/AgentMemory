# Overview | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/search
- Final URL: https://docs.litellm.ai/docs/search
- Canonical URL: https://docs.litellm.ai/docs/search/
- Fetched at: 2026-06-23T14:32:55Z
- Content type: text/html; charset=utf-8

## Description

| Feature | Supported |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Feature Supported Supported Providers perplexity , tavily , parallel_ai , exa_ai , brave , google_pse , dataforseo , firecrawl , searxng , linkup , duckduckgo , searchapi , serper , you_com , apiserpent Cost Tracking ✅ Logging ✅ Load Balancing ❌
tip
LiteLLM follows the Perplexity API request/response for the Search API
info
Supported from LiteLLM v1.78.7+
LiteLLM Python SDK Usage ​
Quick Start ​
Basic Search
from litellm import search
import os
os . environ [ "PERPLEXITYAI_API_KEY" ] = "pplx-..."
response = search (
query = "latest AI developments in 2024" ,
search_provider = "perplexity" ,
max_results = 5
)
# Access search results
for result in response . results :
print ( f" { result . title } : { result . url } " )
print ( f"Snippet: { result . snippet } \n" )
Async Usage ​
Async Search
from litellm import asearch
import os , asyncio
async def search_async ( ) :
response = await asearch (
query = "machine learning research papers" ,
max_results = 10 ,
search_domain_filter = [ "arxiv.org" , "nature.com" ]
print ( f"Snippet: { result . snippet } " )
asyncio . run ( search_async ( ) )
Optional Parameters ​
Search with Options
query = "AI developments" ,
# Unified parameters (work across all providers)
max_results = 10 , # Maximum number of results (1-20)
search_domain_filter = [ "arxiv.org" ] , # Filter to specific domains
country = "US" , # Country code filter
max_tokens_per_page = 1024 # Max tokens per page
LiteLLM AI Gateway Usage ​
LiteLLM provides a Perplexity API compatible /search endpoint for search calls.
Setup
Add this to your litellm proxy config.yaml
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
- search_tool_name : tavily - search
search_provider : tavily
api_key : os.environ/TAVILY_API_KEY
Start litellm
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test Request ​
Option 1: Search tool name in URL (Recommended - keeps body Perplexity-compatible)
cURL Request
curl http://0.0.0.0:4000/v1/search/perplexity-search \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"query": "latest AI developments 2024",
"max_results": 5,
"search_domain_filter": ["arxiv.org", "nature.com"],
"country": "US"
}'
Option 2: Search tool name in body
cURL Request with search_tool_name in body
curl http://0.0.0.0:4000/v1/search \
"search_tool_name": "perplexity-search",
"max_results": 5
Load Balancing ​
Configure multiple search providers for automatic load balancing and fallbacks:
config.yaml with load balancing
- search_tool_name : my - search
search_provider : exa_ai
api_key : os.environ/EXA_API_KEY
search_provider : brave
api_key : os.environ/BRAVE_API_KEY
router_settings :
routing_strategy : simple - shuffle # or 'least-busy', 'latency-based-routing'
Test with load balancing:
curl http://0.0.0.0:4000/v1/search/my-search \
"query": "AI developments",
"max_results": 10
Request/Response Format ​
LiteLLM follows the Perplexity Search API specification .
See the official Perplexity Search documentation for complete details.
Example Request ​
Search Request
{
"query" : "latest AI developments 2024" ,
"max_results" : 10 ,
"search_domain_filter" : [ "arxiv.org" , "nature.com" ] ,
"country" : "US" ,
"max_tokens_per_page" : 1024
}
Request Parameters ​
Parameter Type Required Description query string or array Yes Search query. Can be a single string or array of strings search_provider string Yes (SDK) The search provider to use: "perplexity" , "tavily" , "parallel_ai" , "exa_ai" , "brave" , "google_pse" , "dataforseo" , "firecrawl" , "searxng" , "linkup" , "duckduckgo" , "searchapi" , "serper" , or "you_com" or "apiserpent" search_tool_name string Yes (Proxy) Name of the search tool configured in config.yaml max_results integer No Maximum number of results to return (1-20). Default: 10 search_domain_filter array No List of domains to filter results (max 20 domains) max_tokens_per_page integer No Maximum tokens per page to process. Default: 1024 country string No Country code filter (e.g., "US" , "GB" , "DE" )
Query Format Examples:
# Single query
query = "AI developments"
# Multiple queries
query = [ "AI developments" , "machine learning trends" ]
Response Format ​
The response follows Perplexity's search format with the following structure:
Search Response
"object" : "search" ,
"results" : [
"title" : "Latest Advances in Artificial Intelligence" ,
"url" : "https://arxiv.org/paper/example" ,
"snippet" : "This paper discusses recent developments in AI..." ,
"date" : "2024-01-15"
} ,
"title" : "Machine Learning Breakthroughs" ,
"url" : "https://nature.com/articles/ml-breakthrough" ,
"snippet" : "Researchers have achieved new milestones..." ,
"date" : "2024-01-10"
]
Response Fields ​ Field Type Description object string Always "search" for search responses results array List of search results results[].title string Title of the search result results[].url string URL of the search result results[].snippet string Text snippet from the result results[].date string Optional publication or last updated date
Supported Providers ​
Provider Environment Variable search_provider Value Perplexity AI PERPLEXITYAI_API_KEY perplexity Tavily TAVILY_API_KEY tavily Exa AI EXA_API_KEY exa_ai Brave Search BRAVE_API_KEY brave Parallel AI PARALLEL_AI_API_KEY parallel_ai Google PSE GOOGLE_PSE_API_KEY , GOOGLE_PSE_ENGINE_ID google_pse DataForSEO DATAFORSEO_LOGIN , DATAFORSEO_PASSWORD dataforseo Firecrawl FIRECRAWL_API_KEY firecrawl SearXNG SEARXNG_API_BASE (required) searxng Linkup LINKUP_API_KEY linkup Serper SERPER_API_KEY serper DuckDuckGo DUCKDUCKGO_API_BASE duckduckgo SearchAPI.io SEARCHAPI_API_KEY searchapi You.com YOUCOM_API_KEY (optional — omit for keyless free tier) you_com APISerpent APISERPENT_API_KEY apiserpent
See the individual provider documentation for detailed setup instructions and provider-specific parameters.
LiteLLM Python SDK Usage
Quick Start
Async Usage
Optional Parameters
LiteLLM AI Gateway Usage
Test Request
Load Balancing
Request/Response Format
Example Request
Request Parameters
Response Format
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
