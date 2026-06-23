# LiveKit xAI Realtime Voice Agent | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/livekit_xai_realtime
- Final URL: https://docs.litellm.ai/docs/tutorials/livekit_xai_realtime
- Canonical URL: https://docs.litellm.ai/docs/tutorials/livekit_xai_realtime
- Fetched at: 2026-06-23T14:34:24Z
- Content type: text/html; charset=utf-8

## Description

Use LiveKit's xAI Grok Voice Agent plugin with LiteLLM Proxy to build low-latency voice AI agents.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use LiveKit's xAI Grok Voice Agent plugin with LiteLLM Proxy to build low-latency voice AI agents.
The LiveKit Agents framework provides tools for building real-time voice and video AI applications. By routing through LiteLLM Proxy, you get unified access to multiple realtime voice providers, cost tracking, rate limiting, and more.
Quick Start ​
1. Install Dependencies ​
uv add livekit-agents[xai]
2. Start LiteLLM Proxy ​
Create a config file with your xAI realtime model:
config.yaml
model_list :
- model_name : grok - voice - agent
litellm_params :
model : xai/grok - voice - latest
api_key : os.environ/XAI_API_KEY
model_info :
mode : realtime
litellm_settings :
drop_params : True
general_settings :
master_key : sk - 1234 # Change this to a secure key
Start the proxy:
litellm --config config.yaml --port 4000
3. Configure LiveKit xAI Plugin ​
Point LiveKit's xAI plugin to your LiteLLM proxy:
from livekit . plugins import xai
# Configure xAI to use LiteLLM proxy
model = xai . realtime . RealtimeModel (
voice = "ara" , # Voice option
api_key = "sk-1234" , # Your LiteLLM proxy master key
base_url = "http://localhost:4000" , # LiteLLM proxy URL
)
Complete Example ​
Here's a complete working example:
Python Client
LiveKit Agent
#!/usr/bin/env python3
"""
Simple xAI realtime voice agent through LiteLLM proxy.
import asyncio
import json
import websockets
PROXY_URL = "ws://localhost:4000/v1/realtime"
API_KEY = "sk-1234"
MODEL = "grok-voice-agent"
async def run_voice_agent ( ) :
"""Connect to xAI realtime API through LiteLLM proxy"""
url = f" { PROXY_URL } ?model= { MODEL } "
headers = { "Authorization" : f"Bearer { API_KEY } " }
async with websockets . connect ( url , extra_headers = headers ) as ws :
# Wait for initial connection event
initial = json . loads ( await ws . recv ( ) )
print ( f"✅ Connected: { initial [ 'type' ] } " )
# Send user message
await ws . send ( json . dumps ( {
"type" : "conversation.item.create" ,
"item" : {
"type" : "message" ,
"role" : "user" ,
"content" : [ {
"type" : "input_text" ,
"text" : "Hello! Tell me a joke."
} ]
}
} ) )
# Request response
"type" : "response.create" ,
"response" : { "modalities" : [ "text" , "audio" ] }
# Collect response
transcript = [ ]
async for message in ws :
event = json . loads ( message )
# Capture text response
if event [ 'type' ] == 'response.output_audio_transcript.delta' :
transcript . append ( event [ 'delta' ] )
print ( event [ 'delta' ] , end = '' , flush = True )
# Done when response completes
elif event [ 'type' ] == 'response.done' :
break
print ( f"\n\n✅ Full response: { '' . join ( transcript ) } " )
if __name__ == "__main__" :
asyncio . run ( run_voice_agent ( ) )
from livekit . agents import Agent , AgentSession , WorkerOptions , cli
class VoiceAgent ( Agent ) :
def __init__ ( self ) :
super ( ) . __init__ (
instructions = "You are a helpful voice assistant." ,
llm = xai . realtime . RealtimeModel (
voice = "ara" ,
api_key = "sk-1234" ,
base_url = "http://localhost:4000" ,
) ,
cli . run_app (
WorkerOptions (
agent_factory = VoiceAgent ,
Running the Example ​
Start LiteLLM Proxy (if not already running):
Run the example :
python your_script.py
Expected Output ​
✅ Connected: session.created
Hello! Here's a joke for you: Why don't scientists trust atoms?
Because they make up everything!
✅ Full response: Hello! Here's a joke for you: Why don't scientists trust atoms? Because they make up everything!
Complete Working Example ​
LiveKit Agent SDK Cookbook
Learn More ​
xAI Realtime API
LiveKit xAI Plugin
LiteLLM Realtime API
Quick Start
1. Install Dependencies
2. Start LiteLLM Proxy
3. Configure LiveKit xAI Plugin
Complete Example
Running the Example
Expected Output
Complete Working Example
Learn More
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
