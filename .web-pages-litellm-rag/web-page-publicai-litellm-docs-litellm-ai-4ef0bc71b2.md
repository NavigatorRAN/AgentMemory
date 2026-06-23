# PublicAI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/publicai
- Final URL: https://docs.litellm.ai/docs/providers/publicai
- Canonical URL: https://docs.litellm.ai/docs/providers/publicai
- Fetched at: 2026-06-23T14:28:47Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description PublicAI provides large language models including essential models like the swiss-ai apertus model. Provider Route on LiteLLM publicai/ Link to Provider Doc PublicAI ↗ Base URL https://platform.publicai.co/ Supported Operations /chat/completions
https://platform.publicai.co/
We support ALL PublicAI models, just set publicai/ as a prefix when sending completion requests
Required Variables ​
Environment Variables
os . environ [ "PUBLICAI_API_KEY" ] = "" # your PublicAI API key
You can overwrite the base url with:
os.environ["PUBLICAI_API_BASE"] = "https://platform.publicai.co/v1"
Usage - LiteLLM Python SDK ​
Non-streaming ​
PublicAI Non-streaming Completion
import os
import litellm
from litellm import completion
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# PublicAI call
response = completion (
model = "publicai/swiss-ai/apertus-8b-instruct" ,
messages = messages
)
print ( response )
Streaming ​
PublicAI Streaming Completion
# PublicAI call with streaming
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : swiss - ai - apertus - 8b
litellm_params :
model : publicai/swiss - ai/apertus - 8b - instruct
api_key : os.environ/PUBLICAI_API_KEY
- model_name : swiss - ai - apertus - 70b
model : publicai/swiss - ai/apertus - 70b - instruct
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
PublicAI via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
model = "swiss-ai-apertus-8b" ,
messages = [ { "role" : "user" , "content" : "hello from litellm" } ]
print ( response . choices [ 0 ] . message . content )
PublicAI via Proxy - Streaming
# Streaming response
messages = [ { "role" : "user" , "content" : "hello from litellm" } ] ,
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
PublicAI via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/swiss-ai-apertus-8b" ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
PublicAI via Proxy - LiteLLM SDK Streaming
# Configure LiteLLM to use your proxy with streaming
api_key = "your-proxy-api-key" ,
if hasattr ( chunk . choices [ 0 ] , 'delta' ) and chunk . choices [ 0 ] . delta . content is not None :
PublicAI via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "swiss-ai-apertus-8b",
"messages": [{"role": "user", "content": "hello from litellm"}]
}'
PublicAI via Proxy - cURL Streaming
"messages": [{"role": "user", "content": "hello from litellm"}],
"stream": true
For more detailed information on using the LiteLLM Proxy, see the LiteLLM Proxy documentation .
Overview
Required Variables
Usage - LiteLLM Python SDK
Non-streaming
Streaming
Usage - LiteLLM Proxy
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
