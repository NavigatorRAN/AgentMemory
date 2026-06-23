# Azure AI Studio | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_ai
- Final URL: https://docs.litellm.ai/docs/providers/azure_ai
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_ai
- Fetched at: 2026-06-23T14:26:59Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models on Azure AI Studio

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models on Azure AI Studio
Usage ​
SDK
PROXY
ENV VAR ​
import os
os . environ [ "AZURE_AI_API_KEY" ] = ""
os . environ [ "AZURE_AI_API_BASE" ] = ""
Example Call ​
from litellm import completion
## set ENV variables
os . environ [ "AZURE_AI_API_KEY" ] = "azure ai key"
os . environ [ "AZURE_AI_API_BASE" ] = "azure ai base url" # e.g.: https://Mistral-large-dfgfj-serverless.eastus2.inference.ai.azure.com/
# predibase llama-3 call
response = completion (
model = "azure_ai/command-r-plus" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
Add models to your config.yaml
model_list :
- model_name : command - r - plus
litellm_params :
model : azure_ai/command - r - plus
api_key : os.environ/AZURE_AI_API_KEY
api_base : os.environ/AZURE_AI_API_BASE
Start the proxy
$ litellm --config /path/to/config.yaml --debug
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
response = client . chat . completions . create (
model = "command-r-plus" ,
messages = [
{
"role" : "system" ,
"content" : "Be a good human!"
} ,
"role" : "user" ,
"content" : "What do you know about earth?"
}
]
print ( response )
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "command-r-plus",
"messages": [
"role": "system",
"content": "Be a good human!"
},
"role": "user",
"content": "What do you know about earth?"
],
}'
Passing additional params - max_tokens, temperature ​
See all litellm.completion supported params here
# !uv add litellm
os . environ [ "AZURE_AI_API_KEY" ] = "azure ai api key"
os . environ [ "AZURE_AI_API_BASE" ] = "azure ai api base"
# command r plus call
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
max_tokens = 20 ,
temperature = 0.5
proxy
max_tokens : 20
temperature : 0.5
$ litellm --config /path/to/config.yaml
model = "mistral" ,
"content" : "what llm are you"
] ,
"model": "mistral",
"content": "what llm are you"
Function Calling ​
# set env
os . environ [ "AZURE_AI_API_KEY" ] = "your-api-key"
os . environ [ "AZURE_AI_API_BASE" ] = "your-api-base"
tools = [
"type" : "function" ,
"function" : {
"name" : "get_current_weather" ,
"description" : "Get the current weather in a given location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state, e.g. San Francisco, CA" ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
"required" : [ "location" ] ,
messages = [ { "role" : "user" , "content" : "What's the weather like in Boston today?" } ]
model = "azure_ai/mistral-large-latest" ,
messages = messages ,
tools = tools ,
tool_choice = "auto" ,
# Add any assertions, here to check response args
assert isinstance ( response . choices [ 0 ] . message . tool_calls [ 0 ] . function . name , str )
assert isinstance (
response . choices [ 0 ] . message . tool_calls [ 0 ] . function . arguments , str
curl http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $YOUR_API_KEY" \
-d '{
"content": "What'\''s the weather like in Boston today?"
"tools": [
"type": "function",
"function": {
"name": "get_current_weather",
"description": "Get the current weather in a given location",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA"
"unit": {
"enum": ["celsius", "fahrenheit"]
"required": ["location"]
"tool_choice": "auto"
Supported Models ​
LiteLLM supports ALL azure ai models. Here's a few examples:
Model Name Function Call Cohere command-r-plus completion(model="azure_ai/command-r-plus", messages) Cohere command-r completion(model="azure_ai/command-r", messages) mistral-large-latest completion(model="azure_ai/mistral-large-latest", messages) AI21-Jamba-Instruct completion(model="azure_ai/ai21-jamba-instruct", messages)
Usage - Azure Anthropic (Azure Foundry Claude) ​
LiteLLM funnels Azure Claude deployments through the azure_ai/ provider so Claude Opus models on Azure Foundry keep working with Tool Search, Effort, streaming, and the rest of the advanced feature set. Point AZURE_AI_API_BASE to https://<resource>.services.ai.azure.com/anthropic (LiteLLM appends /v1/messages automatically) and authenticate with AZURE_AI_API_KEY or an Azure AD token.
LiteLLM Python SDK
LiteLLM Proxy
# Configure Azure credentials
os . environ [ "AZURE_AI_API_KEY" ] = "your-azure-ai-api-key"
os . environ [ "AZURE_AI_API_BASE" ] = "https://my-resource.services.ai.azure.com/anthropic"
model = "azure_ai/claude-opus-4-1" ,
messages = [ { "role" : "user" , "content" : "Explain how Azure Anthropic hosts Claude Opus differently from the public Anthropic API." } ] ,
max_tokens = 1200 ,
temperature = 0.7 ,
stream = True ,
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" , flush = True )
1. Set environment variables
export AZURE_AI_API_KEY="your-azure-ai-api-key"
export AZURE_AI_API_BASE="https://my-resource.services.ai.azure.com/anthropic"
2. Configure the proxy
- model_name : claude - 4 - azure
model : azure_ai/claude - opus - 4 - 1
3. Start LiteLLM
litellm --config /path/to/config.yaml
4. Test the Azure Claude route
--header 'Authorization: Bearer $LITELLM_KEY' \
"model": "claude-4-azure",
"content": "How do I use Claude Opus 4 via Azure Anthropic in LiteLLM?"
"max_tokens": 1024
Rerank Endpoint ​
LiteLLM SDK Usage
LiteLLM Proxy Usage
from litellm import rerank
os . environ [ "AZURE_AI_API_KEY" ] = "sk-.."
os . environ [ "AZURE_AI_API_BASE" ] = "https://.."
query = "What is the capital of the United States?"
documents = [
"Carson City is the capital city of the American state of Nevada." ,
"The Commonwealth of the Northern Mariana Islands is a group of islands in the Pacific Ocean. Its capital is Saipan." ,
"Washington, D.C. is the capital of the United States." ,
"Capital punishment has existed in the United States since before it was a country." ,
response = rerank (
model = "azure_ai/cohere-rerank-v3.5" ,
query = query ,
documents = documents ,
top_n = 3 ,
LiteLLM provides an cohere api compatible /rerank endpoint for Rerank calls.
Setup
Add this to your litellm proxy config.yaml
- model_name : Salesforce/Llama - Rank - V1
model : together_ai/Salesforce/Llama - Rank - V1
api_key : os.environ/TOGETHERAI_API_KEY
- model_name : cohere - rerank - v3.5
model : azure_ai/cohere - rerank - v3.5
Start litellm
# RUNNING on http://0.0.0.0:4000
Test request
curl http://0.0.0.0:4000/rerank \
-H "Authorization: Bearer sk-1234" \
"model": "cohere-rerank-v3.5",
"query": "What is the capital of the United States?",
"documents": [
"Carson City is the capital city of the American state of Nevada.",
"The Commonwealth of the Northern Mariana Islands is a group of islands in the Pacific Ocean. Its capital is Saipan.",
"Washington, D.C. is the capital of the United States.",
"Capital punishment has existed in the United States since before it was a country."
"top_n": 3
Usage
ENV VAR
Example Call
Passing additional params - max_tokens, temperature
Function Calling
Supported Models
Usage - Azure Anthropic (Azure Foundry Claude)
Rerank Endpoint
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
