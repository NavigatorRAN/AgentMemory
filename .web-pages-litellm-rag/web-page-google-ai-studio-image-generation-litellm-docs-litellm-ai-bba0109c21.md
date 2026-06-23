# Google AI Studio Image Generation | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/google_ai_studio/image_gen
- Final URL: https://docs.litellm.ai/docs/providers/google_ai_studio/image_gen
- Canonical URL: https://docs.litellm.ai/docs/providers/google_ai_studio/image_gen
- Fetched at: 2026-06-23T14:27:58Z
- Content type: text/html; charset=utf-8

## Description

Google AI Studio provides powerful image generation capabilities using Google's Imagen models to create high-quality images from text descriptions.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Google AI Studio provides powerful image generation capabilities using Google's Imagen models to create high-quality images from text descriptions.
Overview ​
Property Details Description Google AI Studio Image Generation uses Google's Imagen models to generate high-quality images from text descriptions. Provider Route on LiteLLM gemini/ Provider Doc Google AI Studio Image Generation ↗ Supported Operations /images/generations
Setup ​
API Key ​
# Set your Google AI Studio API key
import os
os . environ [ "GEMINI_API_KEY" ] = "your-api-key-here"
Get your API key from Google AI Studio .
Image Generation ​
Usage - LiteLLM Python SDK ​
Basic Usage
Async Usage
Advanced Parameters
Basic Image Generation
import litellm
# Set your API key
# Generate a single image
response = litellm . image_generation (
model = "gemini/imagen-4.0-generate-001" ,
prompt = "A cute baby sea otter swimming in crystal clear water"
)
print ( response . data [ 0 ] . url )
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
prompt = "A futuristic cityscape at night with neon lights" ,
size = "1024x1024" ,
quality = "standard" ,
response_format = "url"
for image in response . data :
print ( f"Generated image URL: { image . url } " )
Usage - LiteLLM Proxy Server ​
1. Configure your config.yaml ​
Google AI Studio Image Generation Configuration
model_list :
- model_name : google - imagen
litellm_params :
model : gemini/imagen - 4.0 - generate - 001
api_key : os.environ/GEMINI_API_KEY
model_info :
mode : image_generation
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
Google AI Studio Image Generation via Proxy - OpenAI SDK
from openai import OpenAI
# Initialize client with your proxy URL
client = OpenAI (
base_url = "http://localhost:4000" , # Your proxy URL
api_key = "sk-1234" # Your proxy API key
# Generate image
response = client . images . generate (
model = "google-imagen" ,
prompt = "A majestic eagle soaring over snow-capped mountains" ,
size = "1024x1024"
Google AI Studio Image Generation via Proxy - LiteLLM SDK
# Configure LiteLLM to use your proxy
model = "litellm_proxy/google-imagen" ,
prompt = "A serene Japanese garden with cherry blossoms" ,
api_base = "http://localhost:4000" ,
api_key = "sk-1234"
Google AI Studio Image Generation via Proxy - cURL
curl --location 'http://localhost:4000/v1/images/generations' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "google-imagen",
"prompt": "A cozy coffee shop interior with warm lighting",
"n": 1,
"size": "1024x1024"
}'
Gemini Image Models ​
Gemini image models (e.g. gemini-3.1-flash-image-preview , gemini-3-pro-image-preview ) use the generateContent API and return base64 images. They also support Google Search grounding on /v1/images/generations .
Gemini image generation with Google Search
model = "gemini/gemini-3.1-flash-image-preview" ,
prompt = "Generate an image of the latest iPhone design" ,
web_search_options = { } ,
print ( response . data [ 0 ] . b64_json )
Proxy request with web_search_options
"model": "gemini-3.1-flash-image-preview",
"prompt": "Generate an image of the latest iPhone design",
"web_search_options": {}
You can also pass tools=[{"type": "web_search"}] or native tools=[{"googleSearch": {}}] .
Supported Parameters ​
Google AI Studio Image Generation supports the following OpenAI-compatible parameters:
Parameter Type Description Default Example prompt string Text description of the image to generate Required "A sunset over the ocean" model string The model to use for generation Required "gemini/imagen-4.0-generate-001" n integer Number of images to generate (1-4) 1 2 size string Image dimensions "1024x1024" "512x512" , "1024x1024" web_search_options object Enable Google Search grounding (Gemini image models only) - {} tools array Pass {"type": "web_search"} or {"googleSearch": {}} (Gemini image models only) - [{"type": "web_search"}]
Create an account at Google AI Studio
Generate an API key from API Keys section
Set your GEMINI_API_KEY environment variable
Start generating images using LiteLLM
Additional Resources ​
Google AI Studio Documentation
Imagen Model Overview
LiteLLM Image Generation Guide
Overview
Setup
API Key
Image Generation
Usage - LiteLLM Python SDK
Usage - LiteLLM Proxy Server
Gemini Image Models
Supported Parameters
Additional Resources
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
