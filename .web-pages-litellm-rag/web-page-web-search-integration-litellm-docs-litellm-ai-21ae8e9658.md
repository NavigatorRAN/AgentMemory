# Web Search Integration | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/integrations/websearch_interception
- Final URL: https://docs.litellm.ai/docs/integrations/websearch_interception
- Canonical URL: https://docs.litellm.ai/docs/integrations/websearch_interception
- Fetched at: 2026-06-23T14:24:18Z
- Content type: text/html; charset=utf-8

## Description

Enable transparent server-side web search execution for any LLM provider. LiteLLM automatically intercepts web search tool calls and executes them using your configured search provider (Perplexity, Tavily, etc.).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Enable transparent server-side web search execution for any LLM provider. LiteLLM automatically intercepts web search tool calls and executes them using your configured search provider (Perplexity, Tavily, etc.).
Quick Start ​
1. Configure Web Search Interception ​
Add to your config.yaml :
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "websearch_interception" ]
websearch_interception_params :
enabled_providers :
- openai
- minimax
- anthropic
search_tool_name : perplexity - search # Optional
search_tools :
- search_tool_name : perplexity - search
search_provider : perplexity
api_key : os.environ/PERPLEXITY_API_KEY
2. Use with Any Provider ​
import litellm
response = await litellm . acompletion (
model = "gpt-4o" ,
messages = [
{ "role" : "user" , "content" : "What's the weather in San Francisco today?" }
] ,
tools = [
{
"type" : "function" ,
"function" : {
"name" : "litellm_web_search" ,
"description" : "Search the web for information" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"query" : { "type" : "string" , "description" : "Search query" }
} ,
"required" : [ "query" ]
}
]
)
# Response includes search results automatically!
print ( response . choices [ 0 ] . message . content )
How It Works ​
When a model makes a web search tool call, LiteLLM:
Detects the litellm_web_search tool call in the response
Executes the search using your configured search provider
Makes a follow-up request with the search results
Returns the final answer to the user
Result : One API call from user → Complete answer with search results
Supported Providers ​
Web search integration works with all providers that use:
✅ Base HTTP Handler ( BaseLLMHTTPHandler )
✅ OpenAI Completion Handler ( OpenAIChatCompletion )
Providers Using Base HTTP Handler ​
Provider Status Notes OpenAI ✅ Supported GPT-4, GPT-3.5, etc. Anthropic ✅ Supported Claude models via HTTP handler MiniMax ✅ Supported All MiniMax models Mistral ✅ Supported Mistral AI models Cohere ✅ Supported Command models Fireworks AI ✅ Supported All Fireworks models Together AI ✅ Supported All Together AI models Groq ✅ Supported All Groq models Perplexity ✅ Supported Perplexity models DeepSeek ✅ Supported DeepSeek models xAI ✅ Supported Grok models Hugging Face ✅ Supported Inference API models OCI ✅ Supported Oracle Cloud models Vertex AI ✅ Supported Google Vertex AI models Bedrock ✅ Supported AWS Bedrock models (converse_like route) Azure OpenAI ✅ Supported Azure-hosted OpenAI models Sagemaker ✅ Supported AWS Sagemaker models Databricks ✅ Supported Databricks models DataRobot ✅ Supported DataRobot models Hosted VLLM ✅ Supported Self-hosted VLLM Heroku ✅ Supported Heroku-hosted models RAGFlow ✅ Supported RAGFlow models Compactif ✅ Supported Compactif models Cometapi ✅ Supported Comet API models A2A ✅ Supported Agent-to-Agent models Bytez ✅ Supported Bytez models
Providers Using OpenAI Handler ​
Provider Status Notes OpenAI ✅ Supported Native OpenAI API Azure OpenAI ✅ Supported Azure-hosted OpenAI OpenAI-Compatible ✅ Supported Any OpenAI-compatible API
Configuration ​
WebSearch Interception Parameters ​
Parameter Type Required Description Example enabled_providers List[String] Yes List of providers to enable web search for [openai, minimax, anthropic] search_tool_name String No Specific search tool from search_tools config. If not set, uses first available. perplexity-search
Provider Values ​
Use these values in enabled_providers :
Provider Value Provider Value OpenAI openai Anthropic anthropic MiniMax minimax Mistral mistral Cohere cohere Fireworks AI fireworks_ai Together AI together_ai Groq groq Perplexity perplexity DeepSeek deepseek xAI xai Hugging Face huggingface OCI oci Vertex AI vertex_ai Bedrock bedrock Azure azure Sagemaker sagemaker_chat Databricks databricks DataRobot datarobot VLLM hosted_vllm Heroku heroku RAGFlow ragflow Compactif compactif Cometapi cometapi A2A a2a Bytez bytez
Search Providers ​
Configure which search provider to use. LiteLLM supports multiple search providers:
Provider search_provider Value Environment Variable Perplexity AI perplexity PERPLEXITYAI_API_KEY Tavily tavily TAVILY_API_KEY Exa AI exa_ai EXA_API_KEY Brave Search brave BRAVE_API_KEY Parallel AI parallel_ai PARALLEL_AI_API_KEY Google PSE google_pse GOOGLE_PSE_API_KEY , GOOGLE_PSE_ENGINE_ID DataForSEO dataforseo DATAFORSEO_LOGIN , DATAFORSEO_PASSWORD Firecrawl firecrawl FIRECRAWL_API_KEY SearXNG searxng SEARXNG_API_BASE (required) Linkup linkup LINKUP_API_KEY Serper serper SERPER_API_KEY SearchAPI.io searchapi SEARCHAPI_API_KEY
See Search Providers Documentation for detailed setup instructions.
Complete Configuration Example ​
# OpenAI
# MiniMax
- model_name : minimax
model : minimax/MiniMax - M2.1
api_key : os.environ/MINIMAX_API_KEY
# Anthropic
- model_name : claude
model : anthropic/claude - sonnet - 4 - 5
api_key : os.environ/ANTHROPIC_API_KEY
# Azure OpenAI
- model_name : azure - gpt4
model : azure/gpt - 4
api_base : https : //my - azure.openai.azure.com
api_key : os.environ/AZURE_API_KEY
- azure
search_tool_name : perplexity - search
- search_tool_name : tavily - search
search_provider : tavily
api_key : os.environ/TAVILY_API_KEY
Usage Examples ​
Python SDK ​
# Configure callbacks
litellm . callbacks = [ "websearch_interception" ]
# Make completion with web search tool
{ "role" : "user" , "content" : "What are the latest AI news?" }
"description" : "Search the web for current information" ,
"query" : {
"type" : "string" ,
"description" : "Search query"
Proxy Server ​
# Start proxy with config
litellm --config config.yaml
# Make request
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4o",
"messages": [
{"role": "user", "content": "What is the weather in San Francisco?"}
],
"tools": [
"type": "function",
"function": {
"name": "litellm_web_search",
"description": "Search the web",
"parameters": {
"type": "object",
"properties": {
"query": {"type": "string"}
},
"required": ["query"]
}'
How Search Tool Selection Works ​
If search_tool_name is specified → Uses that specific search tool
If search_tool_name is not specified → Uses first search tool in search_tools list
- search_tool_name : perplexity - search # ← This will be used if no search_tool_name specified
Troubleshooting ​
Web Search Not Working ​
Check provider is enabled :
- openai # Make sure your provider is in this list
Verify search tool is configured :
Check API keys are set :
export PERPLEXITY_API_KEY=your-key
Enable debug logging :
litellm . set_verbose = True
Common Issues ​
Issue : Model returns tool_calls instead of final answer
Cause : Provider not in enabled_providers list
Solution : Add provider to enabled_providers
Issue : "No search tool configured" error
Cause : No search tools in search_tools config
Solution : Add at least one search tool configuration
Issue : "Invalid function arguments json string" error (MiniMax)
Cause : Fixed in latest version - arguments weren't properly JSON serialized
Solution : Update to latest LiteLLM version
Related Documentation ​
Search Providers - Detailed search provider setup
Claude Code WebSearch - Using with Claude Code
Tool Calling - General tool calling documentation
Callbacks - Custom callback documentation
Technical Details ​
Architecture ​
Web search integration is implemented as a custom callback ( WebSearchInterceptionLogger ) that:
Pre-request Hook : Converts native web search tools to LiteLLM standard format
Post-response Hook : Detects web search tool calls in responses
Agentic Loop : Executes searches and makes follow-up requests automatically
Supported APIs ​
✅ Chat Completions API (OpenAI format)
✅ Anthropic Messages API (Anthropic format)
✅ Streaming (automatically converted)
✅ Non-streaming
Response Format Detection ​
The handler automatically detects response format:
OpenAI format : tool_calls in assistant message
Anthropic format : tool_use blocks in content
Performance ​
Latency : Adds one additional LLM call (follow-up request with search results)
Caching : Search results can be cached (depends on search provider)
Parallel Searches : Multiple search queries executed in parallel
Contributing ​
Found a bug or want to add support for a new provider? See our Contributing Guide .
Quick Start
1. Configure Web Search Interception
2. Use with Any Provider
How It Works
Supported Providers
Providers Using Base HTTP Handler
Providers Using OpenAI Handler
Configuration
WebSearch Interception Parameters
Provider Values
Search Providers
Complete Configuration Example
Usage Examples
Python SDK
Proxy Server
How Search Tool Selection Works
Troubleshooting
Web Search Not Working
Common Issues
Related Documentation
Technical Details
Architecture
Supported APIs
Response Format Detection
Performance
Contributing
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
