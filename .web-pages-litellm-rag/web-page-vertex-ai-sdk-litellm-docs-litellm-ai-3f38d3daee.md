# Vertex AI SDK | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/pass_through/vertex_ai
- Final URL: https://docs.litellm.ai/docs/pass_through/vertex_ai
- Canonical URL: https://docs.litellm.ai/docs/pass_through/vertex_ai
- Fetched at: 2026-06-23T14:25:57Z
- Content type: text/html; charset=utf-8

## Description

Pass-through endpoints for Vertex AI - call provider-specific endpoint, in native format (no translation).

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Pass-through endpoints for Vertex AI - call provider-specific endpoint, in native format (no translation).
Feature Supported Notes Cost Tracking ✅ supports all models on /generateContent endpoint Logging ✅ works across all integrations End-user Tracking ❌ Tell us if you need this Streaming ✅
Supported Endpoints ​
LiteLLM supports 3 vertex ai passthrough routes:
/vertex_ai → routes to https://{vertex_location}-aiplatform.googleapis.com/
/vertex_ai/discovery → routes to https://discoveryengine.googleapis.com - See Search Datastores Guide
/vertex_ai/live → upgrades to the Vertex AI Live API WebSocket ( google.cloud.aiplatform.v1.LlmBidiService/BidiGenerateContent ) - See Live WebSocket Guide
How to use ​
Just replace https://REGION-aiplatform.googleapis.com with LITELLM_PROXY_BASE_URL/vertex_ai
LiteLLM supports 3 flows for calling Vertex AI endpoints via pass-through:
Specific Credentials : Admin sets passthrough credentials for a specific project/region.
Default Credentials : Admin sets default credentials.
Client-Side Credentials : User can send client-side credentials through to Vertex AI (default behavior - if no default or mapped credentials are found, the request is passed through directly).
Example Usage ​
Specific Project/Region
Default Credentials
Client Credentials
model_list :
- model_name : gemini - 1.0 - pro
litellm_params :
model : vertex_ai/gemini - 1.0 - pro
vertex_project : adroit - crow - 413218
vertex_location : us - central1
vertex_credentials : /path/to/credentials.json
use_in_pass_through : true # 👈 KEY CHANGE
Set in config.yaml
Set in environment variables
default_vertex_config :
export DEFAULT_VERTEXAI_PROJECT="adroit-crow-413218"
export DEFAULT_VERTEXAI_LOCATION="us-central1"
export DEFAULT_GOOGLE_APPLICATION_CREDENTIALS="/path/to/credentials.json"
Try Gemini 2.0 Flash (curl)
MODEL_ID="gemini-2.0-flash-001"
PROJECT_ID="YOUR_PROJECT_ID"
curl \
-X POST \
-H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
-H "Content-Type: application/json" \
"${LITELLM_PROXY_BASE_URL}/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/${MODEL_ID}:streamGenerateContent" -d \
$'{
"contents": {
"role": "user",
"parts": [
{
"fileData": {
"mimeType": "image/png",
"fileUri": "gs://generativeai-downloads/images/scones.jpg"
}
},
"text": "Describe this picture."
]
}'
curl
Vertex Node.js SDK
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/${MODEL_ID}:generateContent \
-H "x-litellm-api-key: Bearer sk-1234" \
-d '{
"contents":[{
"parts":[{"text": "How are you doing today?"}]
}]
const { VertexAI } = require ( '@google-cloud/vertexai' ) ;
const vertexAI = new VertexAI ( {
project : 'your-project-id' , // enter your vertex project id
location : 'us-central1' , // enter your vertex region
apiEndpoint : "localhost:4000/vertex_ai" // <proxy-server-url>/vertex_ai # note, do not include 'https://' in the url
} ) ;
const model = vertexAI . getGenerativeModel ( {
model : 'gemini-1.0-pro'
} , {
customHeaders : {
"x-litellm-api-key" : "sk-1234" // Your litellm Virtual Key
async function generateContent ( ) {
try {
const prompt = {
contents : [ {
role : 'user' ,
parts : [ { text : 'How are you doing today?' } ]
} ]
} ;
const response = await model . generateContent ( prompt ) ;
console . log ( 'Response:' , response ) ;
} catch ( error ) {
console . error ( 'Error:' , error ) ;
generateContent ( ) ;
Vertex AI Live API WebSocket ​
LiteLLM can now proxy the Vertex AI Live API to help you experiment with streaming audio/text from Gemini Live models without exposing Google credentials to clients.
Configure default Vertex credentials via default_vertex_config or environment variables (see examples above).
Connect to wss://<PROXY_URL>/vertex_ai/live . LiteLLM will exchange your saved credentials for a short-lived access token and forward messages bidirectionally.
Optional query params vertex_project , vertex_location , and model let you override defaults for multi-project setups or global-only models.
client.py
import asyncio
import json
from websockets . asyncio . client import connect
async def main ( ) - > None :
headers = {
"x-litellm-api-key" : "Bearer sk-your-litellm-key" ,
"Content-Type" : "application/json" ,
async with connect (
"ws://localhost:4000/vertex_ai/live" ,
additional_headers = headers ,
) as ws :
await ws . send (
json . dumps (
"setup" : {
"model" : "projects/your-project/locations/us-central1/publishers/google/models/gemini-2.0-flash-live-preview-04-09" ,
"generation_config" : { "response_modalities" : [ "TEXT" ] } ,
)
async for message in ws :
print ( "server:" , message )
if __name__ == "__main__" :
asyncio . run ( main ( ) )
Quick Start ​
Let's call the Vertex AI /generateContent endpoint
Add Vertex AI Credentials to your environment
export DEFAULT_VERTEXAI_PROJECT="" # "adroit-crow-413218"
export DEFAULT_VERTEXAI_LOCATION="" # "us-central1"
export DEFAULT_GOOGLE_APPLICATION_CREDENTIALS="" # "/Users/Downloads/adroit-crow-413218-a956eef1a2a8.json"
Start LiteLLM Proxy
litellm
# RUNNING on http://0.0.0.0:4000
Test it!
Let's call the Google AI Studio token counting endpoint
curl http://localhost:4000/vertex-ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/gemini-1.0-pro:generateContent \
-H "Authorization: Bearer sk-1234" \
Supported API Endpoints ​
Gemini API
Embeddings API
Imagen API
Code Completion API
Batch prediction API
Tuning API
CountTokens API
Authentication to Vertex AI ​
LiteLLM Proxy Server supports two methods of authentication to Vertex AI:
Pass Vertex Credentials client side to proxy server
Set Vertex AI credentials on proxy server
Usage Examples ​
Gemini API (Generate Content) ​
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/gemini-1.5-flash-001:generateContent \
-d '{"contents":[{"role": "user", "parts":[{"text": "hi"}]}]}'
Embeddings API ​
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/textembedding-gecko@001:predict \
-d '{"instances":[{"content": "gm"}]}'
Imagen API ​
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/imagen-3.0-generate-001:predict \
-d '{"instances":[{"prompt": "make an otter"}], "parameters": {"sampleCount": 1}}'
Count Tokens API ​
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/gemini-1.5-flash-001:countTokens \
Tuning API ​
Create Fine Tuning Job
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/gemini-1.5-flash-001:tuningJobs \
"baseModel": "gemini-1.0-pro-002",
"supervisedTuningSpec" : {
"training_dataset_uri": "gs://cloud-samples-data/ai-platform/generative_ai/sft_train_data.jsonl"
Advanced ​
Pre-requisites
Setup proxy with DB
Use this, to avoid giving developers the raw Anthropic API key, but still letting them use Anthropic endpoints.
Use with Virtual Keys ​
Setup environment
export DATABASE_URL=""
export LITELLM_MASTER_KEY=""
# vertex ai credentials
Generate virtual key
curl -X POST 'http://0.0.0.0:4000/key/generate' \
-H 'x-litellm-api-key: Bearer sk-1234' \
-H 'Content-Type: application/json' \
-d '{}'
Expected Response
...
"key": "sk-1234ewknldferwedojwojw"
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-central1/publishers/google/models/gemini-1.0-pro:generateContent \
Send tags in request headers ​
Use this if you wants tags to be tracked in the LiteLLM DB and on logging callbacks
Pass tags in request headers as a comma separated list. In the example below the following tags will be tracked
tags: ["vertex-js-sdk", "pass-through-endpoint"]
-H "tags: vertex-js-sdk,pass-through-endpoint" \
"x-litellm-api-key" : "sk-1234" , // Your litellm Virtual Key
"tags" : "vertex-js-sdk,pass-through-endpoint"
Using Anthropic Beta Features on Vertex AI ​
When using Anthropic models via Vertex AI passthrough (e.g., Claude on Vertex), you can enable Anthropic beta features like extended context windows.
The anthropic-beta header is automatically forwarded to Vertex AI when calling Anthropic models.
curl http://localhost:4000/vertex_ai/v1/projects/${PROJECT_ID}/locations/us-east5/publishers/anthropic/models/claude-3-5-sonnet:rawPredict \
-H "anthropic-beta: context-1m-2025-08-07" \
"anthropic_version": "vertex-2023-10-16",
"messages": [{"role": "user", "content": "Hello"}],
"max_tokens": 500
Forwarding Custom Headers with x-pass- Prefix ​
You can forward any custom header to the provider by prefixing it with x-pass- . The prefix is stripped before the header is sent to the provider.
For example:
x-pass-anthropic-beta: value becomes anthropic-beta: value
x-pass-custom-header: value becomes custom-header: value
This is useful when you need to send provider-specific headers that aren't in the default allowlist.
-H "x-pass-anthropic-beta: context-1m-2025-08-07" \
-H "x-pass-custom-feature: enabled" \
info
The x-pass- prefix works for all LLM pass-through endpoints, not just Vertex AI.
Supported Endpoints
How to use
Example Usage
Vertex AI Live API WebSocket
Quick Start
Supported API Endpoints
Usage Examples
Gemini API (Generate Content)
Count Tokens API
Advanced
Use with Virtual Keys
Send tags in request headers
Using Anthropic Beta Features on Vertex AI
Forwarding Custom Headers with x-pass- Prefix
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
