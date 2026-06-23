# /assistants | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/assistants
- Final URL: https://docs.litellm.ai/docs/assistants
- Canonical URL: https://docs.litellm.ai/docs/assistants
- Fetched at: 2026-06-23T14:22:50Z
- Content type: text/html; charset=utf-8

## Description

OpenAI has deprecated the Assistants API. It will shut down on August 26, 2026.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Deprecation Notice
OpenAI has deprecated the Assistants API. It will shut down on August 26, 2026 .
Consider migrating to the Responses API instead. See OpenAI's migration guide for details.
Covers Threads, Messages, Assistants.
LiteLLM currently covers:
Create Assistants
Delete Assistants
Get Assistants
Create Thread
Get Thread
Add Messages
Get Messages
Run Thread
Supported Providers : ​
OpenAI
Azure OpenAI
OpenAI-Compatible APIs
Quick Start ​
Call an existing Assistant.
Get the Assistant
Create a Thread when a user starts a conversation.
Add Messages to the Thread as the user asks questions.
Run the Assistant on the Thread to generate a response by calling the model and the tools.
SDK + PROXY ​
SDK
PROXY
Create an Assistant
import litellm
import os
# setup env
os . environ [ "OPENAI_API_KEY" ] = "sk-.."
assistant = litellm . create_assistants (
custom_llm_provider = "openai" ,
model = "gpt-4-turbo" ,
instructions = "You are a personal math tutor. When asked a question, write and run Python code to answer the question." ,
name = "Math Tutor" ,
tools = [ { "type" : "code_interpreter" } ] ,
)
### ASYNC USAGE ###
# assistant = await litellm.acreate_assistants(
# custom_llm_provider="openai",
# model="gpt-4-turbo",
# instructions="You are a personal math tutor. When asked a question, write and run Python code to answer the question.",
# name="Math Tutor",
# tools=[{"type": "code_interpreter"}],
# )
from litellm import get_assistants , aget_assistants
assistants = get_assistants ( custom_llm_provider = "openai" )
# assistants = await aget_assistants(custom_llm_provider="openai")
Create a Thread
from litellm import create_thread , acreate_thread
new_thread = create_thread (
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] , # type: ignore
# new_thread = await acreate_thread(custom_llm_provider="openai",messages=[{"role": "user", "content": "Hey, how's it going?"}])
Add Messages to the Thread
from litellm import create_thread , get_thread , aget_thread , add_message , a_add_message
## CREATE A THREAD
_new_thread = create_thread (
## OR retrieve existing thread
received_thread = get_thread (
thread_id = _new_thread . id ,
# received_thread = await aget_thread(custom_llm_provider="openai", thread_id=_new_thread.id,)
## ADD MESSAGE TO THREAD
message = { "role" : "user" , "content" : "Hey, how's it going?" }
added_message = add_message (
thread_id = _new_thread . id , custom_llm_provider = "openai" , ** message
# added_message = await a_add_message(thread_id=_new_thread.id, custom_llm_provider="openai", **message)
Run the Assistant on the Thread
from litellm import get_assistants , create_thread , add_message , run_thread , arun_thread
## get the first assistant ###
assistant_id = assistants . data [ 0 ] . id
## GET A THREAD
## ADD MESSAGE
## 🚨 RUN THREAD
response = run_thread (
custom_llm_provider = "openai" , thread_id = thread_id , assistant_id = assistant_id
# response = await arun_thread(custom_llm_provider="openai", thread_id=thread_id, assistant_id=assistant_id)
print ( f"run_thread: { run_thread } " )
assistant_settings :
custom_llm_provider : azure
litellm_params :
api_key : os.environ/AZURE_API_KEY
api_base : os.environ/AZURE_API_BASE
api_version : os.environ/AZURE_API_VERSION
$ litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Create the Assistant
curl "http://localhost:4000/v1/assistants" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"instructions": "You are a personal math tutor. When asked a question, write and run Python code to answer the question.",
"name": "Math Tutor",
"tools": [{"type": "code_interpreter"}],
"model": "gpt-4-turbo"
}'
curl "http://0.0.0.0:4000/v1/assistants?order=desc&limit=20" \
-H "Authorization: Bearer sk-1234"
curl http://0.0.0.0:4000/v1/threads \
-d ''
Get a Thread
curl http://0.0.0.0:4000/v1/threads/{thread_id} \
curl http://0.0.0.0:4000/v1/threads/{thread_id}/messages \
"role": "user",
"content": "How does AI work? Explain it in simple terms."
curl http://0.0.0.0:4000/v1/threads/thread_abc123/runs \
"assistant_id": "asst_abc123"
Streaming ​
from litellm import run_thread_stream
data = { "custom_llm_provider" : "openai" , "thread_id" : _new_thread . id , "assistant_id" : assistant_id , ** message }
run = run_thread_stream ( ** data )
with run as run :
assert isinstance ( run , AssistantEventHandler )
for chunk in run :
print ( f"chunk: { chunk } " )
run . until_done ( )
curl -X POST 'http://0.0.0.0:4000/threads/{thread_id}/runs' \
-H 'Authorization: Bearer sk-1234' \
-H 'Content-Type: application/json' \
"assistant_id": "asst_6xVZQFFy1Kw87NbnYeNebxTf",
"stream": true
👉 Proxy API Reference ​
Azure OpenAI ​
config
curl
curl -X POST "http://localhost:4000/v1/assistants" \
"model": "<my-azure-deployment-name>"
OpenAI-Compatible APIs ​
To call openai-compatible Assistants API's (eg. Astra Assistants API), just add openai/ to the model name:
custom_llm_provider : openai
api_key : os.environ/ASTRA_API_KEY
api_base : os.environ/ASTRA_API_BASE
"model": "openai/<my-astra-model-name>"
Supported Providers :
Quick Start
SDK + PROXY
Streaming
👉 Proxy API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
