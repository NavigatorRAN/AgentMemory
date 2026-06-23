# Manus | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/manus
- Final URL: https://docs.litellm.ai/docs/providers/manus
- Canonical URL: https://docs.litellm.ai/docs/providers/manus
- Fetched at: 2026-06-23T14:28:16Z
- Content type: text/html; charset=utf-8

## Description

Use Manus AI agents through LiteLLM's OpenAI-compatible Responses API.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Manus AI agents through LiteLLM's OpenAI-compatible Responses API.
Property Details Description Manus is an AI agent platform for complex reasoning tasks, document analysis, and multi-step workflows with asynchronous task execution. Provider Route on LiteLLM manus/{agent_profile} Supported Operations /responses (Responses API), /files (Files API) Provider Doc Manus API ↗
Model Format ​
manus/{agent_profile}
Examples:
manus/manus-1.6 - General purpose agent
manus/manus-1.6-lite - Lightweight agent for simple tasks
manus/manus-1.6-max - Advanced agent for complex analysis
LiteLLM Python SDK ​
Basic Usage
import litellm
import os
import time
# Set API key
os . environ [ "MANUS_API_KEY" ] = "your-manus-api-key"
# Create task
response = litellm . responses (
model = "manus/manus-1.6" ,
input = "What's the capital of France?" ,
)
print ( f"Task ID: { response . id } " )
print ( f"Status: { response . status } " ) # "running"
# Poll until complete
task_id = response . id
while response . status == "running" :
time . sleep ( 5 )
response = litellm . get_response (
response_id = task_id ,
custom_llm_provider = "manus" ,
print ( f"Status: { response . status } " )
# Get results
if response . status == "completed" :
for message in response . output :
if message . role == "assistant" :
print ( message . content [ 0 ] . text )
LiteLLM AI Gateway ​
Setup ​
config.yaml
model_list :
- model_name : manus - agent
litellm_params :
model : manus/manus - 1.6
api_key : os.environ/MANUS_API_KEY
Start Proxy
litellm --config config.yaml
Usage ​
cURL
OpenAI SDK
Create Task
curl -X POST http://localhost:4000/responses \
-H "Authorization: Bearer your-proxy-key" \
-H "Content-Type: application/json" \
-d '{
"model": "manus-agent",
"input": "What is the capital of France?"
}'
# Response
{
"id": "task_abc123",
"status": "running",
"metadata": {
"task_url": "https://manus.im/app/task_abc123"
}
Poll for Completion
# Check status (repeat until status is "completed")
curl http://localhost:4000/responses/task_abc123 \
-H "Authorization: Bearer your-proxy-key"
# When completed
"status": "completed",
"output": [
"role": "user",
"content": [{"text": "What is the capital of France?"}]
},
"role": "assistant",
"content": [{"text": "The capital of France is Paris."}]
]
Create Task and Poll
import openai
client = openai . OpenAI (
base_url = "http://localhost:4000" ,
api_key = "your-proxy-key"
response = client . responses . create (
model = "manus-agent" ,
input = "What is the capital of France?"
response = client . responses . retrieve ( response_id = task_id )
How It Works ​
Manus operates as an asynchronous agent API :
Create Task : When you call litellm.responses() , Manus creates a task and returns immediately with status: "running"
Task Executes : The agent works on your request in the background
Poll for Completion : You must repeatedly call litellm.get_response() or client.responses.retrieve() until the status changes to "completed"
Get Results : Once completed, the output field contains the full conversation
Task Statuses:
running - Agent is actively working
pending - Agent is waiting for input
completed - Task finished successfully
error - Task failed
Production Usage
For production applications, use webhooks instead of polling to get notified when tasks complete.
Supported Parameters ​
Parameter Supported Notes input ✅ Text, images, or structured content stream ✅ Fake streaming (task runs async) max_output_tokens ✅ Limits response length previous_response_id ✅ For multi-turn conversations
Files API ​
Manus supports file uploads for document analysis and processing. Files can be uploaded and then referenced in Responses API calls.
Upload, Use, Retrieve, and Delete Files
# Upload file
file_content = b"This is a document for analysis."
created_file = await litellm . acreate_file (
file = ( "document.txt" , file_content ) ,
purpose = "assistants" ,
print ( f"Uploaded file: { created_file . id } " )
# Use file with Responses API
response = await litellm . aresponses (
input = [
"role" : "user" ,
"content" : [
{ "type" : "input_text" , "text" : "Summarize this document." } ,
{ "type" : "input_file" , "file_id" : created_file . id } ,
] ,
} ,
extra_body = { "task_mode" : "agent" , "agent_profile" : "manus-1.6-agent" } ,
print ( f"Response: { response . id } " )
# Retrieve file
retrieved_file = await litellm . afile_retrieve (
file_id = created_file . id ,
print ( f"File details: { retrieved_file . filename } , { retrieved_file . bytes } bytes" )
# Delete file
deleted_file = await litellm . afile_delete (
print ( f"Deleted: { deleted_file . deleted } " )
Upload File
curl -X POST http://localhost:4000/v1/files \
-F "file=@document.txt" \
-F "purpose=assistants" \
-F "custom_llm_provider=manus"
"id": "file_abc123",
"object": "file",
"bytes": 1024,
"created_at": 1234567890,
"filename": "document.txt",
"purpose": "assistants",
"status": "uploaded"
Use File with Responses API
# Create response with file
"input": [
"content": [
{"type": "input_text", "text": "Summarize this document."},
{"type": "input_file", "file_id": "file_abc123"}
Retrieve File
# Get file details
curl http://localhost:4000/v1/files/file_abc123 \
Delete File
curl -X DELETE http://localhost:4000/v1/files/file_abc123 \
"deleted": true
with open ( "document.txt" , "rb" ) as f :
created_file = client . files . create (
file = f ,
extra_body = { "custom_llm_provider" : "manus" }
{ "type" : "input_file" , "file_id" : created_file . id }
retrieved_file = client . files . retrieve ( created_file . id )
print ( f"File: { retrieved_file . filename } , { retrieved_file . bytes } bytes" )
deleted_file = client . files . delete ( created_file . id )
Related Documentation ​
LiteLLM Responses API
LiteLLM Files API
Manus OpenAI Compatibility
Model Format
LiteLLM Python SDK
LiteLLM AI Gateway
Setup
Usage
How It Works
Supported Parameters
Files API
Related Documentation
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
