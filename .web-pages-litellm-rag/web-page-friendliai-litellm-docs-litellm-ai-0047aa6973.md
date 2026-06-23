# FriendliAI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/friendliai
- Final URL: https://docs.litellm.ai/docs/providers/friendliai
- Canonical URL: https://docs.litellm.ai/docs/providers/friendliai
- Fetched at: 2026-06-23T14:27:47Z
- Content type: text/html; charset=utf-8

## Description

We support ALL FriendliAI models, just set friendliai/ as a prefix when sending completion requests

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
We support ALL FriendliAI models, just set friendliai/ as a prefix when sending completion requests
Property Details Description The fastest and most efficient inference engine to build production-ready, compound AI systems. Provider Route on LiteLLM friendliai/ Provider Doc FriendliAI ↗ Supported OpenAI Endpoints /chat/completions , /completions
API Key ​
# env variable
os . environ [ 'FRIENDLI_TOKEN' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'FRIENDLI_TOKEN' ] = ""
response = completion (
model = "friendliai/meta-llama-3.1-8b-instruct" ,
messages = [
{ "role" : "user" , "content" : "hello from litellm" }
] ,
)
print ( response )
Sample Usage - Streaming ​
stream = True
for chunk in response :
print ( chunk )
Supported Models ​
We support ALL FriendliAI AI models, just set friendliai/ as a prefix when sending completion requests
Model Name Function Call meta-llama-3.1-8b-instruct completion(model="friendliai/meta-llama-3.1-8b-instruct", messages) meta-llama-3.1-70b-instruct completion(model="friendliai/meta-llama-3.1-70b-instruct", messages)
API Key
Sample Usage
Sample Usage - Streaming
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
