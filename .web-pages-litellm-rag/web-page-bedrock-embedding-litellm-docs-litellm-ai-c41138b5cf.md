# Bedrock Embedding | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_embedding
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_embedding
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_embedding
- Fetched at: 2026-06-23T14:27:13Z
- Content type: text/html; charset=utf-8

## Description

Supported Embedding Models

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Supported Embedding Models ​
Provider LiteLLM Route AWS Documentation Cost Tracking Amazon Titan bedrock/amazon.titan-* Amazon Titan Embeddings ✅ Amazon Nova bedrock/amazon.nova-* Amazon Nova Embeddings ✅ Cohere bedrock/cohere.* Cohere Embeddings ✅ TwelveLabs bedrock/us.twelvelabs.* TwelveLabs ✅
Async Invoke Support ​
LiteLLM supports AWS Bedrock's async-invoke feature for embedding models that require asynchronous processing, particularly useful for large media files (video, audio) or when you need to process embeddings in the background.
Supported Models ​
Provider Async Invoke Route Use Case Amazon Nova bedrock/async_invoke/amazon.nova-2-multimodal-embeddings-v1:0 Multimodal embeddings with segmentation for long text, video, and audio TwelveLabs Marengo bedrock/async_invoke/us.twelvelabs.marengo-embed-2-7-v1:0 Video, audio, image, and text embeddings
Required Parameters ​
When using async-invoke, you must provide:
Parameter Description Required output_s3_uri S3 URI where the embedding results will be stored ✅ Yes input_type Type of input: "text" , "image" , "video" , or "audio" ✅ Yes aws_region_name AWS region for the request ✅ Yes
Usage ​
Basic Async Invoke ​
from litellm import embedding
# Text embedding with async-invoke
response = embedding (
model = "bedrock/async_invoke/us.twelvelabs.marengo-embed-2-7-v1:0" ,
input = [ "Hello world from LiteLLM async invoke!" ] ,
aws_region_name = "us-east-1" ,
input_type = "text" ,
output_s3_uri = "s3://your-bucket/async-invoke-output/"
)
print ( f"Job submitted! Invocation ARN: { response . _hidden_params . _invocation_arn } " )
Video/Audio Embedding ​
# Video embedding (requires async-invoke)
input = [ "s3://your-bucket/video.mp4" ] , # S3 URL for video
input_type = "video" ,
print ( f"Video embedding job submitted! ARN: { response . _hidden_params . _invocation_arn } " )
Image Embedding with Base64 ​
import base64
# Load and encode image
with open ( "image.jpg" , "rb" ) as img_file :
img_data = base64 . b64encode ( img_file . read ( ) ) . decode ( 'utf-8' )
img_base64 = f"data:image/jpeg;base64, { img_data } "
input = [ img_base64 ] ,
input_type = "image" ,
Retrieving Job Information ​
Getting Job ID and Invocation ARN ​
The async-invoke response includes the invocation ARN in the hidden parameters:
input = [ "Hello world" ] ,
# Access invocation ARN
invocation_arn = response . _hidden_params . _invocation_arn
print ( f"Invocation ARN: { invocation_arn } " )
# Extract job ID from ARN (last part after the last slash)
job_id = invocation_arn . split ( "/" ) [ - 1 ]
print ( f"Job ID: { job_id } " )
Checking Job Status ​
Use LiteLLM's retrieve_batch function to check if your job is still processing:
from litellm import retrieve_batch
def check_async_job_status ( invocation_arn , aws_region_name = "us-east-1" ) :
"""Check the status of an async invoke job using LiteLLM batch API"""
try :
response = retrieve_batch (
batch_id = invocation_arn , # Pass the invocation ARN here
custom_llm_provider = "bedrock" ,
aws_region_name = aws_region_name
return response
except Exception as e :
print ( f"Error checking job status: { e } " )
return None
# Check status
status = check_async_job_status ( invocation_arn , "us-east-1" )
if status :
print ( f"Job Status: { status . status } " ) # "in_progress", "completed", or "failed"
print ( f"Output Location: { status . metadata [ 'output_file_id' ] } " ) # S3 URI where results are stored
Polling Until Complete ​
Here's a complete example of polling for job completion:
def wait_for_async_job ( invocation_arn , aws_region_name = "us-east-1" , max_wait = 3600 ) :
"""Poll job status until completion"""
start_time = time . time ( )
while True :
status = retrieve_batch (
batch_id = invocation_arn ,
aws_region_name = aws_region_name ,
if status . status == "completed" :
print ( "✅ Job completed!" )
return status
elif status . status == "failed" :
error_msg = status . metadata . get ( 'failure_message' , 'Unknown error' )
raise Exception ( f"❌ Job failed: { error_msg } " )
else :
elapsed = time . time ( ) - start_time
if elapsed > max_wait :
raise TimeoutError ( f"Job timed out after { max_wait } seconds" )
print ( f"⏳ Job still processing... (elapsed: { elapsed : .0f } s)" )
time . sleep ( 10 ) # Wait 10 seconds before checking again
# Wait for completion
completed_status = wait_for_async_job ( invocation_arn )
output_s3_uri = completed_status . metadata [ 'output_file_id' ]
print ( f"Results available at: { output_s3_uri } " )
Note: The actual embedding results are stored in S3. When the job is completed, download the results from the S3 location specified in status.metadata['output_file_id'] . The results will be in JSON/JSONL format containing the embedding vectors.
Amazon Nova Multimodal Embeddings ​
Amazon Nova supports multimodal embeddings for text, images, video, and audio. It offers flexible embedding dimensions and purposes optimized for different use cases.
Supported Features ​
Modalities : Text, Image, Video, Audio
Dimensions : 256, 384, 1024, 3072 (default: 3072)
Embedding Purposes :
GENERIC_INDEX (default)
GENERIC_RETRIEVAL
TEXT_RETRIEVAL
IMAGE_RETRIEVAL
VIDEO_RETRIEVAL
AUDIO_RETRIEVAL
CLASSIFICATION
CLUSTERING
Text Embedding ​
model = "bedrock/amazon.nova-2-multimodal-embeddings-v1:0" ,
input = [ "Hello, world!" ] ,
dimensions = 1024 , # Optional: 256, 384, 1024, or 3072
print ( response . data [ 0 ] . embedding )
Amazon Nova accepts images in base64 format using the standard data URL format:
# Method 1: Load image from file
with open ( "image.jpg" , "rb" ) as image_file :
image_data = base64 . b64encode ( image_file . read ( ) ) . decode ( 'utf-8' )
# Create data URL with proper format
image_base64 = f"data:image/jpeg;base64, { image_data } "
input = [ image_base64 ] ,
dimensions = 1024 ,
print ( f"Image embedding: { response . data [ 0 ] . embedding [ : 10] } ..." ) # First 10 dimensions
Supported Image Formats ​
Nova supports the following image formats:
JPEG: data:image/jpeg;base64,...
PNG: data:image/png;base64,...
GIF: data:image/gif;base64,...
WebP: data:image/webp;base64,...
Complete Example with Error Handling ​
def get_image_embedding ( image_path , dimensions = 1024 ) :
"""
Get embedding for an image file.
Args:
image_path: Path to the image file
dimensions: Embedding dimension (256, 384, 1024, or 3072)
Returns:
List of embedding values
# Determine image format from file extension
if image_path . lower ( ) . endswith ( '.png' ) :
mime_type = "image/png"
elif image_path . lower ( ) . endswith ( ( '.jpg' , '.jpeg' ) ) :
mime_type = "image/jpeg"
elif image_path . lower ( ) . endswith ( '.gif' ) :
mime_type = "image/gif"
elif image_path . lower ( ) . endswith ( '.webp' ) :
mime_type = "image/webp"
raise ValueError ( f"Unsupported image format: { image_path } " )
# Read and encode image
with open ( image_path , "rb" ) as image_file :
image_base64 = f"data: { mime_type } ;base64, { image_data } "
# Get embedding
dimensions = dimensions ,
return response . data [ 0 ] . embedding
print ( f"Error getting image embedding: { e } " )
raise
# Example usage
image_embedding = get_image_embedding ( "photo.jpg" , dimensions = 1024 )
print ( f"Got embedding with { len ( image_embedding ) } dimensions" )
Error Handling ​
Common Errors ​ Error Cause Solution ValueError: output_s3_uri cannot be empty Missing S3 output URI Provide a valid S3 URI ValueError: Input type 'video' requires async_invoke route Using video/audio without async-invoke Use bedrock/async_invoke/ model prefix ValueError: input_type is required Missing input type parameter Specify input_type parameter Example Error Handling ​
output_s3_uri = "s3://your-bucket/output/" # Required for async-invoke
print ( "Job submitted successfully!" )
except ValueError as e :
if "output_s3_uri cannot be empty" in str ( e ) :
print ( "Error: Please provide a valid S3 output URI" )
elif "requires async_invoke route" in str ( e ) :
print ( "Error: Use async_invoke model for video/audio inputs" )
print ( f"Error: { e } " )
print ( f"Unexpected error: { e } " )
Best Practices ​
Use async-invoke for large files : Video and audio files are better processed asynchronously
Use LiteLLM batch API : Use retrieve_batch() instead of direct Bedrock API calls for status checking
Monitor job status : Check job status periodically using the batch API to know when results are ready
Handle errors gracefully : Implement proper error handling for network issues and job failures
Set appropriate timeouts : Consider the processing time for large files
Use S3 for large inputs : For video/audio, use S3 URLs instead of base64 encoding
Limitations ​
Async-invoke is supported for TwelveLabs Marengo and Amazon Nova models
Results are stored in S3 and must be retrieved separately using the output file ID
Job status checking requires using LiteLLM's retrieve_batch() function
No built-in polling mechanism in LiteLLM (must implement your own status checking loop)
API keys ​
This can be set as env variables or passed as params to litellm.embedding()
import os
os . environ [ "AWS_ACCESS_KEY_ID" ] = "" # Access key
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = "" # Secret access key
os . environ [ "AWS_REGION_NAME" ] = "" # us-east-1, us-east-2, us-west-1, us-west-2
LiteLLM Python SDK ​
model = "bedrock/amazon.titan-embed-text-v1" ,
input = [ "good morning from litellm" ] ,
print ( response )
LiteLLM Proxy Server ​
1. Setup config.yaml ​
model_list :
- model_name : titan - embed - v1
litellm_params :
model : bedrock/amazon.titan - embed - text - v1
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : us - east - 1
- model_name : titan - embed - v2
model : bedrock/amazon.titan - embed - text - v2 : 0
2. Start Proxy ​
litellm --config /path/to/config.yaml
3. Use with OpenAI Python SDK ​
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . embeddings . create (
model = "titan-embed-v1"
4. Use with LiteLLM Python SDK ​
import litellm
response = litellm . embedding (
model = "titan-embed-v1" , # model alias from config.yaml
api_base = "http://0.0.0.0:4000" ,
api_key = "anything"
Supported AWS Bedrock Embedding Models ​
Model Name Usage Supported Additional OpenAI params Amazon Nova Multimodal Embeddings embedding(model="bedrock/amazon.nova-2-multimodal-embeddings-v1:0", input=input) Supports multimodal input (text, image, video, audio), multiple purposes, dimensions (256, 384, 1024, 3072) Titan Embeddings V2 embedding(model="bedrock/amazon.titan-embed-text-v2:0", input=input) here Titan Embeddings - V1 embedding(model="bedrock/amazon.titan-embed-text-v1", input=input) here Titan Multimodal Embeddings embedding(model="bedrock/amazon.titan-embed-image-v1", input=input) here TwelveLabs Marengo Embed 2.7 embedding(model="bedrock/us.twelvelabs.marengo-embed-2-7-v1:0", input=input) Supports multimodal input (text, video, audio, image) Cohere Embeddings - English embedding(model="bedrock/cohere.embed-english-v3", input=input) here Cohere Embeddings - Multilingual embedding(model="bedrock/cohere.embed-multilingual-v3", input=input) here Cohere Embed v4 embedding(model="bedrock/cohere.embed-v4:0", input=input) Supports text and image input, configurable dimensions (256, 512, 1024, 1536), 128k context length
Advanced - Drop Unsupported Params ​
Advanced - Pass model/provider-specific Params ​
Supported Embedding Models
Async Invoke Support
Supported Models
Required Parameters
Usage
Retrieving Job Information
Amazon Nova Multimodal Embeddings
Supported Features
Text Embedding
Image Embedding with Base64
Error Handling
Best Practices
Limitations
API keys
LiteLLM Python SDK
LiteLLM Proxy Server
Supported AWS Bedrock Embedding Models
Advanced - Drop Unsupported Params
Advanced - Pass model/provider-specific Params
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
