# /v1/messages/count_tokens | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/anthropic_count_tokens
- Final URL: https://docs.litellm.ai/docs/anthropic_count_tokens
- Canonical URL: https://docs.litellm.ai/docs/anthropic_count_tokens
- Fetched at: 2026-06-23T14:22:45Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Anthropic-compatible token counting endpoint. Count tokens for messages before sending them to the model.
Feature Supported Notes Cost Tracking ❌ Token counting only, no cost incurred Logging ✅ Works across all integrations End-user Tracking ✅ Supported Providers Anthropic, Vertex AI (Claude), Bedrock (Claude), Gemini, Vertex AI Auto-routes to provider-specific token counting APIs
Quick Start ​
1. Start LiteLLM Proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
2. Count Tokens ​
curl
Python (httpx)
curl -X POST "http://localhost:4000/v1/messages/count_tokens" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "claude-3-5-sonnet-20241022",
"messages": [
{"role": "user", "content": "Hello, how are you?"}
]
}'
import httpx
response = httpx . post (
"http://localhost:4000/v1/messages/count_tokens" ,
headers = {
"Content-Type" : "application/json" ,
"Authorization" : "Bearer sk-1234"
} ,
json = {
"model" : "claude-3-5-sonnet-20241022" ,
"messages" : [
{ "role" : "user" , "content" : "Hello, how are you?" }
}
)
print ( response . json ( ) )
# {"input_tokens": 14}
Expected Response:
{
"input_tokens" : 14
LiteLLM Proxy Configuration ​
Add models to your config.yaml :
model_list :
- model_name : claude - 3 - 5 - sonnet
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet - 20241022
api_key : os.environ/ANTHROPIC_API_KEY
- model_name : claude - vertex
model : vertex_ai/claude - 3 - 5 - sonnet - v2@20241022
vertex_project : my - project
vertex_location : us - east5
vertex_count_tokens_location : us - east5 # Optional: Override location for token counting (count_tokens not available on global location)
- model_name : claude - bedrock
model : bedrock/us.anthropic.claude - haiku - 4 - 5 - 20251001 - v1 : 0
aws_region_name : us - west - 2
Request Parameters ​
Parameter Type Required Description model string ✅ The model to use for token counting messages array ✅ Array of messages in Anthropic format
Messages Format ​
{ "role" : "user" , "content" : "Hello!" } ,
{ "role" : "assistant" , "content" : "Hi there!" } ,
{ "role" : "user" , "content" : "How are you?" }
Response Format ​
"input_tokens" : <number>
Field Type Description input_tokens integer Number of tokens in the input messages
Supported Providers ​
The /v1/messages/count_tokens endpoint automatically routes to the appropriate provider-specific token counting API:
Provider Token Counting Method Anthropic Anthropic Token Counting API OpenAI OpenAI Responses API /input_tokens — see Token Counting Vertex AI (Claude) Vertex AI Partner Models Token Counter Bedrock (Claude) AWS Bedrock CountTokens API Gemini Google AI Studio countTokens API Vertex AI (Gemini) Vertex AI countTokens API
Examples ​
Count Tokens with System Message ​
{"role": "user", "content": "You are a helpful assistant. Please help me write a haiku about programming."}
Count Tokens for Multi-turn Conversation ​
{"role": "user", "content": "What is the capital of France?"},
{"role": "assistant", "content": "The capital of France is Paris."},
{"role": "user", "content": "What is its population?"}
Using with Vertex AI Claude ​
"model": "claude-vertex",
{"role": "user", "content": "Hello, world!"}
Using with Bedrock Claude ​
"model": "claude-bedrock",
Comparison with Anthropic Passthrough ​
LiteLLM provides two ways to count tokens:
Endpoint Description Use Case /v1/messages/count_tokens LiteLLM's Anthropic-compatible endpoint Works with all supported providers (Anthropic, Vertex AI, Bedrock, etc.) /anthropic/v1/messages/count_tokens Pass-through to Anthropic API Direct Anthropic API access with native headers
Pass-through Example ​
For direct Anthropic API access with full native headers:
curl --request POST \
--url http://0.0.0.0:4000/anthropic/v1/messages/count_tokens \
--header "x-api-key: $LITELLM_API_KEY" \
--header "anthropic-version: 2023-06-01" \
--header "anthropic-beta: token-counting-2024-11-01" \
--header "content-type: application/json" \
--data '{
{"role": "user", "content": "Hello, world"}
Overview
Quick Start
1. Start LiteLLM Proxy
2. Count Tokens
LiteLLM Proxy Configuration
Request Parameters
Messages Format
Response Format
Supported Providers
Examples
Count Tokens with System Message
Count Tokens for Multi-turn Conversation
Using with Vertex AI Claude
Using with Bedrock Claude
Comparison with Anthropic Passthrough
Pass-through Example
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
