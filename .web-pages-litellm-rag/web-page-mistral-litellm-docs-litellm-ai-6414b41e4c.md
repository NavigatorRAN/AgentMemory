# Mistral | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/mistral
- Final URL: https://docs.litellm.ai/docs/pass_through/mistral
- Canonical URL: https://docs.litellm.ai/docs/pass_through/mistral
- Fetched at: 2026-06-23T14:25:55Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Mistral - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Mistral - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ❌ Not supported Logging ✅ works across all integrations End-user Tracking ❌ Tell us if you need this Streaming ✅
Just replace https://api.mistral.ai/v1 with LITELLM_PROXY_BASE_URL/mistral 🚀
Example Usage ​
curl -L -X POST 'http://0.0.0.0:4000/mistral/v1/ocr' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "mistral-ocr-latest",
"document": {
"type": "image_url",
"image_url": "https://raw.githubusercontent.com/mistralai/cookbook/refs/heads/main/mistral/ocr/receipt.png"
}
}'
Supports ALL Mistral Endpoints (including streaming).
Quick Start ​
Let's call the Mistral /chat/completions endpoint
Add MISTRAL_API_KEY to your environment
export MISTRAL_API_KEY="sk-1234"
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
Let's call the Mistral /ocr endpoint
Examples ​
Anything after http://0.0.0.0:4000/mistral is treated as a provider-specific route, and handled accordingly.
Key Changes:
Original Endpoint Replace With https://api.mistral.ai/v1 http://0.0.0.0:4000/mistral (LITELLM_PROXY_BASE_URL=" http://0.0.0.0:4000 ") bearer $MISTRAL_API_KEY bearer anything (use bearer LITELLM_VIRTUAL_KEY if Virtual Keys are setup on proxy)
Example 1: OCR endpoint ​
LiteLLM Proxy Call ​
-H 'Authorization: Bearer $LITELLM_API_KEY' \
Direct Mistral API Call ​
curl https://api.mistral.ai/v1/ocr \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${MISTRAL_API_KEY}" \
"type": "document_url",
"document_url": "https://arxiv.org/pdf/2201.04234"
},
"include_image_base64": true
Example 2: Chat API ​
curl -L -X POST 'http://0.0.0.0:4000/mistral/v1/chat/completions' \
-H 'Authorization: Bearer $LITELLM_VIRTUAL_KEY' \
"messages": [
{
"role": "user",
"content": "I am going to Paris, what should I see?"
],
"max_tokens": 2048,
"temperature": 0.8,
"top_p": 0.1,
"model": "mistral-large-latest",
curl -L -X POST 'https://api.mistral.ai/v1/chat/completions' \
Advanced - Use with Virtual Keys ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Mistral API key, but still letting them use Mistral endpoints.
Usage ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
export MISTRAL_API_BASE=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-d '{}'
Expected Response
...
"key": "sk-1234ewknldferwedojwojw"
-H 'Authorization: Bearer sk-1234ewknldferwedojwojw' \
--data '{
"model": "qwen2.5-7b-instruct",
Quick Start
Examples
Example 1: OCR endpoint
Example 2: Chat API
Advanced - Use with Virtual Keys
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
