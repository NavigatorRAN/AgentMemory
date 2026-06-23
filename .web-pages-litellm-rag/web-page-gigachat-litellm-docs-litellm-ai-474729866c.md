# GigaChat | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/gigachat
- Final URL: https://docs.litellm.ai/docs/providers/gigachat
- Canonical URL: https://docs.litellm.ai/docs/providers/gigachat
- Fetched at: 2026-06-23T14:27:53Z
- Content type: text/html; charset=utf-8

## Description

https://developers.sber.ru/docs/ru/gigachat/api/overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://developers.sber.ru/docs/ru/gigachat/api/overview
GigaChat is Sber AI's large language model, Russia's leading LLM provider.
tip
We support ALL GigaChat models, just set model=gigachat/<any-model-on-gigachat> as a prefix when sending litellm requests
warning
GigaChat API uses self-signed SSL certificates. You must pass ssl_verify=False in your requests.
Supported Features ​
Feature Supported Chat Completion Yes Streaming Yes Async Yes Function Calling / Tools Yes Structured Output (JSON Schema) Yes (via function call emulation) Image Input Yes (base64 and URL) - GigaChat-2-Max, GigaChat-2-Pro only Embeddings Yes
API Key ​
GigaChat uses OAuth authentication. Set your credentials as environment variables:
import os
# Required: Set credentials (base64-encoded client_id:client_secret)
os . environ [ 'GIGACHAT_CREDENTIALS' ] = "your-credentials-here"
# Optional: Set scope (default is GIGACHAT_API_PERS for personal use)
os . environ [ 'GIGACHAT_SCOPE' ] = "GIGACHAT_API_PERS" # or GIGACHAT_API_B2B for business
Get your credentials at: https://developers.sber.ru/studio/
Sample Usage ​
from litellm import completion
response = completion (
model = "gigachat/GigaChat-2-Max" ,
messages = [
{ "role" : "user" , "content" : "Hello from LiteLLM!" }
] ,
ssl_verify = False , # Required for GigaChat
)
print ( response )
Sample Usage - Streaming ​
stream = True ,
for chunk in response :
print ( chunk )
Sample Usage - Function Calling ​
tools = [ {
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get weather for a city" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"city" : { "type" : "string" , "description" : "City name" }
} ,
"required" : [ "city" ]
}
} ]
messages = [ { "role" : "user" , "content" : "What's the weather in Moscow?" } ] ,
tools = tools ,
Sample Usage - Structured Output ​
GigaChat supports structured output via JSON schema (emulated through function calling):
messages = [ { "role" : "user" , "content" : "Extract info: John is 30 years old" } ] ,
response_format = {
"type" : "json_schema" ,
"json_schema" : {
"name" : "person" ,
"schema" : {
"name" : { "type" : "string" } ,
"age" : { "type" : "integer" }
print ( response ) # Returns JSON: {"name": "John", "age": 30}
Sample Usage - Image Input ​
GigaChat supports image input via base64 or URL (GigaChat-2-Max and GigaChat-2-Pro only):
model = "gigachat/GigaChat-2-Max" , # Vision requires GigaChat-2-Max or GigaChat-2-Pro
messages = [ {
"role" : "user" ,
"content" : [
{ "type" : "text" , "text" : "What's in this image?" } ,
{ "type" : "image_url" , "image_url" : { "url" : "https://example.com/image.jpg" } }
]
} ] ,
Sample Usage - Embeddings ​
from litellm import embedding
response = embedding (
model = "gigachat/Embeddings" ,
input = [ "Hello world" , "How are you?" ] ,
Usage with LiteLLM Proxy ​
1. Set GigaChat Models on config.yaml ​
model_list :
- model_name : gigachat
litellm_params :
model : gigachat/GigaChat - 2 - Max
api_key : "os.environ/GIGACHAT_CREDENTIALS"
ssl_verify : false
- model_name : gigachat - lite
model : gigachat/GigaChat - 2 - Lite
- model_name : gigachat - embeddings
model : gigachat/Embeddings
2. Start Proxy ​
litellm --config config.yaml
3. Test it ​
Curl Request
OpenAI v1.0.0+
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "gigachat",
"messages": [
{
"role": "user",
"content": "Hello!"
}'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "gigachat" ,
messages = [ { "role" : "user" , "content" : "Hello!" } ]
Supported Models ​
Chat Models ​
Model Name Context Window Vision Description gigachat/GigaChat-2-Lite 128K No Fast, lightweight model gigachat/GigaChat-2-Pro 128K Yes Professional model with vision gigachat/GigaChat-2-Max 128K Yes Maximum capability model
Embedding Models ​
Model Name Max Input Dimensions Description gigachat/Embeddings 512 1024 Standard embeddings gigachat/Embeddings-2 512 1024 Updated embeddings gigachat/EmbeddingsGigaR 4096 2560 High-dimensional embeddings
note
Available models may vary depending on your API access level (personal or business).
Limitations ​
Only one function call per request (GigaChat API limitation)
Maximum 1 image per message, 10 images total per conversation
GigaChat API uses self-signed SSL certificates - ssl_verify=False is required
Supported Features
API Key
Sample Usage
Sample Usage - Streaming
Sample Usage - Function Calling
Sample Usage - Structured Output
Sample Usage - Image Input
Sample Usage - Embeddings
Usage with LiteLLM Proxy
1. Set GigaChat Models on config.yaml
2. Start Proxy
3. Test it
Supported Models
Chat Models
Embedding Models
Limitations
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
