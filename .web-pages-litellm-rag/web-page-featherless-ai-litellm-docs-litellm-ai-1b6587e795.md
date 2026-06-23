# Featherless AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/featherless_ai
- Final URL: https://docs.litellm.ai/docs/providers/featherless_ai
- Canonical URL: https://docs.litellm.ai/docs/providers/featherless_ai
- Fetched at: 2026-06-23T14:27:45Z
- Content type: text/html; charset=utf-8

## Description

https://featherless.ai/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://featherless.ai/
tip
**We support ALL Featherless AI models, just set model=featherless_ai/<any-model-on-featherless> as a prefix when sending litellm requests. For the complete supported model list, visit https://featherless.ai/models **
API Key ​
# env variable
os . environ [ 'FEATHERLESS_AI_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'FEATHERLESS_AI_API_KEY' ] = ""
response = completion (
model = "featherless_ai/featherless-ai/Qwerky-72B" ,
messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ]
)
Sample Usage - Streaming ​
messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ] ,
stream = True
for chunk in response :
print ( chunk )
Chat Models ​
Model Name Function Call featherless-ai/Qwerky-72B completion(model="featherless_ai/featherless-ai/Qwerky-72B", messages) featherless-ai/Qwerky-QwQ-32B completion(model="featherless_ai/featherless-ai/Qwerky-QwQ-32B", messages) Qwen/Qwen2.5-72B-Instruct completion(model="featherless_ai/Qwen/Qwen2.5-72B-Instruct", messages) all-hands/openhands-lm-32b-v0.1 completion(model="featherless_ai/all-hands/openhands-lm-32b-v0.1", messages) Qwen/Qwen2.5-Coder-32B-Instruct completion(model="featherless_ai/Qwen/Qwen2.5-Coder-32B-Instruct", messages) deepseek-ai/DeepSeek-V3-0324 completion(model="featherless_ai/deepseek-ai/DeepSeek-V3-0324", messages) mistralai/Mistral-Small-24B-Instruct-2501 completion(model="featherless_ai/mistralai/Mistral-Small-24B-Instruct-2501", messages) mistralai/Mistral-Nemo-Instruct-2407 completion(model="featherless_ai/mistralai/Mistral-Nemo-Instruct-2407", messages) ProdeusUnity/Stellar-Odyssey-12b-v0.0 completion(model="featherless_ai/ProdeusUnity/Stellar-Odyssey-12b-v0.0", messages)
API Key
Sample Usage
Sample Usage - Streaming
Chat Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
