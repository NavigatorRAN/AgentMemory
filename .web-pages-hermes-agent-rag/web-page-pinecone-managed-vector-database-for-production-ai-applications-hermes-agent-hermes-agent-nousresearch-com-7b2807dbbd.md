# Pinecone — Managed vector database for production AI applications | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-pinecone
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-pinecone
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-pinecone
- Fetched at: 2026-06-23T14:20:07Z
- Content type: text/html; charset=utf-8

## Description

Managed vector database for production AI applications

## Extracted Text

Skip to main content
On this page
Managed vector database for production AI applications. Fully managed, auto-scaling, with hybrid search (dense + sparse), metadata filtering, and namespaces. Low latency (<100ms p95). Use for production RAG, recommendation systems, or semantic search at scale. Best for serverless, managed infrastructure.
Skill metadata ​
Source Optional — install with hermes skills install official/mlops/pinecone Path optional-skills/mlops/pinecone Version 1.0.0 Author Orchestra Research License MIT Dependencies pinecone-client Platforms linux, macos, windows Tags RAG , Pinecone , Vector Database , Managed Service , Serverless , Hybrid Search , Production , Auto-Scaling , Low Latency , Recommendations
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
Pinecone - Managed Vector Database
The vector database for production AI applications.
When to use Pinecone ​
Use when:
Need managed, serverless vector database
Production RAG applications
Auto-scaling required
Low latency critical (<100ms)
Don't want to manage infrastructure
Need hybrid search (dense + sparse vectors)
Metrics :
Fully managed SaaS
Auto-scales to billions of vectors
p95 latency <100ms
99.9% uptime SLA
Use alternatives instead :
Chroma : Self-hosted, open-source
FAISS : Offline, pure similarity search
Weaviate : Self-hosted with more features
Quick start ​
Installation ​
pip install pinecone-client
Basic usage ​
from pinecone import Pinecone , ServerlessSpec
# Initialize
pc = Pinecone ( api_key = "your-api-key" )
# Create index
pc . create_index (
name = "my-index" ,
dimension = 1536 , # Must match embedding dimension
metric = "cosine" , # or "euclidean", "dotproduct"
spec = ServerlessSpec ( cloud = "aws" , region = "us-east-1" )
)
# Connect to index
index = pc . Index ( "my-index" )
# Upsert vectors
index . upsert ( vectors = [
{ "id" : "vec1" , "values" : [ 0.1 , 0.2 , . . . ] , "metadata" : { "category" : "A" } } ,
{ "id" : "vec2" , "values" : [ 0.3 , 0.4 , . . . ] , "metadata" : { "category" : "B" } }
] )
# Query
results = index . query (
vector = [ 0.1 , 0.2 , . . . ] ,
top_k = 5 ,
include_metadata = True
print ( results [ "matches" ] )
Core operations ​
Create index ​
# Serverless (recommended)
dimension = 1536 ,
metric = "cosine" ,
spec = ServerlessSpec (
cloud = "aws" , # or "gcp", "azure"
region = "us-east-1"
# Pod-based (for consistent performance)
from pinecone import PodSpec
spec = PodSpec (
environment = "us-east1-gcp" ,
pod_type = "p1.x1"
Upsert vectors ​
# Single upsert
{
"id" : "doc1" ,
"values" : [ 0.1 , 0.2 , . . . ] , # 1536 dimensions
"metadata" : {
"text" : "Document content" ,
"category" : "tutorial" ,
"timestamp" : "2025-01-01"
}
# Batch upsert (recommended)
vectors = [
{ "id" : f"vec { i } " , "values" : embedding , "metadata" : metadata }
for i , ( embedding , metadata ) in enumerate ( zip ( embeddings , metadatas ) )
]
index . upsert ( vectors = vectors , batch_size = 100 )
Query vectors ​
# Basic query
top_k = 10 ,
include_metadata = True ,
include_values = False
# With metadata filtering
filter = { "category" : { "$eq" : "tutorial" } }
# Namespace query
namespace = "production"
# Access results
for match in results [ "matches" ] :
print ( f"ID: { match [ 'id' ] } " )
print ( f"Score: { match [ 'score' ] } " )
print ( f"Metadata: { match [ 'metadata' ] } " )
Metadata filtering ​
# Exact match
filter = { "category" : "tutorial" }
# Comparison
filter = { "price" : { "$gte" : 100 } } # $gt, $gte, $lt, $lte, $ne
# Logical operators
filter = {
"$and" : [
{ "category" : "tutorial" } ,
{ "difficulty" : { "$lte" : 3 } }
} # Also: $or
# In operator
filter = { "tags" : { "$in" : [ "python" , "ml" ] } }
Namespaces ​
# Partition data by namespace
index . upsert (
vectors = [ { "id" : "vec1" , "values" : [ . . . ] } ] ,
namespace = "user-123"
# Query specific namespace
vector = [ . . . ] ,
namespace = "user-123" ,
top_k = 5
# List namespaces
stats = index . describe_index_stats ( )
print ( stats [ 'namespaces' ] )
Hybrid search (dense + sparse) ​
# Upsert with sparse vectors
"values" : [ 0.1 , 0.2 , . . . ] , # Dense vector
"sparse_values" : {
"indices" : [ 10 , 45 , 123 ] , # Token IDs
"values" : [ 0.5 , 0.3 , 0.8 ] # TF-IDF scores
} ,
"metadata" : { "text" : "..." }
# Hybrid query
sparse_vector = {
"indices" : [ 10 , 45 ] ,
"values" : [ 0.5 , 0.3 ]
alpha = 0.5 # 0=sparse, 1=dense, 0.5=hybrid
LangChain integration ​
from langchain_pinecone import PineconeVectorStore
from langchain_openai import OpenAIEmbeddings
# Create vector store
vectorstore = PineconeVectorStore . from_documents (
documents = docs ,
embedding = OpenAIEmbeddings ( ) ,
index_name = "my-index"
results = vectorstore . similarity_search ( "query" , k = 5 )
# With metadata filter
results = vectorstore . similarity_search (
"query" ,
k = 5 ,
# As retriever
retriever = vectorstore . as_retriever ( search_kwargs = { "k" : 10 } )
LlamaIndex integration ​
from llama_index . vector_stores . pinecone import PineconeVectorStore
# Connect to Pinecone
pc = Pinecone ( api_key = "your-key" )
pinecone_index = pc . Index ( "my-index" )
vector_store = PineconeVectorStore ( pinecone_index = pinecone_index )
# Use in LlamaIndex
from llama_index . core import StorageContext , VectorStoreIndex
storage_context = StorageContext . from_defaults ( vector_store = vector_store )
index = VectorStoreIndex . from_documents ( documents , storage_context = storage_context )
Index management ​
# List indices
indexes = pc . list_indexes ( )
# Describe index
index_info = pc . describe_index ( "my-index" )
print ( index_info )
# Get index stats
print ( f"Total vectors: { stats [ 'total_vector_count' ] } " )
print ( f"Namespaces: { stats [ 'namespaces' ] } " )
# Delete index
pc . delete_index ( "my-index" )
Delete vectors ​
# Delete by ID
index . delete ( ids = [ "vec1" , "vec2" ] )
# Delete by filter
index . delete ( filter = { "category" : "old" } )
# Delete all in namespace
index . delete ( delete_all = True , namespace = "test" )
# Delete entire index
index . delete ( delete_all = True )
Best practices ​
Use serverless - Auto-scaling, cost-effective
Batch upserts - More efficient (100-200 per batch)
Add metadata - Enable filtering
Use namespaces - Isolate data by user/tenant
Monitor usage - Check Pinecone dashboard
Optimize filters - Index frequently filtered fields
Test with free tier - 1 index, 100K vectors free
Use hybrid search - Better quality
Set appropriate dimensions - Match embedding model
Regular backups - Export important data
Performance ​
Operation Latency Notes Upsert ~50-100ms Per batch Query (p50) ~50ms Depends on index size Query (p95) ~100ms SLA target Metadata filter ~+10-20ms Additional overhead
Pricing (as of 2025) ​
Serverless :
$0.096 per million read units
$0.06 per million write units
$0.06 per GB storage/month
Free tier :
1 serverless index
100K vectors (1536 dimensions)
Great for prototyping
Resources ​
Website : https://www.pinecone.io
Docs : https://docs.pinecone.io
Console : https://app.pinecone.io
Pricing : https://www.pinecone.io/pricing
Skill metadata
Reference: full SKILL.md
When to use Pinecone
Quick start
Installation
Basic usage
Core operations
Create index
Upsert vectors
Query vectors
Metadata filtering
Namespaces
Hybrid search (dense + sparse)
LangChain integration
LlamaIndex integration
Index management
Delete vectors
Best practices
Performance
Pricing (as of 2025)
Resources
