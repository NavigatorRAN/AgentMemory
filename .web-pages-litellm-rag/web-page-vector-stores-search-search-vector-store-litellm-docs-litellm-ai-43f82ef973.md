# /vector_stores/search - Search Vector Store | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/vector_stores/search
- Final URL: https://docs.litellm.ai/docs/vector_stores/search
- Canonical URL: https://docs.litellm.ai/docs/vector_stores/search
- Fetched at: 2026-06-23T14:34:51Z
- Content type: text/html; charset=utf-8

## Description

Search a vector store for relevant chunks based on a query and file attributes filter. This is useful for retrieval-augmented generation (RAG) use cases.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Search a vector store for relevant chunks based on a query and file attributes filter. This is useful for retrieval-augmented generation (RAG) use cases.
Overview ​
Feature Supported Notes Cost Tracking ✅ Tracked per search operation Logging ✅ Works across all integrations End-user Tracking ✅ Support LLM Providers OpenAI, Azure OpenAI, Bedrock, Vertex RAG Engine, Azure AI, Milvus, Gemini Full vector stores API support across providers
For retrieve, list, update, and delete over HTTP (including custom_llm_provider / model routing), see Create vector store .
Usage ​
LiteLLM Python SDK ​
Basic Usage
Advanced Configuration
Multiple Queries
OpenAI Provider
Azure AI Provider
Milvus Provider
Gemini Provider
Non-streaming example ​
Search Vector Store - Basic
import litellm
response = await litellm . vector_stores . asearch (
vector_store_id = "vs_abc123" ,
query = "What is the capital of France?"
)
print ( response )
Synchronous example ​
Search Vector Store - Sync
response = litellm . vector_stores . search (
With filters and ranking options ​
Search Vector Store - Advanced
query = "What is the capital of France?" ,
filters = {
"file_ids" : [ "file-abc123" , "file-def456" ]
} ,
max_num_results = 5 ,
ranking_options = {
"score_threshold" : 0.7
rewrite_query = True
Searching with multiple queries ​
Search Vector Store - Multiple Queries
query = [
"What is the capital of France?" ,
"What is the population of Paris?"
] ,
max_num_results = 10
Using OpenAI provider explicitly ​
Search Vector Store - OpenAI Provider
import os
# Set API key
os . environ [ "OPENAI_API_KEY" ] = "your-openai-api-key"
custom_llm_provider = "openai"
Using Azure AI Search ​
Search Vector Store - Azure AI Provider
# Set credentials
os . environ [ "AZURE_SEARCH_API_KEY" ] = "your-search-api-key"
vector_store_id = "my-vector-index" ,
custom_llm_provider = "azure_ai" ,
azure_search_service_name = "your-search-service" ,
litellm_embedding_model = "azure/text-embedding-3-large" ,
litellm_embedding_config = {
"api_base" : "your-embedding-endpoint" ,
"api_key" : "your-embedding-api-key" ,
api_key = os . getenv ( "AZURE_SEARCH_API_KEY" ) ,
See full Azure AI vector store documentation
Using Milvus ​
Search Vector Store - Milvus Provider
os . environ [ "MILVUS_API_KEY" ] = "your-milvus-api-key"
os . environ [ "MILVUS_API_BASE" ] = "https://your-milvus-instance.milvus.io"
vector_store_id = "my-collection-name" ,
custom_llm_provider = "milvus" ,
milvus_text_field = "book_intro" ,
api_key = os . getenv ( "MILVUS_API_KEY" ) ,
See full Milvus vector store documentation
Using Gemini File Search ​
Search Vector Store - Gemini Provider
os . environ [ "GEMINI_API_KEY" ] = "your-gemini-api-key"
vector_store_id = "fileSearchStores/your-store-id" ,
custom_llm_provider = "gemini" ,
max_num_results = 5
With Metadata Filter:
Search with Metadata Filter
query = "What is LiteLLM?" ,
filters = { "author" : "John Doe" , "category" : "documentation" } ,
See full Gemini File Search documentation
LiteLLM Proxy Server ​
Setup & Usage
curl
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
search_results = client . beta . vector_stores . search (
print ( search_results )
Search Vector Store via curl
curl -L -X POST 'http://0.0.0.0:4000/v1/vector_stores/vs_abc123/search' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"query": "What is the capital of France?",
"filters": {
"file_ids": ["file-abc123", "file-def456"]
},
"max_num_results": 5,
"ranking_options": {
"score_threshold": 0.7
"rewrite_query": true
}'
Setting Up Vector Stores ​
To use vector store search, configure your vector stores in the vector_store_registry . See the Vector Store Configuration Guide for:
Provider-specific configuration (Bedrock, OpenAI, Azure, Vertex AI, PG Vector)
Python SDK and Proxy setup examples
Authentication and credential management
Using Vector Stores with Chat Completions ​
Pass vector_store_ids in chat completion requests to automatically retrieve relevant context. See Using Vector Stores with Chat Completions for implementation details.
Overview
Usage
LiteLLM Python SDK
LiteLLM Proxy Server
Setting Up Vector Stores
Using Vector Stores with Chat Completions
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
