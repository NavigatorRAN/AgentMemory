# OpenAI-Compatible Endpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/openai_compatible
- Final URL: https://docs.litellm.ai/docs/providers/openai_compatible
- Canonical URL: https://docs.litellm.ai/docs/providers/openai_compatible
- Fetched at: 2026-06-23T14:28:38Z
- Content type: text/html; charset=utf-8

## Description

Selecting openai as the provider routes your request to an OpenAI-compatible endpoint using the upstream

## Extracted Text

Skip to main content
On this page
Copy as Markdown
info
Selecting openai as the provider routes your request to an OpenAI-compatible endpoint using the upstream
official OpenAI Python API library .
This library requires an API key for all requests, either through the api_key parameter
or the OPENAI_API_KEY environment variable.
If you don't want to provide a fake API key in each request, consider using a provider that directly matches your
OpenAI-compatible endpoint, such as hosted_vllm or llamafile .
To call models hosted behind an openai proxy, make 2 changes:
For /chat/completions : Put openai/ in front of your model name, so litellm knows you're trying to call an openai /chat/completions endpoint.
For /completions : Put text-completion-openai/ in front of your model name, so litellm knows you're trying to call an openai /completions endpoint. [NOT REQUIRED for openai/ endpoints called via /v1/completions route].
Do NOT add anything additional to the base url e.g. /v1/embedding . LiteLLM uses the openai-client to make these calls, and that automatically adds the relevant endpoints.
Usage - completion ​
import litellm
import os
response = litellm . completion (
model = "openai/mistral" , # add `openai/` prefix to model so litellm knows to route to OpenAI
api_key = "sk-1234" , # api key to your openai compatible endpoint
api_base = "http://0.0.0.0:4000" , # set API Base of your Custom OpenAI Endpoint
messages = [
{
"role" : "user" ,
"content" : "Hey, how's it going?" ,
}
] ,
)
print ( response )
Usage - embedding ​
response = litellm . embedding (
model = "openai/GPT-J" , # add `openai/` prefix to model so litellm knows to route to OpenAI
input = [ "good morning from litellm" ]
Usage with LiteLLM Proxy Server ​
Here's how to call an OpenAI-Compatible Endpoint with the LiteLLM Proxy Server
Modify the config.yaml
model_list :
- model_name : my - model
litellm_params :
model : openai/<your - model - name > # add openai/ prefix to route as OpenAI provider
api_base : <model - api - base > # add api base for OpenAI compatible provider
api_key : api - key # api key to send your model
If you see Not Found Error when testing make sure your api_base has the /v1 postfix
Example: http://vllm-endpoint.xyz/v1
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
Advanced - Disable System Messages ​
Some VLLM models (e.g. gemma) don't support system messages. To map those requests to 'user' messages, use the supports_system_message flag.
- model_name : my - custom - model
model : openai/google/gemma
api_base : http : //my - custom - base
api_key : ""
supports_system_message : False # 👈 KEY CHANGE
Usage - completion
Usage - embedding
Usage with LiteLLM Proxy Server
Advanced - Disable System Messages
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
