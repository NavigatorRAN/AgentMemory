# Comet Opik - Logging + Evals | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/opik_integration
- Final URL: https://docs.litellm.ai/docs/observability/opik_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/opik_integration
- Fetched at: 2026-06-23T14:25:26Z
- Content type: text/html; charset=utf-8

## Description

Opik is an open source end-to-end LLM Evaluation Platform that helps developers track their LLM prompts and responses during both development and production. Users can define and run evaluations to test their LLMs apps before deployment to check for hallucinations, accuracy, context retrevial, and more!

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Opik is an open source end-to-end LLM Evaluation Platform that helps developers track their LLM prompts and responses during both development and production. Users can define and run evaluations to test their LLMs apps before deployment to check for hallucinations, accuracy, context retrevial, and more!
info
We want to learn how we can make the callbacks better! Meet the LiteLLM founders or
join our discord
Pre-Requisites ​
You can learn more about setting up Opik in the Opik quickstart guide . You can also learn more about self-hosting Opik in our self-hosting guide .
Quick Start ​
Use just 4 lines of code, to instantly log your responses across all providers with Opik
Get your Opik API Key by signing up here !
import litellm
litellm . callbacks = [ "opik" ]
Full examples:
SDK
Proxy
import os
# Configure the Opik API key or call opik.configure()
os . environ [ "OPIK_API_KEY" ] = ""
os . environ [ "OPIK_WORKSPACE" ] = ""
# LLM provider API Keys:
os . environ [ "OPENAI_API_KEY" ] = ""
# set "opik" as a callback, litellm will send the data to an Opik server (such as comet.com)
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Why is tracking and evaluation of LLMs important?" }
]
)
If you are using liteLLM within a function tracked using Opik's @track decorator,
you will need provide the current_span_data field in the metadata attribute
so that the LLM call is assigned to the correct trace:
from opik import track
from opik . opik_context import get_current_span_data
@track ( )
def streaming_function ( input ) :
messages = [ { "role" : "user" , "content" : input } ]
messages = messages ,
metadata = {
"opik" : {
"current_span_data" : get_current_span_data ( ) ,
"tags" : [ "streaming-test" ] ,
} ,
}
return response
response = streaming_function ( "Why is tracking and evaluation of LLMs important?" )
chunks = list ( response )
Setup config.yaml
model_list :
- model_name : gpt - 3.5 - turbo - testing
litellm_params :
model : gpt - 3.5 - turbo
api_key : os.environ/OPENAI_API_KEY
litellm_settings :
callbacks : [ "opik" ]
environment_variables :
OPIK_API_KEY : ""
OPIK_WORKSPACE : ""
Run proxy
litellm --config config.yaml
Test it!
curl -L -X POST 'http://0.0.0.0:4000/v1/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "gpt-3.5-turbo-testing",
"messages": [
{
"role": "user",
"content": "What's the weather like in Boston today?"
}'
Opik-Specific Parameters ​
These can be passed inside metadata with the opik key.
Fields ​
project_name - Name of the Opik project to send data to.
current_span_data - The current span data to be used for tracing.
tags - Tags to be used for tracing.
thread_id - The thread id to group together multiple related traces.
Usage ​
"project_name" : "your-opik-project-name" ,
"thread_id" : "your-thread-id"
"model": "gpt-3.5-turbo",
],
"metadata": {
"opik": {
"project_name": "your-opik-project-name",
"current_span_data": "...",
"tags": ["streaming-test"],
"thread_id": "your-thread-id"
},
You can also pass the fields as part of the request header with a opik_* prefix:
curl --location --request POST 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--header 'opik_project_name: your-opik-project-name' \
--header 'opik_thread_id: your-thread-id' \
--header 'opik_tags: ["streaming-test"]' \
--data '{
Automatic Metadata from API Keys ​
In some cases, the requester may be unable or unaware of how to add Opik metadata to their requests. To ensure all Opik-related actions are properly tracked, LiteLLM Proxy can automatically associate metadata from a user-specific API key when none is provided in the request.
How It Works ​
When you create an API key in LiteLLM Proxy, you can attach Opik-specific metadata to the key itself. This metadata will be automatically applied to all requests made with that key, unless the request explicitly provides its own Opik metadata (which takes precedence).
Step 1: Save Opik Metadata to the corresponding Api Key
Go to 'Virtual Keys', click on your choosen api key and edit 'Settings'.
Now save the opik metadata as user api key metdata.
Step 2: Use the key - Opik metadata is automatically applied
-H 'Authorization: Bearer sk-key-from-step-1' \
All requests made with this key will automatically be tracked in the "TestProject" Opik project with the specified tags, without requiring the user to pass metadata in each request.
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Pre-Requisites
Quick Start
Opik-Specific Parameters
Fields
Usage
Automatic Metadata from API Keys
How It Works
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
