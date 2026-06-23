# CometAPI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/cometapi
- Final URL: https://docs.litellm.ai/docs/providers/cometapi
- Canonical URL: https://docs.litellm.ai/docs/providers/cometapi
- Fetched at: 2026-06-23T14:27:31Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all AI models from CometAPI. CometAPI provides access to 500+ AI models through a unified API interface, including cutting-edge models like GPT-5, Claude Opus 4.1, and various other state-of-the-art language models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all AI models from CometAPI . CometAPI provides access to 500+ AI models through a unified API interface, including cutting-edge models like GPT-5, Claude Opus 4.1, and various other state-of-the-art language models.
Authentication ​
To use CometAPI models, you need to obtain an API key from CometAPI Token Console . CometAPI offers free tokens for new users - you can get your free API key instantly by registering.
Usage ​
Set your CometAPI key as an environment variable and use the completion function:
import os
from litellm import completion
# Set API key
os . environ [ "COMETAPI_KEY" ] = "your_comet_api_key_here"
# Define messages
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# Method 1: Using environment variable (recommended)
response = completion (
model = "cometapi/gpt-5" ,
messages = messages
)
print ( response . choices [ 0 ] . message . content )
Alternative Usage - Explicit API Key ​
You can also pass the API key explicitly:
# Method 2: Explicitly passing API key
model = "cometapi/gpt-4o" ,
messages = messages ,
api_key = "your_comet_api_key_here"
Usage - Streaming ​
Just set stream=True when calling completion:
stream = True
for chunk in response :
print ( chunk . choices [ 0 ] . delta . content or "" , end = "" )
Usage - Async Streaming ​
For async streaming, use acompletion :
from litellm import acompletion
import asyncio , os , traceback
async def completion_call ( ) :
try :
print ( "test acompletion + streaming" )
response = await acompletion (
model = "cometapi/chatgpt-4o-latest" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
print ( f"response: { response } " )
async for chunk in response :
print ( chunk )
except :
print ( f"error occurred: { traceback . format_exc ( ) } " )
pass
# Run the async function
await completion_call ( )
CometAPI Models ​
CometAPI offers access to 500+ AI models through a unified API. Some popular models include:
Model Name Function Call cometapi/gpt-5 completion('cometapi/gpt-5', messages) cometapi/gpt-5-mini completion('cometapi/gpt-5-mini', messages) cometapi/gpt-5-nano completion('cometapi/gpt-5-nano', messages) cometapi/gpt-oss-20b completion('cometapi/gpt-oss-20b', messages) cometapi/gpt-oss-120b completion('cometapi/gpt-oss-120b', messages) cometapi/chatgpt-4o-latest completion('cometapi/chatgpt-4o-latest', messages)
For a complete list of available models, visit the CometAPI Models page .
Environment Variables ​
Variable Description Required COMETAPI_KEY Your CometAPI API key Yes
Error Handling ​
except Exception as e :
print ( f"Error: { e } " )
Authentication
Usage
Alternative Usage - Explicit API Key
Usage - Streaming
Usage - Async Streaming
CometAPI Models
Environment Variables
Error Handling
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
