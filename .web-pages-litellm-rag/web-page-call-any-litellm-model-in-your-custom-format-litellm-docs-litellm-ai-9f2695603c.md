# Call any LiteLLM model in your custom format | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/extras/creating_adapters
- Final URL: https://docs.litellm.ai/docs/extras/creating_adapters
- Canonical URL: https://docs.litellm.ai/docs/extras/creating_adapters
- Fetched at: 2026-06-23T14:23:57Z
- Content type: text/html; charset=utf-8

## Description

Use this to call any LiteLLM supported .completion() model, in your custom format. Useful if you have a custom API and want to support any LiteLLM supported model.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this to call any LiteLLM supported .completion() model, in your custom format. Useful if you have a custom API and want to support any LiteLLM supported model.
How it works ​
Your request → Adapter translates to OpenAI format → LiteLLM processes it → Adapter translates response back → Your response
Create an Adapter ​
Inherit from CustomLogger and implement 3 methods:
from litellm . integrations . custom_logger import CustomLogger
from litellm . types . llms . openai import ChatCompletionRequest
from litellm . types . utils import ModelResponse
class MyAdapter ( CustomLogger ) :
def translate_completion_input_params ( self , kwargs ) - > ChatCompletionRequest :
"""Convert your format → OpenAI format"""
# Example: Anthropic to OpenAI
return {
"model" : kwargs [ "model" ] ,
"messages" : self . _convert_messages ( kwargs [ "messages" ] ) ,
"max_tokens" : kwargs . get ( "max_tokens" ) ,
}
def translate_completion_output_params ( self , response : ModelResponse ) :
"""Convert OpenAI format → your format"""
# Return your provider's response format
return MyProviderResponse (
id = response . id ,
content = response . choices [ 0 ] . message . content ,
usage = response . usage ,
)
def translate_completion_output_params_streaming ( self , completion_stream ) :
"""Handle streaming responses"""
return MyStreamWrapper ( completion_stream )
Register it ​
import litellm
my_adapter = MyAdapter ( )
litellm . adapters = [ { "id" : "my_provider" , "adapter" : my_adapter } ]
Use it ​
from litellm import adapter_completion
# Now you can use your provider's format with any LiteLLM model
response = adapter_completion (
adapter_id = "my_provider" ,
model = "gpt-4" , # or any LiteLLM model
messages = [ { "role" : "user" , "content" : "hello" } ] ,
max_tokens = 100
Streaming ​
stream = adapter_completion (
model = "gpt-4" ,
stream = True
for chunk in stream :
print ( chunk )
Async ​
from litellm import aadapter_completion
response = await aadapter_completion (
messages = [ { "role" : "user" , "content" : "hello" } ]
Example: Anthropic Adapter ​
Here's how we translate Anthropic's format:
Input Translation ​
def translate_completion_input_params ( self , kwargs ) :
model = kwargs . pop ( "model" )
messages = kwargs . pop ( "messages" )
# Convert Anthropic messages to OpenAI format
openai_messages = [ ]
for msg in messages :
if msg [ "role" ] == "user" :
openai_messages . append ( {
"role" : "user" ,
"content" : msg [ "content" ]
} )
# Handle system message
if "system" in kwargs :
openai_messages . insert ( 0 , {
"role" : "system" ,
"content" : kwargs . pop ( "system" )
"model" : model ,
"messages" : openai_messages ,
** kwargs # pass through other params
Output Translation ​
def translate_completion_output_params ( self , response ) :
return AnthropicResponse (
type = "message" ,
role = "assistant" ,
content = [ {
"type" : "text" ,
"text" : response . choices [ 0 ] . message . content
} ] ,
usage = {
"input_tokens" : response . usage . prompt_tokens ,
"output_tokens" : response . usage . completion_tokens
from litellm . types . utils import AdapterCompletionStreamWrapper
class AnthropicStreamWrapper ( AdapterCompletionStreamWrapper ) :
def __init__ ( self , completion_stream , model ) :
super ( ) . __init__ ( completion_stream )
self . model = model
self . first_chunk = True
async def __anext__ ( self ) :
# First chunk
if self . first_chunk :
self . first_chunk = False
return { "type" : "message_start" , "message" : { . . . } }
# Stream chunks
async for chunk in self . completion_stream :
"type" : "content_block_delta" ,
"delta" : { "text" : chunk . choices [ 0 ] . delta . content }
# Last chunk
return { "type" : "message_stop" }
def translate_completion_output_params_streaming ( self , stream , model ) :
return AnthropicStreamWrapper ( stream , model )
Use with Proxy ​
Add to your proxy config:
general_settings :
pass_through_endpoints :
- path : "/v1/messages"
target : "my_module.MyAdapter"
Then call it:
curl http://localhost:4000/v1/messages \
-H "Authorization: Bearer sk-1234" \
-d '{"model": "gpt-4", "messages": [...]}'
Real Example ​
Check out the full Anthropic adapter:
transformation.py
handler.py
streaming_iterator.py
That's it ​
Create a class that inherits CustomLogger
Implement the 3 translation methods
Register with litellm.adapters = [{"id": "...", "adapter": ...}]
Call with adapter_completion(adapter_id="...")
How it works
Create an Adapter
Register it
Use it
Streaming
Async
Example: Anthropic Adapter
Input Translation
Output Translation
Use with Proxy
Real Example
That's it
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
