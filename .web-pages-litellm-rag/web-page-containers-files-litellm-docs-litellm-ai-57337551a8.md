# /containers/files | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/container_files
- Final URL: https://docs.litellm.ai/docs/container_files
- Canonical URL: https://docs.litellm.ai/docs/container_files
- Fetched at: 2026-06-23T14:23:38Z
- Content type: text/html; charset=utf-8

## Description

Manage files within Code Interpreter containers. Files are created automatically when code interpreter generates outputs (charts, CSVs, images, etc.).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Manage files within Code Interpreter containers. Files are created automatically when code interpreter generates outputs (charts, CSVs, images, etc.).
tip
Looking for how to use Code Interpreter? See the Code Interpreter Guide .
Feature Supported Cost Tracking ✅ Logging ✅ Supported Providers openai
Endpoints ​
Endpoint Method Description /v1/containers/{container_id}/files POST Upload file to container /v1/containers/{container_id}/files GET List files in container /v1/containers/{container_id}/files/{file_id} GET Get file metadata /v1/containers/{container_id}/files/{file_id}/content GET Download file content /v1/containers/{container_id}/files/{file_id} DELETE Delete file
LiteLLM Python SDK ​
Upload Container File ​
Upload files directly to a container session. This is useful when /chat/completions or /responses sends files to the container but the input file type is limited to PDF. This endpoint lets you work with other file types like CSV, Excel, Python scripts, etc.
upload_container_file.py
from litellm import upload_container_file
# Upload a CSV file
file = upload_container_file (
container_id = "cntr_123..." ,
file = ( "data.csv" , open ( "data.csv" , "rb" ) . read ( ) , "text/csv" ) ,
custom_llm_provider = "openai"
)
print ( f"Uploaded: { file . id } " )
print ( f"Path: { file . path } " )
Async:
aupload_container_file.py
from litellm import aupload_container_file
file = await aupload_container_file (
file = ( "script.py" , b"print('hello world')" , "text/x-python" ) ,
Supported file formats:
CSV ( .csv )
Excel ( .xlsx )
Python scripts ( .py )
JSON ( .json )
Markdown ( .md )
Text files ( .txt )
And more...
List Container Files ​
list_container_files.py
from litellm import list_container_files
files = list_container_files (
for file in files . data :
print ( f" - { file . id } : { file . filename } " )
alist_container_files.py
from litellm import alist_container_files
files = await alist_container_files (
Retrieve Container File ​
retrieve_container_file.py
from litellm import retrieve_container_file
file = retrieve_container_file (
file_id = "cfile_456..." ,
print ( f"File: { file . filename } " )
print ( f"Size: { file . bytes } bytes" )
Download File Content ​
retrieve_container_file_content.py
from litellm import retrieve_container_file_content
content = retrieve_container_file_content (
# content is raw bytes
with open ( "output.png" , "wb" ) as f :
f . write ( content )
Delete Container File ​
delete_container_file.py
from litellm import delete_container_file
result = delete_container_file (
print ( f"Deleted: { result . deleted } " )
LiteLLM AI Gateway (Proxy) ​
Upload File ​
OpenAI SDK
curl
upload_file.py
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" ,
base_url = "http://localhost:4000"
file = client . containers . files . create (
file = open ( "data.csv" , "rb" )
upload_file.sh
curl "http://localhost:4000/v1/containers/cntr_123.../files" \
-H "Authorization: Bearer sk-1234" \
-F file="@data.csv"
List Files ​
list_files.py
files = client . containers . files . list (
container_id = "cntr_123..."
list_files.sh
-H "Authorization: Bearer sk-1234"
Retrieve File Metadata ​
retrieve_file.py
file = client . containers . files . retrieve (
file_id = "cfile_456..."
retrieve_file.sh
curl "http://localhost:4000/v1/containers/cntr_123.../files/cfile_456..." \
download_content.py
content = client . containers . files . content (
f . write ( content . read ( ) )
download_content.sh
curl "http://localhost:4000/v1/containers/cntr_123.../files/cfile_456.../content" \
--output downloaded_file.png
Delete File ​
delete_file.py
result = client . containers . files . delete (
delete_file.sh
curl -X DELETE "http://localhost:4000/v1/containers/cntr_123.../files/cfile_456..." \
Parameters ​
Parameter Type Required Description container_id string Yes Container ID file FileTypes Yes File to upload. Can be a tuple of (filename, content, content_type), file-like object, or bytes
Parameter Type Required Description container_id string Yes Container ID after string No Pagination cursor limit integer No Items to return (1-100, default: 20) order string No Sort order: asc or desc
Retrieve/Delete File ​
Parameter Type Required Description container_id string Yes Container ID file_id string Yes File ID
Response Objects ​
ContainerFileObject ​
ContainerFileObject
{
"id" : "cfile_456..." ,
"object" : "container.file" ,
"container_id" : "cntr_123..." ,
"bytes" : 12345 ,
"created_at" : 1234567890 ,
"filename" : "chart.png" ,
"path" : "/mnt/data/chart.png" ,
"source" : "code_interpreter"
}
ContainerFileListResponse ​
ContainerFileListResponse
"object" : "list" ,
"data" : [ ... ] ,
"first_id" : "cfile_456..." ,
"last_id" : "cfile_789..." ,
"has_more" : false
DeleteContainerFileResponse ​
DeleteContainerFileResponse
"object" : "container.file.deleted" ,
"deleted" : true
Supported Providers ​
Provider Status OpenAI ✅ Supported
Related ​
Containers API - Manage containers
Code Interpreter Guide - Using Code Interpreter with LiteLLM
Endpoints
LiteLLM Python SDK
Upload Container File
List Container Files
Retrieve Container File
Download File Content
Delete Container File
LiteLLM AI Gateway (Proxy)
Upload File
List Files
Retrieve File Metadata
Delete File
Parameters
Retrieve/Delete File
Response Objects
Supported Providers
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
