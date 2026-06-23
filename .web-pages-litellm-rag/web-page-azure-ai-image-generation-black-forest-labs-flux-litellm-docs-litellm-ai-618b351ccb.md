# Azure AI Image Generation (Black Forest Labs - Flux) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_ai_img
- Final URL: https://docs.litellm.ai/docs/providers/azure_ai_img
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_ai_img
- Fetched at: 2026-06-23T14:27:03Z
- Content type: text/html; charset=utf-8

## Description

Azure AI provides powerful image generation capabilities using FLUX models from Black Forest Labs to create high-quality images from text descriptions.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Azure AI provides powerful image generation capabilities using FLUX models from Black Forest Labs to create high-quality images from text descriptions.
Overview ​
Property Details Description Azure AI Image Generation uses FLUX models to generate high-quality images from text descriptions. Provider Route on LiteLLM azure_ai/ Provider Doc Azure AI FLUX Models ↗ Supported Operations /images/generations , /images/edits
Setup ​
API Key & Base URL ​
# Set your Azure AI API credentials
import os
os . environ [ "AZURE_AI_API_KEY" ] = "your-api-key-here"
os . environ [ "AZURE_AI_API_BASE" ] = "your-azure-ai-endpoint" # e.g., https://your-endpoint.eastus2.inference.ai.azure.com/
Get your API key and endpoint from Azure AI Studio .
Supported Models ​
Model Name Description Cost per Image azure_ai/FLUX-1.1-pro Latest FLUX 1.1 Pro model for high-quality image generation $0.04 azure_ai/FLUX.1-Kontext-pro FLUX 1 Kontext Pro model with enhanced context understanding $0.04 azure_ai/flux.2-pro FLUX 2 Pro model for next-generation image generation $0.04
Image Generation ​
Usage - LiteLLM Python SDK ​
Basic Usage
FLUX 1.1 Pro
FLUX 2 Pro
Async Usage
Advanced Parameters
Basic Image Generation
import litellm
# Set your API credentials
os . environ [ "AZURE_AI_API_BASE" ] = "your-azure-ai-endpoint"
# Generate a single image
response = litellm . image_generation (
model = "azure_ai/FLUX.1-Kontext-pro" ,
prompt = "A cute baby sea otter swimming in crystal clear water" ,
api_base = os . environ [ "AZURE_AI_API_BASE" ] ,
api_key = os . environ [ "AZURE_AI_API_KEY" ]
)
print ( response . data [ 0 ] . url )
FLUX 1.1 Pro Image Generation
# Generate image with FLUX 1.1 Pro
model = "azure_ai/FLUX-1.1-pro" ,
prompt = "A futuristic cityscape at night with neon lights and flying cars" ,
FLUX 2 Pro Image Generation
os . environ [ "AZURE_AI_API_BASE" ] = "your-azure-ai-endpoint" # e.g., https://litellm-ci-cd-prod.services.ai.azure.com
# Generate image with FLUX 2 Pro
model = "azure_ai/flux.2-pro" ,
prompt = "A photograph of a red fox in an autumn forest" ,
api_key = os . environ [ "AZURE_AI_API_KEY" ] ,
api_version = "preview" ,
size = "1024x1024" ,
n = 1
print ( response . data [ 0 ] . b64_json ) # FLUX 2 returns base64 encoded images
Async Image Generation
import asyncio
async def generate_image ( ) :
# Generate image asynchronously
response = await litellm . aimage_generation (
prompt = "A beautiful sunset over mountains with vibrant colors" ,
n = 1 ,
return response
# Run the async function
asyncio . run ( generate_image ( ) )
Advanced Image Generation with Parameters
# Generate image with additional parameters
prompt = "A majestic dragon soaring over a medieval castle at dawn" ,
quality = "standard"
for image in response . data :
print ( f"Generated image URL: { image . url } " )
Usage - LiteLLM Proxy Server ​
1. Configure your config.yaml ​
Azure AI Image Generation Configuration
model_list :
- model_name : azure - flux - kontext
litellm_params :
model : azure_ai/FLUX.1 - Kontext - pro
api_key : os.environ/AZURE_AI_API_KEY
api_base : os.environ/AZURE_AI_API_BASE
model_info :
mode : image_generation
- model_name : azure - flux - 11 - pro
model : azure_ai/FLUX - 1.1 - pro
- model_name : azure - flux - 2 - pro
model : azure_ai/flux.2 - pro
api_version : preview
general_settings :
master_key : sk - 1234
2. Start LiteLLM Proxy Server ​
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Make requests with OpenAI Python SDK ​
OpenAI SDK
LiteLLM SDK
cURL
Azure AI Image Generation via Proxy - OpenAI SDK
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "sk-1234" # Your proxy API key
# Generate image with FLUX Kontext Pro
response = client . images . generate (
model = "azure-flux-kontext" ,
prompt = "A serene Japanese garden with cherry blossoms and a peaceful pond" ,
size = "1024x1024"
Azure AI Image Generation via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
model = "litellm_proxy/azure-flux-11-pro" ,
prompt = "A cyberpunk warrior in a neon-lit alleyway" ,
api_base = "http://localhost:4000" ,
api_key = "sk-1234"
Azure AI Image Generation via Proxy - cURL
curl --location 'http://localhost:4000/v1/images/generations' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "azure-flux-kontext",
"prompt": "A cozy coffee shop interior with warm lighting and rustic wooden furniture",
"n": 1,
"size": "1024x1024"
}'
Image Editing ​
FLUX 2 Pro supports image editing by passing an input image along with a prompt describing the desired modifications.
Basic Image Edit
Async Image Edit
Basic Image Editing with FLUX 2 Pro
# Edit an existing image
response = litellm . image_edit (
prompt = "Add a red hat to the subject" ,
image = open ( "input_image.png" , "rb" ) ,
Async Image Editing
async def edit_image ( ) :
response = await litellm . aimage_edit (
prompt = "Change the background to a sunset beach" ,
asyncio . run ( edit_image ( ) )
Image Edit via Proxy - cURL
curl --location 'http://localhost:4000/v1/images/edits' \
--form 'model="azure-flux-2-pro"' \
--form 'prompt="Add sunglasses to the person"' \
--form 'image=@"input_image.png"'
Image Edit via Proxy - OpenAI SDK
base_url = "http://localhost:4000" ,
response = client . images . edit (
model = "azure-flux-2-pro" ,
prompt = "Make the sky more dramatic with storm clouds" ,
print ( response . data [ 0 ] . b64_json )
Supported Parameters ​
Azure AI Image Generation supports the following OpenAI-compatible parameters:
Parameter Type Description Default Example prompt string Text description of the image to generate Required "A sunset over the ocean" model string The FLUX model to use for generation Required "azure_ai/FLUX.1-Kontext-pro" n integer Number of images to generate (1-4) 1 2 size string Image dimensions "1024x1024" "512x512" , "1024x1024" api_base string Your Azure AI endpoint URL Required "https://your-endpoint.eastus2.inference.ai.azure.com/" api_key string Your Azure AI API key Required Environment variable or direct value
Getting Started ​
Create an account at Azure AI Studio
Deploy a FLUX model in your Azure AI Studio workspace
Get your API key and endpoint from the deployment details
Set your AZURE_AI_API_KEY and AZURE_AI_API_BASE environment variables
Start generating images using LiteLLM
Additional Resources ​
Azure AI Studio Documentation
FLUX Models Announcement
Overview
Setup
API Key & Base URL
Supported Models
Image Generation
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Image Editing
Supported Parameters
Getting Started
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
