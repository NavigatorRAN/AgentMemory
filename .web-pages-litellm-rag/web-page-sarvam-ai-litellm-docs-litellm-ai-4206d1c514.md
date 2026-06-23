# Sarvam.ai | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/sarvam
- Final URL: https://docs.litellm.ai/docs/providers/sarvam
- Canonical URL: https://docs.litellm.ai/docs/providers/sarvam
- Fetched at: 2026-06-23T14:28:58Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all the text models from Sarvam ai

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all the text models from Sarvam ai
Usage ​
import os
from litellm import completion
# Set your Sarvam API key
os . environ [ "SARVAM_API_KEY" ] = ""
messages = [ { "role" : "user" , "content" : "Hello" } ]
response = completion (
model = "sarvam/sarvam-m" ,
messages = messages ,
)
print ( response )
Usage with LiteLLM Proxy Server ​
Here's how to call a Sarvam.ai model with the LiteLLM Proxy Server
Modify the config.yaml :
model_list :
- model_name : my - model
litellm_params :
model : sarvam/<your - model - name > # add sarvam/ prefix to route as Sarvam provider
api_key : api - key # api key to send your model
Start the proxy:
$ litellm --config /path/to/config.yaml
Send a request to LiteLLM Proxy Server:
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
response = client . chat . completions . create (
model = "my-model" ,
messages = [
{
"role" : "user" ,
"content" : "what llm are you"
}
] ,
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "my-model",
"messages": [
"role": "user",
"content": "what llm are you"
]
}'
Usage
Usage with LiteLLM Proxy Server
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
