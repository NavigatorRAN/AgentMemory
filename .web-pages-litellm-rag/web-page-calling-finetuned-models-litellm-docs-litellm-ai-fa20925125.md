# Calling Finetuned Models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/guides/finetuned_models
- Final URL: https://docs.litellm.ai/docs/guides/finetuned_models
- Canonical URL: https://docs.litellm.ai/docs/guides/finetuned_models
- Fetched at: 2026-06-23T14:24:06Z
- Content type: text/html; charset=utf-8

## Description

OpenAI

## Extracted Text

Skip to main content
On this page
Copy as Markdown
OpenAI ​
Model Name Function Call fine tuned gpt-4-0613 response = completion(model="ft:gpt-4-0613", messages=messages) fine tuned gpt-4o-2024-05-13 response = completion(model="ft:gpt-4o-2024-05-13", messages=messages) fine tuned gpt-3.5-turbo-0125 response = completion(model="ft:gpt-3.5-turbo-0125", messages=messages) fine tuned gpt-3.5-turbo-1106 response = completion(model="ft:gpt-3.5-turbo-1106", messages=messages) fine tuned gpt-3.5-turbo-0613 response = completion(model="ft:gpt-3.5-turbo-0613", messages=messages)
Vertex AI ​
Fine tuned models on vertex have a numerical model/endpoint id.
SDK
PROXY
from litellm import completion
import os
## set ENV variables
os . environ [ "VERTEXAI_PROJECT" ] = "hardy-device-38811"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
response = completion (
model = "vertex_ai/<your-finetuned-model>" , # e.g. vertex_ai/4965075652664360960
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
base_model = "vertex_ai/gemini-1.5-pro" # the base model - used for routing
)
Add Vertex Credentials to your env
!gcloud auth application-default login
Setup config.yaml
- model_name : finetuned - gemini
litellm_params :
model : vertex_ai/<ENDPOINT_ID >
vertex_project : <PROJECT_ID >
vertex_location : <LOCATION >
model_info :
base_model : vertex_ai/gemini - 1.5 - pro # IMPORTANT
Test it!
curl --location 'https://0.0.0.0:4000/v1/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: <LITELLM_KEY>' \
--data '{"model": "finetuned-gemini" ,"messages":[{"role": "user", "content":[{"type": "text", "text": "hi"}]}]}'
OpenAI
Vertex AI
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
