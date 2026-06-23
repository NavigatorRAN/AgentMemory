# /rag/query | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/rag_query
- Final URL: https://docs.litellm.ai/docs/rag_query
- Canonical URL: https://docs.litellm.ai/docs/rag_query
- Fetched at: 2026-06-23T14:32:42Z
- Content type: text/html; charset=utf-8

## Description

RAG Query endpoint: Search Vector Store → (Rerank) → LLM Completion

## Extracted Text

Skip to main content
On this page
Copy as Markdown
RAG Query endpoint: Search Vector Store → (Rerank) → LLM Completion
Feature Supported Logging Yes Streaming Yes Reranking Yes (optional) Supported Providers openai , bedrock , vertex_ai
Quick Start ​
RAG Query with OpenAI
curl -X POST "http://localhost:4000/v1/rag/query" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "gpt-4o-mini",
"messages": [{"role": "user", "content": "What is LiteLLM?"}],
"retrieval_config": {
"vector_store_id": "vs_abc123",
"custom_llm_provider": "openai",
"top_k": 5
}
}'
How It Works ​
The RAG query endpoint performs the following steps:
Extract Query : Extracts the query text from the last user message
Search Vector Store : Searches the specified vector store for relevant context
Rerank (Optional) : Reranks the search results using a reranking model
Generate Response : Calls the LLM with the retrieved context prepended to the messages
Response ​
The response follows the standard OpenAI chat completion format, with additional search metadata:
{
"id" : "chatcmpl-abc123" ,
"object" : "chat.completion" ,
"created" : 1703123456 ,
"model" : "gpt-4o-mini" ,
"choices" : [
"index" : 0 ,
"message" : {
"role" : "assistant" ,
"content" : "LiteLLM is a unified interface for 100+ LLMs..."
} ,
"finish_reason" : "stop"
] ,
"usage" : {
"prompt_tokens" : 150 ,
"completion_tokens" : 50 ,
"total_tokens" : 200
"_hidden_params" : {
"search_results" : { ... } ,
"rerank_results" : { ... }
With Reranking ​
Add a rerank configuration to improve result quality:
RAG Query with Reranking
"top_k": 10
},
"rerank": {
"enabled": true,
"model": "cohere/rerank-english-v3.0",
"top_n": 3
Streaming ​
Enable streaming for real-time responses:
RAG Query with Streaming
"custom_llm_provider": "openai"
"stream": true
Request Parameters ​
Top-Level ​
Parameter Type Required Description model string Yes The LLM model to use for generation messages array Yes Array of chat messages (OpenAI format) retrieval_config object Yes Vector store search configuration rerank object No Reranking configuration stream boolean No Enable streaming (default: false )
retrieval_config ​
Parameter Type Default Description vector_store_id string required ID of the vector store to search custom_llm_provider string "openai" Vector store provider top_k integer 10 Number of results to retrieve
rerank ​
Parameter Type Default Description enabled boolean false Enable reranking model string - Reranking model (e.g., cohere/rerank-english-v3.0 ) top_n integer 5 Number of results after reranking
End-to-End Example ​
1. Ingest a Document ​
First, ingest a document using the /rag/ingest endpoint:
Step 1: Ingest
curl -X POST "http://localhost:4000/v1/rag/ingest" \
-d "{
\"file\": {
\"filename\": \"company_docs.txt\",
\"content\": \"$(base64 -i company_docs.txt)\",
\"content_type\": \"text/plain\"
\"ingest_options\": {
\"vector_store\": {
\"custom_llm_provider\": \"openai\"
}"
Response:
"id" : "ingest_abc123" ,
"status" : "completed" ,
"vector_store_id" : "vs_xyz789" ,
"file_id" : "file-123"
2. Query with RAG ​
Now query the ingested documents:
Step 2: Query
"messages": [
{"role": "user", "content": "What products does the company offer?"}
],
"vector_store_id": "vs_xyz789",
"content" : "Based on the company documents, the company offers..."
]
Provider Examples ​
Bedrock ​
RAG Query with Bedrock
"model": "bedrock/anthropic.claude-3-sonnet-20240229-v1:0",
"vector_store_id": "KNOWLEDGE_BASE_ID",
"custom_llm_provider": "bedrock",
Vertex AI ​
RAG Query with Vertex AI
"model": "vertex_ai/gemini-1.5-pro",
"vector_store_id": "your-corpus-id",
"custom_llm_provider": "vertex_ai",
Python SDK ​
Using litellm.aquery()
import litellm
response = await litellm . aquery (
model = "gpt-4o-mini" ,
messages = [ { "role" : "user" , "content" : "What is LiteLLM?" } ] ,
retrieval_config = {
"vector_store_id" : "vs_abc123" ,
"custom_llm_provider" : "openai" ,
"top_k" : 5 ,
rerank = {
"enabled" : True ,
"model" : "cohere/rerank-english-v3.0" ,
"top_n" : 3 ,
)
print ( response . choices [ 0 ] . message . content )
Quick Start
How It Works
Response
With Reranking
Streaming
Request Parameters
Top-Level
retrieval_config
rerank
End-to-End Example
1. Ingest a Document
2. Query with RAG
Provider Examples
Bedrock
Vertex AI
Python SDK
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
