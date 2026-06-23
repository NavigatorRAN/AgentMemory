# Arize AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/arize_integration
- Final URL: https://docs.litellm.ai/docs/observability/arize_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/arize_integration
- Fetched at: 2026-06-23T14:24:55Z
- Content type: text/html; charset=utf-8

## Description

AI Observability and Evaluation Platform

## Extracted Text

Skip to main content
On this page
Copy as Markdown
AI Observability and Evaluation Platform
Pre-Requisites ​
Make an account on Arize AI
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with arize
You can also use the instrumentor option instead of the callback, which you can find here .
litellm . callbacks = [ "arize" ]
import litellm
import os
os . environ [ "ARIZE_SPACE_KEY" ] = ""
os . environ [ "ARIZE_API_KEY" ] = ""
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set arize as a callback, litellm will send the data to arize
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Using with LiteLLM Proxy ​
Setup config.yaml
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/fake
api_key : fake - key
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
litellm_settings :
callbacks : [ "arize" ]
general_settings :
master_key : "sk-1234" # can also be set as an environment variable
environment_variables :
ARIZE_SPACE_ID : "d0*****"
ARIZE_API_KEY : "141a****"
ARIZE_ENDPOINT : "https://otlp.arize.com/v1" # OPTIONAL - your custom arize GRPC api endpoint
ARIZE_HTTP_ENDPOINT : "https://otlp.arize.com/v1" # OPTIONAL - your custom arize HTTP api endpoint. Set either this or ARIZE_ENDPOINT or Neither (defaults to https://otlp.arize.com/v1 on grpc)
ARIZE_PROJECT_NAME : "my-litellm-project" # OPTIONAL - sets the arize project name
Start the proxy
litellm --config config.yaml
Test it!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{ "model": "gpt-4", "messages": [{"role": "user", "content": "Hi 👋 - i'm openai"}]}'
Pass Arize Space/Key per-request ​
Supported parameters:
arize_api_key
arize_space_key (deprecated, use arize_space_id instead)
arize_space_id
SDK
PROXY
] ,
arize_api_key = os . getenv ( "ARIZE_API_KEY" ) ,
arize_space_id = os . getenv ( "ARIZE_SPACE_ID" ) ,
litellm --config /path/to/config.yaml
CURL
OpenAI Python
-d '{
"model": "gpt-4",
"messages": [{"role": "user", "content": "Hi 👋 - i'm openai"}],
"arize_api_key": "ARIZE_API_KEY",
"arize_space_id": "ARIZE_SPACE_ID"
}'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create (
{
"role" : "user" ,
"content" : "this is a test request, write a short poem"
}
extra_body = {
"arize_api_key" : "ARIZE_API_KEY" ,
"arize_space_id" : "ARIZE_SPACE_ID"
print ( response )
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
Using with LiteLLM Proxy
Pass Arize Space/Key per-request
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
