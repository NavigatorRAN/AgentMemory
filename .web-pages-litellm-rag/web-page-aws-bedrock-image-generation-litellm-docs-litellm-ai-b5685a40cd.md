# AWS Bedrock - Image Generation | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/bedrock_image_gen
- Final URL: https://docs.litellm.ai/docs/providers/bedrock_image_gen
- Canonical URL: https://docs.litellm.ai/docs/providers/bedrock_image_gen
- Fetched at: 2026-06-23T14:27:15Z
- Content type: text/html; charset=utf-8

## Description

Use Bedrock for image generation with Stable Diffusion, Amazon Titan Image Generator, and Amazon Nova Canvas models.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Use Bedrock for image generation with Stable Diffusion, Amazon Titan Image Generator, and Amazon Nova Canvas models.
Supported Models ​
Model Name Function Call Cost Tracking Stable Diffusion 3 - v0 image_generation(model="bedrock/stability.stability.sd3-large-v1:0", prompt=prompt) ✅ Stable Diffusion - v0 image_generation(model="bedrock/stability.stable-diffusion-xl-v0", prompt=prompt) ✅ Stable Diffusion - v1 image_generation(model="bedrock/stability.stable-diffusion-xl-v1", prompt=prompt) ✅ Amazon Titan Image Generator - v1 image_generation(model="bedrock/amazon.titan-image-generator-v1", prompt=prompt) ✅ Amazon Titan Image Generator - v2 image_generation(model="bedrock/amazon.titan-image-generator-v2:0", prompt=prompt) ✅ Amazon Nova Canvas - v1 image_generation(model="bedrock/amazon.nova-canvas-v1:0", prompt=prompt) ✅
Usage ​
SDK
PROXY
Basic Usage ​
import os
from litellm import image_generation
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = ""
response = image_generation (
prompt = "A cute baby sea otter" ,
model = "bedrock/stability.stable-diffusion-xl-v0" ,
)
print ( f"response: { response } " )
Set Optional Parameters ​
### OPENAI-COMPATIBLE ###
size = "128x512" , # width=128, height=512
### PROVIDER-SPECIFIC ### see `AmazonStabilityConfig` in bedrock.py for all params
seed = 30
1. Setup config.yaml ​
model_list :
- model_name : amazon.nova - canvas - v1 : 0
litellm_params :
model : bedrock/amazon.nova - canvas - v1 : 0
aws_region_name : "us-east-1"
aws_secret_access_key : my - key # OPTIONAL - all boto3 auth params supported
aws_secret_access_id : my - id # OPTIONAL - all boto3 auth params supported
2. Start proxy ​
litellm --config /path/to/config.yaml
3. Test it! ​
Text to Image:
curl -L -X POST 'http://0.0.0.0:4000/v1/images/generations' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer $LITELLM_VIRTUAL_KEY' \
-d '{
"model": "amazon.nova-canvas-v1:0",
"prompt": "A cute baby sea otter"
}'
Color Guided Generation:
"prompt": "A cute baby sea otter",
"taskType": "COLOR_GUIDED_GENERATION",
"colorGuidedGenerationParams":{"colors":["#FFFFFF"]}
Amazon Nova Canvas - Image Edit ​
Use OpenAI-compatible image_edit() with Bedrock Nova Canvas ( amazon.nova-canvas-v1:0 ). Requests use the same InvokeModel API as generation; LiteLLM maps inputs to Nova Canvas task types :
Scenario taskType sent to Bedrock Image + prompt (no mask) IMAGE_VARIATION Image + prompt + mask INPAINTING ( inPaintingParams.image , maskImage or maskPrompt ) taskType: OUTPAINTING + mask or maskPrompt OUTPAINTING (Bedrock requires one; LiteLLM raises a clear error if both are missing) taskType: BACKGROUND_REMOVAL BACKGROUND_REMOVAL
from litellm import image_edit
response = image_edit (
image = open ( "photo.png" , "rb" ) ,
prompt = "Add soft sunset lighting" ,
model = "bedrock/amazon.nova-canvas-v1:0" ,
For BACKGROUND_REMOVAL , the AWS request must not include imageGenerationConfig ; LiteLLM omits it for that task even if you pass size , n , seed , etc. Additional Nova Canvas inference IDs for image edit should set supports_nova_canvas_image_edit : true in model_prices_and_context_window.json (see amazon.nova-canvas-v1:0 ).
Using Inference Profiles with Image Generation ​
For AWS Bedrock Application Inference Profiles with image generation, use the model_id parameter to specify the inference profile ARN:
model_id = "arn:aws:bedrock:eu-west-1:000000000000:application-inference-profile/a0a0a0a0a0a0" ,
prompt = "A cute baby sea otter"
- model_name : nova - canvas - inference - profile
model_id : arn : aws : bedrock : eu - west - 1 : 000000000000 : application - inference - profile/a0a0a0a0a0a0
aws_region_name : "eu-west-1"
Authentication ​
All standard Bedrock authentication methods are supported for image generation. See Bedrock Authentication for details.
Supported Models
Usage
Basic Usage
Set Optional Parameters
1. Setup config.yaml
2. Start proxy
3. Test it!
Amazon Nova Canvas - Image Edit
Using Inference Profiles with Image Generation
Authentication
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
