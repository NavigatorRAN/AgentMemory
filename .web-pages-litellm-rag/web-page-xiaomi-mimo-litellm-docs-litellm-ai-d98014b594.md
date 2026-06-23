# Xiaomi MiMo | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/xiaomi_mimo
- Final URL: https://docs.litellm.ai/docs/providers/xiaomi_mimo
- Canonical URL: https://docs.litellm.ai/docs/providers/xiaomi_mimo
- Fetched at: 2026-06-23T14:29:30Z
- Content type: text/html; charset=utf-8

## Description

https://platform.xiaomimimo.com/#/docs

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://platform.xiaomimimo.com/#/docs
tip
We support ALL Xiaomi MiMo models, just set model=xiaomi_mimo/<any-model-on-xiaomi-mimo> as a prefix when sending litellm requests
API Key ​
# env variable
os . environ [ 'XIAOMI_MIMO_API_KEY' ]
Sample Usage ​
from litellm import completion
import os
os . environ [ 'XIAOMI_MIMO_API_KEY' ] = ""
response = completion (
model = "xiaomi_mimo/mimo-v2-flash" ,
messages = [
{
"role" : "user" ,
"content" : "What's the weather like in Boston today in Fahrenheit?" ,
}
] ,
max_tokens = 1024 ,
temperature = 0.3 ,
top_p = 0.95 ,
)
print ( response )
Sample Usage - Streaming ​
stream = True ,
for chunk in response :
print ( chunk )
Usage with LiteLLM Proxy Server ​
Here's how to call a Xiaomi MiMo model with the LiteLLM Proxy Server
Modify the config.yaml
model_list :
- model_name : my - model
litellm_params :
model : xiaomi_mimo/<your - model - name > # add xiaomi_mimo/ prefix to route as Xiaomi MiMo provider
api_key : api - key # api key to send your model
Start the proxy
$ litellm --config /path/to/config.yaml
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
response = client . chat . completions . create (
model = "my-model" ,
"content" : "what llm are you"
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "my-model",
"messages": [
"role": "user",
"content": "what llm are you"
],
}'
Supported Models ​
Model Name Usage mimo-v2-flash completion(model="xiaomi_mimo/mimo-v2-flash", messages)
API Key
Sample Usage
Sample Usage - Streaming
Usage with LiteLLM Proxy Server
Supported Models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
