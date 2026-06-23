# /interactions | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/interactions
- Final URL: https://docs.litellm.ai/docs/interactions
- Canonical URL: https://docs.litellm.ai/docs/interactions
- Fetched at: 2026-06-23T14:24:19Z
- Content type: text/html; charset=utf-8

## Description

| Feature | Supported | Notes |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Feature Supported Notes Logging ✅ Works across all integrations Streaming ✅ Loadbalancing ✅ Between supported models Supported LLM providers All LiteLLM supported CHAT COMPLETION providers openai , anthropic , bedrock , vertex_ai , gemini , azure , azure_ai etc.
LiteLLM Python SDK Usage ​
Quick Start ​
Create Interaction
from litellm import create_interaction
import os
os . environ [ "GEMINI_API_KEY" ] = "your-api-key"
response = create_interaction (
model = "gemini/gemini-2.5-flash" ,
input = "Tell me a short joke about programming."
)
print ( response . outputs [ - 1 ] . text )
Async Usage ​
Async Create Interaction
from litellm import acreate_interaction
import asyncio
async def main ( ) :
response = await acreate_interaction (
asyncio . run ( main ( ) )
Streaming ​
Streaming Interaction
input = "Write a 3 paragraph story about a robot." ,
stream = True
for chunk in response :
print ( chunk )
LiteLLM AI Gateway (Proxy) Usage ​
Setup ​
Add this to your litellm proxy config.yaml:
config.yaml
model_list :
- model_name : gemini - flash
litellm_params :
model : gemini/gemini - 2.5 - flash
api_key : os.environ/GEMINI_API_KEY
Start litellm:
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test Request ​
curl
Google GenAI SDK
curl -X POST "http://localhost:4000/v1beta/interactions" \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "gemini/gemini-2.5-flash",
"input": "Tell me a short joke about programming."
}'
Streaming:
curl -N -X POST "http://localhost:4000/v1beta/interactions" \
"input": "Write a 3 paragraph story about a robot.",
"stream": true
Get Interaction:
Get Interaction by ID
curl "http://localhost:4000/v1beta/interactions/{interaction_id}" \
-H "Authorization: Bearer sk-1234"
Point the Google GenAI SDK to LiteLLM Proxy:
Google GenAI SDK with LiteLLM Proxy
from google import genai
# Point SDK to LiteLLM Proxy
client = genai . Client (
api_key = "sk-1234" , # Your LiteLLM API key
http_options = { "base_url" : "http://localhost:4000" } ,
# Create an interaction
interaction = client . interactions . create (
print ( interaction . outputs [ - 1 ] . text )
Google GenAI SDK Streaming
for chunk in client . interactions . create_stream (
input = "Write a story about space exploration." ,
) :
Request/Response Format ​
Request Parameters ​
Parameter Type Required Description model string Yes Model to use (e.g., gemini/gemini-2.5-flash ) input string Yes The input text for the interaction stream boolean No Enable streaming responses tools array No Tools available to the model system_instruction string No System instructions for the model generation_config object No Generation configuration previous_interaction_id string No ID of previous interaction for context
Response Format ​
{
"id" : "interaction_abc123" ,
"object" : "interaction" ,
"model" : "gemini-2.5-flash" ,
"status" : "completed" ,
"created" : "2025-01-15T10:30:00Z" ,
"updated" : "2025-01-15T10:30:05Z" ,
"role" : "model" ,
"outputs" : [
"type" : "text" ,
"text" : "Why do programmers prefer dark mode? Because light attracts bugs!"
}
] ,
"usage" : {
"total_input_tokens" : 10 ,
"total_output_tokens" : 15 ,
"total_tokens" : 25
Calling non-Interactions API endpoints ( /interactions to /responses Bridge) ​
LiteLLM allows you to call non-Interactions API models via a bridge to LiteLLM's /responses endpoint. This is useful for calling OpenAI, Anthropic, and other providers that don't natively support the Interactions API.
Python SDK Usage ​
SDK Usage
import litellm
# Set API key
os . environ [ "OPENAI_API_KEY" ] = "your-openai-api-key"
# Non-streaming interaction
response = litellm . interactions . create (
model = "gpt-4o" ,
LiteLLM Proxy Usage ​
Setup Config:
Example Configuration
- model_name : openai - model
model : gpt - 4o
api_key : os.environ/OPENAI_API_KEY
Start Proxy:
Start LiteLLM Proxy
Make Request:
non-Interactions API Model Request
curl http://localhost:4000/v1beta/interactions \
"model": "openai-model",
Supported Providers ​
Provider Link to Usage Google AI Studio Usage All other LiteLLM providers Bridge Usage
LiteLLM Python SDK Usage
Quick Start
Async Usage
Streaming
LiteLLM AI Gateway (Proxy) Usage
Setup
Test Request
Request/Response Format
Request Parameters
Response Format
Calling non-Interactions API endpoints ( /interactions to /responses Bridge)
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
