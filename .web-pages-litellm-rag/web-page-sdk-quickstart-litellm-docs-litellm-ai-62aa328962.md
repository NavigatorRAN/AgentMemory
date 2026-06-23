# SDK Quickstart | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/learn/sdk_quickstart
- Final URL: https://docs.litellm.ai/docs/learn/sdk_quickstart
- Canonical URL: https://docs.litellm.ai/docs/learn/sdk_quickstart
- Fetched at: 2026-06-23T14:24:24Z
- Content type: text/html; charset=utf-8

## Description

Make your first LiteLLM SDK call, then jump to the right docs for the next feature you need.

## Extracted Text

Skip to main content
On this page
Use this path if you are integrating LiteLLM directly into application code.
1. Install LiteLLM ​
uv add 'litellm==1.82.6'
2. Set Provider Credentials ​
Start with one provider and set its environment variables.
OpenAI: OPENAI_API_KEY
Anthropic: ANTHROPIC_API_KEY
Azure OpenAI: AZURE_API_KEY , AZURE_API_BASE , AZURE_API_VERSION
Bedrock: standard AWS credentials
Vertex AI: VERTEXAI_PROJECT , VERTEXAI_LOCATION
If you have not picked a provider yet, browse all supported providers .
3. Make Your First Call ​
from litellm import completion
import os
os . environ [ "OPENAI_API_KEY" ] = "your-api-key"
response = completion (
model = "openai/gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
)
print ( response . choices [ 0 ] . message . content )
4. Check The Response ​
The line below:
prints the assistant text, for example:
Hello! I'm doing well, thanks for asking.
If you print the full object with:
print ( response )
you will see a Python ModelResponse(...) object. For an OpenAI-backed model, it can look like this:
ModelResponse (
id = 'chatcmpl-abc123' ,
created = 1773782130 ,
model = 'gpt-4o-2024-08-06' ,
object = 'chat.completion' ,
system_fingerprint = 'fp_4ff89bf575' ,
choices = [
Choices (
finish_reason = 'stop' ,
index = 0 ,
message = Message (
content = "Hello! I'm just a program, but I'm here to help you. How can I assist you today?" ,
role = 'assistant' ,
tool_calls = None ,
function_call = None ,
provider_specific_fields = { 'refusal' : None } ,
annotations = [ ]
) ,
provider_specific_fields = { }
] ,
usage = Usage (
completion_tokens = 21 ,
prompt_tokens = 13 ,
total_tokens = 34 ,
completion_tokens_details = CompletionTokensDetailsWrapper ( . . . ) ,
prompt_tokens_details = PromptTokensDetailsWrapper ( . . . )
service_tier = 'default'
The same response follows an OpenAI-style shape. Conceptually, it looks like this:
{
"id" : "chatcmpl-abc123" ,
"object" : "chat.completion" ,
"created" : 1677858242 ,
"model" : "gpt-4o" ,
"choices" : [
"index" : 0 ,
"message" : {
"role" : "assistant" ,
"content" : "Hello! I'm doing well, thanks for asking."
} ,
"finish_reason" : "stop"
}
"usage" : {
"prompt_tokens" : 13 ,
"completion_tokens" : 12 ,
"total_tokens" : 25
id , created , token counts, and message text will vary by request.
If you call an OpenAI-backed model, you may also see extra fields such as system_fingerprint , service_tier , tool_calls , function_call , annotations , provider_specific_fields , and detailed token usage. For the full output reference, see completion output .
Need more provider examples? See the main Getting Started page.
5. Pick Your Next Step ​
⚡
Stream Responses
Receive tokens incrementally with stream=True.
🧰
Use Tools
Add function calling in a provider-agnostic way.
📦
Return JSON
Constrain responses to structured JSON output.
🔀
Add Routing
Use retries, fallbacks, and load balancing in app code.
🌐
Choose A Provider
Find provider-specific auth, model naming, and params.
When To Use Gateway Instead ​
Use LiteLLM Gateway if you need centralized auth, virtual keys, spend tracking, shared logging, or one OpenAI-compatible endpoint for multiple apps.
Go to Gateway Quickstart →
1. Install LiteLLM
2. Set Provider Credentials
3. Make Your First Call
4. Check The Response
5. Pick Your Next Step
When To Use Gateway Instead
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
