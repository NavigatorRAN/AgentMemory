# Inception | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/inception
- Final URL: https://docs.litellm.ai/docs/providers/inception
- Canonical URL: https://docs.litellm.ai/docs/providers/inception
- Fetched at: 2026-06-23T14:28:07Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Inception serves the Mercury family of diffusion LLMs (dLLMs). The API is OpenAI-compatible. Provider Route on LiteLLM inception/ (chat), text-completion-inception/ (fill-in-the-middle) Link to Provider Doc Inception Platform Documentation ↗ Base URL https://api.inceptionlabs.ai/v1 Supported Operations /chat/completions , /fim/completions
Available Models ​
Model Description Context Window inception/mercury-2 Fast reasoning chat model; supports tool calling and structured outputs 128,000 tokens text-completion-inception/mercury-edit-2 Code model for fill-in-the-middle (FIM) autocomplete 32,000 tokens
Required Variables ​
Environment Variables
os . environ [ "INCEPTION_API_KEY" ] = "" # your Inception API key
Usage - LiteLLM Python SDK ​
Non-streaming ​
Inception Non-streaming Completion
import os
import litellm
from litellm import completion
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# Inception call
response = completion (
model = "inception/mercury-2" ,
messages = messages
)
print ( response )
Streaming ​
Inception Streaming Completion
messages = [ { "content" : "Write a short story about AI" , "role" : "user" } ]
# Inception call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Reasoning Effort and Reasoning Summary ​
Mercury exposes a reasoning_effort control with an Inception-specific instant value for near real-time responses, alongside the standard low , medium , and high . Set reasoning_summary=True to receive a summary of the model's reasoning on the response.
Inception Reasoning
messages = [ { "role" : "user" , "content" : "If a bat and ball cost $1.10 and the bat is $1 more than the ball, how much is the ball?" } ] ,
reasoning_effort = "high" ,
reasoning_summary = True ,
print ( response . choices [ 0 ] . message . content )
print ( response . reasoning_summary ) # {"content": "...", "status": "complete"}
Function Calling ​
Inception Function Calling
tools = [ {
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather in a location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state, e.g. San Francisco, CA"
}
} ,
"required" : [ "location" ]
} ]
messages = [ { "role" : "user" , "content" : "What's the weather in Boston?" } ]
tools = tools ,
tool_choice = "auto"
Fill-in-the-Middle (FIM) ​
mercury-edit-2 provides code autocomplete through Inception's /v1/fim/completions endpoint. Use text_completion with the text-completion-inception/ route and pass a prompt (prefix) plus an optional suffix .
Inception FIM
from litellm import text_completion
response = text_completion (
model = "text-completion-inception/mercury-edit-2" ,
prompt = "def add(a, b):\n return " ,
suffix = "\n" ,
max_tokens = 64 ,
print ( response . choices [ 0 ] . text )
Usage - LiteLLM Proxy Server ​
config.yaml
model_list :
- model_name : mercury - 2
litellm_params :
model : inception/mercury - 2
api_key : os.environ/INCEPTION_API_KEY
- model_name : mercury - edit - 2
model : text - completion - inception/mercury - edit - 2
Supported OpenAI Parameters ​
max_tokens
max_completion_tokens
temperature
stop
tools
tool_choice
stream
stream_options
response_format
Inception-specific Parameters ​
These are passed through to the Inception chat API:
reasoning_effort ( instant | low | medium | high )
reasoning_summary (bool) — return a summary of the model's reasoning
reasoning_summary_wait (bool) — wait for the summary to complete before returning
diffusing (bool) — stream intermediate denoising steps
realtime (bool) — optimize for lowest latency
Overview
Available Models
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Reasoning Effort and Reasoning Summary
Function Calling
Fill-in-the-Middle (FIM)
Usage - LiteLLM Proxy Server
Supported OpenAI Parameters
Inception-specific Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
