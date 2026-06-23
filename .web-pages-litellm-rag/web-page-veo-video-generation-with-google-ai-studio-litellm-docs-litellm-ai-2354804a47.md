# Veo Video Generation with Google AI Studio | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/veo_video_generation
- Final URL: https://docs.litellm.ai/docs/proxy/veo_video_generation
- Canonical URL: https://docs.litellm.ai/docs/proxy/veo_video_generation
- Fetched at: 2026-06-23T14:32:34Z
- Content type: text/html; charset=utf-8

## Description

Generate videos using Google's Veo model through LiteLLM's pass-through endpoints.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Generate videos using Google's Veo model through LiteLLM's pass-through endpoints.
Quick Start ​
LiteLLM allows you to use Google AI Studio's Veo video generation API through pass-through routes with zero configuration.
1. Add Google AI Studio API Key to your environment ​
export GEMINI_API_KEY="your_google_ai_studio_api_key"
2. Start LiteLLM Proxy ​
litellm
# RUNNING on http://0.0.0.0:4000
3. Generate Video ​
Python
Curl
import requests
import time
import json
# Configuration
BASE_URL = "http://localhost:4000/gemini/v1beta"
API_KEY = "anything" # Use "anything" as the key
headers = {
"x-goog-api-key" : API_KEY ,
"Content-Type" : "application/json"
}
# Step 1: Initiate video generation
def generate_video ( prompt ) :
url = f" { BASE_URL } /models/veo-3.0-generate-preview:predictLongRunning"
payload = {
"instances" : [ {
"prompt" : prompt
} ]
response = requests . post ( url , headers = headers , json = payload )
response . raise_for_status ( )
data = response . json ( )
return data . get ( "name" ) # Operation name
# Step 2: Poll for completion
def wait_for_completion ( operation_name ) :
operation_url = f" { BASE_URL } / { operation_name } "
while True :
response = requests . get ( operation_url , headers = headers )
if data . get ( "done" , False ) :
# Extract video URI
video_uri = data [ "response" ] [ "generateVideoResponse" ] [ "generatedSamples" ] [ 0 ] [ "video" ] [ "uri" ]
return video_uri
time . sleep ( 10 ) # Wait 10 seconds before next poll
# Step 3: Download video
def download_video ( video_uri , filename = "generated_video.mp4" ) :
# Replace Google URL with LiteLLM proxy URL
litellm_url = video_uri . replace (
"https://generativelanguage.googleapis.com/v1beta" ,
BASE_URL
)
response = requests . get ( litellm_url , headers = headers , stream = True )
with open ( filename , 'wb' ) as f :
for chunk in response . iter_content ( chunk_size = 8192 ) :
if chunk :
f . write ( chunk )
return filename
# Complete workflow
prompt = "A cat playing with a ball of yarn in a sunny garden"
print ( "Generating video..." )
operation_name = generate_video ( prompt )
print ( "Waiting for completion..." )
video_uri = wait_for_completion ( operation_name )
print ( "Downloading video..." )
filename = download_video ( video_uri )
print ( f"Video saved as: { filename } " )
curl -X POST "http://localhost:4000/gemini/v1beta/models/veo-3.0-generate-preview:predictLongRunning" \
-H "x-goog-api-key: anything" \
-H "Content-Type: application/json" \
-d '{
"instances": [{
"prompt": "A cat playing with a ball of yarn in a sunny garden"
}]
}'
# Response will include operation name:
# {"name": "operations/generate_12345"}
curl -X GET "http://localhost:4000/gemini/v1beta/operations/generate_12345" \
-H "x-goog-api-key: anything"
# Step 3: Download video (when done=true)
curl -X GET "http://localhost:4000/gemini/v1beta/files/VIDEO_ID:download?alt=media" \
--output generated_video.mp4
Complete Example ​
For a full working example with error handling and logging, see our Veo Video Generation Cookbook .
How It Works ​
Video Generation Request : Send a prompt to Veo's predictLongRunning endpoint
Operation Polling : Monitor the long-running operation until completion
File Download : Download the generated video through LiteLLM's pass-through with automatic redirect handling
LiteLLM handles:
✅ Authentication with Google AI Studio
✅ Request routing and proxying
✅ Automatic redirect handling for file downloads
Configuration Options ​
Environment Variables ​
Quick Start
1. Add Google AI Studio API Key to your environment
2. Start LiteLLM Proxy
3. Generate Video
Complete Example
How It Works
Configuration Options
Environment Variables
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
