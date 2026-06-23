# Black Forest Labs Image Generation | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/black_forest_labs
- Final URL: https://docs.litellm.ai/docs/providers/black_forest_labs
- Canonical URL: https://docs.litellm.ai/docs/providers/black_forest_labs
- Fetched at: 2026-06-23T14:27:22Z
- Content type: text/html; charset=utf-8

## Description

Black Forest Labs provides state-of-the-art text-to-image generation using their FLUX models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Black Forest Labs provides state-of-the-art text-to-image generation using their FLUX models.
Overview ​
Property Details Description Black Forest Labs FLUX models for high-quality text-to-image generation Provider Route on LiteLLM black_forest_labs/ Provider Doc Black Forest Labs API ↗ Supported Operations /images/generations
Setup ​
API Key ​
import os
# Set your Black Forest Labs API key
os . environ [ "BFL_API_KEY" ] = "your-api-key-here"
Get your API key from Black Forest Labs .
Supported Models ​
Model Name Description Price black_forest_labs/flux-pro-1.1 Fast & reliable standard generation $0.04/image black_forest_labs/flux-pro-1.1-ultra Ultra high-resolution (up to 4MP) $0.06/image black_forest_labs/flux-dev Development/open-source variant $0.025/image black_forest_labs/flux-pro Original pro model $0.05/image
Image Generation ​
Usage - LiteLLM Python SDK ​
Basic Usage
Async Usage
Custom Size
Ultra High-Res
Advanced Parameters
Basic Image Generation
import litellm
# Set your API key
# Generate an image
response = litellm . image_generation (
model = "black_forest_labs/flux-pro-1.1" ,
prompt = "A beautiful sunset over the ocean with sailing boats" ,
)
# BFL returns URLs
print ( response . data [ 0 ] . url )
Async Image Generation
import asyncio
async def generate_image ( ) :
response = await litellm . aimage_generation (
prompt = "A futuristic city skyline at night" ,
# Run the async function
asyncio . run ( generate_image ( ) )
Image Generation with Custom Size
# Generate with specific dimensions
prompt = "A majestic mountain landscape" ,
size = "1792x1024" , # Maps to width/height
Ultra High Resolution with flux-pro-1.1-ultra
# Generate ultra high-resolution image
model = "black_forest_labs/flux-pro-1.1-ultra" ,
prompt = "Detailed portrait of a fantasy character" ,
size = "2048x2048" , # Up to 4MP supported
quality = "hd" , # Maps to raw=True for natural look
Advanced Image Generation with BFL Parameters
# Generate with BFL-specific parameters
prompt = "A cute orange cat sitting on a windowsill" ,
seed = 42 , # For reproducible results
output_format = "png" , # png or jpeg
safety_tolerance = 2 , # 0-6, higher = more permissive
prompt_upsampling = True , # Enhance prompt for better results
Usage - LiteLLM Proxy Server ​
1. Configure your config.yaml ​
Black Forest Labs Image Generation Configuration
model_list :
- model_name : flux - pro
litellm_params :
model : black_forest_labs/flux - pro - 1.1
api_key : os.environ/BFL_API_KEY
model_info :
mode : image_generation
- model_name : flux - ultra
model : black_forest_labs/flux - pro - 1.1 - ultra
- model_name : flux - dev
model : black_forest_labs/flux - dev
general_settings :
master_key : sk - 1234
2. Start LiteLLM Proxy Server ​
Start LiteLLM Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Make image generation requests ​
OpenAI SDK
cURL
Black Forest Labs via Proxy - OpenAI SDK
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "sk-1234"
# Generate image with FLUX Pro
response = client . images . generate (
model = "flux-pro" ,
prompt = "A beautiful garden with colorful flowers" ,
size = "1024x1024" ,
Black Forest Labs via Proxy - cURL
curl -X POST 'http://localhost:4000/v1/images/generations' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-d '{
"model": "flux-pro",
"prompt": "A beautiful garden with colorful flowers",
"size": "1024x1024"
}'
Supported Parameters ​
OpenAI-Compatible Parameters ​
Parameter Type Description Mapping prompt string Text description of the image to generate Direct model string The FLUX model to use Direct size string Image dimensions (e.g., 1024x1024 ) Maps to width and height n integer Number of images (ultra model only, up to 4) Maps to num_images quality string hd for natural look Maps to raw=True for ultra response_format string url or b64_json Direct
Black Forest Labs Specific Parameters ​
Parameter Type Description Default width integer Image width (256-1920, multiples of 16) 1024 height integer Image height (256-1920, multiples of 16) 1024 aspect_ratio string Alternative to width/height (e.g., 16:9 , 1:1 ) - seed integer Seed for reproducible results Random output_format string Output format: png or jpeg png safety_tolerance integer Safety filter tolerance (0-6, higher = more permissive) 2 prompt_upsampling boolean Enhance prompt for better results false
Ultra Model Specific Parameters ​
Parameter Type Description Default raw boolean Raw mode for more natural, less synthetic look false num_images integer Number of images to generate (1-4) 1
How It Works ​
Black Forest Labs uses a polling-based API:
Submit Request : LiteLLM sends your prompt to BFL
Get Task ID : BFL returns a task ID and polling URL
Poll for Result : LiteLLM automatically polls until the image is ready
Return Result : The generated image URL is returned
This polling is handled automatically by LiteLLM - you just call image_generation() and get the result.
Getting Started ​
Create an account at Black Forest Labs
Get your API key from the dashboard
Set your BFL_API_KEY environment variable
Use litellm.image_generation() with any supported model
Additional Resources ​
Black Forest Labs Documentation
Black Forest Labs Image Editing - For editing existing images
FLUX Model Information
Overview
Setup
API Key
Supported Models
Image Generation
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Supported Parameters
OpenAI-Compatible Parameters
Black Forest Labs Specific Parameters
Ultra Model Specific Parameters
How It Works
Getting Started
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
