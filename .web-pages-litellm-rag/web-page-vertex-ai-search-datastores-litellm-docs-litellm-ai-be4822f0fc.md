# Vertex AI Search Datastores | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/vertex_ai_search_datastores
- Final URL: https://docs.litellm.ai/docs/pass_through/vertex_ai_search_datastores
- Canonical URL: https://docs.litellm.ai/docs/pass_through/vertex_ai_search_datastores
- Fetched at: 2026-06-23T14:25:59Z
- Content type: text/html; charset=utf-8

## Description

Call Vertex AI Discovery Engine Search API through LiteLLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Vertex AI Discovery Engine Search API through LiteLLM.
Provider Doc: https://cloud.google.com/generative-ai-app-builder/docs/reference/rest/v1/projects.locations.dataStores.servingConfigs/search
What you get ​
Reference datastores by ID. LiteLLM finds the credentials.
No project/location in every request.
Configure credentials once, use everywhere.
Cost tracking works automatically.
Quick Start ​
Step 1. Set credentials
export DEFAULT_VERTEXAI_PROJECT="your-project-id"
export DEFAULT_VERTEXAI_LOCATION="us-central1"
export DEFAULT_GOOGLE_APPLICATION_CREDENTIALS="/path/to/credentials.json"
Step 2. Start proxy
litellm
Step 3. Search your datastore
curl -X POST \
"http://localhost:4000/vertex_ai/discovery/v1/projects/my-project/locations/global/collections/default_collection/dataStores/my-datastore/servingConfigs/default_config:search" \
-H "Content-Type: application/json" \
-H "x-litellm-api-key: Bearer sk-1234" \
-d '{
"query": "How do I authenticate?",
"pageSize": 10
}'
Managed Vector Stores (Recommended) ​
Register your datastore once. Reference it by ID.
In config.yaml:
vector_store_registry :
- vector_store_name : "vertex-ai-litellm-website-knowledgebase"
litellm_params :
vector_store_id : "my-datastore"
custom_llm_provider : "vertex_ai/search_api"
vertex_app_id : "test-litellm-app_1761094730750"
vertex_project : "test-vector-store-db"
vertex_location : "global"
vector_store_description : "Vertex AI vector store for the Litellm website knowledgebase"
vector_store_metadata :
source : "https://www.litellm.com/docs"
How it works:
LiteLLM sees dataStores/my-datastore in your URL. It looks up the vector store. Uses the right project and credentials automatically.
Endpoint ​
{PROXY_BASE_URL}/vertex_ai/discovery/{endpoint:path}
Routes to https://discoveryengine.googleapis.com
Examples ​
Basic Search ​
"query": "pricing",
Search with Filters ​
"query": "tutorials",
"pageSize": 20,
"filter": "category = \"beginner\"",
"spellCorrectionSpec": {"mode": "AUTO"}
Python ​
import requests
url = "http://localhost:4000/vertex_ai/discovery/v1/projects/my-project/locations/global/collections/default_collection/dataStores/my-datastore/servingConfigs/default_config:search"
response = requests . post ( url ,
headers = {
"Content-Type" : "application/json" ,
"x-litellm-api-key" : "Bearer sk-1234"
} ,
json = { "query" : "pricing" , "pageSize" : 10 }
)
for result in response . json ( ) . get ( "results" , [ ] ) :
data = result [ "document" ] [ "derivedStructData" ]
print ( f" { data [ 'title' ] } : { data [ 'link' ] } " )
Use with Chat Completion ​
curl http://localhost:4000/v1/chat/completions \
-H "Authorization: Bearer $LITELLM_API_KEY" \
"model": "claude-3-5-sonnet",
"messages": [{"role": "user", "content": "What is litellm?"}],
"tools": [
{
"type": "file_search",
"vector_store_ids": ["my-datastore"]
}
]
What you get
Quick Start
Managed Vector Stores (Recommended)
Endpoint
Examples
Basic Search
Search with Filters
Python
Use with Chat Completion
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
