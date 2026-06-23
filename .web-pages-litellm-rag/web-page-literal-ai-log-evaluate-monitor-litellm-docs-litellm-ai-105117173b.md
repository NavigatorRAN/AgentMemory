# Literal AI - Log, Evaluate, Monitor | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/literalai_integration
- Final URL: https://docs.litellm.ai/docs/observability/literalai_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/literalai_integration
- Fetched at: 2026-06-23T14:25:16Z
- Content type: text/html; charset=utf-8

## Description

Literal AI is a collaborative observability, evaluation and analytics platform for building production-grade LLM apps.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Literal AI is a collaborative observability, evaluation and analytics platform for building production-grade LLM apps.
Pre-Requisites ​
Ensure you have the literalai package installed:
uv add literalai litellm
Quick Start ​
import litellm
import os
os . environ [ "LITERAL_API_KEY" ] = ""
os . environ [ 'OPENAI_API_KEY' ] = ""
os . environ [ 'LITERAL_BATCH_SIZE' ] = "1" # You won't see logs appear until the batch is full and sent
litellm . success_callback = [ "literalai" ] # Log Input/Output to LiteralAI
litellm . failure_callback = [ "literalai" ] # Log Errors to LiteralAI
# openai call
response = litellm . completion (
model = "gpt-3.5-turbo" ,
messages = [
{ "role" : "user" , "content" : "Hi 👋 - i'm openai" }
]
)
Multi Step Traces ​
This integration is compatible with the Literal AI SDK decorators, enabling conversation and agent tracing
from literalai import LiteralClient
litellm . input_callback = [ "literalai" ] # Support other Literal AI decorators and prompt templates
literalai_client = LiteralClient ( )
@literalai_client . run
def my_agent ( question : str ) :
# agent logic here
{ "role" : "user" , "content" : question }
] ,
metadata = { "literalai_parent_id" : literalai_client . get_current_step ( ) . id }
return response
my_agent ( "Hello world" )
# Waiting to send all logs before exiting, not needed in a production server
literalai_client . flush ( )
Learn more about Literal AI logging capabilities .
Bind a Generation to its Prompt Template ​
This integration works out of the box with prompts managed on Literal AI. This means that a specific LLM generation will be bound to its template.
Learn more about Prompt Management on Literal AI.
OpenAI Proxy Usage ​
If you are using the Lite LLM proxy, you can use the Literal AI OpenAI instrumentation to log your calls.
from openai import OpenAI
client = OpenAI (
api_key = "anything" , # litellm proxy virtual key
base_url = "http://0.0.0.0:4000" # litellm proxy base_url
literalai_client = LiteralClient ( api_key = "" )
# Instrument the OpenAI client
literalai_client . instrument_openai ( )
settings = {
"model" : "gpt-3.5-turbo" , # model you want to send litellm proxy
"temperature" : 0 ,
# ... more settings
}
response = client . chat . completions . create (
{
"content" : "You are a helpful bot, you always reply in Spanish" ,
"role" : "system"
} ,
"content" : message . content ,
"role" : "user"
** settings
Pre-Requisites
Quick Start
Multi Step Traces
Bind a Generation to its Prompt Template
OpenAI Proxy Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
