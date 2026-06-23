# /containers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/containers
- Final URL: https://docs.litellm.ai/docs/containers
- Canonical URL: https://docs.litellm.ai/docs/containers
- Fetched at: 2026-06-23T14:23:39Z
- Content type: text/html; charset=utf-8

## Description

Manage OpenAI code interpreter containers (sessions) for executing code in isolated environments.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Manage OpenAI code interpreter containers (sessions) for executing code in isolated environments.
tip
Looking for how to use Code Interpreter? See the Code Interpreter Guide .
Feature Supported Cost Tracking ✅ Logging ✅ (Full request/response logging) Load Balancing ✅ Proxy Server Support ✅ Full proxy integration with virtual keys Spend Management ✅ Budget tracking and rate limiting Supported Providers openai
Containers provide isolated execution environments for code interpreter sessions. You can create, list, retrieve, and delete containers.
LiteLLM Python SDK Usage ​
Quick Start ​
Create a Container
import litellm
import os
# setup env
os . environ [ "OPENAI_API_KEY" ] = "sk-.."
container = litellm . create_container (
name = "My Code Interpreter Container" ,
custom_llm_provider = "openai" ,
expires_after = {
"anchor" : "last_active_at" ,
"minutes" : 20
}
)
print ( f"Container ID: { container . id } " )
print ( f"Container Name: { container . name } " )
Async Usage ​
from litellm import acreate_container
container = await acreate_container (
List Containers ​
from litellm import list_containers
containers = list_containers (
limit = 20 ,
order = "desc"
print ( f"Found { len ( containers . data ) } containers" )
for container in containers . data :
print ( f" - { container . id } : { container . name } " )
Async Usage:
from litellm import alist_containers
containers = await alist_containers (
Retrieve a Container ​
from litellm import retrieve_container
container = retrieve_container (
container_id = "cntr_123..." ,
custom_llm_provider = "openai"
print ( f"Container: { container . name } " )
print ( f"Status: { container . status } " )
print ( f"Created: { container . created_at } " )
from litellm import aretrieve_container
container = await aretrieve_container (
Delete a Container ​
from litellm import delete_container
result = delete_container (
print ( f"Deleted: { result . deleted } " )
print ( f"Container ID: { result . id } " )
from litellm import adelete_container
result = await adelete_container (
LiteLLM Proxy Usage ​
LiteLLM provides OpenAI API compatible container endpoints for managing code interpreter sessions:
/v1/containers - Create and list containers
/v1/containers/{container_id} - Retrieve and delete containers
Setup
$ export OPENAI_API_KEY="sk-..."
$ litellm
# RUNNING on http://0.0.0.0:4000
Custom Provider Specification
You can specify the custom LLM provider in multiple ways (priority order):
Header: -H "custom-llm-provider: openai"
Query param: ?custom_llm_provider=openai
Request body: {"custom_llm_provider": "openai", ...}
Defaults to "openai" if not specified
# Default provider (openai)
curl -X POST "http://localhost:4000/v1/containers" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"name": "My Container",
"expires_after": {
"anchor": "last_active_at",
"minutes": 20
}'
# Via header
-H "custom-llm-provider: openai" \
"name": "My Container"
# Via query parameter
curl -X POST "http://localhost:4000/v1/containers?custom_llm_provider=openai" \
List Containers
curl "http://localhost:4000/v1/containers?limit=20&order=desc" \
-H "Authorization: Bearer sk-1234"
Retrieve a Container
curl "http://localhost:4000/v1/containers/cntr_123..." \
Delete a Container
curl -X DELETE "http://localhost:4000/v1/containers/cntr_123..." \
Using OpenAI Client with LiteLLM Proxy ​
You can use the standard OpenAI Python client to interact with LiteLLM's container endpoints. This provides a familiar interface while leveraging LiteLLM's proxy features.
Setup ​
First, configure your OpenAI client to point to your LiteLLM proxy:
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" , # Your LiteLLM proxy key
base_url = "http://localhost:4000" # LiteLLM proxy URL
Create a Container ​
container = client . containers . create (
name = "test-container" ,
} ,
extra_body = { "custom_llm_provider" : "openai" }
print ( f"Created at: { container . created_at } " )
containers = client . containers . list (
container = client . containers . retrieve (
container_id = "cntr_6901d28b3c8881908b702815828a5bde0380b3408aeae8c7" ,
print ( f"Last active: { container . last_active_at } " )
result = client . containers . delete (
Complete Workflow Example ​
Here's a complete example showing the full container management workflow:
# Initialize client
api_key = "sk-1234" ,
base_url = "http://localhost:4000"
# 1. Create a container
print ( "Creating container..." )
name = "My Code Interpreter Session" ,
container_id = container . id
print ( f"Container created. ID: { container_id } " )
# 2. List all containers
print ( "\nListing containers..." )
for c in containers . data :
print ( f" - { c . id } : { c . name } (Status: { c . status } )" )
# 3. Retrieve specific container
print ( f"\nRetrieving container { container_id } ..." )
retrieved = client . containers . retrieve (
container_id = container_id ,
print ( f"Container: { retrieved . name } " )
print ( f"Status: { retrieved . status } " )
print ( f"Last active: { retrieved . last_active_at } " )
# 4. Delete container
print ( f"\nDeleting container { container_id } ..." )
Container Parameters ​
Create Container Parameters ​
Parameter Type Required Description name string Yes Name of the container expires_after object No Container expiration settings expires_after.anchor string No Anchor point for expiration (e.g., "last_active_at") expires_after.minutes integer No Minutes until expiration from anchor file_ids array No List of file IDs to include in the container custom_llm_provider string No LLM provider to use (default: "openai")
List Container Parameters ​
Parameter Type Required Description after string No Cursor for pagination limit integer No Number of items to return (1-100, default: 20) order string No Sort order: "asc" or "desc" (default: "desc") custom_llm_provider string No LLM provider to use (default: "openai")
Retrieve/Delete Container Parameters ​
Parameter Type Required Description container_id string Yes ID of the container to retrieve/delete custom_llm_provider string No LLM provider to use (default: "openai")
Response Objects ​
ContainerObject ​
{
"id" : "cntr_123..." ,
"object" : "container" ,
"created_at" : 1234567890 ,
"name" : "My Container" ,
"status" : "active" ,
"last_active_at" : 1234567890 ,
"expires_at" : 1234569090 ,
"file_ids" : [ ]
ContainerListResponse ​
"object" : "list" ,
"data" : [
"status" : "active"
] ,
"first_id" : "cntr_123..." ,
"last_id" : "cntr_456..." ,
"has_more" : false
DeleteContainerResult ​
"object" : "container.deleted" ,
"deleted" : true
Supported Providers ​
Provider Support Status Notes OpenAI ✅ Supported Full support for all container operations
info
Currently, only OpenAI supports container management for code interpreter sessions. Support for additional providers may be added in the future.
Related ​
Container Files API - Manage files within containers
Code Interpreter Guide - Using Code Interpreter with LiteLLM
LiteLLM Python SDK Usage
Quick Start
Async Usage
LiteLLM Proxy Usage
Using OpenAI Client with LiteLLM Proxy
Complete Workflow Example
Container Parameters
Create Container Parameters
List Container Parameters
Retrieve/Delete Container Parameters
Response Objects
ContainerObject
ContainerListResponse
DeleteContainerResult
Supported Providers
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
