# Perplexity AI (pplx-api) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/perplexity
- Final URL: https://docs.litellm.ai/docs/providers/perplexity
- Canonical URL: https://docs.litellm.ai/docs/providers/perplexity
- Fetched at: 2026-06-23T14:28:41Z
- Content type: text/html; charset=utf-8

## Description

https://www.perplexity.ai

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://www.perplexity.ai
API Key ​
# env variable
os . environ [ 'PERPLEXITYAI_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'PERPLEXITYAI_API_KEY' ] = ""
response = completion (
model = "perplexity/sonar-pro" ,
messages = messages
)
print ( response )
Sample Usage - Streaming ​
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Reasoning Effort ​
Requires v1.72.6+
info
See full guide on Reasoning with LiteLLM here
You can set the reasoning effort by setting the reasoning_effort parameter.
SDK
Proxy
model = "perplexity/sonar-reasoning" ,
reasoning_effort = "high"
Setup config.yaml
model_list :
- model_name : perplexity - sonar - reasoning - model
litellm_params :
model : perplexity/sonar - reasoning
api_key : os.environ/PERPLEXITYAI_API_KEY
Start proxy
litellm --config /path/to/config.yaml
Test it!
Replace anything with your LiteLLM Proxy Virtual Key, if setup .
curl http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer anything" \
-d '{
"model": "perplexity-sonar-reasoning-model",
"messages": [{"role": "user", "content": "Who won the World Cup in 2022?"}],
"reasoning_effort": "high"
}'
Supported Models ​
All models listed here https://docs.perplexity.ai/docs/model-cards are supported. Just do model=perplexity/<model-name> .
Model Name Function Call sonar-deep-research completion(model="perplexity/sonar-deep-research", messages) sonar-reasoning-pro completion(model="perplexity/sonar-reasoning-pro", messages) sonar-reasoning completion(model="perplexity/sonar-reasoning", messages) sonar-pro completion(model="perplexity/sonar-pro", messages) sonar completion(model="perplexity/sonar", messages) r1-1776 completion(model="perplexity/r1-1776", messages)
Agent API (Responses API) ​
Using Presets ​
Presets provide optimized defaults for specific use cases. Start with a preset for quick setup:
from litellm import responses
os . environ [ 'PERPLEXITY_API_KEY' ] = ""
# Using the pro-search preset
response = responses (
model = "perplexity/preset/pro-search" ,
input = "What are the latest developments in AI?" ,
custom_llm_provider = "perplexity" ,
print ( response . output )
- model_name : perplexity - pro - search
model : perplexity/preset/pro - search
api_key : os.environ/PERPLEXITY_API_KEY
curl http://0.0.0.0:4000/v1/responses \
"model": "perplexity-pro-search",
"input": "What are the latest developments in AI?"
Using Third-Party Models ​
Access models from OpenAI, Anthropic, Google, xAI, and other providers through Perplexity's unified API:
OpenAI
Anthropic
Google
xAI
model = "perplexity/openai/gpt-5.2" ,
input = "Explain quantum computing in simple terms" ,
max_output_tokens = 500 ,
model = "perplexity/anthropic/claude-sonnet-4-5" ,
input = "Write a short story about a robot learning to paint" ,
model = "perplexity/google/gemini-2.5-flash" ,
input = "Explain the concept of neural networks" ,
model = "perplexity/xai/grok-4-1-fast-non-reasoning" ,
input = "What makes a good AI assistant?" ,
Web Search Tool ​
Enable web search capabilities to access real-time information:
input = "What's the weather in San Francisco today?" ,
tools = [ { "type" : "web_search" } ] ,
instructions = "You have access to a web_search tool. Use it for questions about current events." ,
Function Calling ​
The Agent API supports custom function tools. Pass function tools through unchanged:
input = "What's the weather in San Francisco?" ,
tools = [
{ "type" : "web_search" } ,
{
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather for a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : { "type" : "string" } ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
} ,
] ,
instructions = "Use tools when appropriate." ,
Structured Outputs ​
Request JSON schema structured outputs via the text parameter:
input = "Extract key facts about the Eiffel Tower" ,
text = {
"format" : {
"type" : "json_schema" ,
"name" : "facts" ,
"schema" : {
"name" : { "type" : "string" } ,
"height_meters" : { "type" : "number" } ,
"year_built" : { "type" : "integer" } ,
"required" : [ "name" , "height_meters" , "year_built" ] ,
"strict" : True ,
}
Reasoning Effort (Responses API) ​
Control the reasoning effort level for reasoning-capable models:
input = "Solve this complex problem step by step" ,
reasoning = { "effort" : "high" } , # Options: low, medium, high
max_output_tokens = 1000 ,
Multi-Turn Conversations ​
Use message arrays for multi-turn conversations with context:
input = [
{ "type" : "message" , "role" : "system" , "content" : "You are a helpful assistant." } ,
{ "type" : "message" , "role" : "user" , "content" : "What are the latest AI developments?" } ,
instructions = "Provide detailed, well-researched answers." ,
max_output_tokens = 800 ,
Streaming Responses ​
Stream responses for real-time output:
input = "Tell me a story about space exploration" ,
stream = True ,
if hasattr ( chunk , 'type' ) :
if chunk . type == "response.output_text.delta" :
print ( chunk . delta , end = "" , flush = True )
Supported Third-Party Models ​
Provider Model Name Function Call OpenAI gpt-5.2 responses(model="perplexity/openai/gpt-5.2", ...) OpenAI gpt-5.1 responses(model="perplexity/openai/gpt-5.1", ...) OpenAI gpt-5-mini responses(model="perplexity/openai/gpt-5-mini", ...) Anthropic claude-opus-4-6 responses(model="perplexity/anthropic/claude-opus-4-6", ...) Anthropic claude-opus-4-5 responses(model="perplexity/anthropic/claude-opus-4-5", ...) Anthropic claude-sonnet-4-5 responses(model="perplexity/anthropic/claude-sonnet-4-5", ...) Anthropic claude-haiku-4-5 responses(model="perplexity/anthropic/claude-haiku-4-5", ...) Google gemini-3-pro-preview responses(model="perplexity/google/gemini-3-pro-preview", ...) Google gemini-3-flash-preview responses(model="perplexity/google/gemini-3-flash-preview", ...) Google gemini-2.5-pro responses(model="perplexity/google/gemini-2.5-pro", ...) Google gemini-2.5-flash responses(model="perplexity/google/gemini-2.5-flash", ...) xAI grok-4-1-fast-non-reasoning responses(model="perplexity/xai/grok-4-1-fast-non-reasoning", ...) Perplexity sonar responses(model="perplexity/perplexity/sonar", ...)
Available Presets ​
Preset Name Function Call fast-search responses(model="perplexity/preset/fast-search", ...) pro-search responses(model="perplexity/preset/pro-search", ...) deep-research responses(model="perplexity/preset/deep-research", ...) advanced-deep-research responses(model="perplexity/preset/advanced-deep-research", ...)
Complete Example ​
# Comprehensive example with multiple features
input = "Research the latest developments in quantum computing and provide sources" ,
{ "type" : "fetch_url" }
instructions = "Use web_search to find relevant information and fetch_url to retrieve detailed content from sources. Provide citations for all claims." ,
temperature = 0.7 ,
print ( f"Response ID: { response . id } " )
print ( f"Model: { response . model } " )
print ( f"Status: { response . status } " )
print ( f"Output: { response . output } " )
print ( f"Usage: { response . usage } " )
For more information about passing provider-specific parameters, go here
API Key
Sample Usage
Sample Usage - Streaming
Reasoning Effort
Supported Models
Agent API (Responses API)
Using Presets
Using Third-Party Models
Web Search Tool
Function Calling
Structured Outputs
Reasoning Effort (Responses API)
Multi-Turn Conversations
Streaming Responses
Supported Third-Party Models
Available Presets
Complete Example
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
