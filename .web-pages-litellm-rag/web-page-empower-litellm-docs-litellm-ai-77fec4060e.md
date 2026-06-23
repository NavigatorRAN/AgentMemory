# Empower | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/empower
- Final URL: https://docs.litellm.ai/docs/providers/empower
- Canonical URL: https://docs.litellm.ai/docs/providers/empower
- Fetched at: 2026-06-23T14:27:43Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models on Empower.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models on Empower.
API Keys ​
import os
os . environ [ "EMPOWER_API_KEY" ] = "your-api-key"
Example Usage ​
from litellm import completion
messages = [ { "role" : "user" , "content" : "Write me a poem about the blue sky" } ]
response = completion ( model = "empower/empower-functions" , messages = messages )
print ( response )
Example Usage - Streaming ​
response = completion ( model = "empower/empower-functions" , messages = messages , streaming = True )
for chunk in response :
print ( chunk [ 'choices' ] [ 0 ] [ 'delta' ] )
Example Usage - Automatic Tool Calling ​
messages = [ { "role" : "user" , "content" : "What's the weather like in San Francisco, Tokyo, and Paris?" } ]
tools = [
{
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
} ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
"required" : [ "location" ] ,
}
]
response = completion (
model = "empower/empower-functions-small" ,
messages = messages ,
tools = tools ,
tool_choice = "auto" , # auto is default, but we'll be explicit
)
print ( "\nLLM Response:\n" , response )
Empower Models ​
liteLLM supports non-streaming and streaming requests to all models on https://empower.dev/
Example Empower Usage - Note: liteLLM supports all models deployed on Empower
Empower LLMs - Automatic Tool Using models ​
Model Name Function Call Required OS Variables empower/empower-functions completion('empower/empower-functions', messages) os.environ['TOGETHERAI_API_KEY'] empower/empower-functions-small completion('empower/empower-functions-small', messages) os.environ['TOGETHERAI_API_KEY']
API Keys
Example Usage
Example Usage - Streaming
Example Usage - Automatic Tool Calling
Empower Models
Empower LLMs - Automatic Tool Using models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
