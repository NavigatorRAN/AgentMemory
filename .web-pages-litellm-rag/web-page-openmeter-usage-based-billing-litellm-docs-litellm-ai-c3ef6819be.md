# OpenMeter - Usage-Based Billing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/openmeter
- Final URL: https://docs.litellm.ai/docs/observability/openmeter
- Canonical URL: https://docs.litellm.ai/docs/observability/openmeter
- Fetched at: 2026-06-23T14:25:23Z
- Content type: text/html; charset=utf-8

## Description

OpenMeter is an Open Source Usage-Based Billing solution for AI/Cloud applications. It integrates with Stripe for easy billing.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
OpenMeter is an Open Source Usage-Based Billing solution for AI/Cloud applications. It integrates with Stripe for easy billing.
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with OpenMeter
Get your OpenMeter API Key from https://openmeter.cloud/meters
litellm . callbacks = [ "openmeter" ] # logs cost + usage of successful calls to openmeter
SDK
PROXY
# uv add openmeter
import litellm
import os
# from https://openmeter.cloud
os . environ [ "OPENMETER_API_ENDPOINT" ] = ""
os . environ [ "OPENMETER_API_KEY" ] = ""
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set openmeter as a callback, litellm will send the data to openmeter
litellm . callbacks = [ "openmeter" ]
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Add to Config.yaml
model_list :
- litellm_params :
api_base : https : //openai - function - calling - workers.tasslexyz.workers.dev/
api_key : my - fake - key
model : openai/my - fake - model
model_name : fake - openai - endpoint
litellm_settings :
callbacks : [ "openmeter" ] # 👈 KEY CHANGE
Start Proxy
litellm --config /path/to/config.yaml
Test it!
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data ' {
"model": "fake-openai-endpoint",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
],
'
Quick Start
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
