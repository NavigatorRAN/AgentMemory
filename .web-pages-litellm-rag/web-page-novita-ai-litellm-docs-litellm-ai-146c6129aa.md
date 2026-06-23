# Novita AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/novita
- Final URL: https://docs.litellm.ai/docs/providers/novita
- Canonical URL: https://docs.litellm.ai/docs/providers/novita
- Fetched at: 2026-06-23T14:28:26Z
- Content type: text/html; charset=utf-8

## Description

| Property | Details |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Property Details Description Novita AI is an AI cloud platform that helps developers easily deploy AI models through a simple API, backed by affordable and reliable GPU cloud infrastructure. LiteLLM supports all models from Novita AI Provider Route on LiteLLM novita/ Provider Doc Novita AI Docs ↗ API Endpoint for Provider https://api.novita.ai/v3/openai Supported OpenAI Endpoints /chat/completions , /completions
API Keys ​
Get your API key here
import os
os . environ [ "NOVITA_API_KEY" ] = "your-api-key"
Supported OpenAI Params ​
max_tokens
stream
stream_options
n
seed
frequency_penalty
presence_penalty
repetition_penalty
stop
temperature
top_p
top_k
min_p
logit_bias
logprobs
top_logprobs
tools
response_format
separate_reasoning
Sample Usage ​
SDK
PROXY
from litellm import completion
os . environ [ "NOVITA_API_KEY" ] = ""
response = completion (
model = "novita/deepseek/deepseek-r1-turbo" ,
messages = [ { "role" : "user" , "content" : "List 5 popular cookie recipes." } ]
)
content = response . get ( 'choices' , [ { } ] ) [ 0 ] . get ( 'message' , { } ) . get ( 'content' )
print ( content )
Add model to config.yaml
model_list :
- model_name : deepseek - r1 - turbo
litellm_params :
model : novita/deepseek/deepseek - r1 - turbo
api_key : os.environ/NOVITA_API_KEY
Start Proxy
$ litellm --config /path/to/config.yaml
Make Request!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk_sujEQQEjTRxGUiMLN3TJh2KadRX4pw2TLWRoIKeoYZ0' \
-d '{
"model": "deepseek-r1-turbo",
"messages": [
{"role": "user", "content": "List 5 popular cookie recipes."}
]
}
'
Tool Calling ​
# set env
tools = [
{
"type" : "function" ,
"function" : {
"name" : "get_current_weather" ,
"description" : "Get the current weather in a given location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state, e.g. San Francisco, CA" ,
} ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
"required" : [ "location" ] ,
messages = [ { "role" : "user" , "content" : "What's the weather like in Boston today?" } ]
messages = messages ,
tools = tools ,
# Add any assertions, here to check response args
print ( response )
assert isinstance ( response . choices [ 0 ] . message . tool_calls [ 0 ] . function . name , str )
assert isinstance (
response . choices [ 0 ] . message . tool_calls [ 0 ] . function . arguments , str
JSON Mode ​
import json
os . environ [ 'NOVITA_API_KEY' ] = ""
messages = [
"role" : "user" ,
"content" : "List 5 popular cookie recipes."
completion (
response_format = { "type" : "json_object" } # 👈 KEY CHANGE
print ( json . loads ( completion . choices [ 0 ] . message . content ) )
-H 'Authorization: Bearer sk-1234' \
],
"response_format": {"type": "json_object"}
Chat Models ​
🚨 LiteLLM supports ALL Novita AI models, send model=novita/<your-novita-model> to send it to Novita AI. See all Novita AI models here
Model Name Function Call novita/deepseek/deepseek-r1-turbo completion('novita/deepseek/deepseek-r1-turbo', messages) novita/deepseek/deepseek-v3-turbo completion('novita/deepseek/deepseek-v3-turbo', messages) novita/deepseek/deepseek-v3-0324 completion('novita/deepseek/deepseek-v3-0324', messages) novita/qwen/qwen3-235b-a22b-fp8 completion('novita/qwen/qwen/qwen3-235b-a22b-fp8', messages) novita/qwen/qwen3-30b-a3b-fp8 completion('novita/qwen/qwen3-30b-a3b-fp8', messages) novita/qwen/qwen/qwen3-32b-fp8 completion('novita/qwen/qwen3-32b-fp8', messages) novita/qwen/qwen3-30b-a3b-fp8 completion('novita/qwen/qwen3-30b-a3b-fp8', messages) novita/qwen/qwen2.5-vl-72b-instruct completion('novita/qwen/qwen2.5-vl-72b-instruct', messages) novita/meta-llama/llama-4-maverick-17b-128e-instruct-fp8 completion('novita/meta-llama/llama-4-maverick-17b-128e-instruct-fp8', messages) novita/meta-llama/llama-3.3-70b-instruct completion('novita/meta-llama/llama-3.3-70b-instruct', messages) novita/meta-llama/llama-3.1-8b-instruct completion('novita/meta-llama/llama-3.1-8b-instruct', messages) novita/meta-llama/llama-3.1-8b-instruct-max completion('novita/meta-llama/llama-3.1-8b-instruct-max', messages) novita/meta-llama/llama-3.1-70b-instruct completion('novita/meta-llama/llama-3.1-70b-instruct', messages) novita/gryphe/mythomax-l2-13b completion('novita/gryphe/mythomax-l2-13b', messages) novita/google/gemma-3-27b-it completion('novita/google/gemma-3-27b-it', messages) novita/mistralai/mistral-nemo completion('novita/mistralai/mistral-nemo', messages)
API Keys
Supported OpenAI Params
Sample Usage
Tool Calling
JSON Mode
Chat Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
