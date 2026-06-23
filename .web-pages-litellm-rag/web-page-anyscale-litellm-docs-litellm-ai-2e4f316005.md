# Anyscale | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/anyscale
- Final URL: https://docs.litellm.ai/docs/providers/anyscale
- Canonical URL: https://docs.litellm.ai/docs/providers/anyscale
- Fetched at: 2026-06-23T14:26:48Z
- Content type: text/html; charset=utf-8

## Description

https://app.endpoints.anyscale.com/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://app.endpoints.anyscale.com/
API Key ​
# env variable
os . environ [ 'ANYSCALE_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'ANYSCALE_API_KEY' ] = ""
response = completion (
model = "anyscale/mistralai/Mistral-7B-Instruct-v0.1" ,
messages = messages
)
print ( response )
Sample Usage - Streaming ​
messages = messages ,
stream = True
for chunk in response :
print ( chunk )
Supported Models ​
All models listed here https://app.endpoints.anyscale.com/ are supported. We actively maintain the list of models, pricing, token window, etc. here .
Model Name Function Call llama2-7b-chat completion(model="anyscale/meta-llama/Llama-2-7b-chat-hf", messages) llama-2-13b-chat completion(model="anyscale/meta-llama/Llama-2-13b-chat-hf", messages) llama-2-70b-chat completion(model="anyscale/meta-llama/Llama-2-70b-chat-hf", messages) mistral-7b-instruct completion(model="anyscale/mistralai/Mistral-7B-Instruct-v0.1", messages) CodeLlama-34b-Instruct completion(model="anyscale/codellama/CodeLlama-34b-Instruct-hf", messages)
API Key
Sample Usage
Sample Usage - Streaming
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
