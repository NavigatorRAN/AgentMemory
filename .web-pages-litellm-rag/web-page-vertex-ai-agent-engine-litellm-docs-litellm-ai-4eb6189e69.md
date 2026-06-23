# Vertex AI Agent Engine | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_ai_agent_engine
- Final URL: https://docs.litellm.ai/docs/providers/vertex_ai_agent_engine
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_ai_agent_engine
- Fetched at: 2026-06-23T14:29:12Z
- Content type: text/html; charset=utf-8

## Description

Call Vertex AI Agent Engine (Reasoning Engines) in the OpenAI Request/Response format.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Call Vertex AI Agent Engine (Reasoning Engines) in the OpenAI Request/Response format.
Property Details Description Vertex AI Agent Engine provides hosted agent runtimes that can execute agentic workflows with foundation models, tools, and custom logic. Provider Route on LiteLLM vertex_ai/agent_engine/{RESOURCE_NAME} Supported Endpoints /chat/completions , /v1/messages , /v1/responses , /v1/a2a/message/send Provider Doc Vertex AI Agent Engine ↗
Quick Start ​
Model Format ​
Model Format
vertex_ai/agent_engine/{RESOURCE_NAME}
Example:
vertex_ai/agent_engine/projects/1060139831167/locations/us-central1/reasoningEngines/8263861224643493888
LiteLLM Python SDK ​
Basic Agent Completion
import litellm
response = litellm . completion (
model = "vertex_ai/agent_engine/projects/1060139831167/locations/us-central1/reasoningEngines/8263861224643493888" ,
messages = [
{ "role" : "user" , "content" : "Explain machine learning in simple terms" }
] ,
)
print ( response . choices [ 0 ] . message . content )
Streaming Agent Responses
response = await litellm . acompletion (
{ "role" : "user" , "content" : "What are the key principles of software architecture?" }
stream = True ,
async for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
LiteLLM Proxy ​
1. Configure your model in config.yaml ​
config.yaml
LiteLLM Proxy Configuration
model_list :
- model_name : vertex - agent - 1
litellm_params :
model : vertex_ai/agent_engine/projects/1060139831167/locations/us - central1/reasoningEngines/8263861224643493888
vertex_project : your - project - id
vertex_location : us - central1
2. Start the LiteLLM Proxy ​
Start LiteLLM Proxy
litellm --config config.yaml
3. Make requests to your Vertex AI Agent Engine ​
Curl
OpenAI Python SDK
Basic Agent Request
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $LITELLM_API_KEY" \
-d '{
"model": "vertex-agent-1",
"messages": [
{"role": "user", "content": "Summarize the main benefits of cloud computing"}
]
}'
Using OpenAI SDK with LiteLLM Proxy
from openai import OpenAI
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "your-litellm-api-key"
response = client . chat . completions . create (
model = "vertex-agent-1" ,
{ "role" : "user" , "content" : "What are best practices for API design?" }
LiteLLM A2A Gateway ​
You can also connect to Vertex AI Agent Engine through LiteLLM's A2A (Agent-to-Agent) Gateway UI. This provides a visual way to register and test agents without writing code.
1. Navigate to Agents ​
From the sidebar, click "Agents" to open the agent management page, then click "+ Add New Agent".
2. Select Vertex AI Agent Engine Type ​
Click "A2A Standard" to see available agent types, then select "Vertex AI Agent Engine".
3. Configure the Agent ​
Fill in the following fields:
Agent Name - A friendly name for your agent (e.g., my-vertex-agent )
Reasoning Engine Resource ID - The full resource path from Google Cloud Console (e.g., projects/1060139831167/locations/us-central1/reasoningEngines/8263861224643493888 )
Vertex Project - Your Google Cloud project ID
Vertex Location - The region where your agent is deployed (e.g., us-central1 )
You can find the Resource ID in Google Cloud Console under Vertex AI > Agent Engine:
You can find the Project ID in Google Cloud Console:
4. Create Agent ​
Click "Create Agent" to save your configuration.
5. Test in Playground ​
Go to "Playground" in the sidebar to test your agent.
6. Select A2A Endpoint ​
Click the endpoint dropdown and select /v1/a2a/message/send .
7. Select Your Agent and Send a Message ​
Pick your Vertex AI Agent Engine from the dropdown and send a test message.
Environment Variables ​
Variable Description GOOGLE_APPLICATION_CREDENTIALS Path to service account JSON key file VERTEXAI_PROJECT Google Cloud project ID VERTEXAI_LOCATION Google Cloud region (default: us-central1 )
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account.json"
export VERTEXAI_PROJECT="your-project-id"
export VERTEXAI_LOCATION="us-central1"
Further Reading ​
Vertex AI Agent Engine Documentation
Create a Reasoning Engine
A2A Agent Gateway
Vertex AI Provider
Quick Start
LiteLLM Python SDK
LiteLLM Proxy
LiteLLM A2A Gateway
1. Navigate to Agents
2. Select Vertex AI Agent Engine Type
3. Configure the Agent
4. Create Agent
5. Test in Playground
6. Select A2A Endpoint
7. Select Your Agent and Send a Message
Environment Variables
Further Reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
