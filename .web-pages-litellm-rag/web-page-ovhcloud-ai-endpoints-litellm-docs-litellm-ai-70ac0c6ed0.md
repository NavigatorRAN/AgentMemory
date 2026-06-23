# 🆕 OVHCloud AI Endpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/ovhcloud
- Final URL: https://docs.litellm.ai/docs/providers/ovhcloud
- Canonical URL: https://docs.litellm.ai/docs/providers/ovhcloud
- Fetched at: 2026-06-23T14:28:40Z
- Content type: text/html; charset=utf-8

## Description

Leading French Cloud provider in Europe with data sovereignty and privacy.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Leading French Cloud provider in Europe with data sovereignty and privacy.
You can explore the last models we made available in our catalog .
tip
We support ALL OVHCloud AI Endpoints models, just set model=ovhcloud/<any-model-on-ai-endpoints> as a prefix when sending litellm requests.
For the complete models catalog, visit https://endpoints.ai.cloud.ovh.net/catalog . **
Sample usage ​
Chat completion ​
You can define your API key by setting the OVHCLOUD_API_KEY environment variable or by overriding the api_key parameter. You can generate a key on the OVHCloud Manager .
from litellm import completion
import os
# Our API is free but ratelimited for calls without an API key.
os . environ [ 'OVHCLOUD_API_KEY' ] = "your-api-key"
response = completion (
model = "ovhcloud/Meta-Llama-3_3-70B-Instruct" ,
messages = [
{
"role" : "user" ,
"content" : "Hello, how are you?" ,
}
] ,
max_tokens = 10 ,
stop = [ ] ,
temperature = 0.2 ,
top_p = 0.9 ,
user = "user" ,
api_key = "your-api-key" # Optional if set through the enviromnent variable.
)
print ( response )
Streaming ​
Set the parameter stream to True to stream a response.
api_key = "your-api-key" # Optional if set through the enviromnent variable,
stream = True
for part in response :
Tool Calling ​
import json
def get_current_weather ( location , unit = "celsius" ) :
if unit == "celsius" :
return { "location" : location , "temperature" : "22" , "unit" : "celsius" }
else :
return { "location" : location , "temperature" : "72" , "unit" : "fahrenheit" }
def print_message ( role , content , is_tool_call = False , function_name = None ) :
if role == "user" :
print ( f"🧑 User: { content } " )
elif role == "assistant" :
if is_tool_call :
print ( f"🤖 Assistant: I will call the function ' { function_name } ' to get some informations." )
print ( f"🤖 Assistant: { content } " )
elif role == "tool" :
print ( f"🔧 Tool ( { function_name } ): { content } " )
print ( )
messages = [ { "role" : "user" , "content" : "What's the weather like in Paris?" } ]
model = "ovhcloud/Meta-Llama-3_3-70B-Instruct"
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
"description" : "The city and country, e.g. Montréal, Canada" ,
} ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
"required" : [ "location" ] ,
]
print ( "🌟 Beginning of the conversation" )
# Initial user message
print_message ( "user" , messages [ 0 ] [ "content" ] )
# First request to the model
print ( "📡 Sending first request to the model..." )
model = model ,
messages = messages ,
tools = tools ,
tool_choice = "auto" ,
response_message = response . choices [ 0 ] . message
tool_calls = response_message . tool_calls
if tool_calls :
available_functions = {
"get_current_weather" : get_current_weather ,
# Display the tool calls suggested by the model
for tool_call in tool_calls :
print_message ( "assistant" , "" , is_tool_call = True , function_name = tool_call . function . name )
print ( f" 📋 Arguments: { tool_call . function . arguments } " )
# Add assistant message with tool calls to the conversation history
assistant_message = {
"role" : "assistant" ,
"content" : response_message . content ,
"tool_calls" : [
"id" : tool_call . id ,
"name" : tool_call . function . name ,
"arguments" : tool_call . function . arguments
} for tool_call in tool_calls
messages . append ( assistant_message )
# Execute each tool call and add the results to the conversation history
function_name = tool_call . function . name
function_to_call = available_functions [ function_name ]
function_args = json . loads ( tool_call . function . arguments )
print ( f"🔧 Executing function ' { function_name } '..." )
function_response = function_to_call (
location = function_args . get ( "location" ) ,
unit = function_args . get ( "unit" ) ,
# Display tool response
print_message ( "tool" , json . dumps ( function_response , indent = 2 ) , function_name = function_name )
messages . append ( {
"tool_call_id" : tool_call . id ,
"role" : "tool" ,
"name" : function_name ,
"content" : json . dumps ( function_response ) ,
} )
print ( "📡 Sending second request to the model with results..." )
# Second request with function results
second_response = completion (
messages = messages
# Display final response
final_content = second_response . choices [ 0 ] . message . content
print_message ( "assistant" , final_content )
print ( "❌ No function call detected" )
print_message ( "assistant" , response_message . content )
Vision Example ​
from base64 import b64encode
from mimetypes import guess_type
import litellm
# Auxiliary function to get b64 images
def data_url_from_image ( file_path ) :
mime_type , _ = guess_type ( file_path )
if mime_type is None :
raise ValueError ( "Could not determine MIME type of the file" )
with open ( file_path , "rb" ) as image_file :
encoded_string = b64encode ( image_file . read ( ) ) . decode ( "utf-8" )
data_url = f"data: { mime_type } ;base64, { encoded_string } "
return data_url
response = litellm . completion (
model = "ovhcloud/Mistral-Small-3.2-24B-Instruct-2506" ,
"content" : [
"type" : "text" ,
"text" : "What's in this image?"
"type" : "image_url" ,
"image_url" : {
"url" : data_url_from_image ( "your_image.jpg" ) ,
"format" : "image/jpeg"
stream = False
print ( response . choices [ 0 ] . message . content )
Structured Output ​
"role" : "system" ,
"content" : (
"You are a specialist in extracting structured data from unstructured text. "
"Your task is to identify relevant entities and categories, then format them "
"according to the requested structure."
) ,
"content" : "Room 12 contains books, a desk, and a lamp."
response_format = {
"type" : "json_schema" ,
"json_schema" : {
"title" : "data" ,
"name" : "data_extraction" ,
"schema" : {
"section" : { "type" : "string" } ,
"products" : {
"type" : "array" ,
"items" : { "type" : "string" }
"required" : [ "section" , "products" ] ,
"additionalProperties" : False
"strict" : False
Embeddings ​
from litellm import embedding
response = embedding (
model = "ovhcloud/BGE-M3" ,
input = [ "sample text to embed" , "another sample text to embed" ]
print ( response . data )
Audio Transcription ​
from litellm import transcription
audio_file = open ( "path/to/your/audio.wav" , "rb" )
response = transcription (
model = "ovhcloud/whisper-large-v3-turbo" ,
file = audio_file
print ( response . text )
Usage with LiteLLM Proxy Server ​
Here's how to call a OVHCloud AI Endpoints model with the LiteLLM Proxy Server
Modify the config.yaml
model_list :
- model_name : my - model
litellm_params :
model : ovhcloud/<your - model - name > # add ovhcloud/ prefix to route as OVHCloud provider
api_key : api - key # api key to send your model
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
Sample usage
Chat completion
Streaming
Tool Calling
Vision Example
Structured Output
Embeddings
Audio Transcription
Usage with LiteLLM Proxy Server
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
