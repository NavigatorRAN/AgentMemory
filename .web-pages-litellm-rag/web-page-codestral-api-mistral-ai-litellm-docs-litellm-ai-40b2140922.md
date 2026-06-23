# Codestral API [Mistral AI] | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/codestral
- Final URL: https://docs.litellm.ai/docs/providers/codestral
- Canonical URL: https://docs.litellm.ai/docs/providers/codestral
- Fetched at: 2026-06-23T14:27:29Z
- Content type: text/html; charset=utf-8

## Description

Codestral is available in select code-completion plugins but can also be queried directly. See the documentation for more details.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Codestral is available in select code-completion plugins but can also be queried directly. See the documentation for more details.
API Key ​
# env variable
os . environ [ 'CODESTRAL_API_KEY' ]
FIM / Completions ​
info
Official Mistral API Docs: https://docs.mistral.ai/api/#operation/createFIMCompletion
No Streaming
Streaming
Sample Usage ​
import os
import litellm
response = await litellm . atext_completion (
model = "text-completion-codestral/codestral-2405" ,
prompt = "def is_odd(n): \n return n % 2 == 1 \ndef test_is_odd():" ,
suffix = "return True" , # optional
temperature = 0 , # optional
top_p = 1 , # optional
max_tokens = 10 , # optional
min_tokens = 10 , # optional
seed = 10 , # optional
stop = [ "return" ] , # optional
)
Expected Response ​
{
"id" : "b41e0df599f94bc1a46ea9fcdbc2aabe" ,
"object" : "text_completion" ,
"created" : 1589478378 ,
"model" : "codestral-latest" ,
"choices" : [
"text" : "\n assert is_odd(1)\n assert" ,
"index" : 0 ,
"logprobs" : null ,
"finish_reason" : "length"
}
] ,
"usage" : {
"prompt_tokens" : 5 ,
"completion_tokens" : 7 ,
"total_tokens" : 12
Sample Usage - Streaming ​
stream = True ,
async for chunk in response :
print ( chunk )
"id" : "726025d3e2d645d09d475bb0d29e3640" ,
"created" : 1718659669 ,
"text" : "This" ,
"finish_reason" : null
"model" : "codestral-2405" ,
Supported Models ​
All models listed here https://docs.mistral.ai/platform/endpoints are supported. We actively maintain the list of models, pricing, token window, etc. here .
Model Name Function Call Codestral Latest completion(model="text-completion-codestral/codestral-latest", messages) Codestral 2405 completion(model="text-completion-codestral/codestral-2405", messages)
Chat Completions ​
Official Mistral API Docs: https://docs.mistral.ai/api/#operation/createChatCompletion
response = await litellm . acompletion (
model = "codestral/codestral-latest" ,
messages = [
"role" : "user" ,
"content" : "Hey, how's it going?" ,
temperature = 0.0 , # optional
safe_prompt = False , # optional
seed = 12 , # optional
"id" : "chatcmpl-123" ,
"object" : "chat.completion" ,
"created" : 1677652288 ,
"model" : "codestral/codestral-latest" ,
"system_fingerprint" : None ,
"choices" : [ {
"message" : {
"role" : "assistant" ,
"content" : "\n\nHello there, how may I assist you today?" ,
} ,
"finish_reason" : "stop"
} ] ,
"prompt_tokens" : 9 ,
"completion_tokens" : 12 ,
"total_tokens" : 21
stream = True , # optional
"object" : "chat.completion.chunk" ,
"created" : 1694268190 ,
"delta" : { "role" : "assistant" , "content" : "gm" } ,
" finish_reason" : null
]
Model Name Function Call Codestral Latest completion(model="codestral/codestral-latest", messages) Codestral 2405 completion(model="codestral/codestral-2405", messages)
API Key
FIM / Completions
Supported Models
Chat Completions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
