# Nscale (EU Sovereign) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/nscale
- Final URL: https://docs.litellm.ai/docs/providers/nscale
- Canonical URL: https://docs.litellm.ai/docs/providers/nscale
- Fetched at: 2026-06-23T14:28:28Z
- Content type: text/html; charset=utf-8

## Description

https://docs.nscale.com/docs/inference/chat

## Extracted Text

Skip to main content
On this page
Copy as Markdown
https://docs.nscale.com/docs/inference/chat
tip
We support ALL Nscale models, just set model=nscale/<any-model-on-nscale> as a prefix when sending litellm requests
Property Details Description European-domiciled full-stack AI cloud platform for LLMs and image generation. Provider Route on LiteLLM nscale/ Supported Endpoints /chat/completions , /images/generations API Reference Nscale docs
Required Variables ​
Environment Variables
os . environ [ "NSCALE_API_KEY" ] = "" # your Nscale API key
Explore Available Models ​
Explore our full list of text and multimodal AI models — all available at highly competitive pricing:
📚 Full List of Models
Key Features ​
EU Sovereign : Full data sovereignty and compliance with European regulations
Ultra-Low Cost (starting at $0.01 / M tokens) : Extremely competitive pricing for both text and image generation models
Production Grade : Reliable serverless deployments with full isolation
No Setup Required : Instant access to compute without infrastructure management
Full Control : Your data remains private and isolated
Usage - LiteLLM Python SDK ​
Text Generation ​
Nscale Text Generation
from litellm import completion
import os
response = completion (
model = "nscale/meta-llama/Llama-4-Scout-17B-16E-Instruct" ,
messages = [ { "role" : "user" , "content" : "What is LiteLLM?" } ]
)
print ( response )
Nscale Text Generation - Streaming
stream = completion (
messages = [ { "role" : "user" , "content" : "What is LiteLLM?" } ] ,
stream = True
for chunk in stream :
if chunk . choices [ 0 ] . delta . content is not None :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
Image Generation ​
Nscale Image Generation
from litellm import image_generation
response = image_generation (
model = "nscale/stabilityai/stable-diffusion-xl-base-1.0" ,
prompt = "A beautiful sunset over mountains" ,
n = 1 ,
size = "1024x1024"
Usage - LiteLLM Proxy ​
Add the following to your LiteLLM Proxy configuration file:
config.yaml
model_list :
- model_name : nscale/meta - llama/Llama - 4 - Scout - 17B - 16E - Instruct
litellm_params :
model : nscale/meta - llama/Llama - 4 - Scout - 17B - 16E - Instruct
api_key : os.environ/NSCALE_API_KEY
- model_name : nscale/meta - llama/Llama - 3.3 - 70B - Instruct
model : nscale/meta - llama/Llama - 3.3 - 70B - Instruct
- model_name : nscale/stabilityai/stable - diffusion - xl - base - 1.0
model : nscale/stabilityai/stable - diffusion - xl - base - 1.0
Start your LiteLLM Proxy server:
Start LiteLLM Proxy
litellm --config config.yaml
# RUNNING on http://0.0.0.0:4000
OpenAI SDK
LiteLLM SDK
cURL
Nscale via Proxy - Non-streaming
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "your-proxy-api-key" # Your proxy API key
# Non-streaming response
response = client . chat . completions . create (
print ( response . choices [ 0 ] . message . content )
Nscale via Proxy - LiteLLM SDK
import litellm
# Configure LiteLLM to use your proxy
response = litellm . completion (
model = "litellm_proxy/nscale/meta-llama/Llama-4-Scout-17B-16E-Instruct" ,
api_base = "http://localhost:4000" ,
api_key = "your-proxy-api-key"
Nscale via Proxy - cURL
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your-proxy-api-key" \
-d '{
"model": "nscale/meta-llama/Llama-4-Scout-17B-16E-Instruct",
"messages": [{"role": "user", "content": "What is LiteLLM?"}]
}'
Getting Started ​
Create an account at console.nscale.com
Claim free credit
Create an API key in settings
Start making API calls using LiteLLM
Additional Resources ​
Nscale Documentation
Blog: Sovereign Serverless
Required Variables
Explore Available Models
Key Features
Usage - LiteLLM Python SDK
Text Generation
Image Generation
Usage - LiteLLM Proxy
Getting Started
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
