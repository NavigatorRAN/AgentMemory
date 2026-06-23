# Modify / Reject Incoming Requests | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/call_hooks
- Final URL: https://docs.litellm.ai/docs/proxy/call_hooks
- Canonical URL: https://docs.litellm.ai/docs/proxy/call_hooks
- Fetched at: 2026-06-23T14:29:44Z
- Content type: text/html; charset=utf-8

## Description

- Modify data before making llm api calls on proxy

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Modify data before making llm api calls on proxy
Reject data before making llm api calls / before returning the response
Enforce 'user' param for all openai endpoint calls
tip
Understanding Callback Hooks? Check out our Callback Guide to understand the differences between proxy-specific hooks like async_pre_call_hook and general logging hooks like async_log_success_event .
Which Hook Should I Use? ​
Hook Use Case When It Runs async_pre_call_hook Modify incoming request before it's sent to model Before the LLM API call is made async_moderation_hook Run checks on input in parallel to LLM API call In parallel with the LLM API call async_post_call_success_hook Modify outgoing response (non-streaming) After successful LLM API call, for non-streaming responses async_post_call_failure_hook Transform error responses sent to clients After failed LLM API call async_post_call_streaming_hook Modify outgoing response (streaming) After successful LLM API call, for streaming responses async_post_call_response_headers_hook Inject custom HTTP response headers After LLM API call (both success and failure)
See a complete example with our parallel request rate limiter
Quick Start ​
In your Custom Handler add a new async_pre_call_hook function
This function is called just before a litellm completion call is made, and allows you to modify the data going into the litellm call See Code
from litellm . integrations . custom_logger import CustomLogger
import litellm
from litellm . proxy . proxy_server import UserAPIKeyAuth , DualCache
from litellm . types . utils import ModelResponseStream
from typing import Any , AsyncGenerator , Optional , Literal
# This file includes the custom callbacks for LiteLLM Proxy
# Once defined, these can be passed in proxy_config.yaml
class MyCustomHandler ( CustomLogger ) : # https://docs.litellm.ai/docs/observability/custom_callback#callback-class
# Class variables or attributes
def __init__ ( self ) :
pass
#### CALL HOOKS - proxy only ####
async def async_pre_call_hook ( self , user_api_key_dict : UserAPIKeyAuth , cache : DualCache , data : dict , call_type : Literal [
"completion" ,
"text_completion" ,
"embeddings" ,
"image_generation" ,
"moderation" ,
"audio_transcription" ,
] ) :
data [ "model" ] = "my-new-model"
return data
async def async_post_call_failure_hook (
self ,
request_data : dict ,
original_exception : Exception ,
user_api_key_dict : UserAPIKeyAuth ,
traceback_str : Optional [ str ] = None ,
) - > Optional [ HTTPException ] :
"""
Transform error responses sent to clients.
Return an HTTPException to replace the original error with a user-friendly message.
Return None to use the original exception.
Example:
if isinstance(original_exception, litellm.ContextWindowExceededError):
return HTTPException(
status_code=400,
detail="Your prompt is too long. Please reduce the length and try again."
)
return None # Use original exception
async def async_post_call_success_hook (
data : dict ,
response ,
) :
async def async_moderation_hook ( # call made in parallel to llm api call
call_type : Literal [ "completion" , "embeddings" , "image_generation" , "moderation" , "audio_transcription" ] ,
async def async_post_call_streaming_hook (
response : str ,
async def async_post_call_streaming_iterator_hook (
response : Any ,
) - > AsyncGenerator [ ModelResponseStream , None ] :
Passes the entire stream to the guardrail
This is useful for plugins that need to see the entire stream.
async for item in response :
yield item
async def async_post_call_response_headers_hook (
request_headers : Optional [ Dict [ str , str ] ] = None ,
) - > Optional [ Dict [ str , str ] ] :
Inject custom headers into HTTP response (runs for both success and failure).
return { "x-custom-header" : "custom-value" }
proxy_handler_instance = MyCustomHandler ( )
Add this file to your proxy config
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : gpt - 3.5 - turbo
litellm_settings :
callbacks : custom_callbacks.proxy_handler_instance # sets litellm.callbacks = [proxy_handler_instance]
Start the server + test the request
$ litellm /path/to/config.yaml
curl --location 'http://0.0.0.0:4000/chat/completions' \
--data ' {
"model": "gpt-3.5-turbo",
"messages": [
{
"role": "user",
"content": "good morning good sir"
}
],
"user": "ishaan-app",
"temperature": 0.2
}'
[BETA] NEW async_moderation_hook ​
Run a moderation check in parallel to the actual LLM API call.
In your Custom Handler add a new async_moderation_hook function
This is currently only supported for /chat/completion calls.
This function runs in parallel to the actual LLM API call.
If your async_moderation_hook raises an Exception, we will return that to the user.
info
We might need to update the function schema in the future, to support multiple endpoints (e.g. accept a call_type). Please keep that in mind, while trying this feature
See a complete example with our Llama Guard content moderation hook
from fastapi import HTTPException
#### ASYNC ####
async def async_log_pre_api_call ( self , model , messages , kwargs ) :
async def async_log_success_event ( self , kwargs , response_obj , start_time , end_time ) :
async def async_log_failure_event ( self , kwargs , response_obj , start_time , end_time ) :
async def async_pre_call_hook ( self , user_api_key_dict : UserAPIKeyAuth , cache : DualCache , data : dict , call_type : Literal [ "completion" , "embeddings" ] ) :
async def async_moderation_hook ( ### 👈 KEY CHANGE ###
messages = data [ "messages" ]
print ( messages )
if messages [ 0 ] [ "content" ] == "hello world" :
raise HTTPException (
status_code = 400 , detail = { "error" : "Violated content safety policy" }
"content": "Hello world"
Advanced - Enforce 'user' param ​
Set enforce_user_param to true, to require all calls to the openai endpoints to have the 'user' param.
See Code
general_settings :
enforce_user_param : True
Result
Advanced - Return rejected message as response ​
For chat completions and text completion calls, you can return a rejected message as a user response.
Do this by returning a string. LiteLLM takes care of returning the response in the correct format depending on the endpoint and if it's streaming/non-streaming.
For non-chat/text completion endpoints, this response is returned as a 400 status code exception.
1. Create Custom Handler ​
from litellm . utils import get_formatted_prompt
class MyCustomHandler ( CustomLogger ) :
] ) - > Optional [ dict , str , Exception ] :
formatted_prompt = get_formatted_prompt ( data = data , call_type = call_type )
if "Hello world" in formatted_prompt :
return "This is an invalid response"
2. Update config.yaml ​
3. Test it! ​
Expected Response
"id": "chatcmpl-d00bbede-2d90-4618-bf7b-11a1c23cf360",
"choices": [
"finish_reason": "stop",
"index": 0,
"message": {
"content": "This is an invalid response.", # 👈 REJECTED RESPONSE
"role": "assistant"
"created": 1716234198,
"model": null,
"object": "chat.completion",
"system_fingerprint": null,
"usage": {}
Advanced - Transform Error Responses ​
Transform technical API errors into user-friendly messages using async_post_call_failure_hook . Return an HTTPException to replace the original error, or None to use the original exception.
from typing import Optional
class MyErrorTransformer ( CustomLogger ) :
if isinstance ( original_exception , litellm . ContextWindowExceededError ) :
return HTTPException (
status_code = 400 ,
detail = "Your prompt is too long. Please reduce the length and try again."
if isinstance ( original_exception , litellm . RateLimitError ) :
status_code = 429 ,
detail = "Rate limit exceeded. Please try again in a moment."
proxy_handler_instance = MyErrorTransformer ( )
Result: Clients receive "Your prompt is too long..." instead of "ContextWindowExceededError: Prompt exceeds context window" .
Advanced - Inject Custom HTTP Response Headers ​
Use async_post_call_response_headers_hook to inject custom HTTP headers into responses. This hook runs for both successful and failed LLM API calls.
from litellm . proxy . proxy_server import UserAPIKeyAuth
from typing import Any , Dict , Optional
class CustomHeaderLogger ( CustomLogger ) :
super ( ) . __init__ ( )
Inject custom headers into all responses (success and failure).
proxy_handler_instance = CustomHeaderLogger ( )
Which Hook Should I Use?
Quick Start
[BETA] NEW async_moderation_hook
Advanced - Enforce 'user' param
Advanced - Return rejected message as response
1. Create Custom Handler
2. Update config.yaml
3. Test it!
Advanced - Transform Error Responses
Advanced - Inject Custom HTTP Response Headers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
