# Cohere SDK | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/cohere
- Final URL: https://docs.litellm.ai/docs/pass_through/cohere
- Canonical URL: https://docs.litellm.ai/docs/pass_through/cohere
- Fetched at: 2026-06-23T14:25:50Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Cohere - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Cohere - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ✅ Supported for /v1/chat , and /v2/chat Logging ✅ works across all integrations End-user Tracking ❌ Tell us if you need this Streaming ✅
Just replace https://api.cohere.com with LITELLM_PROXY_BASE_URL/cohere 🚀
Example Usage ​
curl --request POST \
--url http://0.0.0.0:4000/cohere/v1/chat \
--header 'accept: application/json' \
--header 'content-type: application/json' \
--header "Authorization: bearer sk-anything" \
--data '{
"chat_history": [
{"role": "USER", "message": "Who discovered gravity?"},
{"role": "CHATBOT", "message": "The man who is widely credited with discovering gravity is Sir Isaac Newton"}
],
"message": "What year was he born?",
"connectors": [{"id": "web-search"}]
}'
Supports ALL Cohere Endpoints (including streaming).
See All Cohere Endpoints
Quick Start ​
Let's call the Cohere /rerank endpoint
Add Cohere API Key to your environment
export COHERE_API_KEY=""
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
--url http://0.0.0.0:4000/cohere/v1/rerank \
"model": "rerank-english-v3.0",
"query": "What is the capital of the United States?",
"top_n": 3,
"documents": ["Carson City is the capital city of the American state of Nevada.",
"The Commonwealth of the Northern Mariana Islands is a group of islands in the Pacific Ocean. Its capital is Saipan.",
"Washington, D.C. (also known as simply Washington or D.C., and officially as the District of Columbia) is the capital of the United States. It is a federal district.",
"Capitalization or capitalisation in English grammar is the use of a capital letter at the start of a word. English usage varies from capitalization in other languages.",
"Capital punishment (the death penalty) has existed in the United States since beforethe United States was a country. As of 2017, capital punishment is legal in 30 of the 50 states."]
Examples ​
Anything after http://0.0.0.0:4000/cohere is treated as a provider-specific route, and handled accordingly.
Key Changes:
Original Endpoint Replace With https://api.cohere.com http://0.0.0.0:4000/cohere (LITELLM_PROXY_BASE_URL=" http://0.0.0.0:4000 ") bearer $CO_API_KEY bearer anything (use bearer LITELLM_VIRTUAL_KEY if Virtual Keys are setup on proxy)
Example 1: Rerank endpoint ​
LiteLLM Proxy Call ​
Direct Cohere API Call ​
--url https://api.cohere.com/v1/rerank \
--header "Authorization: bearer $CO_API_KEY" \
Example 2: Chat API ​
--url https://api.cohere.com/v1/chat \
Example 3: Embedding ​
--url https://api.cohere.com/v1/embed \
"model": "embed-english-v3.0",
"texts": ["hello", "goodbye"],
"input_type": "classification"
Advanced - Use with Virtual Keys ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Cohere API key, but still letting them use Cohere endpoints.
Usage ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{}'
Expected Response
{
...
"key": "sk-1234ewknldferwedojwojw"
}
--header "Authorization: bearer sk-1234ewknldferwedojwojw" \
Quick Start
Examples
Example 1: Rerank endpoint
Example 2: Chat API
Example 3: Embedding
Advanced - Use with Virtual Keys
Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
