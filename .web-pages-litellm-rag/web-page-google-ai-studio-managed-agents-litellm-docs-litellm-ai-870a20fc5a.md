# Google AI Studio - Managed Agents | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/managed_agents
- Final URL: https://docs.litellm.ai/docs/managed_agents
- Canonical URL: https://docs.litellm.ai/docs/managed_agents
- Fetched at: 2026-06-23T14:24:30Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM now supports the Google AI Studio Managed Agents API. Create, manage, and run custom agents through LiteLLM.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM now supports the Google AI Studio Managed Agents API . Create, manage, and run custom agents through LiteLLM.
Overview ​
There are two distinct steps:
Create a custom agent : /v1beta/agents defines your agent on the Gemini side (name, base model, instructions).
Run the agent : Once you have created a named agent, you can interact with it by specifying its resource name in the agent field of the /interactions request.
LiteLLM does not store the agent in its own database. The agent lives entirely on Google's side. LiteLLM is just the auth + routing layer.
Quick start ​
Proxy
SDK
Add your Gemini API key to the environment:
export GEMINI_API_KEY="AIzaSy..."
Minimal proxy_config.yaml :
general_settings :
master_key : "sk-1234"
environment_variables :
GEMINI_API_KEY : "AIzaSy..." # or set in shell env
Start the proxy:
litellm --config proxy_config.yaml
If GEMINI_API_KEY is not set, all managed-agent calls will fail with an auth error from Google.
import os
import litellm
os . environ [ "GEMINI_API_KEY" ] = "AIzaSy..."
You can also pass api_key="AIzaSy..." to each call instead of setting the environment variable.
1. Create an agent ​
curl -X POST "http://localhost:4000/v1beta/agents" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"name": "my-custom-slides-agent",
"base_agent": "antigravity-preview-05-2026",
"instructions": "You are a helpful assistant that creates slides.",
"base_environment": {"env_id": "YOUR_ENVIRONMENT_ID"}
}'
Response:
{
"id" : "my-slides-agent" ,
"base_agent" : "antigravity-preview-05-2026" ,
"system_instruction" : "You are a helpful assistant that creates slides."
}
response = litellm . interactions . agents . create (
name = "my-slides-agent" ,
base_agent = "antigravity-preview-05-2026" ,
instructions = "You are a helpful assistant that creates slides." ,
custom_llm_provider = "gemini" ,
base_environment = { "env_id" : "YOUR_ENVIRONMENT_ID" }
)
print ( response . id ) # "my-slides-agent"
Async variant: litellm.interactions.agents.acreate(...) .
Parameters:
Field Required Description name Yes Unique agent identifier, used as the ID in later calls base_agent Yes Base model to build on. Currently only "antigravity-preview-05-2026" is supported by Google instructions No System-level instructions for the agent base_environment No Environment config (e.g. GCS skill sources)
Calling create twice with the same name returns a 409 Conflict from Google.
2. Run an agent ​
curl -X POST "http://localhost:4000/v1beta/interactions" \
"agent": "my-slides-agent",
"input": "Create a slide deck on the Fibonacci sequence",
"environment": "remote" # required for agents
response = litellm . interactions . create (
agent = "my-slides-agent" ,
input = "Create a slide deck on the Fibonacci sequence" ,
environment = "remote"
print ( response )
Async variant: litellm.interactions.acreate(...) .
Note: pass agent , not model . The agent name is not a LiteLLM model, do not put it in the model field.
See also: /interactions for the full Interactions API.
Manage agents ​
List agents ​
curl "http://localhost:4000/v1beta/agents" \
-H "Authorization: Bearer sk-1234"
Response
"agents" : [
"id" : "my-custom-slides-agent"
} ,
"id" : "my-custom-slides-agent-1"
]
agents = litellm . interactions . agents . list ( )
Get an agent ​
curl "http://localhost:4000/v1beta/agents/my-slides-agent" \
"id" : "my-custom-slides-agent" ,
"system_instruction" : "You are a helpful assistant that creates slides." ,
"base_environment" : {
"sources" : [
"type" : "gcs" ,
"source" : "gs://eap-templates/slides-skill" ,
"target" : "/.agents/skills/slides-skill"
] ,
"type" : "remote"
agent = litellm . interactions . agents . get (
name = "my-slides-agent"
Delete an agent ​
curl -X DELETE "http://localhost:4000/v1beta/agents/my-slides-agent" \
litellm . interactions . agents . delete (
List agent versions ​
curl "http://localhost:4000/v1beta/agents/my-slides-agent/versions" \
"agentVersions" : [
"agent" : "antigravity-preview-05-2026" ,
"env_id" : "sdsdd"
"instructions" : "You are a helpful assistant that creates slides" ,
"name" : "agents/my-custom-slides-agent-1/versions/a7616fd3-4e3e-48e7-aea7-9ac76b4f37ab"
versions = litellm . interactions . agents . list_versions (
Authentication ​
Method How to provide the key Proxy Set GEMINI_API_KEY (or GOOGLE_API_KEY ) in the proxy's environment. Virtual keys ( sk-... ) authenticate users to the proxy ; the proxy uses your Gemini key to talk to Google. SDK Set GEMINI_API_KEY in the environment, or pass api_key="AIzaSy..." to each call.
There is no way to use managed agents with any provider other than Google AI Studio. Other providers are not supported by this API.
Limitations ​
base_agent only accepts "antigravity-preview-05-2026" (Google's current restriction).
Agents are stored on Google's side only. LiteLLM does not persist them in its database. If you delete an agent via Google's API directly, the proxy will not know.
Using the Interactions API via the agent param is only supported by Gemini as of now. Use the model param to call other providers' models.
GEMINI_API_KEY / GOOGLE_API_KEY must be present in the proxy environment. Passing the key per-request via api_key is supported in the SDK but not currently via the proxy endpoint.
Tags ​
gemini managed-agents interactions google-ai-studio agents litellm-proxy
Overview
Quick start
1. Create an agent
2. Run an agent
Manage agents
List agents
Get an agent
Delete an agent
List agent versions
Authentication
Limitations
Tags
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
