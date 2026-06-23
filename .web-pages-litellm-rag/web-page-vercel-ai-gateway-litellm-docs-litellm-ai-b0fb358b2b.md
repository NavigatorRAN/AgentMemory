# Vercel AI Gateway | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vercel_ai_gateway
- Final URL: https://docs.litellm.ai/docs/providers/vercel_ai_gateway
- Canonical URL: https://docs.litellm.ai/docs/providers/vercel_ai_gateway
- Fetched at: 2026-06-23T14:29:09Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Vercel AI Gateway provides a unified interface to access multiple AI providers through a single endpoint, with built-in caching, rate limiting, and analytics. Provider Route on LiteLLM vercel_ai_gateway/ Link to Provider Doc Vercel AI Gateway Documentation ↗ Base URL https://ai-gateway.vercel.sh/v1 Supported Operations /chat/completions , /embeddings , /models
https://vercel.com/docs/ai-gateway
We support ALL models available through Vercel AI Gateway, just set vercel_ai_gateway/ as a prefix when sending completion requests
Required Variables ​
Environment Variables
os . environ [ "VERCEL_AI_GATEWAY_API_KEY" ] = "" # your Vercel AI Gateway API key
# OR
os . environ [ "VERCEL_OIDC_TOKEN" ] = "" # your Vercel OIDC token for authentication
Optional Variables ​
os . environ [ "VERCEL_SITE_URL" ] = "" # your site url
os . environ [ "VERCEL_APP_NAME" ] = "" # your app name
Note: see the Vercel AI Gateway docs for instructions on obtaining a key.
Usage - LiteLLM Python SDK ​
Non-streaming ​
Vercel AI Gateway Non-streaming Completion
import os
import litellm
from litellm import completion
os . environ [ "VERCEL_AI_GATEWAY_API_KEY" ] = "your-api-key"
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# Vercel AI Gateway call
response = completion (
model = "vercel_ai_gateway/openai/gpt-4o" ,
messages = messages
)
print ( response )
Streaming ​
Vercel AI Gateway Streaming Completion
# Vercel AI Gateway call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Embeddings ​
Vercel AI Gateway Embeddings
from litellm import embedding
# Vercel AI Gateway embedding call
response = embedding (
model = "vercel_ai_gateway/openai/text-embedding-3-small" ,
input = "Hello world"
print ( response . data [ 0 ] [ "embedding" ] [ : 5 ] ) # Print first 5 dimensions
You can also specify the dimensions parameter:
Vercel AI Gateway Embeddings with Dimensions
input = [ "Hello world" , "Goodbye world" ] ,
dimensions = 768
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : gpt - 4o - gateway
litellm_params :
model : vercel_ai_gateway/openai/gpt - 4o
api_key : os.environ/VERCEL_AI_GATEWAY_API_KEY
- model_name : claude - 4 - sonnet - gateway
model : vercel_ai_gateway/anthropic/claude - 4 - sonnet
- model_name : text - embedding - 3 - small - gateway
model : vercel_ai_gateway/openai/text - embedding - 3 - small
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
Vercel AI Gateway via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
model = "gpt-4o-gateway" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ]
print ( response . choices [ 0 ] . message . content )
Vercel AI Gateway via Proxy - Streaming
# Streaming response
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
Vercel AI Gateway via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/gpt-4o-gateway" ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
Vercel AI Gateway via Proxy - LiteLLM SDK Streaming
# Configure LiteLLM to use your proxy with streaming
api_key = "your-proxy-api-key" ,
if hasattr ( chunk . choices [ 0 ] , 'delta' ) and chunk . choices [ 0 ] . delta . content is not None :
Vercel AI Gateway via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "gpt-4o-gateway",
"messages": [{"role": "user", "content": "Hello, how are you?"}]
}'
Vercel AI Gateway via Proxy - cURL Streaming
"messages": [{"role": "user", "content": "Hello, how are you?"}],
"stream": true
For more detailed information on using the LiteLLM Proxy, see the LiteLLM Proxy documentation .
Additional Resources ​
Vercel AI Gateway Documentation
Overview
Required Variables
Optional Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Embeddings
Usage - LiteLLM Proxy
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
