# Bedrock Knowledge Bases | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_vector_store
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_vector_store
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_vector_store
- Fetched at: 2026-06-23T14:27:19Z
- Content type: text/html; charset=utf-8

## Description

AWS Bedrock Knowledge Bases allows you to connect your LLM's to your organization's data, letting your models retrieve and reference information specific to your business.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
AWS Bedrock Knowledge Bases allows you to connect your LLM's to your organization's data, letting your models retrieve and reference information specific to your business.
Property Details Description Bedrock Knowledge Bases connects your data to LLM's, enabling them to retrieve and reference your organization's information in their responses. Provider Route on LiteLLM bedrock in the litellm vector_store_registry Provider Doc AWS Bedrock Knowledge Bases ↗
Quick Start ​
LiteLLM Python SDK ​
Example using LiteLLM Python SDK
import os
import litellm
from litellm . vector_stores . vector_store_registry import VectorStoreRegistry , LiteLLM_ManagedVectorStore
# Init vector store registry with your Bedrock Knowledge Base
litellm . vector_store_registry = VectorStoreRegistry (
vector_stores = [
LiteLLM_ManagedVectorStore (
vector_store_id = "YOUR_KNOWLEDGE_BASE_ID" , # KB ID from AWS Bedrock
custom_llm_provider = "bedrock"
)
]
# Make a completion request using your Knowledge Base
response = await litellm . acompletion (
model = "anthropic/claude-3-5-sonnet" ,
messages = [ { "role" : "user" , "content" : "What does our company policy say about remote work?" } ] ,
tools = [
{
"type" : "file_search" ,
"vector_store_ids" : [ "YOUR_KNOWLEDGE_BASE_ID" ]
}
] ,
print ( response . choices [ 0 ] . message . content )
LiteLLM Proxy ​
1. Configure your vector_store_registry ​
config.yaml
LiteLLM UI
model_list :
- model_name : claude - 3 - 5 - sonnet
litellm_params :
model : anthropic/claude - 3 - 5 - sonnet
api_key : os.environ/ANTHROPIC_API_KEY
vector_store_registry :
- vector_store_name : "bedrock-company-docs"
vector_store_id : "YOUR_KNOWLEDGE_BASE_ID"
custom_llm_provider : "bedrock"
vector_store_description : "Bedrock Knowledge Base for company documents"
vector_store_metadata :
source : "Company internal documentation"
On the LiteLLM UI, Navigate to Experimental > Vector Stores > Create Vector Store. On this page you can create a vector store with a name, vector store id and credentials.
2. Make a request with vector_store_ids parameter ​
Curl
OpenAI Python SDK
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "claude-3-5-sonnet",
"messages": [{"role": "user", "content": "What does our company policy say about remote work?"}],
"tools": [
"type": "file_search",
"vector_store_ids": ["YOUR_KNOWLEDGE_BASE_ID"]
}'
from openai import OpenAI
# Initialize client with your LiteLLM proxy URL
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "your-litellm-api-key"
# Make a completion request with vector_store_ids parameter
response = client . chat . completions . create (
model = "claude-3-5-sonnet" ,
Filter Results ​
Filter by metadata attributes.
Operators (OpenAI-style, auto-translated):
eq , ne , gt , gte , lt , lte , in , nin
AWS operators (use directly):
equals , notEquals , greaterThan , greaterThanOrEquals , lessThan , lessThanOrEquals , in , notIn , startsWith , listContains , stringContains
Single Filter
AND
OR
AWS Operators
Proxy
messages = [ { "role" : "user" , "content" : "What are the latest updates?" } ] ,
tools = [ {
"vector_store_ids" : [ "YOUR_KNOWLEDGE_BASE_ID" ] ,
"filters" : {
"key" : "category" ,
"value" : "updates" ,
"operator" : "eq"
} ]
messages = [ { "role" : "user" , "content" : "What are the policies?" } ] ,
"and" : [
{ "key" : "category" , "value" : "policy" , "operator" : "eq" } ,
{ "key" : "year" , "value" : 2024 , "operator" : "gte" }
messages = [ { "role" : "user" , "content" : "Show me technical docs" } ] ,
"or" : [
{ "key" : "category" , "value" : "api" , "operator" : "eq" } ,
{ "key" : "category" , "value" : "sdk" , "operator" : "eq" }
messages = [ { "role" : "user" , "content" : "Find docs" } ] ,
{ "key" : "title" , "value" : "Guide" , "operator" : "stringContains" } ,
{ "key" : "tags" , "value" : "important" , "operator" : "listContains" }
"messages": [{"role": "user", "content": "What are our policies?"}],
"tools": [{
"vector_store_ids": ["YOUR_KNOWLEDGE_BASE_ID"],
"filters": {
"and": [
{"key": "department", "value": "engineering", "operator": "eq"},
{"key": "type", "value": "policy", "operator": "eq"}
}]
Accessing Search Results ​
See how to access vector store search results in your response:
Accessing Search Results (Non-Streaming & Streaming)
Further Reading ​
Vector Stores:
Always on Vector Stores
Listing available vector stores on litellm proxy
How LiteLLM Vector Stores Work
Quick Start
LiteLLM Python SDK
LiteLLM Proxy
Filter Results
Accessing Search Results
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
