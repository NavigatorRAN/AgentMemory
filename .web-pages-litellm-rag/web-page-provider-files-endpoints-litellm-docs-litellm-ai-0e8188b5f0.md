# Provider Files Endpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/files_endpoints
- Final URL: https://docs.litellm.ai/docs/files_endpoints
- Canonical URL: https://docs.litellm.ai/docs/files_endpoints
- Fetched at: 2026-06-23T14:23:59Z
- Content type: text/html; charset=utf-8

## Description

Files are used to upload documents that can be used with features like Assistants, Fine-tuning, and Batch API.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Files are used to upload documents that can be used with features like Assistants, Fine-tuning, and Batch API.
Use this to call the provider's /files endpoints directly, in the OpenAI format.
Quick Start ​
Upload a File
List Files
Retrieve File Information
Delete File
Get File Content
Multi-Account Support (Multiple OpenAI Keys) ​
Use different OpenAI API keys for files and batches by specifying a model parameter that references entries in your model_list . This approach works without requiring a database and allows you to route files/batches to different OpenAI accounts.
How It Works ​
Define models in model_list with different API keys
Pass model parameter when creating files
LiteLLM returns encoded IDs that contain routing information
Use encoded IDs for all subsequent operations (retrieve, delete, batches)
No need to specify model again - routing info is in the ID
Setup ​
model_list :
# litellm OpenAI Account
- model_name : "gpt-4o-litellm"
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_LITELLM_API_KEY
# Free OpenAI Account
- model_name : "gpt-4o-free"
api_key : os.environ/OPENAI_FREE_API_KEY
Usage Example ​
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" , # Your LiteLLM proxy key
base_url = "http://0.0.0.0:4000"
)
# Create file using litellm account
file_response = client . files . create (
file = open ( "batch_data.jsonl" , "rb" ) ,
purpose = "batch" ,
extra_body = { "model" : "gpt-4o-litellm" } # Routes to litellm key
print ( f"File ID: { file_response . id } " )
# Returns encoded ID like: file-bGl0ZWxsbTpmaWxlLWFiYzEyMzttb2RlbCxncHQtNG8taWZvb2Q
# Create batch using the encoded file ID
# No need to specify model again - it's embedded in the file ID
batch_response = client . batches . create (
input_file_id = file_response . id , # Encoded ID
endpoint = "/v1/chat/completions" ,
completion_window = "24h"
print ( f"Batch ID: { batch_response . id } " )
# Returns encoded batch ID with routing info
# Retrieve batch - routing happens automatically
batch_status = client . batches . retrieve ( batch_response . id )
print ( f"Status: { batch_status . status } " )
# List files for a specific account
files = client . files . list (
extra_body = { "model" : "gpt-4o-free" } # List free files
# List batches for a specific account
batches = client . batches . list (
extra_query = { "model" : "gpt-4o-litellm" } # List litellm batches
Parameter Options ​
You can pass the model parameter via:
Request body : extra_body={"model": "gpt-4o-litellm"}
Query parameter : ?model=gpt-4o-litellm
Header : x-litellm-model: gpt-4o-litellm
How Encoded IDs Work ​
When you create a file/batch with a model parameter, LiteLLM encodes the model name into the returned ID
The encoded ID is base64-encoded and looks like: file-bGl0ZWxsbTpmaWxlLWFiYzEyMzttb2RlbCxncHQtNG8taWZvb2Q
When you use this ID in subsequent operations (retrieve, delete, batch create), LiteLLM automatically:
Decodes the ID
Extracts the model name
Looks up the credentials
Routes the request to the correct OpenAI account
The original provider file/batch ID is preserved internally
Benefits ​
✅ No Database Required - All routing info stored in the ID
✅ Stateless - Works across proxy restarts
✅ Simple - Just pass the ID around like normal
✅ Backward Compatible - Existing custom_llm_provider and files_settings still work
✅ Future-Proof - Aligns with managed batches approach
Migration from files_settings ​
Old approach (still works):
files_settings :
- custom_llm_provider : openai
api_key : os.environ/OPENAI_KEY
# Had to specify provider on every call
client . files . create ( . . . , extra_headers = { "custom-llm-provider" : "openai" } )
client . files . retrieve ( file_id , extra_headers = { "custom-llm-provider" : "openai" } )
New approach (recommended):
- model_name : "gpt-4o-account1"
# Specify model once on create
file = client . files . create ( . . . , extra_body = { "model" : "gpt-4o-account1" } )
# Then just use the ID - routing is automatic
client . files . retrieve ( file . id ) # No need to specify account
client . batches . create ( input_file_id = file . id ) # Routes correctly
LiteLLM PROXY Server
SDK
Setup config.yaml
# for /files endpoints
files_settings:
- custom_llm_provider: azure
api_base: https://exampleopenaiendpoint-production.up.railway.app
api_key: fake-key
api_version: "2023-03-15-preview"
- custom_llm_provider: openai
api_key: os.environ/OPENAI_API_KEY
Start LiteLLM PROXY Server
litellm --config /path/to/config.yaml
## RUNNING on http://0.0.0.0:4000
Use OpenAI's /files endpoints
api_key = "sk-..." ,
base_url = "http://0.0.0.0:4000/v1"
client . files . create (
file = wav_data ,
purpose = "user_data" ,
extra_headers = { "custom-llm-provider" : "openai" }
files = client . files . list ( extra_headers = { "custom-llm-provider" : "openai" } )
print ( "files=" , files )
file = client . files . retrieve ( file_id = "file-abc123" , extra_headers = { "custom-llm-provider" : "openai" } )
print ( "file=" , file )
response = client . files . delete ( file_id = "file-abc123" , extra_headers = { "custom-llm-provider" : "openai" } )
print ( "delete response=" , response )
content = client . files . content ( file_id = "file-abc123" , extra_headers = { "custom-llm-provider" : "openai" } )
print ( "content=" , content )
from litellm
import os
os . environ [ "OPENAI_API_KEY" ] = "sk-.."
file_obj = await litellm . acreate_file (
file = open ( "mydata.jsonl" , "rb" ) ,
purpose = "fine-tune" ,
custom_llm_provider = "openai" ,
print ( "Response from creating file=" , file_obj )
files = await litellm . alist_files (
limit = 10
file = await litellm . aretrieve_file (
file_id = "file-abc123" ,
custom_llm_provider = "openai"
response = await litellm . adelete_file (
content = await litellm . afile_content (
print ( "file content=" , content )
Get File Content (Bedrock)
# For Bedrock batch output files stored in S3
file_id = "s3://bucket-name/path/to/file.jsonl" , # S3 URI or unified file ID
custom_llm_provider = "bedrock" ,
aws_region_name = "us-west-2"
print ( "file content=" , content . text )
Supported Providers : ​
OpenAI ​
Azure OpenAI ​
Vertex AI ​
Bedrock ​
Anthropic ​
note
Anthropic Files API has a different purpose than OpenAI's. It's not for Batches or Fine-tuning—it's for uploading files once and referencing them by file_id in multiple messages, avoiding re-uploads. File API operations are free — file content used in Messages requests is priced as input tokens.
Swagger API Reference ​
Quick Start
Multi-Account Support (Multiple OpenAI Keys)
How It Works
Setup
Usage Example
Parameter Options
How Encoded IDs Work
Benefits
Migration from files_settings
Supported Providers :
OpenAI
Azure OpenAI
Vertex AI
Bedrock
Anthropic
Swagger API Reference
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
