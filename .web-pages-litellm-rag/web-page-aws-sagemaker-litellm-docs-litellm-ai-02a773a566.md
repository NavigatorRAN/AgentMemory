# AWS Sagemaker | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/aws_sagemaker
- Final URL: https://docs.litellm.ai/docs/providers/aws_sagemaker
- Canonical URL: https://docs.litellm.ai/docs/providers/aws_sagemaker
- Fetched at: 2026-06-23T14:26:52Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports All Sagemaker Huggingface Jumpstart Models

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports All Sagemaker Huggingface Jumpstart Models
tip
We support ALL Sagemaker models, just set model=sagemaker/<any-model-on-sagemaker> as a prefix when sending litellm requests
API KEYS ​
os . environ [ "AWS_ACCESS_KEY_ID" ] = ""
os . environ [ "AWS_SECRET_ACCESS_KEY" ] = ""
os . environ [ "AWS_REGION_NAME" ] = ""
Usage ​
import os
from litellm import completion
response = completion (
model = "sagemaker/<your-endpoint-name>" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
temperature = 0.2 ,
max_tokens = 80
)
Usage - Streaming ​
Sagemaker currently does not support streaming - LiteLLM fakes streaming by returning chunks of the response string
model = "sagemaker/jumpstart-dft-meta-textgeneration-llama-2-7b" ,
max_tokens = 80 ,
stream = True ,
for chunk in response :
print ( chunk )
LiteLLM Proxy Usage ​
Here's how to call Sagemaker with the LiteLLM Proxy Server
1. Setup config.yaml ​
model_list :
- model_name : jumpstart - model
litellm_params :
model : sagemaker/jumpstart - dft - hf - textgeneration1 - mp - 20240815 - 185614
aws_access_key_id : os.environ/CUSTOM_AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/CUSTOM_AWS_SECRET_ACCESS_KEY
aws_region_name : os.environ/CUSTOM_AWS_REGION_NAME
All possible auth params:
aws_access_key_id: Optional[str],
aws_secret_access_key: Optional[str],
aws_session_token: Optional[str],
aws_region_name: Optional[str],
aws_session_name: Optional[str],
aws_profile_name: Optional[str],
aws_role_name: Optional[str],
aws_web_identity_token: Optional[str],
2. Start the proxy ​
litellm --config /path/to/config.yaml
3. Test it ​
Curl Request
OpenAI v1.0.0+
Langchain
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data ' {
"model": "jumpstart-model",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
]
'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create ( model = "jumpstart-model" , messages = [
"role" : "user" ,
"content" : "this is a test request, write a short poem"
] )
print ( response )
from langchain . chat_models import ChatOpenAI
from langchain . prompts . chat import (
ChatPromptTemplate ,
HumanMessagePromptTemplate ,
SystemMessagePromptTemplate ,
from langchain . schema import HumanMessage , SystemMessage
chat = ChatOpenAI (
openai_api_base = "http://0.0.0.0:4000" , # set openai_api_base to the LiteLLM Proxy
model = "jumpstart-model" ,
temperature = 0.1
messages = [
SystemMessage (
content = "You are a helpful assistant that im using to make a test request to."
) ,
HumanMessage (
content = "test from litellm. tell me why it's amazing in 1 sentence"
response = chat ( messages )
Set temperature, top p, etc. ​
SDK
PROXY
model = "sagemaker/jumpstart-dft-hf-textgeneration1-mp-20240815-185614" ,
temperature = 0.7 ,
top_p = 1
Set on yaml
temperature : <your - temp >
top_p : <your - top - p >
Set on request
# request sent to model set on litellm proxy, `litellm --model`
] ,
Allow setting temperature=0 for Sagemaker ​
By default when temperature=0 is sent in requests to LiteLLM, LiteLLM rounds up to temperature=0.1 since Sagemaker fails most requests when temperature=0
If you want to send temperature=0 for your model here's how to set it up (Since Sagemaker can host any kind of model, some models allow zero temperature)
temperature = 0 ,
aws_sagemaker_allow_zero_temp = True ,
Set aws_sagemaker_allow_zero_temp on yaml
aws_sagemaker_allow_zero_temp : true
Set temperature=0 on request
Pass provider-specific params ​
If you pass a non-openai param to litellm, we'll assume it's provider-specific and send it as a kwarg in the request body. See more
top_k = 1 # 👈 PROVIDER-SPECIFIC PARAM
top_k : 1 # 👈 PROVIDER-SPECIFIC PARAM
extra_body = {
Passing Inference Component Name ​
If you have multiple models on an endpoint, you'll need to specify the individual model names, do this via model_id .
model_id = "<your-model-name" ,
Passing credentials as parameters - Completion() ​
Pass AWS credentials as parameters to litellm.completion
aws_access_key_id = "" ,
aws_secret_access_key = "" ,
aws_region_name = "" ,
Applying Prompt Templates ​
To apply the correct prompt template for your sagemaker deployment, pass in it's hf model name as well.
messages = messages ,
hf_model_name = "meta-llama/Llama-2-7b" ,
You can also pass in your own custom prompt template
Sagemaker Messages API ​
Use route sagemaker_chat/* to route to Sagemaker Messages API
model: sagemaker_chat/<your-endpoint-name>
import litellm
litellm . set_verbose = True # 👈 SEE RAW REQUEST
model = "sagemaker_chat/<your-endpoint-name>" ,
- model_name : "sagemaker-model"
model : "sagemaker_chat/jumpstart-dft-hf-textgeneration1-mp-20240815-185614"
aws_access_key_id : os.environ/AWS_ACCESS_KEY_ID
aws_secret_access_key : os.environ/AWS_SECRET_ACCESS_KEY
aws_region_name : os.environ/AWS_REGION_NAME
"model": "sagemaker-model",
👉 See OpenAI SDK/Langchain/Llamaindex/etc. examples
Completion Models ​
Here's an example of using a sagemaker model with LiteLLM
Model Name Function Call Your Custom Huggingface Model completion(model='sagemaker/<your-deployment-name>', messages=messages) Meta Llama 2 7B completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-7b', messages=messages) Meta Llama 2 7B (Chat/Fine-tuned) completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-7b-f', messages=messages) Meta Llama 2 13B completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-13b', messages=messages) Meta Llama 2 13B (Chat/Fine-tuned) completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-13b-f', messages=messages) Meta Llama 2 70B completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-70b', messages=messages) Meta Llama 2 70B (Chat/Fine-tuned) completion(model='sagemaker/jumpstart-dft-meta-textgeneration-llama-2-70b-b-f', messages=messages)
Embedding Models ​
LiteLLM supports all Sagemaker Jumpstart Huggingface Embedding models. Here's how to call it:
response = litellm . embedding ( model = "sagemaker/<your-deployment-name>" , input = [ "good morning from litellm" , "this is another item" ] )
print ( f"response: { response } " )
Nova Models on SageMaker ​
LiteLLM supports Amazon Nova models (Nova Micro, Nova Lite, Nova 2 Lite) deployed on SageMaker Inference real-time endpoints. These custom/fine-tuned Nova models use an OpenAI-compatible API format.
Reference: AWS Blog - Amazon SageMaker Inference for Custom Amazon Nova Models
Use the sagemaker_nova/ prefix with your SageMaker endpoint name:
os . environ [ "AWS_REGION_NAME" ] = "us-east-1"
# Basic chat completion
response = litellm . completion (
model = "sagemaker_nova/my-nova-endpoint" ,
messages = [ { "role" : "user" , "content" : "Hello, how are you?" } ] ,
max_tokens = 512 ,
print ( response . choices [ 0 ] . message . content )
Streaming ​
messages = [ { "role" : "user" , "content" : "Write a short poem" } ] ,
stream_options = { "include_usage" : True } ,
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" )
Multimodal (Images) ​
Nova models on SageMaker support image inputs using base64 data URIs:
"content" : [
{ "type" : "text" , "text" : "What's in this image?" } ,
{ "type" : "image_url" , "image_url" : { "url" : "data:image/jpeg;base64,..." } }
Proxy Config ​
- model_name : nova - micro
model : sagemaker_nova/my - nova - micro - endpoint
aws_region_name : us - east - 1
Supported Parameters ​
All standard OpenAI parameters are supported, plus these Nova-specific parameters:
Parameter Type Description top_k integer Limits token selection to top K most likely tokens reasoning_effort "low" | "high" Reasoning effort level (Nova 2 Lite custom models only) allowed_token_ids array[int] Restrict output to specified token IDs truncate_prompt_tokens integer Truncate prompt to N tokens if it exceeds limit
messages = [ { "role" : "user" , "content" : "Think step by step: what is 2+2?" } ] ,
top_k = 40 ,
reasoning_effort = "low" ,
logprobs = True ,
top_logprobs = 2 ,
API KEYS
Usage
Usage - Streaming
LiteLLM Proxy Usage
1. Setup config.yaml
2. Start the proxy
3. Test it
Set temperature, top p, etc.
Allow setting temperature=0 for Sagemaker
Pass provider-specific params
Passing Inference Component Name
Passing credentials as parameters - Completion()
Applying Prompt Templates
Sagemaker Messages API
Completion Models
Embedding Models
Nova Models on SageMaker
Streaming
Multimodal (Images)
Proxy Config
Supported Parameters
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
