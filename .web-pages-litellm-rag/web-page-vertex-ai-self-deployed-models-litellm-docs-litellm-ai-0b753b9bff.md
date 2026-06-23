# Vertex AI - Self Deployed Models | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex_self_deployed
- Final URL: https://docs.litellm.ai/docs/providers/vertex_self_deployed
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex_self_deployed
- Fetched at: 2026-06-23T14:29:19Z
- Content type: text/html; charset=utf-8

## Description

Deploy and use your own models on Vertex AI through Model Garden or custom endpoints.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Deploy and use your own models on Vertex AI through Model Garden or custom endpoints.
Model Garden ​
tip
All OpenAI compatible models from Vertex Model Garden are supported.
Using Model Garden ​
Almost all Vertex Model Garden models are OpenAI compatible.
OpenAI Compatible Models
Non-OpenAI Compatible Models
Property Details Provider Route vertex_ai/openai/{MODEL_ID} Vertex Documentation Model Garden LiteLLM Inference , Vertex Model Garden Supported Operations /chat/completions , /embeddings
SDK
Proxy
from litellm import completion
import os
## set ENV variables
os . environ [ "VERTEXAI_PROJECT" ] = "hardy-device-38811"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
response = completion (
model = "vertex_ai/openai/<your-endpoint-id>" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
1. Add to config
model_list :
- model_name : llama3 - 1 - 8b - instruct
litellm_params :
model : vertex_ai/openai/5464397967697903616
vertex_ai_project : "my-test-project"
vertex_ai_location : "us-east-1"
2. Start proxy
litellm --config /path/to/config.yaml
# RUNNING at http://0.0.0.0:4000
3. Test it!
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "llama3-1-8b-instruct", # 👈 the 'model_name' in config
"messages": [
{
"role": "user",
"content": "what llm are you"
}
],
}'
model = "vertex_ai/<your-endpoint-id>" ,
Gemma Models (Custom Endpoints) ​
Deploy Gemma models on custom Vertex AI prediction endpoints with OpenAI-compatible format.
Property Details Provider Route vertex_ai/gemma/{MODEL_NAME} Vertex Documentation Vertex AI Prediction Required Parameter api_base - Full prediction endpoint URL
Proxy Usage:
1. Add to config.yaml
- model_name : gemma - model
model : vertex_ai/gemma/gemma - 3 - 12b - it - 1222199011122
api_base : https : //ENDPOINT.us - central1 - PROJECT.prediction.vertexai.goog/v1/projects/PROJECT_ID/locations/us - central1/endpoints/ENDPOINT_ID : predict
vertex_project : "my-project-id"
vertex_location : "us-central1"
3. Test it
curl http://0.0.0.0:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gemma-model",
"messages": [{"role": "user", "content": "What is machine learning?"}],
"max_tokens": 100
SDK Usage:
model = "vertex_ai/gemma/gemma-3-12b-it-1222199011122" ,
messages = [ { "role" : "user" , "content" : "What is machine learning?" } ] ,
api_base = "https://ENDPOINT.us-central1-PROJECT.prediction.vertexai.goog/v1/projects/PROJECT_ID/locations/us-central1/endpoints/ENDPOINT_ID:predict" ,
vertex_project = "my-project-id" ,
vertex_location = "us-central1" ,
MedGemma Models (Custom Endpoints) ​
Deploy MedGemma models on custom Vertex AI prediction endpoints with OpenAI-compatible format. MedGemma models use the same vertex_ai/gemma/ route.
- model_name : medgemma - model
model : vertex_ai/gemma/medgemma - 2b - v1
"model": "medgemma-model",
"messages": [{"role": "user", "content": "What are the symptoms of hypertension?"}],
model = "vertex_ai/gemma/medgemma-2b-v1" ,
messages = [ { "role" : "user" , "content" : "What are the symptoms of hypertension?" } ] ,
Model Garden
Using Model Garden
Gemma Models (Custom Endpoints)
MedGemma Models (Custom Endpoints)
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
