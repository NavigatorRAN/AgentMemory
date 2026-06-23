# Batching Completion() | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/batching
- Final URL: https://docs.litellm.ai/docs/completion/batching
- Canonical URL: https://docs.litellm.ai/docs/completion/batching
- Fetched at: 2026-06-23T14:23:04Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM allows you to:

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM allows you to:
Send many completion calls to 1 model
Send 1 completion call to many models: Return Fastest Response
Send 1 completion call to many models: Return All Responses
info
Trying to do batch completion on LiteLLM Proxy ? Go here: https://docs.litellm.ai/docs/proxy/user_keys#beta-batch-completions---pass-model-as-list
Send multiple completion calls to 1 model ​
In the batch_completion method, you provide a list of messages where each sub-list of messages is passed to litellm.completion() , allowing you to process multiple prompts efficiently in a single API call.
Example Code ​
import litellm
import os
from litellm import batch_completion
os . environ [ 'ANTHROPIC_API_KEY' ] = ""
responses = batch_completion (
model = "claude-2" ,
messages = [
[
{
"role" : "user" ,
"content" : "good morning? "
}
] ,
"content" : "what's the time? "
]
)
Send 1 completion call to many models: Return Fastest Response ​
This makes parallel calls to the specified models and returns the first response
Use this to reduce latency
SDK
PROXY
from litellm import batch_completion_models
os . environ [ 'OPENAI_API_KEY' ] = ""
os . environ [ 'COHERE_API_KEY' ] = ""
response = batch_completion_models (
models = [ "gpt-3.5-turbo" , "claude-instant-1.2" , "command-nightly" ] ,
messages = [ { "role" : "user" , "content" : "Hey, how's it going" } ]
print ( result )
how to setup proxy config
Just pass a comma-separated string of model names and the flag fastest_response=True .
curl
OpenAI SDK
curl -X POST 'http://localhost:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"model": "gpt-4o, groq-llama", # 👈 Comma-separated models
"messages": [
"role": "user",
"content": "What's the weather like in Boston today?"
],
"stream": true,
"fastest_response": true # 👈 FLAG
'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
# request sent to model set on litellm proxy, `litellm --model`
response = client . chat . completions . create (
model = "gpt-4o, groq-llama" , # 👈 Comma-separated models
"content" : "this is a test request, write a short poem"
extra_body = { "fastest_response" : true } # 👈 FLAG
print ( response )
Example Setup: ​
model_list :
- model_name : groq - llama
litellm_params :
model : groq/llama3 - 8b - 8192
api_key : os.environ/GROQ_API_KEY
- model_name : gpt - 4o
model : gpt - 4o
api_key : os.environ/OPENAI_API_KEY
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Output ​
Returns the first response in OpenAI format. Cancels other LLM API calls.
"object" : "chat.completion" ,
"choices" : [
"finish_reason" : "stop" ,
"index" : 0 ,
"message" : {
"content" : " I'm doing well, thanks for asking! I'm an AI assistant created by Anthropic to be helpful, harmless, and honest." ,
"role" : "assistant" ,
"logprobs" : null
"id" : "chatcmpl-23273eed-e351-41be-a492-bafcf5cf3274" ,
"created" : 1695154628.2076092 ,
"model" : "command-nightly" ,
"usage" : {
"prompt_tokens" : 6 ,
"completion_tokens" : 14 ,
"total_tokens" : 20
Send 1 completion call to many models: Return All Responses ​
This makes parallel calls to the specified models and returns all responses
Use this to process requests concurrently and get responses from multiple models.
from litellm import batch_completion_models_all_responses
responses = batch_completion_models_all_responses (
print ( responses )
[ <ModelResponse chat.completion id=chatcmpl-e673ec8e-4e8f-4c9e-bf26-bf9fa7ee52b9 at 0x103a62160> JSON : {
"finish_reason" : "stop_sequence" ,
"content" : " It's going well, thank you for asking! How about you?" ,
"id" : "chatcmpl-e673ec8e-4e8f-4c9e-bf26-bf9fa7ee52b9" ,
"created" : 1695222060.917964 ,
"model" : "claude-instant-1.2" ,
"prompt_tokens" : 14 ,
"completion_tokens" : 9 ,
"total_tokens" : 23
} , <ModelResponse chat.completion id=chatcmpl-ab6c5bd3-b5d9 -4711 -9697 -e28d9fb8a53c at 0x103a62b60> JSON : {
"id" : "chatcmpl-ab6c5bd3-b5d9-4711-9697-e28d9fb8a53c" ,
"created" : 1695222061.0445492 ,
} , <OpenAIObject chat.completion id=chatcmpl-80szFnKHzCxObW0RqCMw1hWW1Icrq at 0x102dd6430> JSON : {
"id" : "chatcmpl-80szFnKHzCxObW0RqCMw1hWW1Icrq" ,
"created" : 1695222061 ,
"model" : "gpt-3.5-turbo-0613" ,
"content" : "Hello! I'm an AI language model, so I don't have feelings, but I'm here to assist you with any questions or tasks you might have. How can I help you today?"
} ,
"finish_reason" : "stop"
"prompt_tokens" : 13 ,
"completion_tokens" : 39 ,
"total_tokens" : 52
} ]
Send multiple completion calls to 1 model
Example Code
Example Setup:
Output
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
