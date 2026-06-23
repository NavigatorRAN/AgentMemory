# Getting Started | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs
- Final URL: https://docs.litellm.ai/docs
- Canonical URL: https://docs.litellm.ai/docs/
- Fetched at: 2026-06-23T14:22:25Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM is an open-source library that gives you a single, unified interface to call 100+ LLMs — OpenAI, Anthropic, Vertex AI, Bedrock, and more — using the OpenAI format.

## Extracted Text

Skip to main content
On this page
LiteLLM is an open-source library that gives you a single, unified interface to call 100+ LLMs — OpenAI, Anthropic, Vertex AI, Bedrock, and more — using the OpenAI format.
Call any provider using the same completion() interface — no re-learning the API for each one
Consistent output format regardless of which provider or model you use
Built-in retry / fallback logic across multiple deployments via the Router
Self-hosted LLM Gateway (Proxy) with virtual keys, cost tracking, and an admin UI
Installation ​
uv add litellm
To run the full Proxy Server (LLM Gateway):
uv tool install 'litellm[proxy]'
Quick Start ​
Make your first LLM call using the provider of your choice:
OpenAI
Anthropic
Vertex AI
Bedrock
Ollama
Azure OpenAI
from litellm import completion
import os
os . environ [ "OPENAI_API_KEY" ] = "your-api-key"
response = completion (
model = "openai/gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ]
)
print ( response . choices [ 0 ] . message . content )
os . environ [ "ANTHROPIC_API_KEY" ] = "your-api-key"
model = "anthropic/claude-3-5-sonnet-20241022" ,
# auth: run 'gcloud auth application-default login'
os . environ [ "VERTEXAI_PROJECT" ] = "your-project-id"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
model = "vertex_ai/gemini-1.5-pro" ,
os . environ [ "AWS_ACCESS_KEY_ID" ] = "your-key"
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "your-secret"
os . environ [ "AWS_REGION_NAME" ] = "us-east-1"
model = "bedrock/anthropic.claude-haiku-4-5-20251001:0" ,
model = "ollama/llama3" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
api_base = "http://localhost:11434"
os . environ [ "AZURE_API_KEY" ] = "your-key"
os . environ [ "AZURE_API_BASE" ] = "https://your-resource.openai.azure.com"
os . environ [ "AZURE_API_VERSION" ] = "2024-02-01"
model = "azure/your-deployment-name" ,
Every response follows the OpenAI Chat Completions format, regardless of provider. ✅
Response Format ​
Non-streaming responses return a ModelResponse object:
{
"id" : "chatcmpl-abc123" ,
"object" : "chat.completion" ,
"created" : 1677858242 ,
"model" : "gpt-4o" ,
"choices" : [
"index" : 0 ,
"message" : {
"role" : "assistant" ,
"content" : "Hello! I'm doing well, thanks for asking."
} ,
"finish_reason" : "stop"
}
] ,
"usage" : {
"prompt_tokens" : 13 ,
"completion_tokens" : 12 ,
"total_tokens" : 25
Streaming responses ( stream=True ) yield ModelResponseStream chunks:
"object" : "chat.completion.chunk" ,
"delta" : {
"content" : "Hello"
"finish_reason" : null
]
📖 Full output format reference →
Open in Colab
New to LiteLLM? ​
Want to get started fast? Head to Tutorials for step-by-step walkthroughs — AI coding tools, agent SDKs, proxy setup, and more.
Need to understand a specific feature? Check Guides for streaming, function calling, prompt caching, and other how-tos.
Choose Your Path ​
🐍
Python SDK
Integrate LiteLLM directly into your Python application. Drop-in replacement for the OpenAI client.
completion(), embedding(), image_generation() and more
Router with retry, fallback, and load balancing
OpenAI-compatible exceptions across all providers
Observability callbacks (Langfuse, MLflow, Helicone…)
🖥️
Proxy Server (LLM Gateway)
Self-hosted gateway for platform teams managing LLM access across an organization.
Virtual keys with per-key/team/user budgets
Centralized logging, guardrails, and caching
Admin UI for monitoring and management
Drop-in replacement for any OpenAI-compatible client
LiteLLM Python SDK ​
Streaming ​
Add stream=True to receive chunks as they are generated:
for chunk in completion (
messages = [ { "role" : "user" , "content" : "Write a short poem" } ] ,
stream = True ,
) :
print ( chunk . choices [ 0 ] . delta . content or "" , end = "" )
Exception Handling ​
LiteLLM maps every provider's errors to the OpenAI exception types — your existing error handling works out of the box:
import litellm
try :
litellm . completion (
model = "anthropic/claude-instant-1" ,
messages = [ { "role" : "user" , "content" : "Hey!" } ]
except litellm . AuthenticationError as e :
print ( f"Bad API key: { e } " )
except litellm . RateLimitError as e :
print ( f"Rate limited: { e } " )
except litellm . APIError as e :
print ( f"API error: { e } " )
Logging & Observability ​
Send input/output to Langfuse, MLflow, Helicone, Lunary, and more with a single line:
litellm . success_callback = [ "langfuse" , "mlflow" , "helicone" ]
response = litellm . completion (
model = "gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hi!" } ]
📖 See all observability integrations →
Track Costs & Usage ​
Use a callback to capture cost per response:
def track_cost ( kwargs , completion_response , start_time , end_time ) :
print ( "Cost:" , kwargs . get ( "response_cost" , 0 ) )
litellm . success_callback = [ track_cost ]
messages = [ { "role" : "user" , "content" : "Hello!" } ] ,
stream = True
📖 Custom callback docs →
LiteLLM Proxy Server (LLM Gateway) ​
The proxy is a self-hosted OpenAI-compatible gateway. Any client that works with OpenAI works with the proxy — no code changes needed.
Step 1 — Start the proxy ​
LiteLLM CLI
Docker
litellm --model huggingface/bigcode/starcoder
# Proxy running on http://0.0.0.0:4000
litellm_config.yaml
model_list :
- model_name : gpt - 3.5 - turbo
litellm_params :
model : azure/your - deployment
api_base : os.environ/AZURE_API_BASE
api_key : os.environ/AZURE_API_KEY
api_version : "2023-07-01-preview"
docker run \
-v $(pwd)/litellm_config.yaml:/app/config.yaml \
-e AZURE_API_KEY=your-key \
-e AZURE_API_BASE=https://your-resource.openai.azure.com/ \
-p 4000:4000 \
docker.litellm.ai/berriai/litellm:main-latest \
--config /app/config.yaml --detailed_debug
Step 2 — Call it with the OpenAI client ​
import openai
client = openai . OpenAI ( api_key = "anything" , base_url = "http://0.0.0.0:4000" )
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [ { "role" : "user" , "content" : "Write a short poem" } ]
👉 Full proxy quickstart with Docker →
Debugging tool
Use /utils/transform_request to inspect exactly what LiteLLM sends to any provider — useful for debugging prompt formatting, header issues, and provider-specific parameters.
🔗 Interactive API explorer (Swagger) →
Agent & MCP Gateway ​
LiteLLM is a unified gateway for LLMs, agents, and MCP — you don't need a separate agent or MCP gateway. One endpoint for 100+ models, A2A agents, and MCP tools.
🔗
A2A Agents
Add and invoke A2A agents via the LiteLLM gateway.
🛠️
MCP Gateway
Central MCP endpoint with per-key access control.
✨
✨ Enterprise Quickstart
Quickstart guide for trial customers — LLM, MCP, and Agent gateway.
What to Explore Next ​
🔀
Routing & Load Balancing
Load balance across deployments and set automatic fallbacks.
🔑
Virtual Keys
Manage access, budgets, and rate limits per team or user.
📊
Spend Tracking
Track costs per key, team, and user across all providers.
🛡️
Guardrails
Add content filtering, PII masking, and safety checks.
📡
Observability
Integrate with Langfuse, MLflow, Helicone, and more.
🏭
Enterprise
SSO/SAML, audit logs, and advanced security for production.
Installation
Quick Start
Response Format
New to LiteLLM?
Choose Your Path
LiteLLM Python SDK
Streaming
Exception Handling
Logging & Observability
Track Costs & Usage
LiteLLM Proxy Server (LLM Gateway)
Agent & MCP Gateway
What to Explore Next
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
