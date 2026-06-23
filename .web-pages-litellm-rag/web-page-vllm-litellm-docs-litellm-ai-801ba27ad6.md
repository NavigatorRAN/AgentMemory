# VLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/vllm
- Final URL: https://docs.litellm.ai/docs/pass_through/vllm
- Canonical URL: https://docs.litellm.ai/docs/pass_through/vllm
- Fetched at: 2026-06-23T14:26:00Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for VLLM - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for VLLM - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ❌ Not supported Logging ✅ works across all integrations End-user Tracking ❌ Tell us if you need this Streaming ✅
Just replace https://my-vllm-server.com with LITELLM_PROXY_BASE_URL/vllm 🚀
Example Usage ​
curl -L -X GET 'http://0.0.0.0:4000/vllm/metrics' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
Supports ALL VLLM Endpoints (including streaming).
Quick Start ​
Let's call the VLLM /score endpoint
Add a VLLM hosted model to your LiteLLM Proxy
info
Works with LiteLLM v1.72.0+.
model_list :
- model_name : "my-vllm-model"
litellm_params :
model : hosted_vllm/vllm - 1.72
api_base : https : //my - vllm - server.com
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
curl -X 'POST' \
'http://0.0.0.0:4000/vllm/score' \
-H 'accept: application/json' \
-d '{
"model": "my-vllm-model",
"encoding_format": "float",
"text_1": "What is the capital of France?",
"text_2": "The capital of France is Paris."
}'
Examples ​
Anything after http://0.0.0.0:4000/vllm is treated as a provider-specific route, and handled accordingly.
Key Changes:
Original Endpoint Replace With https://my-vllm-server.com http://0.0.0.0:4000/vllm (LITELLM_PROXY_BASE_URL=" http://0.0.0.0:4000 ") bearer $VLLM_API_KEY bearer anything (use bearer LITELLM_VIRTUAL_KEY if Virtual Keys are setup on proxy)
Example 1: Metrics endpoint ​
LiteLLM Proxy Call ​
-H 'Authorization: Bearer $LITELLM_VIRTUAL_KEY' \
Direct VLLM API Call ​
curl -L -X GET 'https://my-vllm-server.com/metrics' \
Example 2: Chat API ​
curl -L -X POST 'http://0.0.0.0:4000/vllm/chat/completions' \
"messages": [
{
"role": "user",
"content": "I am going to Paris, what should I see?"
}
],
"max_tokens": 2048,
"temperature": 0.8,
"top_p": 0.1,
"model": "qwen2.5-7b-instruct",
curl -L -X POST 'https://my-vllm-server.com/chat/completions' \
Advanced - Use with Virtual Keys ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Cohere API key, but still letting them use Cohere endpoints.
Usage ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
export HOSTED_VLLM_API_BASE=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-d '{}'
Expected Response
...
"key": "sk-1234ewknldferwedojwojw"
-H 'Authorization: Bearer sk-1234ewknldferwedojwojw' \
--data '{
Quick Start
Examples
Example 1: Metrics endpoint
Example 2: Chat API
Advanced - Use with Virtual Keys
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
