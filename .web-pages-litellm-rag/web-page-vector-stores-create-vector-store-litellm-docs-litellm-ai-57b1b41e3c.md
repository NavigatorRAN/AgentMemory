# /vector_stores - Create Vector Store | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/vector_stores/create
- Final URL: https://docs.litellm.ai/docs/vector_stores/create
- Canonical URL: https://docs.litellm.ai/docs/vector_stores/create
- Fetched at: 2026-06-23T14:34:51Z
- Content type: text/html; charset=utf-8

## Description

Create a vector store which can be used to store and search document chunks for retrieval-augmented generation (RAG) use cases.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Create a vector store which can be used to store and search document chunks for retrieval-augmented generation (RAG) use cases.
Overview ​
Feature Supported Notes Cost Tracking ✅ Tracked per vector store operation Logging ✅ Works across all integrations End-user Tracking ✅ Support LLM Providers (OpenAI /vector_stores API) OpenAI Full vector stores API support across providers Support LLM Providers (Passthrough API) Azure AI Full vector stores API support across providers Support LLM Providers (Dataset Management) RAGFlow Dataset creation and management (search not supported)
The proxy also supports retrieve , list , update , and delete for vector stores (OpenAI-compatible). See Vector store management and routing on the proxy for curl examples and provider routing.
Usage ​
LiteLLM Python SDK ​
Basic Usage
Advanced Configuration
OpenAI Provider
Async example ​
Create Vector Store - Basic
import litellm
response = await litellm . vector_stores . acreate (
name = "My Document Store" ,
file_ids = [ "file-abc123" , "file-def456" ]
)
print ( response )
Sync example ​
Create Vector Store - Sync
response = litellm . vector_stores . create (
With expiration and chunking strategy ​
Create Vector Store - Advanced
file_ids = [ "file-abc123" , "file-def456" ] ,
expires_after = {
"anchor" : "last_active_at" ,
"days" : 7
} ,
chunking_strategy = {
"type" : "static" ,
"static" : {
"max_chunk_size_tokens" : 800 ,
"chunk_overlap_tokens" : 400
}
metadata = {
"project" : "rag-system" ,
"environment" : "production"
Using OpenAI provider explicitly ​
Create Vector Store - OpenAI Provider
import os
# Set API key
os . environ [ "OPENAI_API_KEY" ] = "your-openai-api-key"
custom_llm_provider = "openai"
LiteLLM Proxy Server ​
Setup & Usage
curl (create)
curl (retrieve, list, update, delete)
Setup config.yaml
model_list :
- model_name : gpt - 4o
litellm_params :
model : openai/gpt - 4o
api_key : os.environ/OPENAI_API_KEY
general_settings :
# Vector store settings can be added here if needed
Start proxy
litellm --config /path/to/config.yaml
Test it with OpenAI SDK!
OpenAI SDK via LiteLLM Proxy
from openai import OpenAI
# Point OpenAI SDK to LiteLLM proxy
client = OpenAI (
base_url = "http://0.0.0.0:4000" ,
api_key = "sk-1234" , # Your LiteLLM API key
vector_store = client . beta . vector_stores . create (
print ( vector_store )
Create Vector Store via curl
curl -L -X POST 'http://0.0.0.0:4000/v1/vector_stores' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"name": "My Document Store",
"file_ids": ["file-abc123", "file-def456"],
"expires_after": {
"anchor": "last_active_at",
"days": 7
},
"chunking_strategy": {
"type": "static",
"static": {
"max_chunk_size_tokens": 800,
"chunk_overlap_tokens": 400
"metadata": {
"project": "rag-system",
"environment": "production"
}'
Use the same base URL and API key as for create. Replace vs_abc123 with your vector store id.
Retrieve
curl -L 'http://0.0.0.0:4000/v1/vector_stores/vs_abc123' \
-H 'Accept: application/json' \
-H 'Authorization: Bearer sk-1234'
List (optional query params: after , before , limit , order )
curl -L 'http://0.0.0.0:4000/v1/vector_stores?limit=20&order=desc' \
Update ( POST with JSON body)
curl -L -X POST 'http://0.0.0.0:4000/v1/vector_stores/vs_abc123' \
-d '{ "name": "Renamed store", "metadata": { "env": "staging" } }'
Delete
curl -L -X DELETE 'http://0.0.0.0:4000/v1/vector_stores/vs_abc123' \
See Vector store management and routing on the proxy for provider routing details and OpenAI API references.
OpenAI SDK (Standalone) ​
Direct OpenAI Usage
OpenAI SDK Direct
client = OpenAI ( api_key = "your-openai-api-key" )
Vector store management and routing on the proxy ​
Besides create ( POST /v1/vector_stores or /vector_stores ), the LiteLLM proxy exposes OpenAI-compatible retrieve , list , update , and delete . Paths work with or without the /v1 prefix (for example /v1/vector_stores/... and /vector_stores/... ).
For search , see Search vector store . For files on a store, see Vector store files .
Authentication ​
Use your LiteLLM proxy virtual key with either:
# or
-H 'x-litellm-api-key: sk-1234'
Provider routing ​
LiteLLM automatically selects the vector store provider from the request context — no extra query parameters needed:
LiteLLM-managed stores — If vector_store_id is a LiteLLM-managed store, the proxy resolves the provider from the registry ( litellm_params stored in the database).
Model-based routing — If the request includes a model matching a configured deployment/model group, credentials come from that deployment.
SDK default — If neither applies, the LiteLLM SDK default for that call is used (e.g. openai ).
OpenAI API reference (management operations) ​
Retrieve vector store
List vector stores
Modify vector store — on the LiteLLM proxy, modify is POST to /v1/vector_stores/{vector_store_id} with a JSON body.
Delete vector store
Request Format ​
The request body follows OpenAI's vector stores API format.
Example request body ​
{
"name" : "My Document Store" ,
"file_ids" : [ "file-abc123" , "file-def456" ] ,
"expires_after" : {
"chunking_strategy" : {
"metadata" : {
Optional Fields ​
name (string): The name of the vector store.
file_ids (array of strings): A list of File IDs that the vector store should use. Useful for tools like file_search that can access files.
expires_after (object): The expiration policy for the vector store.
anchor (string): Anchor timestamp after which the expiration policy applies. Supported anchors: last_active_at .
days (integer): The number of days after the anchor time that the vector store will expire.
chunking_strategy (object): The chunking strategy used to chunk the file(s). If not set, will use the auto strategy.
type (string): Always static .
static (object): The static chunking strategy.
max_chunk_size_tokens (integer): The maximum number of tokens in each chunk. The default value is 800 . The minimum value is 100 and the maximum value is 4096 .
chunk_overlap_tokens (integer): The number of tokens that overlap between chunks. The default value is 400 .
metadata (object): Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format. Keys can be a maximum of 64 characters long and values can be a maximum of 512 characters long.
Response Format ​
Example Response ​
"id" : "vs_abc123" ,
"object" : "vector_store" ,
"created_at" : 1699061776 ,
"bytes" : 139920 ,
"file_counts" : {
"in_progress" : 0 ,
"completed" : 2 ,
"failed" : 0 ,
"cancelled" : 0 ,
"total" : 2
"status" : "completed" ,
"expires_at" : null ,
"last_active_at" : 1699061776 ,
Response Fields ​
id (string): The identifier, which can be referenced in API endpoints.
object (string): The object type, which is always vector_store .
created_at (integer): The Unix timestamp (in seconds) for when the vector store was created.
bytes (integer): The total number of bytes used by the files in the vector store.
file_counts (object): The file counts for the vector store.
in_progress (integer): The number of files that are currently being processed.
completed (integer): The number of files that have been successfully processed.
failed (integer): The number of files that failed to process.
cancelled (integer): The number of files that were cancelled.
total (integer): The total number of files.
status (string): The status of the vector store, which can be either expired , in_progress , or completed . A status of completed indicates that the vector store is ready for use.
expires_after (object or null): The expiration policy for the vector store.
expires_at (integer or null): The Unix timestamp (in seconds) for when the vector store will expire.
last_active_at (integer or null): The Unix timestamp (in seconds) for when the vector store was last active.
metadata (object or null): Set of 16 key-value pairs that can be attached to an object.
Mock Response Testing ​
For testing purposes, you can use mock responses:
Mock Response Example
# Mock response for testing
mock_response = {
"id" : "vs_mock123" ,
"name" : "Mock Vector Store" ,
"bytes" : 0 ,
"completed" : 0 ,
"total" : 0
"status" : "completed"
name = "Test Store" ,
mock_response = mock_response
Overview
Usage
LiteLLM Python SDK
LiteLLM Proxy Server
OpenAI SDK (Standalone)
Vector store management and routing on the proxy
Authentication
Provider routing
OpenAI API reference (management operations)
Request Format
Response Format
Mock Response Testing
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
