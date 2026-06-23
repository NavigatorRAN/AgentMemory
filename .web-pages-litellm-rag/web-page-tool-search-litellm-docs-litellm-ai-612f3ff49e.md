# Tool Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/anthropic_tool_search
- Final URL: https://docs.litellm.ai/docs/providers/anthropic_tool_search
- Canonical URL: https://docs.litellm.ai/docs/providers/anthropic_tool_search
- Fetched at: 2026-06-23T14:26:47Z
- Content type: text/html; charset=utf-8

## Description

Tool search enables Claude to dynamically discover and load tools on-demand from large tool catalogs (10,000+ tools). Instead of loading all tool definitions into the context window upfront, Claude searches your tool catalog and loads only the tools it needs.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Tool search enables Claude to dynamically discover and load tools on-demand from large tool catalogs (10,000+ tools). Instead of loading all tool definitions into the context window upfront, Claude searches your tool catalog and loads only the tools it needs.
Supported Providers ​
Provider Chat Completions API Messages API Anthropic API ✅ ✅ Azure Anthropic (Microsoft Foundry) ✅ ✅ Google Cloud Vertex AI ✅ ✅ Amazon Bedrock ✅ (Invoke API only, Opus 4.5 only) ✅ (Invoke API only, Opus 4.5 only)
Benefits ​
Context efficiency : Avoid consuming massive portions of your context window with tool definitions
Better tool selection : Claude's tool selection accuracy degrades with more than 30-50 tools. Tool search maintains accuracy even with thousands of tools
On-demand loading : Tools are only loaded when Claude needs them
Tool Search Variants ​
LiteLLM supports both tool search variants:
1. Regex Tool Search ( tool_search_tool_regex_20251119 ) ​
Claude constructs regex patterns to search for tools. Best for exact pattern matching (faster).
2. BM25 Tool Search ( tool_search_tool_bm25_20251119 ) ​
Claude uses natural language queries to search for tools using the BM25 algorithm. Best for natural language semantic search.
Note : BM25 variant is not supported on Bedrock.
Chat Completions API ​
SDK Usage ​
Basic Example with Regex Tool Search ​
Basic Tool Search Example
import litellm
response = litellm . completion (
model = "anthropic/claude-sonnet-4-5-20250929" ,
messages = [
{ "role" : "user" , "content" : "What is the weather in San Francisco?" }
] ,
tools = [
# Tool search tool (regex variant)
{
"type" : "tool_search_tool_regex_20251119" ,
"name" : "tool_search_tool_regex"
} ,
# Deferred tool - will be loaded on-demand
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the weather at a specific location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : { "type" : "string" } ,
"unit" : {
"type" : "string" ,
"enum" : [ "celsius" , "fahrenheit" ]
}
"required" : [ "location" ]
"defer_loading" : True # Mark for deferred loading
]
)
print ( response . choices [ 0 ] . message . content )
BM25 Tool Search Example ​
BM25 Tool Search
{ "role" : "user" , "content" : "Search for Python files containing 'authentication'" }
# Tool search tool (BM25 variant)
"type" : "tool_search_tool_bm25_20251119" ,
"name" : "tool_search_tool_bm25"
# Deferred tools...
"name" : "search_codebase" ,
"description" : "Search through codebase files by content and filename" ,
"query" : { "type" : "string" } ,
"file_pattern" : { "type" : "string" }
"required" : [ "query" ]
"defer_loading" : True
Azure Anthropic Example ​
Azure Anthropic Tool Search
model = "azure_anthropic/claude-sonnet-4-5" ,
api_base = "https://<your-resource>.services.ai.azure.com/anthropic" ,
api_key = "your-azure-api-key" ,
{ "role" : "user" , "content" : "What's the weather like?" }
"description" : "Get current weather" ,
"location" : { "type" : "string" }
Vertex AI Example ​
Vertex AI Tool Search
model = "vertex_ai/claude-sonnet-4-5" ,
vertex_project = "your-project-id" ,
vertex_location = "us-central1" ,
{ "role" : "user" , "content" : "Search my documents" }
# Your deferred tools...
Streaming Support ​
Streaming with Tool Search
{ "role" : "user" , "content" : "Get the weather" }
"description" : "Get weather information" ,
stream = True
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
AI Gateway Usage ​
Tool search works automatically through the LiteLLM proxy.
Proxy Configuration ​
config.yaml
model_list :
- model_name : claude - sonnet
litellm_params :
model : anthropic/claude - sonnet - 4 - 5 - 20250929
api_key : os.environ/ANTHROPIC_API_KEY
Client Request ​
Client Request via Proxy
from anthropic import Anthropic
client = Anthropic (
api_key = "your-litellm-proxy-key" ,
base_url = "http://0.0.0.0:4000"
response = client . messages . create (
model = "claude-sonnet" ,
max_tokens = 1024 ,
{ "role" : "user" , "content" : "What's the weather?" }
"input_schema" : {
Messages API ​
The Messages API provides native Anthropic-style tool search support via the litellm.anthropic.messages interface.
Basic Example ​
Messages API - Basic Tool Search
response = await litellm . anthropic . messages . acreate (
model = "anthropic/claude-sonnet-4-20250514" ,
"role" : "user" ,
"content" : "What's the weather in San Francisco?"
"description" : "Get the current weather for a location" ,
"location" : {
"description" : "The city and state, e.g. San Francisco, CA"
extra_headers = { "anthropic-beta" : "advanced-tool-use-2025-11-20" }
print ( response )
Azure Anthropic Messages Example ​
Azure Anthropic Messages API
model = "azure_anthropic/claude-sonnet-4-20250514" ,
"content" : "What's the stock price of Apple?"
"name" : "get_stock_price" ,
"description" : "Get the current stock price for a ticker symbol" ,
"ticker" : {
"description" : "The stock ticker symbol, e.g. AAPL"
"required" : [ "ticker" ]
Vertex AI Messages Example ​
Vertex AI Messages API
model = "vertex_ai/claude-sonnet-4@20250514" ,
"content" : "Search the web for information about AI"
"name" : "search_web" ,
"description" : "Search the web for information" ,
"query" : {
"description" : "The search query"
extra_headers = { "anthropic-beta" : "tool-search-tool-2025-10-19" }
Bedrock Messages Example ​
Bedrock Messages API (Invoke)
model = "bedrock/invoke/anthropic.claude-opus-4-20250514-v1:0" ,
"content" : "What's the weather?"
Messages API - Streaming
import json
"content" : "What's the weather in Tokyo?"
stream = True ,
async for chunk in response :
if isinstance ( chunk , bytes ) :
chunk_str = chunk . decode ( "utf-8" )
for line in chunk_str . split ( "\n" ) :
if line . startswith ( "data: " ) :
try :
json_data = json . loads ( line [ 6 : ] )
print ( json_data )
except json . JSONDecodeError :
pass
Configure the proxy to use Messages API endpoints.
- model_name : claude - sonnet - messages
model : anthropic/claude - sonnet - 4 - 20250514
Client Request via Proxy (Messages API)
model = "claude-sonnet-messages" ,
Additional Resources ​
Anthropic Tool Search Documentation
LiteLLM Tool Calling Guide
Supported Providers
Benefits
Tool Search Variants
1. Regex Tool Search ( tool_search_tool_regex_20251119 )
2. BM25 Tool Search ( tool_search_tool_bm25_20251119 )
Chat Completions API
SDK Usage
AI Gateway Usage
Messages API
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
