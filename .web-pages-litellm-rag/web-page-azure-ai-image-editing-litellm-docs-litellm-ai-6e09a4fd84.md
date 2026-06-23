# Azure AI Image Editing | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/azure_ai_img_edit
- Final URL: https://docs.litellm.ai/docs/providers/azure_ai_img_edit
- Canonical URL: https://docs.litellm.ai/docs/providers/azure_ai_img_edit
- Fetched at: 2026-06-23T14:27:04Z
- Content type: text/html; charset=utf-8

## Description

Azure AI provides powerful image editing capabilities using FLUX models from Black Forest Labs to modify existing images based on text descriptions.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Azure AI provides powerful image editing capabilities using FLUX models from Black Forest Labs to modify existing images based on text descriptions.
Overview ​
Property Details Description Azure AI Image Editing uses FLUX models to modify existing images based on text prompts. Provider Route on LiteLLM azure_ai/ Provider Doc Azure AI FLUX Models ↗ Supported Operations /images/edits
Setup ​
API Key & Base URL & API Version ​
# Set your Azure AI API credentials
import os
os . environ [ "AZURE_AI_API_KEY" ] = "your-api-key-here"
os . environ [ "AZURE_AI_API_BASE" ] = "your-azure-ai-endpoint" # e.g., https://your-endpoint.eastus2.inference.ai.azure.com/
os . environ [ "AZURE_AI_API_VERSION" ] = "2025-04-01-preview" # Example API version
Get your API key and endpoint from Azure AI Studio .
Supported Models ​
Model Name Description Cost per Image azure_ai/FLUX.1-Kontext-pro FLUX 1 Kontext Pro model with enhanced context understanding for editing $0.04
Image Editing ​
Usage - LiteLLM Python SDK ​
Basic Usage
Async Usage
Advanced Parameters
Basic Image Editing
import base64
from pathlib import Path
import litellm
# Set your API credentials
os . environ [ "AZURE_AI_API_BASE" ] = "your-azure-ai-endpoint"
os . environ [ "AZURE_AI_API_VERSION" ] = "2025-04-01-preview"
# Edit an image with a prompt
response = litellm . image_edit (
model = "azure_ai/FLUX.1-Kontext-pro" ,
image = open ( "path/to/your/image.png" , "rb" ) ,
prompt = "Add a winter theme with snow and cold colors" ,
api_base = os . environ [ "AZURE_AI_API_BASE" ] ,
api_key = os . environ [ "AZURE_AI_API_KEY" ] ,
api_version = os . environ [ "AZURE_AI_API_VERSION" ]
)
img_base64 = response . data [ 0 ] . get ( "b64_json" )
img_bytes = base64 . b64decode ( img_base64 )
path = Path ( "edited_image.png" )
path . write_bytes ( img_bytes )
Async Image Editing
import asyncio
async def edit_image ( ) :
# Edit image asynchronously
response = await litellm . aimage_edit (
prompt = "Make this image look like a watercolor painting" ,
path = Path ( "async_edited_image.png" )
# Run the async function
asyncio . run ( edit_image ( ) )
Advanced Image Editing with Parameters
# Edit image with additional parameters
prompt = "Add magical elements like floating crystals and mystical lighting" ,
api_version = os . environ [ "AZURE_AI_API_VERSION" ] ,
n = 1
path = Path ( "advanced_edited_image.png" )
Usage - LiteLLM Proxy Server ​
1. Configure your config.yaml ​
Azure AI Image Editing Configuration
model_list :
- model_name : azure - flux - kontext - edit
litellm_params :
model : azure_ai/FLUX.1 - Kontext - pro
api_key : os.environ/AZURE_AI_API_KEY
api_base : os.environ/AZURE_AI_API_BASE
api_version : os.environ/AZURE_AI_API_VERSION
model_info :
mode : image_edit
general_settings :
master_key : sk - 1234
2. Start LiteLLM Proxy Server ​
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Make image editing requests with OpenAI Python SDK ​
OpenAI SDK
LiteLLM SDK
cURL
Azure AI Image Editing via Proxy - OpenAI SDK
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "sk-1234" # Your proxy API key
# Edit image with FLUX Kontext Pro
response = client . images . edit (
model = "azure-flux-kontext-edit" ,
prompt = "Transform this image into a beautiful oil painting style" ,
img_base64 = response . data [ 0 ] . b64_json
path = Path ( "proxy_edited_image.png" )
Azure AI Image Editing via Proxy - LiteLLM SDK
# Edit image through proxy
model = "litellm_proxy/azure-flux-kontext-edit" ,
prompt = "Add a mystical forest background with magical creatures" ,
api_base = "http://localhost:4000" ,
api_key = "sk-1234"
Azure AI Image Editing via Proxy - cURL
curl --location 'http://localhost:4000/v1/images/edits' \
--header 'Authorization: Bearer sk-1234' \
--form 'model="azure-flux-kontext-edit"' \
--form 'prompt="Convert this image to a vintage sepia tone with old-fashioned effects"' \
--form 'image=@"path/to/your/image.png"'
Supported Parameters ​
Azure AI Image Editing supports the following OpenAI-compatible parameters:
Parameter Type Description Default Example image file The image file to edit Required File object or binary data prompt string Text description of the desired changes Required "Add snow and winter elements" model string The FLUX model to use for editing Required "azure_ai/FLUX.1-Kontext-pro" n integer Number of edited images to generate (You can specify only 1) 1 1 api_base string Your Azure AI endpoint URL Required "https://your-endpoint.eastus2.inference.ai.azure.com/" api_key string Your Azure AI API key Required Environment variable or direct value api_version string API version for Azure AI Required "2025-04-01-preview"
Getting Started ​
Create an account at Azure AI Studio
Deploy a FLUX model in your Azure AI Studio workspace
Get your API key and endpoint from the deployment details
Set your AZURE_AI_API_KEY , AZURE_AI_API_BASE and AZURE_AI_API_VERSION environment variables
Prepare your source image
Use litellm.image_edit() to modify your images with text instructions
Additional Resources ​
Azure AI Studio Documentation
FLUX Models Announcement
Overview
Setup
API Key & Base URL & API Version
Supported Models
Image Editing
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Supported Parameters
Getting Started
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
