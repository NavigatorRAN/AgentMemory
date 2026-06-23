# Anthropic Passthrough | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/anthropic_completion
- Final URL: https://docs.litellm.ai/docs/pass_through/anthropic_completion
- Canonical URL: https://docs.litellm.ai/docs/pass_through/anthropic_completion
- Fetched at: 2026-06-23T14:25:46Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Anthropic - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Anthropic - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ✅ supports all models on /messages , /v1/messages/batches endpoint Logging ✅ works across all integrations End-user Tracking ✅ Prometheus end_user label is off by default; enable via litellm.enable_end_user_cost_tracking_prometheus_only Streaming ✅
Just replace https://api.anthropic.com with LITELLM_PROXY_BASE_URL/anthropic
Example Usage ​
curl
Anthropic Python SDK
curl --request POST \
--url http://0.0.0.0:4000/anthropic/v1/messages \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "Authorization: bearer sk-anything" \
--data '{
"model": "claude-3-5-sonnet-20241022",
"max_tokens": 1024,
"messages": [
{"role": "user", "content": "Hello, world"}
]
}'
from anthropic import Anthropic
# Initialize client with proxy base URL
client = Anthropic (
base_url = "http://0.0.0.0:4000/anthropic" , # <proxy-base-url>/anthropic
api_key = "sk-anything" # proxy virtual key
)
# Make a completion request
response = client . messages . create (
model = "claude-3-5-sonnet-20241022" ,
max_tokens = 1024 ,
messages = [
{ "role" : "user" , "content" : "Hello, world" }
print ( response )
Supports ALL Anthropic Endpoints (including streaming).
See All Anthropic Endpoints
Quick Start ​
Let's call the Anthropic /messages endpoint
Add Anthropic API Key to your environment
export ANTHROPIC_API_KEY=""
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
curl http://0.0.0.0:4000/anthropic/v1/messages \
--header "x-api-key: $LITELLM_API_KEY" \
--header "anthropic-version: 2023-06-01" \
--header "content-type: application/json" \
--data \
'{
Examples ​
Anything after http://0.0.0.0:4000/anthropic is treated as a provider-specific route, and handled accordingly.
Key Changes:
Original Endpoint Replace With https://api.anthropic.com http://0.0.0.0:4000/anthropic (LITELLM_PROXY_BASE_URL=" http://0.0.0.0:4000 ") bearer $ANTHROPIC_API_KEY bearer anything (use bearer LITELLM_VIRTUAL_KEY if Virtual Keys are setup on proxy)
Example 1: Messages endpoint ​
LiteLLM Proxy Call ​
Direct Anthropic API Call ​
curl https://api.anthropic.com/v1/messages \
--header "x-api-key: $ANTHROPIC_API_KEY" \
Example 2: Token Counting API ​
--url http://0.0.0.0:4000/anthropic/v1/messages/count_tokens \
--header "anthropic-beta: token-counting-2024-11-01" \
curl https://api.anthropic.com/v1/messages/count_tokens \
Example 3: Batch Messages ​
--url http://0.0.0.0:4000/anthropic/v1/messages/batches \
--header "anthropic-beta: message-batches-2024-09-24" \
"requests": [
{
"custom_id": "my-first-request",
"params": {
}
},
"custom_id": "my-second-request",
{"role": "user", "content": "Hi again, friend"}
curl https://api.anthropic.com/v1/messages/batches \
Configuration Required for Batch Cost Tracking
For batch passthrough cost tracking to work properly, you need to define the Anthropic model in your proxy_config.yaml :
model_list :
- model_name : claude - sonnet - 4 - 5 - 20250929 # or any alias
litellm_params :
model : anthropic/claude - sonnet - 4 - 5 - 20250929
api_key : os.environ/ANTHROPIC_API_KEY
This ensures the polling mechanism can correctly identify the provider and retrieve batch status for cost calculation.
Advanced ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Anthropic API key, but still letting them use Anthropic endpoints.
Use with Virtual Keys ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
export COHERE_API_KEY=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{}'
Expected Response
...
"key": "sk-1234ewknldferwedojwojw"
--header "Authorization: bearer sk-1234ewknldferwedojwojw" \
Send litellm_metadata (tags, end-user cost tracking) ​
],
"litellm_metadata": {
"tags": ["test-tag-1", "test-tag-2"],
"user": "test-user" # track end-user/customer cost
base_url = "http://0.0.0.0:4000/anthropic" ,
api_key = "sk-anything"
] ,
extra_body = {
"litellm_metadata" : {
"tags" : [ "test-tag-1" , "test-tag-2" ] ,
"user" : "test-user" # track end-user/customer cost
} ,
## OR##
metadata = { # anthropic native param - https://docs.anthropic.com/en/api/messages
"user_id" : "test-user" # track end-user/customer cost
Quick Start
Examples
Example 1: Messages endpoint
Example 2: Token Counting API
Example 3: Batch Messages
Advanced
Use with Virtual Keys
Send litellm_metadata (tags, end-user cost tracking)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
