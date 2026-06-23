# Custom Guardrail | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/guardrails/custom_guardrail
- Final URL: https://docs.litellm.ai/docs/proxy/guardrails/custom_guardrail
- Canonical URL: https://docs.litellm.ai/docs/proxy/guardrails/custom_guardrail
- Fetched at: 2026-06-23T14:30:25Z
- Content type: text/html; charset=utf-8

## Description

Use this if you want to write code to run a custom guardrail

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use this if you want to write code to run a custom guardrail
Quick Start ​
1. Write a CustomGuardrail Class ​
The simplest way to create a custom guardrail is by implementing the apply_guardrail method. This method is called to check text content and can block requests by raising an exception.
Example CustomGuardrail Class
Create a new file called custom_guardrail.py and add this code to it:
import os
from typing import Optional , List
from litellm . integrations . custom_guardrail import CustomGuardrail
from litellm . types . guardrails import PiiEntityType
from litellm . _logging import verbose_proxy_logger
from litellm . llms . custom_httpx . http_handler import (
get_async_httpx_client ,
httpxSpecialProvider ,
)
class myCustomGuardrail ( CustomGuardrail ) :
def __init__ ( self , api_key : Optional [ str ] = None , api_base : Optional [ str ] = None , ** kwargs ) :
self . api_key = api_key or os . getenv ( "MY_GUARDRAIL_API_KEY" )
self . api_base = api_base or os . getenv ( "MY_GUARDRAIL_API_BASE" , "https://api.myguardrail.com" )
super ( ) . __init__ ( ** kwargs )
async def apply_guardrail (
self ,
text : str , # IMPORTANT: This is the text to check against your guardrail rules. It's extracted from the request or response across all LLM call types.
language : Optional [ str ] = None , # ignore
entities : Optional [ List [ PiiEntityType ] ] = None , # ignore
request_data : Optional [ dict ] = None , # ignore
) - > str :
"""
Check text content against your guardrail rules.
Raise an exception to block the request.
Return the text (optionally modified) to allow it through.
result = await self . _check_with_api ( text , request_data )
if result . get ( "action" ) == "BLOCK" :
raise Exception ( f"Content blocked: { result . get ( 'reason' , 'Policy violation' ) } " )
return text
async def _check_with_api ( self , text : str , request_data : Optional [ dict ] ) - > dict :
async_client = get_async_httpx_client ( llm_provider = httpxSpecialProvider . LoggingCallback )
headers = {
"Content-Type" : "application/json" ,
"Authorization" : f"Bearer { self . api_key } " ,
}
response = await async_client . post (
f" { self . api_base } /check" ,
headers = headers ,
json = { "text" : text } ,
timeout = 5 ,
response . raise_for_status ( )
return response . json ( )
Advanced: Using Individual Event Hooks
If you need more fine-grained control, you can implement individual event hooks instead of (or in addition to) apply_guardrail :
async_pre_call_hook - Modify input or reject request before making LLM API call
async_moderation_hook - Reject request, runs in parallel with LLM API call (helps lower latency)
async_post_call_success_hook - Apply guardrail on input/output, runs after making LLM API call
async_post_call_streaming_iterator_hook - Pass the entire stream to the guardrail
See examples of individual event hooks here | See detailed spec of methods here
2. Pass your custom guardrail class in LiteLLM config.yaml ​
In the config below, we point the guardrail to our custom guardrail by setting guardrail: custom_guardrail.myCustomGuardrail
Python Filename: custom_guardrail.py
Guardrail class name : myCustomGuardrail . This is defined in Step 1
guardrail: custom_guardrail.myCustomGuardrail
model_list :
- model_name : gpt - 4
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
guardrails :
- guardrail_name : "my-custom-guardrail"
guardrail : custom_guardrail.myCustomGuardrail # 👈 Key change
mode : "during_call" # runs apply_guardrail method
api_key : os.environ/MY_GUARDRAIL_API_KEY
api_base : https : //api.myguardrail.com
Mode Options
during_call - Default mode, runs apply_guardrail method (or async_moderation_hook if using individual hooks)
pre_call - Runs async_pre_call_hook for input modification
post_call - Runs async_post_call_success_hook for output validation
Streaming and post_call guardrails
For streaming responses , post_call guardrails run on the fully assembled response after all chunks have been delivered to the client. This means post_call guardrails on streaming are audit-only — they can inspect and log the complete response, but cannot block content delivery. Guardrail results are recorded in guardrail_information within the logging payload for compliance and auditing.
To filter or block streaming content in real-time, use async_post_call_streaming_iterator_hook instead, which processes chunks as they arrive.
Advanced: Multiple modes with individual event hooks
If you're using individual event hooks, you can configure multiple guardrails with different modes:
- guardrail_name : "custom-pre-guard"
guardrail : custom_guardrail.myCustomGuardrail
mode : "pre_call" # runs async_pre_call_hook
- guardrail_name : "custom-during-guard"
mode : "during_call" # runs async_moderation_hook
- guardrail_name : "custom-post-guard"
mode : "post_call" # runs async_post_call_success_hook
3. Start LiteLLM Gateway ​
Docker Run
litellm pip
Mount your custom_guardrail.py on the LiteLLM Docker container
This mounts your custom_guardrail.py file from your local directory to the /app directory in the Docker container, making it accessible to the LiteLLM Gateway.
docker run -d \
-p 4000:4000 \
-e OPENAI_API_KEY=$OPENAI_API_KEY \
--name my-app \
-v $(pwd)/my_config.yaml:/app/config.yaml \
-v $(pwd)/custom_guardrail.py:/app/custom_guardrail.py \
my-app:latest \
--config /app/config.yaml \
--port 4000 \
--detailed_debug \
litellm --config config.yaml --detailed_debug
4. Test it ​
Langchain, OpenAI SDK Usage Examples
Blocked Request
Successful Call
This request will be blocked if it violates your guardrail policy:
curl -i -X POST http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4",
"messages": [
{
"role": "user",
"content": "Content that violates policy"
],
"guardrails": ["my-custom-guardrail"]
}'
Expected response when blocked:
"error" : {
"message" : "Content blocked: Policy violation" ,
"type" : "None" ,
"param" : "None" ,
"code" : "500"
This request passes the guardrail:
curl -i http://localhost:4000/v1/chat/completions \
{"role": "user", "content": "What is the weather like today?"}
Advanced: Testing individual event hooks
If you're using individual event hooks, you can test each mode separately: Test "custom-pre-guard" ​
Modify input
Expect this to mask the word litellm before sending the request to the LLM API. This runs the async_pre_call_hook
"content": "say the word - `litellm`"
"guardrails": ["custom-pre-guard"]
"model": "gpt-3.5-turbo",
{"role": "user", "content": "hi what is the weather"}
Test "custom-during-guard" ​
Unsuccessful call
Expect this to fail since litellm is in the message content. This runs the async_moderation_hook
"guardrails": ["custom-during-guard"]
Expected response:
"message" : "Guardrail failed words - `litellm` detected" ,
Test "custom-post-guard" ​
Expect this to fail since coffee will be in the response content. This runs the async_post_call_success_hook
"content": "what is coffee"
"guardrails": ["custom-post-guard"]
"message" : "Guardrail failed Coffee Detected" ,
"content": "what is tea"
✨ Pass additional parameters to guardrail ​
info
✨ This is an Enterprise only feature Contact us to get a free trial
Use this to pass additional parameters to the guardrail API call. e.g. things like success threshold
Use get_guardrail_dynamic_request_body_params
get_guardrail_dynamic_request_body_params is a method of the litellm.integrations.custom_guardrail.CustomGuardrail class that fetches the dynamic guardrail params passed in the request body.
from typing import Any , Dict , List , Literal , Optional , Union
import litellm
from litellm . caching . caching import DualCache
from litellm . proxy . _types import UserAPIKeyAuth
def __init__ ( self , ** kwargs ) :
async def async_pre_call_hook (
user_api_key_dict : UserAPIKeyAuth ,
cache : DualCache ,
data : dict ,
call_type : Literal [
"completion" ,
"text_completion" ,
"embeddings" ,
"image_generation" ,
"moderation" ,
"audio_transcription" ,
"pass_through_endpoint" ,
"rerank"
] ,
) - > Optional [ Union [ Exception , str , dict ] ] :
# Get dynamic params from request body
params = self . get_guardrail_dynamic_request_body_params ( request_data = data )
# params will contain: {"success_threshold": 0.9}
verbose_proxy_logger . debug ( "Guardrail params: %s" , params )
return data
Pass parameters in your API requests:
LiteLLM Proxy allows you to pass guardrails in the request body, following the guardrails spec .
OpenAI Python
Curl
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Write a short poem" } ] ,
extra_body = {
"guardrails" : [
"custom-pre-guard" : {
"extra_body" : {
"success_threshold" : 0.9
]
curl 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
"content": "Write a short poem"
"guardrails": [
"custom-pre-guard": {
"extra_body": {
"success_threshold": 0.9
The get_guardrail_dynamic_request_body_params method will return:
Advanced: Individual Event Hooks ​
Pro: More flexibility
Con: You need to implement this for each LLM call type (chat completions, text completions, embeddings, image generation, moderation, audio transcription, pass through endpoint, rerank, etc. )
For more fine-grained control over when and how your guardrail runs, you can implement individual event hooks. This gives you flexibility to:
Modify inputs before the LLM call
Run checks in parallel with the LLM call (lower latency)
Validate or modify outputs after the LLM call
Process streaming responses
Example with Individual Event Hooks ​
from typing import Any , AsyncGenerator , Literal , Optional , Union
from litellm . types . utils import ModelResponseStream , CallTypes
def __init__ (
** kwargs ,
) :
# store kwargs as optional_params
self . optional_params = kwargs
call_type : Optional [ CallTypes ] ,
Runs before the LLM API call
Runs on only Input
Use this if you want to MODIFY the input
# In this guardrail, if a user inputs `litellm` we will mask it and then send it to the LLM
_messages = data . get ( "messages" )
if _messages :
for message in _messages :
_content = message . get ( "content" )
if isinstance ( _content , str ) :
if "litellm" in _content . lower ( ) :
_content = _content . replace ( "litellm" , "********" )
message [ "content" ] = _content
verbose_proxy_logger . debug (
"async_pre_call_hook: Message after masking %s" , _messages
async def async_moderation_hook (
call_type : Literal [ "completion" , "embeddings" , "image_generation" , "moderation" , "audio_transcription" ] ,
Runs in parallel to LLM API call
This can NOT modify the input, only used to reject or accept a call before going to LLM API
# this works the same as async_pre_call_hook, but just runs in parallel as the LLM API Call
# In this guardrail, if a user inputs `litellm` we will mask it.
raise ValueError ( "Guardrail failed words - `litellm` detected" )
async def async_post_call_success_hook (
response ,
Runs on response from LLM API call
It can be used to reject a response
If a response contains the word "coffee" -> we will raise an exception
verbose_proxy_logger . debug ( "async_pre_call_hook response: %s" , response )
if isinstance ( response , litellm . ModelResponse ) :
for choice in response . choices :
if isinstance ( choice , litellm . Choices ) :
verbose_proxy_logger . debug ( "async_pre_call_hook choice: %s" , choice )
if (
choice . message . content
and isinstance ( choice . message . content , str )
and "coffee" in choice . message . content
raise ValueError ( "Guardrail failed Coffee Detected" )
async def async_post_call_streaming_iterator_hook (
response : Any ,
request_data : dict ,
) - > AsyncGenerator [ ModelResponseStream , None ] :
Passes the entire stream to the guardrail
This is useful for guardrails that need to see the entire response, such as PII masking.
See Aim guardrail implementation for an example - https://github.com/BerriAI/litellm/blob/d0e022cfacb8e9ebc5409bb652059b6fd97b45c0/litellm/proxy/guardrails/guardrail_hooks/aim.py#L168
Triggered by mode: 'post_call'
async for item in response :
yield item
CustomGuardrail methods ​
Component Description Optional Checked Data Can Modify Input Can Modify Output Can Fail Call apply_guardrail Simple method to check and optionally modify text ✅ INPUT or OUTPUT ✅ ✅ ✅ async_pre_call_hook A hook that runs before the LLM API call ✅ INPUT ✅ ❌ ✅ async_moderation_hook A hook that runs during the LLM API call ✅ INPUT ❌ ❌ ✅ async_post_call_success_hook A hook that runs after a successful LLM API call. For streaming, runs on the assembled response after delivery (audit-only, cannot block). ✅ INPUT, OUTPUT ❌ ✅ ✅ (non-streaming only) async_post_call_streaming_iterator_hook A hook that processes streaming responses in real-time (can filter/block chunks) ✅ OUTPUT ❌ ✅ ✅
Frequently Asked Questions ​
Q. Is apply_guardrail relevant both in the request and in the response (pre_call, during_call and post_call hooks)?
A. Yes, one function works in both - See implementation here
Q. What do I get in the inputs of apply_guardrail ? What does each field represent (what is text, language, entities, request_data)?
A. The main one you should care about is 'text' - this is what you'll want to send to your api for verification - See implementation here
**Q. Is this function agnostic to the LLM provider? Meaning does it pass the same values for OpenAI and Anthropic for example?
A. Yes
Q. How do I know if my guardrail is running?
A. If you implement apply_guardrail , you can query the guardrail directly via the /apply_guardrail API .
Quick Start
1. Write a CustomGuardrail Class
2. Pass your custom guardrail class in LiteLLM config.yaml
3. Start LiteLLM Gateway
4. Test it
✨ Pass additional parameters to guardrail
Advanced: Individual Event Hooks
Example with Individual Event Hooks
CustomGuardrail methods
Frequently Asked Questions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
