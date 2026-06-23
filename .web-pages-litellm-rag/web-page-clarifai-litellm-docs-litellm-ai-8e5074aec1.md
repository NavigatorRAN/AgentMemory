# Clarifai | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/clarifai
- Final URL: https://docs.litellm.ai/docs/providers/clarifai
- Canonical URL: https://docs.litellm.ai/docs/providers/clarifai
- Fetched at: 2026-06-23T14:27:27Z
- Content type: text/html; charset=utf-8

## Description

Anthropic, OpenAI, Qwen, xAI, Gemini and most of Open soured LLMs are Supported on Clarifai.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Anthropic, OpenAI, Qwen, xAI, Gemini and most of Open soured LLMs are Supported on Clarifai.
Property Details Description Clarifai is a powerful AI platform that provides access to a wide range of LLMs through a unified API. LiteLLM enables seamless integration with Clarifai's models using an OpenAI-compatible interface. Provider Doc Clarifai ↗ OpenAI compatible Endpoint for Provider https://api.clarifai.com/v2/ext/openai/v1 Supported Endpoints /chat/completions
Pre-Requisites ​
uv add litellm
Required Environment Variables ​
To obtain your Clarifai Personal access token follow this link .
os . environ [ "CLARIFAI_PAT" ] = "CLARIFAI_API_KEY" # CLARIFAI_PAT
Usage ​
import os
from litellm import completion
os . environ [ "CLARIFAI_API_KEY" ] = ""
response = completion (
model = "clarifai/openai.chat-completion.gpt-oss-20b" ,
messages = [ { "content" : "Tell me a joke about physics?" , "role" : "user" } ]
)
Streaming Support ​
LiteLLM supports streaming responses with Clarifai models:
import litellm
for chunk in litellm . completion (
api_key = "CLARIFAI_API_KEY" ,
messages = [
{ "role" : "user" , "content" : "Tell me a fun fact about space." }
] ,
stream = True ,
) :
print ( chunk . choices [ 0 ] . delta )
Tool Calling (Function Calling) ​
Clarifai models accessed via LiteLLM support function calling:
tools = [ {
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get current temperature for a given location." ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "City and country e.g. Tokyo, Japan"
}
} ,
"required" : [ "location" ] ,
"additionalProperties" : False
} ]
response = litellm . completion (
messages = [ { "role" : "user" , "content" : "What is the weather in Paris today?" } ] ,
tools = tools ,
print ( response . choices [ 0 ] . message . tool_calls )
Clarifai models ​
liteLLM supports all models on Clarifai community
🧠 OpenAI Models ​
gpt-oss-20b
gpt-oss-120b
gpt-5-nano
gpt-5-mini
gpt-5
gpt-4o
o3
Many more...
🤖 Anthropic Models ​
claude-sonnet-4
claude-opus-4
claude-3_5-haiku
claude-3_7-sonnet
🪄 xAI Models ​
grok-3
grok-2-vision-1212
grok-2-1212
grok-code-fast-1
grok-2-image-1212
🔷 Google Gemini Models ​
gemini-2_5-pro
gemini-2_5-flash-lite
gemini-2_0-flash
gemini-2_0-flash-lite
🧩 Qwen Models ​
Qwen3-30B-A3B-Instruct-2507
Qwen3-30B-A3B-Thinking-2507
Qwen3-14B
QwQ-32B-AWQ
Qwen2_5-VL-7B-Instruct
Qwen3-Coder-30B-A3B-Instruct
💡 MiniCPM (OpenBMB) Models ​
MiniCPM-o-2_6-language
MiniCPM3-4B
MiniCPM4-8B
🧬 Microsoft Phi Models ​
Phi-4-reasoning-plus
phi-4
🦙 Meta Llama Models ​
Llama-3_2-3B-Instruct
🔍 DeepSeek Models ​
DeepSeek-R1-0528-Qwen3-8B
Usage with LiteLLM Proxy ​
Here's how to call Clarifai with the LiteLLM Proxy Server
1. Save key in your environment ​
export CLARIFAI_PAT="CLARIFAI_API_KEY"
2. Start the proxy ​
config.yaml
model_list :
- model_name : clarifai - model
litellm_params :
model : clarifai/openai.chat - completion.gpt - oss - 20b
api_key : os.environ/CLARIFAI_PAT
litellm --config /path/to/config.yaml
# Server running on http://0.0.0.0:4000
3. Test it ​
Curl Request
OpenAI v1.0.0+
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data ' {
"model": "clarifai-model",
"messages": [
{
"role": "user",
"content": "what llm are you"
]
'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "clarifai-model" ,
"role" : "user" ,
"content" : "this is a test request, write a short poem"
print ( response )
Important Notes ​
Always prefix Clarifai model IDs with clarifai/ when specifying the model name
Use your Clarifai Personal Access Token (PAT) as the API key
Usage is tracked and billed through Clarifai
API rate limits are subject to your Clarifai account settings
Most OpenAI parameters are supported, but some advanced features may vary by model
FAQs ​
Question Answer Can I use all Clarifai models with LiteLLM? Most chat-completion models are supported. Use the Clarifai model URL as the model . Do I need a separate Clarifai PAT? Yes, you must use a valid Clarifai Personal Access Token. Is tool calling supported? Yes, provided the underlying Clarifai model supports function/tool calling. How is billing handled? Clarifai usage is billed independently via Clarifai.
Additional Resources ​
Clarifai Documentation
LiteLLM GitHub
Clarifai Runners Examples
Pre-Requisites
Required Environment Variables
Usage
Streaming Support
Tool Calling (Function Calling)
Clarifai models
🧠 OpenAI Models
🤖 Anthropic Models
🪄 xAI Models
🔷 Google Gemini Models
🧩 Qwen Models
💡 MiniCPM (OpenBMB) Models
🧬 Microsoft Phi Models
🦙 Meta Llama Models
🔍 DeepSeek Models
Usage with LiteLLM Proxy
1. Save key in your environment
2. Start the proxy
3. Test it
Important Notes
FAQs
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
