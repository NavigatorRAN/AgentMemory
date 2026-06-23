# Gemini Video Generation (Veo) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/gemini/videos
- Final URL: https://docs.litellm.ai/docs/providers/gemini/videos
- Canonical URL: https://docs.litellm.ai/docs/providers/gemini/videos
- Fetched at: 2026-06-23T14:27:51Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports Google's Veo video generation models through a unified API interface.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports Google's Veo video generation models through a unified API interface.
Property Details Description Google's Veo AI video generation models Provider Route on LiteLLM gemini/ Supported Models Veo 3.0 / 3.1 preview and production IDs (see table below), including Veo 3.1 Lite Cost Tracking ✅ Duration-based pricing; optional per-resolution tiers where the catalog lists them (e.g. 720p vs 1080p) Logging Support ✅ Full request/response logging Proxy Server Support ✅ Full proxy integration with virtual keys Spend Management ✅ Budget tracking and rate limiting Link to Provider Doc Google Veo Documentation ↗
Quick Start ​
Required API Keys ​
import os
os . environ [ "GEMINI_API_KEY" ] = "your-google-api-key"
# OR
os . environ [ "GOOGLE_API_KEY" ] = "your-google-api-key"
Basic Usage ​
from litellm import video_generation , video_status , video_content
import time
# Step 1: Generate video
response = video_generation (
model = "gemini/veo-3.0-generate-preview" ,
prompt = "A cat playing with a ball of yarn in a sunny garden"
)
print ( f"Video ID: { response . id } " )
print ( f"Initial Status: { response . status } " ) # "processing"
# Step 2: Poll for completion
while True :
status_response = video_status (
video_id = response . id
print ( f"Current Status: { status_response . status } " )
if status_response . status == "completed" :
break
elif status_response . status == "failed" :
print ( "Video generation failed" )
time . sleep ( 10 ) # Wait 10 seconds before checking again
# Step 3: Download video content
video_bytes = video_content (
# Save to file
with open ( "generated_video.mp4" , "wb" ) as f :
f . write ( video_bytes )
print ( "Video downloaded successfully!" )
Supported Models ​
Model Name Description Max Duration Status veo-3.0-generate-preview Veo 3.0 video generation 8 seconds Preview veo-3.1-generate-preview Veo 3.1 video generation 8 seconds Preview veo-3.1-lite-generate-preview Veo 3.1 Lite (cost-efficient; Gemini pricing ) Per Google docs Preview veo-3.1-fast-generate-preview / …-001 Faster / prod variants Per Google docs Preview / GA veo-3.1-generate-001 Veo 3.1 production Per Google docs GA
Use the full LiteLLM model id with the gemini/ prefix (for example gemini/veo-3.1-lite-generate-preview ).
Video Generation Parameters ​
LiteLLM automatically maps OpenAI-style parameters to Veo's format:
OpenAI Parameter Veo Parameter Description Example prompt prompt Text description of the video "A cat playing" size aspectRatio and, when applicable, resolution Standard widths/heights map to landscape/portrait and to 720p or 1080p for the API See below seconds durationSeconds Duration in seconds "8" → 8 input_reference image Reference image to animate File object or path model model Model to use "gemini/veo-3.0-generate-preview"
size and output resolution ​
When you pass a standard size string, LiteLLM sets both:
Aspect ratio ( 16:9 or 9:16 ) — same as before.
Output resolution ( 720p or 1080p ) when the height is clear from the preset, so the correct Veo tier is requested without extra fields.
size Aspect ratio Resolution sent to Veo 1280x720 , 720x1280 16:9 / 9:16 720p 1920x1080 , 1080x1920 16:9 / 9:16 1080p
Other size values still map to an aspect ratio (defaulting to 16:9 when unknown); resolution is left to Google’s default unless you set it yourself.
You can also pass Veo’s resolution (for example via extra_body ) if you need an explicit value that does not match the presets above. If you set resolution yourself, it takes precedence over the value inferred from size .
Size to aspect ratio (reference) ​
"1280x720" , "1920x1080" → "16:9" (landscape)
"720x1280" , "1080x1920" → "9:16" (portrait)
Supported Veo Parameters ​
Based on Veo's API:
prompt (required): Text description with optional audio cues
aspectRatio : "16:9" (default) or "9:16"
resolution : "720p" (default) or "1080p" (Veo 3.1 only, 16:9 aspect ratio only)
durationSeconds : Video length (max 8 seconds for most models)
image : Reference image for animation
negativePrompt : What to exclude from the video (Veo 3.1)
referenceImages : Style and content references (Veo 3.1 only)
Complete Workflow Example ​
import litellm
def generate_and_download_veo_video (
prompt : str ,
output_file : str = "video.mp4" ,
size : str = "1280x720" ,
seconds : str = "8"
) :
"""
Complete workflow for Veo video generation.
Args:
prompt: Text description of the video
output_file: Where to save the video
size: Video dimensions (e.g., "1280x720" for 16:9)
seconds: Duration in seconds
Returns:
bool: True if successful
print ( f"🎬 Generating video: { prompt } " )
# Step 1: Initiate generation
response = litellm . video_generation (
prompt = prompt ,
size = size , # Maps to aspectRatio
seconds = seconds # Maps to durationSeconds
print ( f"✓ Video generation started (ID: { video_id } )" )
# Step 2: Wait for completion
max_wait_time = 600 # 10 minutes
start_time = time . time ( )
while time . time ( ) - start_time < max_wait_time :
status_response = litellm . video_status ( video_id = video_id )
print ( "✓ Video generation completed!" )
print ( "✗ Video generation failed" )
return False
print ( f"⏳ Status: { status_response . status } " )
time . sleep ( 10 )
else :
print ( "✗ Timeout waiting for video generation" )
# Step 3: Download video
print ( "⬇️ Downloading video..." )
video_bytes = litellm . video_content ( video_id = video_id )
with open ( output_file , "wb" ) as f :
print ( f"✓ Video saved to { output_file } " )
return True
# Use it
generate_and_download_veo_video (
prompt = "A serene lake at sunset with mountains in the background" ,
output_file = "sunset_lake.mp4"
Async Usage ​
from litellm import avideo_generation , avideo_status , avideo_content
import asyncio
async def async_video_workflow ( ) :
# Generate video
response = await avideo_generation (
prompt = "A cat playing with a ball of yarn"
# Poll for completion
status = await avideo_status ( video_id = response . id )
if status . status == "completed" :
await asyncio . sleep ( 10 )
# Download content
video_bytes = await avideo_content ( video_id = response . id )
with open ( "video.mp4" , "wb" ) as f :
# Run it
asyncio . run ( async_video_workflow ( ) )
LiteLLM Proxy Usage ​
Configuration ​
Add Veo models to your config.yaml :
model_list :
- model_name : veo - 3
litellm_params :
model : gemini/veo - 3.0 - generate - preview
api_key : os.environ/GEMINI_API_KEY
Start the proxy:
litellm --config config.yaml
# Server running on http://0.0.0.0:4000
Making Requests ​
Curl
Python SDK
curl --location 'http://0.0.0.0:4000/v1/videos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "veo-3",
"prompt": "A cat playing with a ball of yarn in a sunny garden"
}'
# Response: {"id": "gemini::operations/generate_12345::...", "status": "processing", ...}
# Step 2: Check status
curl --location 'http://localhost:4000/v1/videos/{video_id}' \
--header 'x-litellm-api-key: sk-1234'
# Step 3: Download video (when status is "completed")
curl --location 'http://localhost:4000/v1/videos/{video_id}/content' \
--header 'x-litellm-api-key: sk-1234' \
--output video.mp4
litellm . api_base = "http://0.0.0.0:4000"
litellm . api_key = "sk-1234"
model = "veo-3" ,
# Check status
status = litellm . video_status ( video_id = response . id )
# Download video
video_bytes = litellm . video_content ( video_id = response . id )
Cost tracking and spend ​
LiteLLM estimates video spend from:
How long the generated clip is billed for (seconds), and
The per-second price for that model in LiteLLM’s model catalog (aligned with Google’s Gemini API video pricing where applicable).
Some models charge different per-second rates for 720p vs 1080p . When you use the standard size presets above (or set resolution explicitly), LiteLLM uses the matching tier so proxy spend, logs, and budgets line up with the resolution you requested.
LiteLLM automatically tracks costs for Veo video generation:
prompt = "A beautiful sunset"
# Cost is calculated based on video duration
# Veo pricing: ~$0.10 per second (estimated)
# Default video duration: ~5 seconds
# Estimated cost: ~$0.50
Differences from OpenAI Video API ​
Feature OpenAI (Sora) Gemini (Veo) Reference Images ✅ Supported ❌ Not supported Size / dimensions ✅ Supported ✅ Supported via size → aspect ratio + 720p / 1080p where preset Duration ( seconds ) ✅ Supported ✅ Supported (maps to durationSeconds ; limits per Google docs) Video Remix/Edit ✅ Supported ❌ Not supported Video List ✅ Supported ❌ Not supported Prompt-based Generation ✅ Supported ✅ Supported Async Operations ✅ Supported ✅ Supported
Error Handling ​
from litellm . exceptions import APIError , Timeout
try :
prompt = "A beautiful landscape"
# Poll with timeout
max_attempts = 60 # 10 minutes (60 * 10s)
for attempt in range ( max_attempts ) :
status = video_status ( video_id = response . id )
video_bytes = video_content ( video_id = response . id )
elif status . status == "failed" :
raise APIError ( "Video generation failed" )
raise Timeout ( "Video generation timed out" )
except APIError as e :
print ( f"API Error: { e } " )
except Timeout as e :
print ( f"Timeout: { e } " )
except Exception as e :
print ( f"Unexpected error: { e } " )
Best Practices ​
Always poll for completion : Veo video generation is asynchronous and can take several minutes
Set reasonable timeouts : Allow at least 5-10 minutes for video generation
Handle failures gracefully : Check for failed status and implement retry logic
Use descriptive prompts : More detailed prompts generally produce better results
Store video IDs : Save the operation ID/video ID to resume polling if your application restarts
Troubleshooting ​
Video generation times out ​
# Increase polling timeout
max_wait_time = 900 # 15 minutes instead of 10
Video not found when downloading ​
# Make sure video is completed before downloading
status = video_status ( video_id = video_id )
if status . status != "completed" :
print ( "Video not ready yet!" )
API key errors ​
# Verify your API key is set
print ( os . environ . get ( "GEMINI_API_KEY" ) )
# Or pass it explicitly
prompt = "..." ,
api_key = "your-api-key-here"
See Also ​
OpenAI Video Generation
Azure Video Generation
Vertex AI Video Generation
Video Generation API Reference
Veo Pass-through Endpoints
Quick Start
Required API Keys
Basic Usage
Supported Models
Video Generation Parameters
size and output resolution
Size to aspect ratio (reference)
Supported Veo Parameters
Complete Workflow Example
Async Usage
LiteLLM Proxy Usage
Configuration
Making Requests
Cost tracking and spend
Differences from OpenAI Video API
Error Handling
Best Practices
Troubleshooting
Video generation times out
Video not found when downloading
API key errors
See Also
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
