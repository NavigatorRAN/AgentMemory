# Lambda AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/lambda_ai
- Final URL: https://docs.litellm.ai/docs/providers/lambda_ai
- Canonical URL: https://docs.litellm.ai/docs/providers/lambda_ai
- Fetched at: 2026-06-23T14:28:09Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Lambda AI provides access to a wide range of open-source language models through their cloud GPU infrastructure, optimized for inference at scale. Provider Route on LiteLLM lambda_ai/ Link to Provider Doc Lambda AI API Documentation ↗ Base URL https://api.lambda.ai/v1 Supported Operations /chat/completions
https://docs.lambda.ai/api
We support ALL Lambda AI models, just set lambda_ai/ as a prefix when sending completion requests
Available Models ​
Lambda AI offers a diverse selection of state-of-the-art open-source models:
Large Language Models ​
Model Description Context Window lambda_ai/llama3.3-70b-instruct-fp8 Llama 3.3 70B with FP8 quantization 8,192 tokens lambda_ai/llama3.1-405b-instruct-fp8 Llama 3.1 405B with FP8 quantization 8,192 tokens lambda_ai/llama3.1-70b-instruct-fp8 Llama 3.1 70B with FP8 quantization 8,192 tokens lambda_ai/llama3.1-8b-instruct Llama 3.1 8B instruction-tuned 8,192 tokens lambda_ai/llama3.1-nemotron-70b-instruct-fp8 Llama 3.1 Nemotron 70B 8,192 tokens
DeepSeek Models ​
Model Description Context Window lambda_ai/deepseek-llama3.3-70b DeepSeek Llama 3.3 70B 8,192 tokens lambda_ai/deepseek-r1-0528 DeepSeek R1 0528 8,192 tokens lambda_ai/deepseek-r1-671b DeepSeek R1 671B 8,192 tokens lambda_ai/deepseek-v3-0324 DeepSeek V3 0324 8,192 tokens
Hermes Models ​
Model Description Context Window lambda_ai/hermes3-405b Hermes 3 405B 8,192 tokens lambda_ai/hermes3-70b Hermes 3 70B 8,192 tokens lambda_ai/hermes3-8b Hermes 3 8B 8,192 tokens
Coding Models ​
Model Description Context Window lambda_ai/qwen25-coder-32b-instruct Qwen 2.5 Coder 32B 8,192 tokens lambda_ai/qwen3-32b-fp8 Qwen 3 32B with FP8 8,192 tokens
Vision Models ​
Model Description Context Window lambda_ai/llama3.2-11b-vision-instruct Llama 3.2 11B with vision capabilities 8,192 tokens
Specialized Models ​
Model Description Context Window lambda_ai/llama-4-maverick-17b-128e-instruct-fp8 Llama 4 Maverick with 128k context 131,072 tokens lambda_ai/llama-4-scout-17b-16e-instruct Llama 4 Scout with 16k context 16,384 tokens lambda_ai/lfm-40b LFM 40B model 8,192 tokens lambda_ai/lfm-7b LFM 7B model 8,192 tokens
Required Variables ​
Environment Variables
os . environ [ "LAMBDA_API_KEY" ] = "" # your Lambda AI API key
Usage - LiteLLM Python SDK ​
Non-streaming ​
Lambda AI Non-streaming Completion
import os
import litellm
from litellm import completion
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# Lambda AI call
response = completion (
model = "lambda_ai/llama3.1-8b-instruct" ,
messages = messages
)
print ( response )
Streaming ​
Lambda AI Streaming Completion
messages = [ { "content" : "Write a short story about AI" , "role" : "user" } ]
# Lambda AI call with streaming
model = "lambda_ai/llama3.1-70b-instruct-fp8" ,
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Vision/Multimodal Support ​
The Llama 3.2 Vision model supports image inputs:
Lambda AI Vision/Multimodal
messages = [ {
"role" : "user" ,
"content" : [
{
"type" : "text" ,
"text" : "What's in this image?"
} ,
"type" : "image_url" ,
"image_url" : {
"url" : "https://example.com/image.jpg"
}
]
} ]
# Lambda AI vision model call
model = "lambda_ai/llama3.2-11b-vision-instruct" ,
Function Calling ​
Lambda AI models support function calling:
Lambda AI Function Calling
# Define tools
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
"required" : [ "location" ]
messages = [ { "role" : "user" , "content" : "What's the weather in Boston?" } ]
# Lambda AI call with function calling
model = "lambda_ai/hermes3-70b" ,
tools = tools ,
tool_choice = "auto"
Usage - LiteLLM Proxy Server ​
config.yaml
model_list :
- model_name : llama - 8b
litellm_params :
model : lambda_ai/llama3.1 - 8b - instruct
api_key : os.environ/LAMBDA_API_KEY
- model_name : deepseek - 70b
model : lambda_ai/deepseek - llama3.3 - 70b
- model_name : hermes - 405b
model : lambda_ai/hermes3 - 405b
- model_name : qwen - coder
model : lambda_ai/qwen25 - coder - 32b - instruct
Custom API Base ​
If you need to use a custom API base URL:
Custom API Base
# Using environment variable
os . environ [ "LAMBDA_API_BASE" ] = "https://custom.lambda-api.com/v1"
os . environ [ "LAMBDA_API_KEY" ] = "" # your API key
# Or pass directly
messages = [ { "content" : "Hello!" , "role" : "user" } ] ,
api_base = "https://custom.lambda-api.com/v1" ,
api_key = "your-api-key"
Supported OpenAI Parameters ​
Lambda AI supports all standard OpenAI parameters since it's fully OpenAI-compatible:
temperature
max_tokens
top_p
frequency_penalty
presence_penalty
stop
n
stream
tools
tool_choice
response_format
seed
user
logit_bias
Example with parameters:
Lambda AI with Parameters
model = "lambda_ai/hermes3-405b" ,
messages = [ { "content" : "Explain quantum computing" , "role" : "user" } ] ,
temperature = 0.7 ,
max_tokens = 500 ,
top_p = 0.9 ,
frequency_penalty = 0.2 ,
presence_penalty = 0.1
Overview
Available Models
Large Language Models
DeepSeek Models
Hermes Models
Coding Models
Vision Models
Specialized Models
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Vision/Multimodal Support
Function Calling
Usage - LiteLLM Proxy Server
Supported OpenAI Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
