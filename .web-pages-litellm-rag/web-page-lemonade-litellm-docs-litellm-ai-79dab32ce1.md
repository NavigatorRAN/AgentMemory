# Lemonade | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/lemonade
- Final URL: https://docs.litellm.ai/docs/providers/lemonade
- Canonical URL: https://docs.litellm.ai/docs/providers/lemonade
- Fetched at: 2026-06-23T14:28:11Z
- Content type: text/html; charset=utf-8

## Description

Lemonade Server is an OpenAI-compatible local language model inference provider optimized for AMD GPUs and NPUs. The lemonade litellm provider supports standard chat completions with full OpenAI API compatibility.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Lemonade Server is an OpenAI-compatible local language model inference provider optimized for AMD GPUs and NPUs. The lemonade litellm provider supports standard chat completions with full OpenAI API compatibility.
Property Details Description OpenAI-compatible AI provider for local and cloud-based language model inference Provider Route on LiteLLM lemonade/ (add this prefix to the model name - e.g. lemonade/your-model-name ) API Endpoint for Provider http://localhost:8000/api/v1 (default) Supported Endpoints /chat/completions
Supported OpenAI Parameters ​
Lemonade is fully OpenAI-compatible and supports the following parameters:
"repeat_penalty"
"functions"
"logit_bias"
"max_tokens"
"max_completion_tokens"
"presence_penalty"
"stop"
"temperature"
"top_p"
"top_k"
"response_format"
"tools"
API Key Setup ​
Lemonade can be configured with custom API URLs and doesn't require strict API key validation. Set the LEMONADE_API_BASE environment variable to modify the base URL.
Usage ​
SDK
from litellm import completion
import os
# Optional: Set custom API base. Useful if your lemonade server is on
# a different port
os . environ [ 'LEMONADE_API_BASE' ] = "http://localhost:8000/api/v1"
response = completion (
model = "lemonade/your-model-name" ,
messages = [
{ "role" : "user" , "content" : "Hello from LiteLLM!" }
] ,
)
print ( response )
Streaming ​
{ "role" : "user" , "content" : "Write a short story" }
stream = True
for chunk in response :
print ( chunk . choices [ 0 ] . delta . content , end = '' , flush = True )
Advanced Usage ​
Custom Parameters ​
Lemonade supports additional parameters beyond the standard OpenAI set:
messages = [ { "role" : "user" , "content" : "Explain quantum computing" } ] ,
temperature = 0.7 ,
max_tokens = 500 ,
top_p = 0.9 ,
top_k = 50 ,
repeat_penalty = 1.1 ,
stop = [ "Human:" , "AI:" ]
Function Calling ​
Lemonade supports OpenAI-compatible function calling:
functions = [
{
"name" : "get_weather" ,
"description" : "Get current weather information" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state"
}
} ,
"required" : [ "location" ]
]
messages = [ { "role" : "user" , "content" : "What's the weather in San Francisco?" } ] ,
tools = [ { "type" : "function" , "function" : f } for f in functions ] ,
tool_choice = "auto"
Response Format ​
Lemonade supports structured output with response format:
import json
# Define schema in response_format
model = "lemonade/Qwen3-Coder-30B-A3B-Instruct-GGUF" ,
messages = [ { "role" : "user" , "content" : "Generate JSON data for a person with their name, age, and city." } ] ,
response_format = {
"type" : "json_schema" ,
"json_schema" : {
"name" : "person" ,
"schema" : {
"name" : { "type" : "string" } ,
"age" : { "type" : "integer" } ,
"city" : { "type" : "string" }
"required" : [ "name" , "age" ]
print ( f"Model: { response . model } " )
print ( f"JSON Output:" )
json_data = json . loads ( response . choices [ 0 ] . message . content )
print ( json . dumps ( json_data , indent = 2 ) )
Available Models ​
Lemonade automatically validates available models by querying the /models endpoint. You can check available models programmatically:
import httpx
api_base = "http://localhost:8000" # or your custom base
response = httpx . get ( f" { api_base } /api/v1/models" )
models = response . json ( )
print ( "Available models:" , [ model [ 'id' ] for model in models . get ( 'data' , [ ] ) ] )
Support ​
For more information regarding Lemonade please go to to the Lemonade website or Lemonade repository .
Supported OpenAI Parameters
API Key Setup
Usage
Streaming
Advanced Usage
Custom Parameters
Function Calling
Response Format
Available Models
Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
