# Cloudflare Workers AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/cloudflare_workers
- Final URL: https://docs.litellm.ai/docs/providers/cloudflare_workers
- Canonical URL: https://docs.litellm.ai/docs/providers/cloudflare_workers
- Fetched at: 2026-06-23T14:27:28Z
- Content type: text/html; charset=utf-8

## Description

https://developers.cloudflare.com/workers-ai/models/text-generation/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://developers.cloudflare.com/workers-ai/models/text-generation/
API Key ​
# env variable
os . environ [ 'CLOUDFLARE_API_KEY' ] = "3dnSGlxxxx"
os . environ [ 'CLOUDFLARE_ACCOUNT_ID' ] = "03xxxxx"
Sample Usage ​
from litellm import completion
import os
response = completion (
model = "cloudflare/@cf/meta/llama-2-7b-chat-int8" ,
messages = [
{ "role" : "user" , "content" : "hello from litellm" }
] ,
)
print ( response )
Sample Usage - Streaming ​
model = "cloudflare/@hf/thebloke/codellama-7b-instruct-awq" ,
stream = True
for chunk in response :
print ( chunk )
Supported Models ​
All models listed here https://developers.cloudflare.com/workers-ai/models/text-generation/ are supported
Model Name Function Call @cf/meta/llama-2-7b-chat-fp16 completion(model="mistral/mistral-tiny", messages) @cf/meta/llama-2-7b-chat-int8 completion(model="mistral/mistral-small", messages) @cf/mistral/mistral-7b-instruct-v0.1 completion(model="mistral/mistral-medium", messages) @hf/thebloke/codellama-7b-instruct-awq completion(model="codellama/codellama-medium", messages)
API Key
Sample Usage
Sample Usage - Streaming
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
