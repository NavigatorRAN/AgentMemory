# Amazon Nova | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/amazon_nova
- Final URL: https://docs.litellm.ai/docs/providers/amazon_nova
- Canonical URL: https://docs.litellm.ai/docs/providers/amazon_nova
- Fetched at: 2026-06-23T14:26:43Z
- Content type: text/html; charset=utf-8

## Description

| Property | Details |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Property Details Description Amazon Nova is a family of foundation models built by Amazon that deliver frontier intelligence and industry-leading price performance. Provider Route on LiteLLM amazon_nova/ Provider Doc Amazon Nova ↗ Supported OpenAI Endpoints /chat/completions , v1/responses Other Supported Endpoints v1/messages , /generateContent
Authentication ​
Amazon Nova uses API key authentication. You can obtain your API key from the Amazon Nova developer console ↗ .
export AMAZON_NOVA_API_KEY="your-api-key"
Usage ​
SDK
PROXY
import os
from litellm import completion
# Set your API key
os . environ [ "AMAZON_NOVA_API_KEY" ] = "your-api-key"
response = completion (
model = "amazon_nova/nova-micro-v1" ,
messages = [
{ "role" : "system" , "content" : "You are a helpful assistant" } ,
{ "role" : "user" , "content" : "Hello, how are you?" }
]
)
print ( response )
1. Setup config.yaml ​
model_list :
- model_name : amazon - nova - micro
litellm_params :
model : amazon_nova/nova - micro - v1
api_key : os.environ/AMAZON_NOVA_API_KEY
2. Start the proxy ​
litellm --config /path/to/config.yaml
3. Test it ​
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "amazon-nova-micro",
"messages": [
{
"role": "user",
"content": "Hello, how are you?"
}
}'
Supported Models ​
Model Name Usage Context Window Nova Micro completion(model="amazon_nova/nova-micro-v1", messages=messages) 128K tokens Nova Lite completion(model="amazon_nova/nova-lite-v1", messages=messages) 300K tokens Nova Pro completion(model="amazon_nova/nova-pro-v1", messages=messages) 300K tokens Nova Premier completion(model="amazon_nova/nova-premier-v1", messages=messages) 1M tokens
Usage - Streaming ​
{ "role" : "user" , "content" : "Tell me about machine learning" }
] ,
stream = True
for chunk in response :
print ( chunk . choices [ 0 ] . delta . content or "" , end = "" )
"content": "Tell me about machine learning"
],
"stream": true
Usage - Function Calling / Tool Usage ​
tools = [
"type" : "function" ,
"function" : {
"name" : "getCurrentWeather" ,
"description" : "Get the current weather in a given city" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "City and country e.g. San Francisco, CA"
} ,
"required" : [ "location" ]
{ "role" : "user" , "content" : "What's the weather like in San Francisco?" }
tools = tools
"content": "What'\''s the weather like in San Francisco?"
"tools": [
"type": "function",
"function": {
"name": "getCurrentWeather",
"description": "Get the current weather in a given city",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "City and country e.g. San Francisco, CA"
},
"required": ["location"]
Set temperature, top_p, etc. ​
model = "amazon_nova/nova-pro-v1" ,
{ "role" : "user" , "content" : "Write a creative story" }
temperature = 0.8 ,
max_tokens = 500 ,
top_p = 0.9
Set on yaml
- model_name : amazon - nova - pro
model : amazon_nova/nova - pro - v1
temperature : 0.8
max_tokens : 500
top_p : 0.9
Set on request
"model": "amazon-nova-pro",
"content": "Write a creative story"
"temperature": 0.8,
"max_tokens": 500,
"top_p": 0.9
Model Comparison ​
Model Best For Speed Cost Context Nova Micro Simple tasks, high throughput Fastest Lowest 128K Nova Lite Balanced performance Fast Low 300K Nova Pro Complex reasoning Medium Medium 300K Nova Premier Most advanced tasks Slower Higher 1M
Error Handling ​
Common error codes and their meanings:
401 Unauthorized : Invalid API key
429 Too Many Requests : Rate limit exceeded
400 Bad Request : Invalid request format
500 Internal Server Error : Service temporarily unavailable
Authentication
Usage
1. Setup config.yaml
2. Start the proxy
3. Test it
Supported Models
Usage - Streaming
Usage - Function Calling / Tool Usage
Set temperature, top_p, etc.
Model Comparison
Error Handling
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
