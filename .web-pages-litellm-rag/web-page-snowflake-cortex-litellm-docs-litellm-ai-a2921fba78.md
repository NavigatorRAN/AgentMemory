# Snowflake Cortex | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/snowflake
- Final URL: https://docs.litellm.ai/docs/providers/snowflake
- Canonical URL: https://docs.litellm.ai/docs/providers/snowflake
- Fetched at: 2026-06-23T14:29:00Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models on the Snowflake Cortex REST API, including models from Anthropic (Claude), OpenAI (GPT), Meta (Llama), Mistral, DeepSeek, and Snowflake.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models on the Snowflake Cortex REST API, including models from Anthropic (Claude), OpenAI (GPT), Meta (Llama), Mistral, DeepSeek, and Snowflake.
Description Snowflake Cortex REST API provides access to leading frontier LLMs through OpenAI-compatible and Anthropic-compatible endpoints. All inference runs within Snowflake's security perimeter. Provider Route on LiteLLM snowflake/ Provider Docs Cortex REST API ↗ API Endpoints Chat Completions: https://{account}.snowflakecomputing.com/api/v2/cortex/v1/chat/completions
Messages: https://{account}.snowflakecomputing.com/api/v2/cortex/v1/messages
Legacy: https://{account}.snowflakecomputing.com/api/v2/cortex/inference:complete Supported OpenAI Endpoints /chat/completions , /completions , /embeddings
Tip : We support ALL Snowflake Cortex models. Use model=snowflake/<model-name> as a prefix when sending LiteLLM requests.
Authentication ​
Snowflake Cortex REST API supports three authentication methods.
Programmatic Access Token (PAT) — Recommended ​
The simplest approach. Generate a PAT in Snowsight under User Menu → My Profile → Programmatic Access Tokens .
import os
from litellm import completion
os . environ [ "SNOWFLAKE_API_KEY" ] = "pat/<your-programmatic-access-token>"
os . environ [ "SNOWFLAKE_API_BASE" ] = "https://<account>.snowflakecomputing.com/api/v2/cortex/v1"
response = completion (
model = "snowflake/claude-sonnet-4-5" ,
messages = [ { "role" : "user" , "content" : "Hello!" } ] ,
)
JWT (Key-Pair Authentication) ​
Generate a JWT from a Snowflake key pair. See Key-pair authentication .
os . environ [ "SNOWFLAKE_JWT" ] = "<your-jwt-token>"
os . environ [ "SNOWFLAKE_ACCOUNT_ID" ] = "<orgname>-<account_name>"
Pass credentials as parameters ​
# Using PAT
api_key = "pat/<your-pat-token>" ,
api_base = "https://<account>.snowflakecomputing.com/api/v2/cortex/v1" ,
# Using JWT
api_key = "<your-jwt-token>" ,
account_id = "<orgname>-<account_name>" ,
For all authentication options, see Authenticating to Cortex REST API .
Usage ​
SDK
PROXY
os . environ [ "SNOWFLAKE_API_KEY" ] = "pat/<your-pat>"
messages = [ { "role" : "user" , "content" : "What is Snowflake Cortex?" } ] ,
print ( response . choices [ 0 ] . message . content )
1. Config
model_list :
- model_name : claude - sonnet
litellm_params :
model : snowflake/claude - sonnet - 4 - 5
api_key : pat/<your - pat >
api_base : https : //<account > .snowflakecomputing.com/api/v2/cortex/v1
- model_name : llama4 - maverick
model : snowflake/llama4 - maverick
2. Start proxy
litellm --config /path/to/config.yaml
3. Test
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "claude-sonnet",
"messages": [
{"role": "user", "content": "What is Snowflake Cortex?"}
]
}'
Supported OpenAI Parameters ​
temperature, max_tokens, top_p, stream, response_format,
tools, tool_choice
Streaming ​
messages = [ { "role" : "user" , "content" : "Write a haiku about data." } ] ,
stream = True ,
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
"messages": [{"role": "user", "content": "Write a haiku about data."}],
"stream": true
Tool / Function Calling ​
Supported on Claude and select models. LiteLLM automatically transforms OpenAI tool format to Snowflake's tool_spec format.
import os , json
tools = [
{
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather for a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : { "type" : "string" , "description" : "City name" }
} ,
"required" : [ "location" ] ,
}
messages = [ { "role" : "user" , "content" : "What's the weather in San Francisco?" } ] ,
tools = tools ,
tool_choice = "auto" ,
print ( response . choices [ 0 ] . message . tool_calls )
"messages": [{"role": "user", "content": "What is the weather in SF?"}],
"tools": [{
"type": "function",
"function": {
"name": "get_weather",
"description": "Get weather for a location",
"parameters": {
"type": "object",
"properties": {"location": {"type": "string"}},
"required": ["location"]
}],
"tool_choice": "auto"
Thinking / Reasoning ​
Claude 3.7 Sonnet, Claude 4 Opus, and DeepSeek R1 on Cortex support extended thinking. LiteLLM translates reasoning_effort to the provider's thinking parameter.
reasoning_effort budget_tokens "low" 1024 "medium" 2048 "high" 4096
model = "snowflake/claude-3-7-sonnet" ,
messages = [ { "role" : "user" , "content" : "Solve: what is 127 * 389?" } ] ,
reasoning_effort = "low" ,
Prompt Caching ​
Snowflake Cortex supports prompt caching to reduce costs:
OpenAI models : Implicit caching for prompts ≥ 1,024 tokens (no code changes needed)
Claude models : Explicit caching via cache_control breakpoints
Cached input tokens are billed at 10% of the regular input rate (90% discount) when ≥ 1,024 tokens are cached.
See Cortex REST API Billing & Cost Analysis for details.
Embeddings ​
from litellm import embedding
response = embedding (
model = "snowflake/snowflake-arctic-embed-l-v2.0" ,
input = [ "Snowflake Cortex provides LLM inference" ] ,
print ( response . data [ 0 ] [ "embedding" ] [ : 5 ] )
Supported Models ​
All models are available through the snowflake/ prefix.
tip
For current model availability, rate limits, and pricing, see the official Cortex REST API docs and Service Consumption Table .
Chat Completion Models ​
Model litellm model name Function Calling Vision Prompt Caching Claude Sonnet 4.5 snowflake/claude-sonnet-4-5 ✅ ✅ ✅ Claude Sonnet 4.6 snowflake/claude-sonnet-4-6 ✅ ✅ ✅ Claude 4 Sonnet snowflake/claude-4-sonnet ✅ ✅ ✅ Claude 4 Opus snowflake/claude-4-opus ✅ ✅ ✅ Claude Haiku 4.5 snowflake/claude-haiku-4-5 ✅ ✅ ✅ Claude 3.7 Sonnet snowflake/claude-3-7-sonnet ✅ ✅ ✅ Claude 3.5 Sonnet snowflake/claude-3-5-sonnet ✅ ✅ ✅ OpenAI GPT-4.1 snowflake/openai-gpt-4.1 ✅ ✅ ✅ OpenAI GPT-5 snowflake/openai-gpt-5 ✅ ✅ ✅ OpenAI GPT-5 Mini snowflake/openai-gpt-5-mini ✅ OpenAI GPT-5 Nano snowflake/openai-gpt-5-nano ✅ DeepSeek R1 snowflake/deepseek-r1 Mistral Large 2 snowflake/mistral-large2 ✅ Llama 3.1 8B snowflake/llama3.1-8b Llama 3.1 70B snowflake/llama3.1-70b ✅ Llama 3.1 405B snowflake/llama3.1-405b ✅ Llama 3.3 70B snowflake/llama3.3-70b ✅ Llama 4 Maverick snowflake/llama4-maverick ✅ Snowflake Llama 3.3 70B snowflake/snowflake-llama-3.3-70b ✅
Embedding Models ​
Model litellm model name Snowflake Arctic Embed L v2.0 snowflake/snowflake-arctic-embed-l-v2.0 Snowflake Arctic Embed M v2.0 snowflake/snowflake-arctic-embed-m-v2.0
Authentication
Programmatic Access Token (PAT) — Recommended
JWT (Key-Pair Authentication)
Pass credentials as parameters
Usage
Supported OpenAI Parameters
Streaming
Tool / Function Calling
Thinking / Reasoning
Prompt Caching
Embeddings
Supported Models
Chat Completion Models
Embedding Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
