# /generateContent | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/generateContent
- Final URL: https://docs.litellm.ai/docs/generateContent
- Canonical URL: https://docs.litellm.ai/docs/generateContent
- Fetched at: 2026-06-23T14:24:00Z
- Content type: text/html; charset=utf-8

## Description

Use LiteLLM to call Google AI's generateContent endpoints for text generation, multimodal interactions, and streaming responses.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use LiteLLM to call Google AI's generateContent endpoints for text generation, multimodal interactions, and streaming responses.
Overview ​
Feature Supported Notes Cost Tracking ✅ Logging ✅ works across all integrations End-user Tracking ✅ Streaming ✅ Fallbacks ✅ between supported models Loadbalancing ✅ between supported models Metadata Tracking ✅ passes trace ID, metadata to observability callbacks (e.g. S3, Langfuse)
Usage ​
LiteLLM Python SDK ​
Basic Usage
Sync Usage
Non-streaming example ​
Basic Text Generation
from litellm . google_genai import agenerate_content
from google . genai . types import ContentDict , PartDict
import os
# Set API key
os . environ [ "GEMINI_API_KEY" ] = "your-gemini-api-key"
contents = ContentDict (
parts = [
PartDict ( text = "Hello, can you tell me a short joke?" )
] ,
role = "user" ,
)
response = await agenerate_content (
contents = contents ,
model = "gemini/gemini-2.0-flash" ,
max_tokens = 100 ,
print ( response )
Streaming example ​
Streaming Text Generation
from litellm . google_genai import agenerate_content_stream
PartDict ( text = "Write a long story about space exploration" )
response = await agenerate_content_stream (
max_tokens = 500 ,
async for chunk in response :
print ( chunk )
Sync non-streaming example ​
Sync Text Generation
from litellm . google_genai import generate_content
response = generate_content (
Sync streaming example ​
Sync Streaming Text Generation
from litellm . google_genai import generate_content_stream
response = generate_content_stream (
for chunk in response :
LiteLLM Proxy Server ​
Setup config.yaml
model_list :
- model_name : gemini - flash
litellm_params :
model : gemini/gemini - 2.0 - flash
api_key : os.environ/GEMINI_API_KEY
Start proxy
litellm --config /path/to/config.yaml
Test it!
Google GenAI SDK
curl
Google GenAI SDK with LiteLLM Proxy
from google . genai import Client
# Configure Google GenAI SDK to use LiteLLM proxy
os . environ [ "GOOGLE_GEMINI_BASE_URL" ] = "http://localhost:4000"
os . environ [ "GEMINI_API_KEY" ] = "sk-1234"
client = Client ( )
response = client . models . generate_content (
model = "gemini-flash" ,
contents = [
{
"parts" : [ { "text" : "Write a short story about AI" } ] ,
"role" : "user"
}
config = { "max_output_tokens" : 100 }
Generate Content ​
generateContent via LiteLLM Proxy
curl -L -X POST 'http://localhost:4000/v1beta/models/gemini-flash:generateContent' \
-H 'content-type: application/json' \
-H 'authorization: Bearer sk-1234' \
-d '{
"contents": [
"parts": [
"text": "Write a short story about AI"
],
"role": "user"
"generationConfig": {
"maxOutputTokens": 100
}'
Stream Generate Content ​
streamGenerateContent via LiteLLM Proxy
curl -L -X POST 'http://localhost:4000/v1beta/models/gemini-flash:streamGenerateContent' \
"text": "Write a long story about space exploration"
"maxOutputTokens": 500
Related ​
Use LiteLLM with gemini-cli
Overview
Usage
LiteLLM Python SDK
LiteLLM Proxy Server
Related
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
