# Gemini File Search | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/gemini_file_search
- Final URL: https://docs.litellm.ai/docs/providers/gemini_file_search
- Canonical URL: https://docs.litellm.ai/docs/providers/gemini_file_search
- Fetched at: 2026-06-23T14:27:52Z
- Content type: text/html; charset=utf-8

## Description

Use Google Gemini's File Search for Retrieval Augmented Generation (RAG) with LiteLLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Google Gemini's File Search for Retrieval Augmented Generation (RAG) with LiteLLM.
Gemini File Search imports, chunks, and indexes your data to enable fast retrieval of relevant information based on user prompts. This information is then provided as context to the model for more accurate and relevant answers.
Official Gemini File Search Documentation
Features ​
Feature Supported Notes Cost Tracking ❌ Cost calculation not yet implemented Logging ✅ Full request/response logging RAG Ingest API ✅ Upload → Chunk → Embed → Store Vector Store Search ✅ Search with metadata filters Custom Chunking ✅ Configure chunk size and overlap Metadata Filtering ✅ Filter by custom metadata Citations ✅ Extract from grounding metadata
Quick Start ​
Setup ​
Set your Gemini API key:
export GEMINI_API_KEY="your-api-key"
# or
export GOOGLE_API_KEY="your-api-key"
Basic RAG Ingest ​
Python SDK
LiteLLM Proxy
import litellm
# Ingest a document
response = await litellm . aingest (
ingest_options = {
"name" : "my-document-store" ,
"vector_store" : {
"custom_llm_provider" : "gemini"
}
} ,
file_data = ( "document.txt" , b"Your document content" , "text/plain" )
)
print ( f"Vector Store ID: { response [ 'vector_store_id' ] } " )
print ( f"File ID: { response [ 'file_id' ] } " )
curl -X POST "http://localhost:4000/v1/rag/ingest" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"file": {
"filename": "document.txt",
"content": "'$(base64 -i document.txt)'",
"content_type": "text/plain"
},
"ingest_options": {
"name": "my-document-store",
"vector_store": {
"custom_llm_provider": "gemini"
}'
Search Vector Store ​
# Search the vector store
response = await litellm . vector_stores . asearch (
vector_store_id = "fileSearchStores/your-store-id" ,
query = "What is the main topic?" ,
custom_llm_provider = "gemini" ,
max_num_results = 5
for result in response [ "data" ] :
print ( f"Score: { result . get ( 'score' ) } " )
print ( f"Content: { result [ 'content' ] [ 0 ] [ 'text' ] } " )
curl -X POST "http://localhost:4000/v1/vector_stores/fileSearchStores/your-store-id/search" \
"query": "What is the main topic?",
"custom_llm_provider": "gemini",
"max_num_results": 5
Advanced Features ​
Custom Chunking Configuration ​
Control how documents are split into chunks:
"name" : "custom-chunking-store" ,
"chunking_strategy" : {
"white_space_config" : {
"max_tokens_per_chunk" : 200 ,
"max_overlap_tokens" : 20
file_data = ( "document.txt" , document_content , "text/plain" )
Chunking Parameters:
max_tokens_per_chunk : Maximum tokens per chunk (default: 800, min: 100, max: 4096)
max_overlap_tokens : Overlap between chunks (default: 400)
Metadata Filtering ​
Attach custom metadata to files and filter searches:
Attach Metadata During Ingest ​
"name" : "metadata-store" ,
"custom_llm_provider" : "gemini" ,
"custom_metadata" : [
{ "key" : "author" , "string_value" : "John Doe" } ,
{ "key" : "year" , "numeric_value" : 2024 } ,
{ "key" : "category" , "string_value" : "documentation" }
]
Search with Metadata Filter ​
query = "What is LiteLLM?" ,
filters = { "author" : "John Doe" , "category" : "documentation" }
Filter Syntax:
Simple equality: {"key": "value"}
Gemini converts to: key="value"
Multiple filters combined with AND
Using Existing Vector Store ​
Ingest into an existing File Search store:
# First, create a store
create_response = await litellm . vector_stores . acreate (
name = "My Persistent Store" ,
custom_llm_provider = "gemini"
store_id = create_response [ "id" ]
# Then ingest multiple documents into it
for doc in documents :
await litellm . aingest (
"vector_store_id" : store_id # Reuse existing store
file_data = ( doc [ "name" ] , doc [ "content" ] , doc [ "type" ] )
Citation Extraction ​
Gemini provides grounding metadata with citations:
query = "Explain the concept" ,
# Access citation information
if "attributes" in result :
print ( f"URI: { result [ 'attributes' ] . get ( 'uri' ) } " )
print ( f"Title: { result [ 'attributes' ] . get ( 'title' ) } " )
# Content with relevance score
print ( f"Text: { result [ 'content' ] [ 0 ] [ 'text' ] } " )
Complete Example ​
End-to-end workflow:
# 1. Create a File Search store
store_response = await litellm . vector_stores . acreate (
name = "Knowledge Base" ,
store_id = store_response [ "id" ]
print ( f"Created store: { store_id } " )
# 2. Ingest documents with custom chunking and metadata
documents = [
{
"name" : "intro.txt" ,
"content" : b"Introduction to LiteLLM..." ,
"metadata" : [
{ "key" : "section" , "string_value" : "intro" } ,
{ "key" : "priority" , "numeric_value" : 1 }
"name" : "advanced.txt" ,
"content" : b"Advanced features..." ,
{ "key" : "section" , "string_value" : "advanced" } ,
{ "key" : "priority" , "numeric_value" : 2 }
ingest_response = await litellm . aingest (
"name" : f"ingest- { doc [ 'name' ] } " ,
"vector_store_id" : store_id ,
"custom_metadata" : doc [ "metadata" ]
"max_tokens_per_chunk" : 300 ,
"max_overlap_tokens" : 50
file_data = ( doc [ "name" ] , doc [ "content" ] , "text/plain" )
print ( f"Ingested: { doc [ 'name' ] } " )
# 3. Search with filters
search_response = await litellm . vector_stores . asearch (
vector_store_id = store_id ,
query = "How do I get started?" ,
filters = { "section" : "intro" } ,
max_num_results = 3
# 4. Process results
for i , result in enumerate ( search_response [ "data" ] ) :
print ( f"\nResult { i + 1 } :" )
print ( f" Score: { result . get ( 'score' ) } " )
print ( f" File: { result . get ( 'filename' ) } " )
print ( f" Content: { result [ 'content' ] [ 0 ] [ 'text' ] [ : 100] } ..." )
Supported File Types ​
Gemini File Search supports a wide range of file formats:
Documents ​
PDF ( application/pdf )
Microsoft Word ( .docx , .doc )
Microsoft Excel ( .xlsx , .xls )
Microsoft PowerPoint ( .pptx )
OpenDocument formats ( .odt , .ods , .odp )
Text Files ​
Plain text ( text/plain )
Markdown ( text/markdown )
HTML ( text/html )
CSV ( text/csv )
JSON ( application/json )
XML ( application/xml )
Code Files ​
Python, JavaScript, TypeScript, Java, C/C++, Go, Rust, etc.
Most common programming languages supported
See Gemini's full list of supported file types .
Pricing ​
Indexing : $0.15 per 1M tokens (embedding pricing)
Storage : Free
Query embeddings : Free
Retrieved tokens : Charged as regular context tokens
Supported Models ​
File Search works with:
gemini-3-pro-preview
gemini-2.5-pro
gemini-2.5-flash (and preview versions)
gemini-2.5-flash-lite (and preview versions)
Troubleshooting ​
Authentication Errors ​
# Ensure API key is set
import os
os . environ [ "GEMINI_API_KEY" ] = "your-api-key"
# Or pass explicitly
"api_key" : "your-api-key"
file_data = ( . . . )
Store Not Found ​
Ensure you're using the full store name format:
✅ fileSearchStores/abc123
❌ abc123
Large Files ​
For files >100MB, split them into smaller chunks before ingestion.
Slow Indexing ​
After ingestion, Gemini may need time to index documents. Wait a few seconds before searching:
import time
# After ingest
await litellm . aingest ( . . . )
# Wait for indexing
time . sleep ( 5 )
# Then search
await litellm . vector_stores . asearch ( . . . )
Related Resources ​
Gemini File Search Official Docs
LiteLLM RAG Ingest API
LiteLLM Vector Store Search
Using Vector Stores with Chat
Features
Quick Start
Setup
Basic RAG Ingest
Search Vector Store
Advanced Features
Custom Chunking Configuration
Metadata Filtering
Using Existing Vector Store
Citation Extraction
Complete Example
Supported File Types
Documents
Text Files
Code Files
Pricing
Supported Models
Troubleshooting
Authentication Errors
Store Not Found
Large Files
Slow Indexing
Related Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
