# Token Counting | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/count_tokens
- Final URL: https://docs.litellm.ai/docs/count_tokens
- Canonical URL: https://docs.litellm.ai/docs/count_tokens
- Fetched at: 2026-06-23T14:23:42Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
LiteLLM provides exact token counting by calling provider-specific token counting APIs. This gives you accurate token counts before sending requests, helping with cost estimation and context window management.
Feature Details SDK Method litellm.acount_tokens() Proxy Endpoints /v1/messages/count_tokens (Anthropic format), /v1/responses/input_tokens (OpenAI format) Fallback Local tiktoken-based counting for unsupported providers
Supported Providers ​
Provider Token Counting API Format OpenAI Responses API /input_tokens OpenAI Responses Anthropic Messages /count_tokens Anthropic Messages Vertex AI (Claude) Vertex AI Partner Models Token Counter Anthropic Messages Bedrock (Claude) AWS Bedrock CountTokens API Anthropic Messages Gemini Google AI Studio countTokens API Anthropic Messages Vertex AI (Gemini) Vertex AI countTokens API Anthropic Messages Other providers Local tiktoken fallback N/A
SDK Usage ​
Basic Usage ​
import asyncio
import litellm
async def main ( ) :
# OpenAI
result = await litellm . acount_tokens (
model = "openai/gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
)
print ( f"Token count: { result . total_tokens } " )
print ( f"Tokenizer: { result . tokenizer_type } " ) # "openai_api"
# Anthropic
model = "anthropic/claude-3-5-sonnet-20241022" ,
print ( f"Tokenizer: { result . tokenizer_type } " ) # "anthropic_api"
asyncio . run ( main ( ) )
With Tools and System Message ​
messages = [ { "role" : "user" , "content" : "What's the weather in Paris?" } ] ,
tools = [ {
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get weather for a city" ,
"parameters" : {
"type" : "object" ,
"properties" : { "city" : { "type" : "string" } } ,
} ,
} ] ,
system = "You are a helpful weather assistant." ,
print ( f"Token count (with tools): { result . total_tokens } " )
Response Format ​
litellm.acount_tokens() returns a TokenCountResponse :
TokenCountResponse (
total_tokens = 15 , # Token count
request_model = "openai/gpt-4o" , # Model requested
model_used = "gpt-4o" , # Model used for counting
tokenizer_type = "openai_api" , # "openai_api", "anthropic_api", "local_tokenizer"
original_response = { "input_tokens" : 15 } , # Raw API response
error = False , # True if counting failed
error_message = None , # Error details if failed
Fallback Behavior ​
If a provider doesn't support a token counting API, or if the API key is missing, acount_tokens() automatically falls back to local tiktoken-based counting:
# Unsupported provider → automatic fallback
model = "together_ai/meta-llama/Llama-3-8b-chat-hf" ,
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
print ( result . tokenizer_type ) # "local_tokenizer"
Proxy Usage ​
OpenAI Format — /v1/responses/input_tokens ​
curl
Python (httpx)
curl -X POST "http://localhost:4000/v1/responses/input_tokens" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4o",
"input": "Hello, how are you?"
}'
import httpx
response = httpx . post (
"http://localhost:4000/v1/responses/input_tokens" ,
headers = {
"Content-Type" : "application/json" ,
"Authorization" : "Bearer sk-1234"
json = {
"model" : "gpt-4o" ,
"input" : "Hello, how are you?"
}
print ( response . json ( ) )
# {"input_tokens": 7}
Response:
{ "input_tokens" : 7 }
Anthropic Format — /v1/messages/count_tokens ​
See Anthropic Token Counting for full documentation.
curl -X POST "http://localhost:4000/v1/messages/count_tokens" \
"model": "claude-3-5-sonnet-20241022",
"messages": [
{"role": "user", "content": "Hello, how are you?"}
]
Proxy Configuration ​
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
- model_name : claude - 3 - 5 - sonnet
model : anthropic/claude - 3 - 5 - sonnet - 20241022
api_key : os.environ/ANTHROPIC_API_KEY
Overview
Supported Providers
SDK Usage
Basic Usage
With Tools and System Message
Response Format
Fallback Behavior
Proxy Usage
OpenAI Format — /v1/responses/input_tokens
Anthropic Format — /v1/messages/count_tokens
Proxy Configuration
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
