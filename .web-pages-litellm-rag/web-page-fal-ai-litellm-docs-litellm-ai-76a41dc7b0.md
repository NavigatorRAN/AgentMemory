# Fal AI | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/fal_ai
- Final URL: https://docs.litellm.ai/docs/providers/fal_ai
- Canonical URL: https://docs.litellm.ai/docs/providers/fal_ai
- Fetched at: 2026-06-23T14:27:45Z
- Content type: text/html; charset=utf-8

## Description

Fal AI provides fast, scalable access to state-of-the-art image generation models including FLUX, Stable Diffusion, Imagen, and more.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Fal AI provides fast, scalable access to state-of-the-art image generation models including FLUX, Stable Diffusion, Imagen, and more.
Overview ​
Property Details Description Fal AI offers optimized infrastructure for running image generation models at scale with low latency. Provider Route on LiteLLM fal_ai/ Provider Doc Fal AI Documentation ↗ Supported Operations /images/generations
Setup ​
API Key ​
import os
# Set your Fal AI API key
os . environ [ "FAL_AI_API_KEY" ] = "your-fal-api-key"
Get your API key from fal.ai .
Supported Models ​
Model Name Description Documentation fal_ai/fal-ai/flux-pro/v1.1 FLUX Pro v1.1 - Balanced speed and quality Docs ↗ fal_ai/flux/schnell Flux Schnell - Low-latency generation with image_size support Docs ↗ fal_ai/fal-ai/bytedance/seedream/v3/text-to-image ByteDance Seedream v3 - Text-to-image with image_size control Docs ↗ fal_ai/fal-ai/bytedance/dreamina/v3.1/text-to-image ByteDance Dreamina v3.1 - Text-to-image with image_size control Docs ↗ fal_ai/fal-ai/flux-pro/v1.1-ultra FLUX Pro v1.1 Ultra - High-quality image generation Docs ↗ fal_ai/fal-ai/imagen4/preview Google's Imagen 4 - Highest quality model Docs ↗ fal_ai/fal-ai/recraft/v3/text-to-image Recraft v3 - Multiple style options Docs ↗ fal_ai/fal-ai/ideogram/v3 Ideogram v3 - Lettering-first creative model (Balanced: $0.06/image) Docs ↗ fal_ai/fal-ai/stable-diffusion-v35-medium Stable Diffusion v3.5 Medium Docs ↗ fal_ai/bria/text-to-image/3.2 Bria 3.2 - Commercial-grade generation Docs ↗
Image Generation ​
Usage - LiteLLM Python SDK ​
Basic Usage
Imagen 4
Recraft v3
Async Usage
Advanced Parameters
Basic Image Generation
import litellm
# Set your API key
# Generate an image
response = litellm . image_generation (
model = "fal_ai/fal-ai/flux-pro/v1.1-ultra" ,
prompt = "A serene mountain landscape at sunset with vibrant colors"
)
print ( response . data [ 0 ] . url )
Google Imagen 4 Generation
# Generate with Imagen 4
model = "fal_ai/fal-ai/imagen4/preview" ,
prompt = "A vintage 1960s kitchen with flour package on countertop" ,
aspect_ratio = "16:9" ,
num_images = 1
Recraft v3 with Style
# Generate with specific style
model = "fal_ai/fal-ai/recraft/v3/text-to-image" ,
prompt = "A red panda eating bamboo" ,
style = "realistic_image" ,
image_size = "landscape_4_3"
Async Image Generation
import asyncio
async def generate_image ( ) :
response = await litellm . aimage_generation (
model = "fal_ai/fal-ai/stable-diffusion-v35-medium" ,
prompt = "A cyberpunk cityscape with neon lights" ,
guidance_scale = 7.5 ,
num_inference_steps = 50
return response
asyncio . run ( generate_image ( ) )
Advanced FLUX Pro Generation
# Generate with advanced parameters
prompt = "A majestic dragon soaring over mountains" ,
n = 2 ,
size = "1792x1024" , # Maps to aspect_ratio="16:9"
seed = 42 ,
safety_tolerance = "2" ,
enhance_prompt = True
for image in response . data :
print ( f"Generated image: { image . url } " )
Usage - LiteLLM Proxy Server ​
1. Configure your config.yaml ​
Fal AI Image Generation Configuration
model_list :
- model_name : flux - ultra
litellm_params :
model : fal_ai/fal - ai/flux - pro/v1.1 - ultra
api_key : os.environ/FAL_AI_API_KEY
model_info :
mode : image_generation
- model_name : imagen4
model : fal_ai/fal - ai/imagen4/preview
- model_name : stable - diffusion
model : fal_ai/fal - ai/stable - diffusion - v35 - medium
general_settings :
master_key : sk - 1234
2. Start LiteLLM Proxy Server ​
Start Proxy Server
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
3. Make requests ​
OpenAI SDK
LiteLLM SDK
cURL
Generate via Proxy - OpenAI SDK
from openai import OpenAI
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "sk-1234"
response = client . images . generate (
model = "flux-ultra" ,
prompt = "A beautiful sunset over the ocean" ,
n = 1 ,
size = "1024x1024"
Generate via Proxy - LiteLLM SDK
model = "litellm_proxy/imagen4" ,
prompt = "A cozy coffee shop interior" ,
api_base = "http://localhost:4000" ,
Generate via Proxy - cURL
curl --location 'http://localhost:4000/v1/images/generations' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "stable-diffusion",
"prompt": "A serene Japanese garden with cherry blossoms",
"n": 1,
"size": "1024x1024"
}'
Using Model-Specific Parameters ​
LiteLLM forwards any additional parameters directly to the Fal AI API. You can pass model-specific parameters in your request and they will be sent to Fal AI.
Pass Model-Specific Parameters
# Any parameters beyond the standard ones are forwarded to Fal AI
prompt = "A beautiful sunset" ,
# Model-specific Fal AI parameters
enhance_prompt = True ,
seed = 42
For the complete list of parameters supported by each model, see:
FLUX Pro v1.1-ultra Parameters ↗
Imagen 4 Parameters ↗
Recraft v3 Parameters ↗
Stable Diffusion v3.5 Parameters ↗
Bria 3.2 Parameters ↗
Supported Parameters ​
Standard OpenAI-compatible parameters that work across all models:
Parameter Type Description Default prompt string Text description of desired image Required model string Fal AI model to use Required n integer Number of images to generate (1-4) 1 size string Image dimensions (maps to model-specific format) Model default api_key string Your Fal AI API key Environment variable
Getting Started ​
Sign up at fal.ai
Get your API key from your account settings
Set FAL_AI_API_KEY environment variable
Choose a model from the Fal AI model gallery
Start generating images with LiteLLM
Additional Resources ​
Fal AI Documentation
Model Gallery
API Reference
Pricing
Overview
Setup
API Key
Supported Models
Image Generation
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Using Model-Specific Parameters
Supported Parameters
Getting Started
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
