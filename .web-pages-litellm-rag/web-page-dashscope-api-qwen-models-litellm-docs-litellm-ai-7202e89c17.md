# Dashscope API (Qwen models) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/dashscope
- Final URL: https://docs.litellm.ai/docs/providers/dashscope
- Canonical URL: https://docs.litellm.ai/docs/providers/dashscope
- Fetched at: 2026-06-23T14:27:34Z
- Content type: text/html; charset=utf-8

## Description

https://dashscope.console.aliyun.com/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://dashscope.console.aliyun.com/
We support ALL Qwen models (from Alibaba Cloud), just set dashscope/ as a prefix when sending completion requests
API Key ​
# env variable
os . environ [ 'DASHSCOPE_API_KEY' ]
API Base ​
You can optionally specify the API base URL depending on your region:
Region API Base International https://dashscope-intl.aliyuncs.com/compatible-mode/v1 China/Beijing https://dashscope.aliyuncs.com/compatible-mode/v1
# Set via environment variable
os . environ [ 'DASHSCOPE_API_BASE' ] = "https://dashscope-intl.aliyuncs.com/compatible-mode/v1"
# Or pass directly in the completion call
response = completion (
model = "dashscope/qwen-turbo" ,
messages = [ { "role" : "user" , "content" : "hello" } ] ,
api_base = "https://dashscope-intl.aliyuncs.com/compatible-mode/v1"
)
Sample Usage ​
from litellm import completion
import os
os . environ [ 'DASHSCOPE_API_KEY' ] = ""
messages = [
{ "role" : "user" , "content" : "hello from litellm" }
] ,
print ( response )
Sample Usage - Streaming ​
stream = True
for chunk in response :
print ( chunk )
All supported Models ​
DashScope Model List
Model Name Function Call qwen-turbo completion(model="dashscope/qwen-turbo", messages) qwen-plus completion(model="dashscope/qwen-plus", messages) qwen-max completion(model="dashscope/qwen-max", messages) qwen-turbo-latest completion(model="dashscope/qwen-turbo-latest", messages) qwen-plus-latest completion(model="dashscope/qwen-plus-latest", messages) qwen-max-latest completion(model="dashscope/qwen-max-latest", messages) qwen-vl-plus completion(model="dashscope/qwen-vl-plus", messages) qwen-vl-max completion(model="dashscope/qwen-vl-max", messages) qwq-32b completion(model="dashscope/qwq-32b", messages) qwq-32b-preview completion(model="dashscope/qwq-32b-preview", messages) qwen3-235b-a22b completion(model="dashscope/qwen3-235b-a22b", messages) qwen3-32b completion(model="dashscope/qwen3-32b", messages) qwen3-30b-a3b completion(model="dashscope/qwen3-30b-a3b", messages)
API Key
API Base
Sample Usage
Sample Usage - Streaming
All supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
