# Scrub Logged Data | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/scrub_data
- Final URL: https://docs.litellm.ai/docs/observability/scrub_data
- Canonical URL: https://docs.litellm.ai/docs/observability/scrub_data
- Fetched at: 2026-06-23T14:25:33Z
- Content type: text/html; charset=utf-8

## Description

Redact messages / mask PII before sending data to logging integrations (langfuse/etc.).

## Extracted Text

Skip to main content
Copy as Markdown
Redact messages / mask PII before sending data to logging integrations (langfuse/etc.).
See our Presidio PII Masking for reference.
Setup a custom callback
from litellm . integrations . custom_logger import CustomLogger
class MyCustomHandler ( CustomLogger ) :
async def async_logging_hook (
self , kwargs : dict , result : Any , call_type : str
) - > Tuple [ dict , Any ] :
"""
For masking logged request/response. Return a modified version of the request/result.
Called before `async_log_success_event`.
if (
call_type == "completion" or call_type == "acompletion"
) : # /chat/completions requests
messages : Optional [ List ] = kwargs . get ( "messages" , None )
kwargs [ "messages" ] = [ { "role" : "user" , "content" : "MASK_THIS_ASYNC_VALUE" } ]
return kwargs , responses
def logging_hook (
Called before `log_success_event`.
kwargs [ "messages" ] = [ { "role" : "user" , "content" : "MASK_THIS_SYNC_VALUE" } ]
customHandler = MyCustomHandler ( )
Connect custom handler to LiteLLM
import litellm
litellm . callbacks = [ customHandler ]
Test it!
# uv add langfuse
import os
from litellm import completion
os . environ [ "LANGFUSE_PUBLIC_KEY" ] = ""
os . environ [ "LANGFUSE_SECRET_KEY" ] = ""
# Optional, defaults to https://cloud.langfuse.com
os . environ [ "LANGFUSE_HOST" ] # optional
# LLM API Keys
os . environ [ 'OPENAI_API_KEY' ] = ""
litellm . success_callback = [ "langfuse" ]
## sync
response = completion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm openai" } ] ,
stream = True )
for chunk in response :
continue
## async
import asyncio
def async completion ( ) :
response = await acompletion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm openai" } ] ,
async for chunk in response :
asyncio . run ( completion ( ) )
