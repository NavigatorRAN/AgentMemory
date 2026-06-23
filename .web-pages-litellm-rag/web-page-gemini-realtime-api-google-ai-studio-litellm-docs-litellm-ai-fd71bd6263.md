# Gemini Realtime API - Google AI Studio | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/google_ai_studio/realtime
- Final URL: https://docs.litellm.ai/docs/providers/google_ai_studio/realtime
- Canonical URL: https://docs.litellm.ai/docs/providers/google_ai_studio/realtime
- Fetched at: 2026-06-23T14:27:59Z
- Content type: text/html; charset=utf-8

## Description

| Feature | Description | Comments |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Feature Description Comments Proxy ✅ SDK ⌛️ Experimental access via litellm._arealtime .
Proxy Usage ​
Add model to config ​
model_list :
- model_name : "gemini-2.0-flash"
litellm_params :
model : gemini/gemini - 2.0 - flash - live - 001
model_info :
mode : realtime
Start proxy ​
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:8000
Test ​
Run this script using node - node test.js
// test.js
const WebSocket = require ( "ws" ) ;
const url = "ws://0.0.0.0:4000/v1/realtime?model=openai-gemini-2.0-flash" ;
const ws = new WebSocket ( url , {
headers : {
"api-key" : ` ${ LITELLM_API_KEY } ` ,
"OpenAI-Beta" : "realtime=v1" ,
} ,
} ) ;
ws . on ( "open" , function open ( ) {
console . log ( "Connected to server." ) ;
ws . send ( JSON . stringify ( {
type : "response.create" ,
response : {
modalities : [ "text" ] ,
instructions : "Please assist the user." ,
}
} ) ) ;
ws . on ( "message" , function incoming ( message ) {
console . log ( JSON . parse ( message . toString ( ) ) ) ;
ws . on ( "error" , function handleError ( error ) {
console . error ( "Error: " , error ) ;
Tool Calling ​
import asyncio
import json
import websockets
PROXY_URL = "ws://localhost:4000/v1/realtime?model=gemini-live"
TOOLS = [
{
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather for a location." ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : { "type" : "string" } ,
"unit" : { "type" : "string" , "enum" : [ "fahrenheit" , "celsius" ] } ,
"required" : [ "location" ] ,
]
def get_weather ( location : str , unit : str = "fahrenheit" ) - > dict :
return {
"location" : location ,
"temperature" : 72 if unit == "fahrenheit" else 22 ,
"unit" : unit ,
"conditions" : "sunny" ,
TOOL_FUNCTIONS = { "get_weather" : get_weather }
async def main ( ) :
async with websockets . connect (
PROXY_URL ,
additional_headers = {
"Authorization" : "Bearer sk-1234" ,
"X-Serverless-Authorization" : "Bearer sk-1234" ,
) as ws :
_ = json . loads ( await ws . recv ( ) ) # session.created
# Required for tool calling: send tools in session.update
await ws . send (
json . dumps (
"type" : "session.update" ,
"session" : {
"instructions" : "Use get_weather for weather questions." ,
"modalities" : [ "audio" ] ,
"tools" : TOOLS ,
)
"type" : "conversation.item.create" ,
"item" : {
"type" : "message" ,
"role" : "user" ,
"content" : [
{ "type" : "input_text" , "text" : "What's the weather in San Francisco?" }
] ,
await ws . send ( json . dumps ( { "type" : "response.create" } ) )
async for raw in ws :
ev = json . loads ( raw )
t = ev . get ( "type" , "" )
if t == "response.text.delta" :
print ( ev . get ( "delta" , "" ) , end = "" , flush = True )
elif t == "response.function_call_arguments.done" :
fn_name = ev . get ( "name" , "" )
call_id = ev . get ( "call_id" , "" )
args = json . loads ( ev . get ( "arguments" , "{}" ) )
result = TOOL_FUNCTIONS [ fn_name ] ( ** args )
"type" : "function_call_output" ,
"call_id" : call_id ,
"output" : json . dumps ( result ) ,
elif t == "response.done" :
print ( "\n[done]" )
break
elif t == "error" :
print ( ev )
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Config + run ​
- model_name : gemini - live
model : gemini/gemini - 2.5 - flash - native - audio - latest
api_key : os.environ/GEMINI_API_KEY
litellm_settings :
# Required for tool calling with Gemini Live:
# defer setup until client sends session.update (with tools)
gemini_live_defer_setup : true
litellm --config config.yaml --port 4000
python test_realtime_tool_calling.py
Limitations ​
Does not support audio transcription.
Session config updates after the first session.update are ignored (Gemini setup is one-time per connection).
Precaution ​
Tool calling will not work unless you send session.update first with your tools .
Send it as the first config message for that websocket session.
gemini_live_defer_setup defaults to false for backward compatibility.
Supported OpenAI Realtime Events ​
session.created
response.created
response.output_item.added
conversation.item.created
response.content_part.added
response.text.delta
response.audio.delta
response.text.done
response.audio.done
response.content_part.done
response.output_item.done
response.done
Supported Session Params ​
More Examples ​
Gemini Realtime API with Audio Input/Output ​
Proxy Usage
Add model to config
Start proxy
Test
Tool Calling
Config + run
Limitations
Precaution
Supported OpenAI Realtime Events
Supported Session Params
More Examples
Gemini Realtime API with Audio Input/Output
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
