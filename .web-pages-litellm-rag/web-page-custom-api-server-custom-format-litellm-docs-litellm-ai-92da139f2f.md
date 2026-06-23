# Custom API Server (Custom Format) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/custom_llm_server
- Final URL: https://docs.litellm.ai/docs/providers/custom_llm_server
- Canonical URL: https://docs.litellm.ai/docs/providers/custom_llm_server
- Fetched at: 2026-06-23T14:27:33Z
- Content type: text/html; charset=utf-8

## Description

Call your custom torch-serve / internal LLM APIs via LiteLLM

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call your custom torch-serve / internal LLM APIs via LiteLLM
info
For calling an openai-compatible endpoint, go here
For modifying incoming/outgoing calls on proxy, go here
Supported Routes:
/v1/chat/completions -> litellm.acompletion
/v1/completions -> litellm.atext_completion
/v1/embeddings -> litellm.aembedding
/v1/images/generations -> litellm.aimage_generation
/v1/images/edits -> litellm.aimage_edit
/v1/messages -> litellm.acompletion
Quick Start ​
import litellm
from litellm import CustomLLM , completion , get_llm_provider
class MyCustomLLM ( CustomLLM ) :
def completion ( self , * args , ** kwargs ) - > litellm . ModelResponse :
return litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Hello world" } ] ,
mock_response = "Hi!" ,
) # type: ignore
my_custom_llm = MyCustomLLM ( )
litellm . custom_provider_map = [ # 👈 KEY STEP - REGISTER HANDLER
{ "provider" : "my-custom-llm" , "custom_handler" : my_custom_llm }
]
resp = completion (
model = "my-custom-llm/my-fake-model" ,
messages = [ { "role" : "user" , "content" : "Hello world!" } ] ,
)
assert resp . choices [ 0 ] . message . content == "Hi!"
OpenAI Proxy Usage ​
Setup your custom_handler.py file
async def acompletion ( self , * args , ** kwargs ) - > litellm . ModelResponse :
Add to config.yaml
In the config below, we pass
python_filename: custom_handler.py
custom_handler_instance_name: my_custom_llm . This is defined in Step 1
custom_handler: custom_handler.my_custom_llm
model_list :
- model_name : "test-model"
litellm_params :
model : "openai/text-embedding-ada-002"
- model_name : "my-custom-model"
model : "my-custom-llm/my-model"
litellm_settings :
custom_provider_map :
- { "provider" : "my-custom-llm" , "custom_handler" : custom_handler.my_custom_llm }
litellm --config /path/to/config.yaml
Test it!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "my-custom-model",
"messages": [{"role": "user", "content": "Say \"this is a test\" in JSON!"}],
}'
Expected Response
{
"id": "chatcmpl-06f1b9cd-08bc-43f7-9814-a69173921216",
"choices": [
"finish_reason": "stop",
"index": 0,
"message": {
"content": "Hi!",
"role": "assistant",
"tool_calls": null,
"function_call": null
}
],
"created": 1721955063,
"model": "gpt-3.5-turbo",
"object": "chat.completion",
"system_fingerprint": null,
"usage": {
"prompt_tokens": 10,
"completion_tokens": 20,
"total_tokens": 30
Add Streaming Support ​
Here's a simple example of returning unix epoch seconds for both completion + streaming use-cases.
s/o @Eloy Lafuente for this code example.
import time
from typing import Iterator , AsyncIterator
from litellm . types . utils import GenericStreamingChunk , ModelResponse
from litellm import CustomLLM , completion , acompletion
class UnixTimeLLM ( CustomLLM ) :
def completion ( self , * args , ** kwargs ) - > ModelResponse :
return completion (
model = "test/unixtime" ,
mock_response = str ( int ( time . time ( ) ) ) ,
async def acompletion ( self , * args , ** kwargs ) - > ModelResponse :
return await acompletion (
def streaming ( self , * args , ** kwargs ) - > Iterator [ GenericStreamingChunk ] :
generic_streaming_chunk : GenericStreamingChunk = {
"finish_reason" : "stop" ,
"index" : 0 ,
"is_finished" : True ,
"text" : str ( int ( time . time ( ) ) ) ,
"tool_use" : None ,
"usage" : { "completion_tokens" : 0 , "prompt_tokens" : 0 , "total_tokens" : 0 } ,
return generic_streaming_chunk # type: ignore
async def astreaming ( self , * args , ** kwargs ) - > AsyncIterator [ GenericStreamingChunk ] :
yield generic_streaming_chunk # type: ignore
unixtime = UnixTimeLLM ( )
Image Generation ​
from litellm import CustomLLM
from litellm . types . utils import ImageResponse , ImageObject
async def aimage_generation ( self , model : str , prompt : str , model_response : ImageResponse , optional_params : dict , logging_obj : Any , timeout : Optional [ Union [ float , httpx . Timeout ] ] = None , client : Optional [ AsyncHTTPHandler ] = None , ) - > ImageResponse :
return ImageResponse (
created = int ( time . time ( ) ) ,
data = [ ImageObject ( url = "https://example.com/image.png" ) ] ,
curl -X POST 'http://0.0.0.0:4000/v1/images/generations' \
"prompt": "A cute baby sea otter",
"data": [{"url": "https://example.com/image.png"}],
Image Edit ​
async def aimage_edit (
self ,
model : str ,
image : Any ,
prompt : str ,
model_response : ImageResponse ,
api_key : Optional [ str ] ,
api_base : Optional [ str ] ,
optional_params : dict ,
logging_obj : Any ,
timeout : Optional [ Union [ float , httpx . Timeout ] ] = None ,
client : Optional [ AsyncHTTPHandler ] = None ,
) - > ImageResponse :
# Your custom image edit logic here
# e.g., call Stability AI, Black Forest Labs, etc.
data = [ ImageObject ( url = "https://example.com/edited-image.png" ) ] ,
- model_name : "my-custom-image-edit-model"
curl -X POST 'http://0.0.0.0:4000/v1/images/edits' \
-F 'model=my-custom-image-edit-model' \
-F 'image=@/path/to/image.png' \
-F 'prompt=Make the sky blue'
"data": [{"url": "https://example.com/edited-image.png"}],
Anthropic /v1/messages ​
Write the integration for .acompletion
litellm will transform it to /v1/messages
curl -L -X POST 'http://0.0.0.0:4000/v1/messages' \
-H 'anthropic-version: 2023-06-01' \
-H 'content-type: application/json' \
"max_tokens": 1024,
"messages": [{
"role": "user",
"content": [
"type": "text",
"text": "What are the key findings in this document 12?"
}]
"id" : "chatcmpl-Bm4qEp4h4vCe7Zi4Gud1MAxTWgibO" ,
"type" : "message" ,
"role" : "assistant" ,
"model" : "gpt-3.5-turbo-0125" ,
"stop_sequence" : null ,
"usage" : {
"input_tokens" : 18 ,
"output_tokens" : 44
} ,
"content" : [
"type" : "text" ,
"text" : "Without the specific document being provided, it is not possible to determine the key findings within it. If you can provide the content or a summary of document 12, I would be happy to help identify the key findings."
] ,
"stop_reason" : "end_turn"
Additional Parameters ​
Additional parameters are passed inside optional_params key in the completion or image_generation function.
Here's how to set this:
SDK
Proxy
assert kwargs [ "optional_params" ] == { "my_custom_param" : "my-custom-param" } # 👈 CHECK HERE
resp = completion ( model = "my-custom-llm/my-model" , my_custom_param = "my-custom-param" )
assert optional_params == { "my_custom_param" : "my-custom-param" } # 👈 CHECK HERE
my_custom_param : "my-custom-param" # 👈 CUSTOM PARAM
Custom Handler Spec ​
from litellm . types . utils import GenericStreamingChunk , ModelResponse , ImageResponse
from typing import Iterator , AsyncIterator , Any , Optional , Union
from litellm . llms . base import BaseLLM
class CustomLLMError ( Exception ) : # use this for all your exceptions
def __init__ (
status_code ,
message ,
) :
self . status_code = status_code
self . message = message
super ( ) . __init__ (
self . message
) # Call the base class constructor with the parameters it needs
class CustomLLM ( BaseLLM ) :
def __init__ ( self ) - > None :
super ( ) . __init__ ( )
raise CustomLLMError ( status_code = 500 , message = "Not implemented yet!" )
def image_generation (
client : Optional [ HTTPHandler ] = None ,
async def aimage_generation (
def image_edit (
Quick Start
OpenAI Proxy Usage
Add Streaming Support
Image Generation
Image Edit
Anthropic /v1/messages
Additional Parameters
Custom Handler Spec
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
