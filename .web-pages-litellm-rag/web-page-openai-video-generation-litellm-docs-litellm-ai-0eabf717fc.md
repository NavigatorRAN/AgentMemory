# OpenAI Video Generation | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/openai/videos
- Final URL: https://docs.litellm.ai/docs/providers/openai/videos
- Canonical URL: https://docs.litellm.ai/docs/providers/openai/videos
- Fetched at: 2026-06-23T14:28:37Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports OpenAI's video generation models including Sora.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports OpenAI's video generation models including Sora.
Quick Start ​
Required API Keys ​
import os
os . environ [ "OPENAI_API_KEY" ] = "your-api-key"
Basic Usage ​
from litellm import video_generation , video_content
# Generate a video
response = video_generation (
prompt = "A cat playing with a ball of yarn in a sunny garden" ,
model = "sora-2" ,
seconds = "8" ,
size = "720x1280"
)
print ( f"Video ID: { response . id } " )
print ( f"Status: { response . status } " )
# Download video content when ready
video_bytes = video_content (
video_id = response . id ,
# Save to file
with open ( "generated_video.mp4" , "wb" ) as f :
f . write ( video_bytes )
LiteLLM Proxy Usage ​
LiteLLM provides OpenAI API compatible video endpoints for complete video generation workflow:
/videos/generations - Generate new videos
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
# Using custom-llm-provider header
curl --location 'http://localhost:4000/v1/videos/video_id' \
--header 'Accept: application/json' \
--header 'custom-llm-provider: openai'
Test video retrieval request
curl --location 'http://localhost:4000/v1/videos/video_id/content' \
--header 'custom-llm-provider: openai' \
--output video.mp4
# Or using query parameter
curl --location 'http://localhost:4000/v1/videos/video_id/content?custom_llm_provider=openai' \
Test video remix request
# Using custom_llm_provider in request body
curl --location --request POST 'http://localhost:4000/v1/videos/video_id/remix' \
"prompt": "New remix instructions",
"custom_llm_provider": "openai"
# Or using custom-llm-provider header
"prompt": "New remix instructions"
Character, Edit, and Extension Routes ​
OpenAI video routes supported by LiteLLM proxy:
POST /v1/videos/characters
GET /v1/videos/characters/{character_id}
POST /v1/videos/edits
POST /v1/videos/extensions
target_model_names support on character creation ​
POST /v1/videos/characters supports target_model_names for model-based routing (same behavior as video create).
curl --location 'http://localhost:4000/v1/videos/characters' \
--header 'Authorization: Bearer sk-1234' \
-F 'name=hero' \
-F 'target_model_names=gpt-4' \
-F 'video=@/path/to/character.mp4'
When target_model_names is used, LiteLLM returns an encoded character ID:
{
"id" : "character_..." ,
"object" : "character" ,
"created_at" : 1712697600 ,
"name" : "hero"
}
Use that encoded ID directly on get:
curl --location 'http://localhost:4000/v1/videos/characters/character_...' \
--header 'Authorization: Bearer sk-1234'
Encoded and non-encoded video IDs for edit/extension ​
Both routes accept either plain or encoded video.id :
curl --location 'http://localhost:4000/v1/videos/edits' \
"prompt": "Make this brighter",
"video": { "id": "video_..." }
curl --location 'http://localhost:4000/v1/videos/extensions' \
"prompt": "Continue this scene",
"seconds": "4",
custom_llm_provider input sources ​
For these routes, custom_llm_provider may be supplied via:
header: custom-llm-provider
query: ?custom_llm_provider=...
body: custom_llm_provider (and extra_body.custom_llm_provider where supported)
Test OpenAI video generation request
curl http://localhost:4000/v1/videos \
-H "Authorization: Bearer sk-1234" \
-H "Content-Type: application/json" \
-d '{
"prompt": "A cat playing with a ball of yarn in a sunny garden",
"seconds": "8",
"size": "720x1280"
Supported Models ​
Model Name Description Max Duration Supported Sizes sora-2 OpenAI's latest video generation model 8 seconds 720x1280, 1280x720
Video Generation Parameters ​
prompt (required): Text description of the desired video
model (optional): Model to use, defaults to "sora-2"
seconds (optional): Video duration in seconds (e.g., "8", "16")
size (optional): Video dimensions (e.g., "720x1280", "1280x720")
input_reference (optional): Reference image for video editing
user (optional): User identifier for tracking
Video Content Retrieval ​
# Download video content
video_id = "video_1234567890"
with open ( "video.mp4" , "wb" ) as f :
Complete Workflow ​
import litellm
import time
def generate_and_download_video ( prompt ) :
# Step 1: Generate video
response = litellm . video_generation (
prompt = prompt ,
video_id = response . id
print ( f"Video ID: { video_id } " )
# Step 2: Wait for processing (in practice, poll status)
time . sleep ( 30 )
# Step 3: Download video
video_bytes = litellm . video_content (
video_id = video_id
# Step 4: Save to file
with open ( f"video_ { video_id } .mp4" , "wb" ) as f :
return f"video_ { video_id } .mp4"
# Usage
video_file = generate_and_download_video (
"A cat playing with a ball of yarn in a sunny garden"
Video Editing with Reference Images ​
# Video editing with reference image
prompt = "Make the cat jump higher" ,
input_reference = open ( "path/to/image.jpg" , "rb" ) , # Reference image
seconds = "8"
Error Handling ​
from litellm . exceptions import BadRequestError , AuthenticationError
try :
prompt = "A cat playing with a ball of yarn"
except AuthenticationError as e :
print ( f"Authentication failed: { e } " )
except BadRequestError as e :
print ( f"Bad request: { e } " )
Quick Start
Required API Keys
Basic Usage
LiteLLM Proxy Usage
Character, Edit, and Extension Routes
Supported Models
Video Generation Parameters
Video Content Retrieval
Complete Workflow
Video Editing with Reference Images
Error Handling
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
