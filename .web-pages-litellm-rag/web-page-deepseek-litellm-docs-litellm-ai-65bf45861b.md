# Deepseek | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/deepseek
- Final URL: https://docs.litellm.ai/docs/providers/deepseek
- Canonical URL: https://docs.litellm.ai/docs/providers/deepseek
- Fetched at: 2026-06-23T14:27:39Z
- Content type: text/html; charset=utf-8

## Description

https://deepseek.com/

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://deepseek.com/
We support ALL Deepseek models, just set deepseek/ as a prefix when sending completion requests
API Key ​
# env variable
os . environ [ 'DEEPSEEK_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'DEEPSEEK_API_KEY' ] = ""
response = completion (
model = "deepseek/deepseek-chat" ,
messages = [
{ "role" : "user" , "content" : "hello from litellm" }
] ,
)
print ( response )
Sample Usage - Streaming ​
stream = True
for chunk in response :
print ( chunk )
Supported Models - ALL Deepseek Models Supported! ​
Model Name Function Call deepseek-chat completion(model="deepseek/deepseek-chat", messages) deepseek-coder completion(model="deepseek/deepseek-coder", messages)
Reasoning Models ​
Model Name Function Call deepseek-reasoner completion(model="deepseek/deepseek-reasoner", messages)
Thinking / Reasoning Mode ​
Enable thinking mode for DeepSeek reasoner models using thinking or reasoning_effort parameters:
thinking param
reasoning_effort param
resp = completion (
model = "deepseek/deepseek-reasoner" ,
messages = [ { "role" : "user" , "content" : "What is 2+2?" } ] ,
thinking = { "type" : "enabled" } ,
print ( resp . choices [ 0 ] . message . reasoning_content ) # Model's reasoning
print ( resp . choices [ 0 ] . message . content ) # Final answer
reasoning_effort = "medium" , # low, medium, high all map to thinking enabled
note
DeepSeek only supports {"type": "enabled"} - unlike Anthropic, it doesn't support budget_tokens . Any reasoning_effort value other than "none" enables thinking mode.
Basic Usage ​
SDK
PROXY
messages = [ { "role" : "user" , "content" : "Tell me a joke." } ] ,
print (
resp . choices [ 0 ] . message . reasoning_content
Setup config.yaml
model_list :
- model_name : deepseek - reasoner
litellm_params :
model : deepseek/deepseek - reasoner
api_key : os.environ/DEEPSEEK_API_KEY
Run proxy
python litellm/proxy/main.py
Test it!
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "deepseek-reasoner",
"messages": [
{
"role": "user",
"content": [
"type": "text",
"text": "Hi, how are you ?"
}
]
}'
API Key
Sample Usage
Sample Usage - Streaming
Supported Models - ALL Deepseek Models Supported!
Reasoning Models
Thinking / Reasoning Mode
Basic Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
