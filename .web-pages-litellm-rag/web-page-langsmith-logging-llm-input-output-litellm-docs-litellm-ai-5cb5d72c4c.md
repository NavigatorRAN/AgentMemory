# Langsmith - Logging LLM Input/Output | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/langsmith_integration
- Final URL: https://docs.litellm.ai/docs/observability/langsmith_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/langsmith_integration
- Fetched at: 2026-06-23T14:25:13Z
- Content type: text/html; charset=utf-8

## Description

An all-in-one developer platform for every step of the application lifecycle

## Extracted Text

Skip to main content
On this page
Copy as Markdown
An all-in-one developer platform for every step of the application lifecycle
https://smith.langchain.com/
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
uv add litellm
Quick Start ​
Use just 2 lines of code, to instantly log your responses across all providers with Langsmith
SDK
LiteLLM Proxy
litellm . callbacks = [ "langsmith" ]
import litellm
import os
os . environ [ "LANGSMITH_API_KEY" ] = ""
os . environ [ "LANGSMITH_PROJECT" ] = "" # defaults to litellm-completion
os . environ [ "LANGSMITH_DEFAULT_RUN_NAME" ] = "" # defaults to LLMRun
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
# set langsmith as a callback, litellm will send the data to langsmith
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : openai/gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "langsmith" ]
Start LiteLLM Proxy
litellm --config /path/to/config.yaml
Test it!
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-eWkpOhYaHiuIZV-29JDeTQ' \
-d '{
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "Hey, how are you?"
}
],
"max_completion_tokens": 250
}'
Advanced ​
Local Testing - Control Batch Size ​
Set the size of the batch that Langsmith will process at a time, default is 512.
Set langsmith_batch_size=1 when testing locally, to see logs land quickly.
litellm . langsmith_batch_size = 1 # 👈 KEY CHANGE
print ( response )
langsmith_batch_size : 1
Set Langsmith fields ​
litellm . success_callback = [ "langsmith" ]
] ,
metadata = {
"run_name" : "litellmRUN" , # langsmith run name
"project_name" : "litellm-completion" , # langsmith project name
"run_id" : "497f6eca-6276-4993-bfeb-53cbbbba6f08" , # langsmith run id
"parent_run_id" : "f8faf8c1-9778-49a4-9004-628cdb0047e5" , # langsmith run parent run id
"trace_id" : "df570c03-5a03-4cea-8df0-c162d05127ac" , # langsmith run trace id
"session_id" : "1ffd059c-17ea-40a8-8aef-70fd0307db82" , # langsmith run session id
"tags" : [ "model1" , "prod-2" ] , # langsmith run tags
"metadata" : { # langsmith run metadata
"key1" : "value1"
} ,
"dotted_order" : "20240429T004912090000Z497f6eca-6276-4993-bfeb-53cbbbba6f08"
Make LiteLLM Proxy use Custom LANGSMITH_BASE_URL ​
If you're using a custom LangSmith instance, you can set the
LANGSMITH_BASE_URL environment variable to point to your instance.
For example, you can make LiteLLM Proxy log to a local LangSmith instance with
this config:
success_callback : [ "langsmith" ]
environment_variables :
LANGSMITH_BASE_URL : "http://localhost:1984"
LANGSMITH_PROJECT : "litellm-proxy"
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
Advanced
Local Testing - Control Batch Size
Set Langsmith fields
Make LiteLLM Proxy use Custom LANGSMITH_BASE_URL
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
