# Lago - Usage Based Billing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/lago
- Final URL: https://docs.litellm.ai/docs/observability/lago
- Canonical URL: https://docs.litellm.ai/docs/observability/lago
- Fetched at: 2026-06-23T14:25:11Z
- Content type: text/html; charset=utf-8

## Description

Lago offers a self-hosted and cloud, metering and usage-based billing solution.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Lago offers a self-hosted and cloud, metering and usage-based billing solution.
Quick Start ​
Use just 1 lines of code, to instantly log your responses across all providers with Lago
Get your Lago API Key
litellm . callbacks = [ "lago" ] # logs cost + usage of successful calls to lago
SDK
PROXY
# uv add lago
import litellm
import os
os . environ [ "LAGO_API_BASE" ] = "" # http://0.0.0.0:3000
os . environ [ "LAGO_API_KEY" ] = ""
os . environ [ "LAGO_API_EVENT_CODE" ] = "" # The billable metric's code - https://docs.getlago.com/guide/events/ingesting-usage#define-a-billable-metric
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set lago as a callback, litellm will send the data to lago
litellm . success_callback = [ "lago" ]
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
] ,
user = "your_customer_id" # 👈 SET YOUR CUSTOMER ID HERE
)
Add to Config.yaml
model_list :
- litellm_params :
api_base : https : //openai - function - calling - workers.tasslexyz.workers.dev/
api_key : my - fake - key
model : openai/my - fake - model
model_name : fake - openai - endpoint
litellm_settings :
callbacks : [ "lago" ] # 👈 KEY CHANGE
Start Proxy
litellm --config /path/to/config.yaml
Test it!
Curl
OpenAI Python SDK
Langchain
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
"user": "your-customer-id" # 👈 SET YOUR CUSTOMER ID
'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create ( model = "gpt-3.5-turbo" , messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
] , user = "my_customer_id" ) # 👈 whatever your customer id is
print ( response )
from langchain . chat_models import ChatOpenAI
from langchain . prompts . chat import (
ChatPromptTemplate ,
HumanMessagePromptTemplate ,
SystemMessagePromptTemplate ,
from langchain . schema import HumanMessage , SystemMessage
os . environ [ "OPENAI_API_KEY" ] = "anything"
chat = ChatOpenAI (
openai_api_base = "http://0.0.0.0:4000" ,
temperature = 0.1 ,
extra_body = {
"user" : "my_customer_id" # 👈 whatever your customer id is
SystemMessage (
content = "You are a helpful assistant that im using to make a test request to."
) ,
HumanMessage (
content = "test from litellm. tell me why it's amazing in 1 sentence"
]
response = chat ( messages )
Advanced - Lagos Logging object ​
This is what LiteLLM will log to Lagos
"event": {
"transaction_id": "<generated_unique_id>",
"external_customer_id": <litellm_end_user_id>, # passed via `user` param in /chat/completion call - https://platform.openai.com/docs/api-reference/chat/create
"code": os.getenv("LAGO_API_EVENT_CODE"),
"properties": {
"input_tokens": <number>,
"output_tokens": <number>,
"model": <string>,
"response_cost": <number>, # 👈 LITELLM CALCULATED RESPONSE COST - https://github.com/BerriAI/litellm/blob/d43f75150a65f91f60dc2c0c9462ce3ffc713c1f/litellm/utils.py#L1473
Quick Start
Advanced - Lagos Logging object
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
