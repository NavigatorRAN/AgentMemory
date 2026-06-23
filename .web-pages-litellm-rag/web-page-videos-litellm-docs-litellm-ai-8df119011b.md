# /videos | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/videos
- Final URL: https://docs.litellm.ai/docs/videos
- Canonical URL: https://docs.litellm.ai/docs/videos
- Fetched at: 2026-06-23T14:34:53Z
- Content type: text/html; charset=utf-8

## Description

| Feature | Supported |

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Feature Supported Cost Tracking ✅ Logging ✅ (Full request/response logging) Fallbacks ✅ (Between supported models) Load Balancing ✅ Guardrails Support ✅ Content moderation and safety checks Proxy Server Support ✅ Full proxy integration with virtual keys Spend Management ✅ Budget tracking and rate limiting Supported Providers openai , azure , gemini , vertex_ai , runwayml
tip
LiteLLM follows the OpenAI Video Generation API specification
LiteLLM Python SDK Usage ​
Quick Start ​
from litellm import video_generation , video_status , video_content
import os
import time
os . environ [ "OPENAI_API_KEY" ] = "sk-.."
# Generate video
response = video_generation (
model = "openai/sora-2" ,
prompt = "A cat playing with a ball of yarn in a sunny garden" ,
seconds = "8" ,
size = "720x1280"
)
print ( f"Video ID: { response . id } " )
print ( f"Initial Status: { response . status } " )
# Check status until video is ready
while True :
status_response = video_status (
video_id = response . id
print ( f"Current Status: { status_response . status } " )
if status_response . status == "completed" :
break
elif status_response . status == "failed" :
print ( "Video generation failed" )
time . sleep ( 10 ) # Wait 10 seconds before checking again
# Download video content when ready
video_bytes = video_content (
# Save to file
with open ( "generated_video.mp4" , "wb" ) as f :
f . write ( video_bytes )
Async Usage ​
from litellm import avideo_generation , avideo_status , avideo_content
import os , asyncio
async def test_async_video ( ) :
response = await avideo_generation (
status_response = await avideo_status (
await asyncio . sleep ( 10 ) # Wait 10 seconds before checking again
video_bytes = await avideo_content (
asyncio . run ( test_async_video ( ) )
Video Status Checking ​
from litellm import video_status
video_id = "video_1234567890"
print ( f"Video Status: { status_response . status } " )
print ( f"Created At: { status_response . created_at } " )
print ( f"Model: { status_response . model } " )
List Videos ​
For listing videos, you need to specify the provider since there's no video_id to decode from:
from litellm import video_list
# List videos from OpenAI
videos = video_list ( custom_llm_provider = "openai" )
for video in videos :
print ( f"Video ID: { video [ 'id' ] } " )
Video Generation with Reference Image ​
from litellm import video_generation
# Video generation with reference image
input_reference = open ( "path/to/image.jpg" , "rb" ) , # Reference image as file object
Video Remix (Video Editing) ​
from litellm import video_remix
# Video remix with reference image
response = video_remix (
prompt = "Make the cat jump higher" ,
seconds = "8"
Optional Parameters ​
seconds = "8" , # Video duration in seconds
size = "720x1280" , # Video dimensions
user = "user_123" # User identifier for tracking
Azure Video Generation ​
os . environ [ "AZURE_OPENAI_API_KEY" ] = "your-azure-api-key"
os . environ [ "AZURE_OPENAI_API_BASE" ] = "https://your-resource.openai.azure.com/"
os . environ [ "AZURE_OPENAI_API_VERSION" ] = "2024-02-15-preview"
model = "azure/sora-2" ,
LiteLLM Proxy Usage ​
LiteLLM provides OpenAI API compatible video endpoints for complete video generation workflow:
/videos - Generate new videos
/videos/remix - Edit existing videos with reference images
/videos/status - Check video generation status
/videos/retrieval - Download completed videos
Setup
Add this to your litellm proxy config.yaml
model_list :
- model_name : sora - 2
litellm_params :
model : openai/sora - 2
api_key : os.environ/OPENAI_API_KEY
- model_name : azure - sora - 2
model : azure/sora - 2
api_key : os.environ/AZURE_OPENAI_API_KEY
api_base : os.environ/AZURE_OPENAI_API_BASE
Start litellm
litellm --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Test video generation request
curl --location 'http://localhost:4000/v1/videos' \
--header 'Content-Type: application/json' \
--header 'x-litellm-api-key: sk-1234' \
--data '{
"model": "sora-2",
"prompt": "A beautiful sunset over the ocean"
}'
Test video status request
curl --location 'http://localhost:4000/v1/videos/{video_id}' \
--header 'x-litellm-api-key: sk-1234'
Test video retrieval request
curl --location 'http://localhost:4000/v1/videos/{video_id}/content' \
--output video.mp4
Test video remix request
curl --location --request POST 'http://localhost:4000/v1/videos/{video_id}/remix' \
"prompt": "New remix instructions"
Test video list request (requires custom_llm_provider)
# Note: video_list requires custom_llm_provider since there's no video_id to decode from
curl --location 'http://localhost:4000/v1/videos?custom_llm_provider=openai' \
# Or using header
--header 'custom-llm-provider: azure'
Character, Edit, and Extension Endpoints ​
LiteLLM proxy also supports these OpenAI-compatible video routes:
POST /v1/videos/characters
GET /v1/videos/characters/{character_id}
POST /v1/videos/edits
POST /v1/videos/extensions
Routing Behavior ( target_model_names , encoded IDs, and provider overrides) ​
POST /v1/videos/characters supports target_model_names like POST /v1/videos .
When target_model_names is provided on character creation, LiteLLM encodes the returned character_id with routing metadata.
GET /v1/videos/characters/{character_id} accepts encoded character IDs directly. LiteLLM decodes the ID internally and routes with the correct model/provider metadata.
POST /v1/videos/edits and POST /v1/videos/extensions support both:
plain video.id
encoded video.id values returned by LiteLLM
custom_llm_provider can be supplied using the same patterns as other proxy endpoints:
header: custom-llm-provider
query: ?custom_llm_provider=...
body: custom_llm_provider (or extra_body.custom_llm_provider where applicable)
Character create with target_model_names ​
curl --location 'http://localhost:4000/v1/videos/characters' \
--header 'Authorization: Bearer sk-1234' \
-F 'name=hero' \
-F 'target_model_names=gpt-4' \
-F 'video=@/path/to/character.mp4'
Example response (encoded id ):
{
"id" : "character_..." ,
"object" : "character" ,
"created_at" : 1712697600 ,
"name" : "hero"
}
Get character using encoded character_id ​
curl --location 'http://localhost:4000/v1/videos/characters/character_...' \
--header 'Authorization: Bearer sk-1234'
Video edit with encoded video.id ​
curl --location 'http://localhost:4000/v1/videos/edits' \
"prompt": "Make this brighter",
"video": { "id": "video_..." }
Video extension with provider override from extra_body ​
curl --location 'http://localhost:4000/v1/videos/extensions' \
"prompt": "Continue this scene",
"seconds": "4",
"video": { "id": "video_..." },
"extra_body": { "custom_llm_provider": "openai" }
Test Azure video generation request
curl http://localhost:4000/v1/videos \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"model": "azure-sora-2",
"prompt": "A cat playing with a ball of yarn in a sunny garden",
"seconds": "8",
"size": "720x1280"
Using OpenAI Client with LiteLLM Proxy ​
You can use the standard OpenAI Python client to interact with LiteLLM's video endpoints. This provides a familiar interface while leveraging LiteLLM's provider abstraction and proxy features.
Setup ​
First, configure your OpenAI client to point to your LiteLLM proxy:
from openai import OpenAI
# Point the OpenAI client to your LiteLLM proxy
client = OpenAI (
api_key = "sk-1234" , # Your LiteLLM proxy API key
base_url = "http://localhost:4000/v1" # Your LiteLLM proxy URL
Video Generation ​
Generate a new video using the OpenAI client interface:
# Basic video generation
response = client . videos . create (
model = "sora-2" ,
seconds = 8 ,
print ( f"Status: { response . status } " )
Create a video using a reference image:
prompt = "Add clouds to the video" ,
seconds = 4 ,
input_reference = open ( "/path/to/your/image.jpg" , "rb" )
Check the status of a video generation:
# Check video status
status_response = client . videos . retrieve (
video_id = "video_6900378779308191a7359266e59b53fc01cd6bbd27a70763"
print ( f"Status: { status_response . status } " )
print ( f"Progress: { status_response . progress } %" )
# Poll until completion
while status_response . status not in [ "completed" , "failed" ] :
time . sleep ( 10 ) # Wait 10 seconds
print ( f"Current status: { status_response . status } " )
Get a list of your videos:
# List all videos
videos = client . videos . list ( )
for video in videos . data :
print ( f"Video ID: { video . id } , Status: { video . status } " )
Download Video Content ​
Download the completed video:
# Download video content
response = client . videos . download_content (
video_id = "video_68fa2938848c8190bb718f977503aba6092ab18d68938fed"
# Save the video to file
f . write ( response . content )
print ( "Video downloaded successfully!" )
Video Remix (Editing) ​
Edit an existing video with new instructions:
# Remix/edit an existing video
response = client . videos . remix (
video_id = "video_68fa2574bdd88190873a8af06a370ff407094ddbc4bbb91b" ,
prompt = "Slow the cloud movement" ,
seconds = 8
print ( f"Remix Video ID: { response . id } " )
Complete Workflow Example ​
Here's a complete example showing the full video generation workflow:
# Initialize client
api_key = "sk-1234" ,
base_url = "http://localhost:4000/v1"
# 1. Generate video
print ( "Generating video..." )
prompt = "A serene lake with mountains in the background" ,
size = "1280x720"
print ( f"Video generation started. ID: { video_id } " )
# 2. Poll for completion
print ( "Waiting for video to complete..." )
status = client . videos . retrieve ( video_id = video_id )
print ( f"Status: { status . status } " )
if status . status == "completed" :
print ( "Video generation completed!" )
elif status . status == "failed" :
print ( "Video generation failed!" )
time . sleep ( 10 )
# 3. Download video
print ( "Downloading video..." )
video_content = client . videos . download_content ( video_id = video_id )
with open ( f"video_ { video_id } .mp4" , "wb" ) as f :
f . write ( video_content . content )
print ( "Video saved successfully!" )
# 4. Optional: Remix the video
print ( "Creating a remix..." )
remix_response = client . videos . remix (
video_id = video_id ,
prompt = "Add gentle ripples to the lake surface"
print ( f"Remix started. ID: { remix_response . id } " )
Request/Response Format ​
info
LiteLLM follows the OpenAI Video Generation API specification .
See the official OpenAI Video Generation documentation for complete details.
Example Request ​
"model" : "openai/sora-2" ,
"prompt" : "A cat playing with a ball of yarn in a sunny garden" ,
"seconds" : "8" ,
"size" : "720x1280" ,
"user" : "user_123"
Request Parameters ​
Parameter Type Required Description model string Yes The video generation model to use (e.g., "openai/sora-2" ) prompt string Yes Text description of the desired video seconds string No Video duration in seconds (e.g., "8", "16") size string No Video dimensions (e.g., "720x1280", "1280x720") input_reference file object No Reference image for video generation or editing (both generation and remix) user string No User identifier for tracking video_id string Yes (status/retrieval) Video ID for status checking or retrieval Video Generation Request Example ​
For video generation:
"model" : "sora-2" ,
"size" : "720x1280"
For video generation with reference image:
"input_reference" : open ( "path/to/image.jpg" , "rb" ) , # File object
For video status check:
"video_id" : "video_1234567890" ,
"model" : "sora-2"
For video retrieval:
Response Format ​
The response follows OpenAI's video generation format with the following structure:
"id" : "video_6900378779308191a7359266e59b53fc01cd6bbd27a70763" ,
"object" : "video" ,
"status" : "queued" ,
"created_at" : 1761621895 ,
"completed_at" : null ,
"expires_at" : null ,
"error" : null ,
"progress" : 0 ,
"remixed_from_video_id" : null ,
"seconds" : "4" ,
"usage" : {
"duration_seconds" : 4.0
Response Fields ​ Field Type Description id string Unique identifier for the video object string Always "video" for video responses status string Video processing status ( "queued" , "processing" , "completed" ) created_at integer Unix timestamp when the video was created model string The model used for video generation size string Video dimensions seconds string Video duration in seconds usage object Token usage and duration information
Supported Providers ​
Provider Link to Usage OpenAI Usage Azure Usage Gemini Usage Vertex AI Usage RunwayML Usage
LiteLLM Python SDK Usage
Quick Start
Async Usage
Video Status Checking
List Videos
Video Generation with Reference Image
Video Remix (Video Editing)
Optional Parameters
Azure Video Generation
LiteLLM Proxy Usage
Character, Edit, and Extension Endpoints
Using OpenAI Client with LiteLLM Proxy
Video Generation
Download Video Content
Video Remix (Editing)
Complete Workflow Example
Request/Response Format
Example Request
Request Parameters
Response Format
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
