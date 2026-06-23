# Abliteration | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/abliteration
- Final URL: https://docs.litellm.ai/docs/providers/abliteration
- Canonical URL: https://docs.litellm.ai/docs/providers/abliteration
- Fetched at: 2026-06-23T14:26:38Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Abliteration provides an OpenAI-compatible /chat/completions endpoint. Provider Route on LiteLLM abliteration/ Link to Provider Doc Abliteration Base URL https://api.abliteration.ai/v1 Supported Operations /chat/completions
Required Variables ​
Environment Variables
os . environ [ "ABLITERATION_API_KEY" ] = "" # your Abliteration API key
Sample Usage ​
Abliteration Completion
import os
from litellm import completion
os . environ [ "ABLITERATION_API_KEY" ] = ""
response = completion (
model = "abliteration/abliterated-model" ,
messages = [ { "role" : "user" , "content" : "Hello from LiteLLM" } ] ,
)
print ( response )
Sample Usage - Streaming ​
Abliteration Streaming Completion
messages = [ { "role" : "user" , "content" : "Stream a short reply" } ] ,
stream = True ,
for chunk in response :
print ( chunk )
Usage with LiteLLM Proxy Server ​
Add the model to your proxy config:
config.yaml
model_list :
- model_name : abliteration - chat
litellm_params :
model : abliteration/abliterated - model
api_key : os.environ/ABLITERATION_API_KEY
Start the proxy:
litellm --config /path/to/config.yaml
Direct API Usage (Bearer Token) ​
Use the environment variable as a Bearer token against the OpenAI-compatible endpoint:
https://api.abliteration.ai/v1/chat/completions .
cURL
export ABLITERATION_API_KEY=""
curl https://api.abliteration.ai/v1/chat/completions \
-H "Authorization: Bearer ${ABLITERATION_API_KEY}" \
-H "Content-Type: application/json" \
-d '{
"model": "abliterated-model",
"messages": [{"role": "user", "content": "Hello from Abliteration"}]
}'
Python (requests)
import requests
api_key = os . environ [ "ABLITERATION_API_KEY" ]
response = requests . post (
"https://api.abliteration.ai/v1/chat/completions" ,
headers = {
"Authorization" : f"Bearer { api_key } " ,
"Content-Type" : "application/json" ,
} ,
json = {
"model" : "abliterated-model" ,
"messages" : [ { "role" : "user" , "content" : "Hello from Abliteration" } ] ,
timeout = 60 ,
print ( response . json ( ) )
Overview
Required Variables
Sample Usage
Sample Usage - Streaming
Usage with LiteLLM Proxy Server
Direct API Usage (Bearer Token)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
