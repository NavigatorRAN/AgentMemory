# VertexAI [Gemini] | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/vertex
- Final URL: https://docs.litellm.ai/docs/providers/vertex
- Canonical URL: https://docs.litellm.ai/docs/providers/vertex
- Fetched at: 2026-06-23T14:29:10Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Property Details Description Vertex AI is a fully-managed AI development platform for building and using generative AI. Provider Route on LiteLLM vertex_ai/ Link to Provider Doc Vertex AI ↗ Base URL 1. Regional endpoints
https://{vertex_location}-aiplatform.googleapis.com/
2. Global endpoints (limited availability)
https://aiplatform.googleapis.com/ Supported Operations /chat/completions , /completions , /embeddings , /audio/speech , /fine_tuning , /batches , /files , /images , /rerank
Vertex AI vs Gemini API
Model Format Provider Auth Required vertex_ai/gemini-2.0-flash Vertex AI GCP credentials + project gemini-2.0-flash (no prefix) Vertex AI GCP credentials + project gemini/gemini-2.0-flash Gemini API GEMINI_API_KEY (simple API key)
If you just want to use an API key (like OpenAI), use the gemini/ prefix instead. See Gemini - Google AI Studio .
Models without a prefix default to Vertex AI which requires GCP authentication.
vertex_ai/ route ​
The vertex_ai/ route uses uses VertexAI's REST API .
from litellm import completion
import json
## GET CREDENTIALS
## RUN ##
# !gcloud auth application-default login - run this to add vertex credentials to your env
## OR ##
file_path = 'path/to/vertex_ai_service_account.json'
# Load the JSON file
with open ( file_path , 'r' ) as file :
vertex_credentials = json . load ( file )
# Convert to JSON string
vertex_credentials_json = json . dumps ( vertex_credentials )
## COMPLETION CALL
response = completion (
model = "vertex_ai/gemini-2.5-pro" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
vertex_credentials = vertex_credentials_json
)
System Message ​
messages = [ { "content" : "You are a good bot." , "role" : "system" } , { "content" : "Hello, how are you?" , "role" : "user" } ] ,
Function Calling ​
Force Gemini to make tool calls with tool_choice="required" .
messages = [
{
"role" : "system" ,
"content" : "Your name is Litellm Bot, you are a helpful assistant" ,
} ,
# User asks for their name and weather in San Francisco
"role" : "user" ,
"content" : "Hello, what is your name and can you tell me the weather?" ,
]
tools = [
"type" : "function" ,
"function" : {
"name" : "get_weather" ,
"description" : "Get the current weather in a given location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state, e.g. San Francisco, CA" ,
}
"required" : [ "location" ] ,
data = {
"model" : "vertex_ai/gemini-1.5-pro-preview-0514" ) ,
"messages" : messages ,
"tools" : tools ,
"tool_choice" : "required" ,
"vertex_credentials" : vertex_credentials_json
print ( completion ( ** data ) )
JSON Schema ​
From v 1.40.1+ LiteLLM supports sending response_schema as a param for Gemini-1.5-Pro on Vertex AI. For other models (e.g. gemini-1.5-flash or claude-3-5-sonnet ), LiteLLM adds the schema to the message list with a user-controlled prompt.
Response Schema
SDK
PROXY
## SETUP ENVIRONMENT
"content" : "List 5 popular cookie recipes."
response_schema = {
"type" : "array" ,
"items" : {
"recipe_name" : {
"required" : [ "recipe_name" ] ,
completion (
model = "vertex_ai/gemini-1.5-pro" ,
messages = messages ,
response_format = { "type" : "json_object" , "response_schema" : response_schema } # 👈 KEY CHANGE
print ( json . loads ( completion . choices [ 0 ] . message . content ) )
Add model to config.yaml
model_list :
- model_name : gemini - 2.5 - pro
litellm_params :
model : vertex_ai/gemini - 2.5 - pro
vertex_project : "project-id"
vertex_location : "us-central1"
vertex_credentials : "/path/to/service_account.json" # [OPTIONAL] Do this OR `!gcloud auth application-default login` - run this to add vertex credentials to your env
or
- model_name : gemini - pro
model : vertex_ai/gemini - 1.5 - pro
litellm_credential_name : vertex - global
vertex_project : project - name - here
vertex_location : global
base_model : gemini
model_info :
provider : Vertex
Start Proxy
$ litellm --config /path/to/config.yaml
Make Request!
curl -X POST 'http://0.0.0.0:4000/chat/completions' \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer sk-1234' \
-D '{
"model": "gemini-2.5-pro",
"messages": [
{"role": "user", "content": "List 5 popular cookie recipes."}
],
"response_format": {"type": "json_object", "response_schema": {
"type": "array",
"items": {
"type": "object",
"properties": {
"recipe_name": {
"type": "string",
},
"required": ["recipe_name"],
}}
'
Validate Schema
To validate the response_schema, set enforce_validation: true .
from litellm import completion , JSONSchemaValidationError
try :
response_format = {
"type" : "json_object" ,
"response_schema" : response_schema ,
"enforce_validation" : true # 👈 KEY CHANGE
except JSONSchemaValidationError as e :
print ( "Raw Response: {}" . format ( e . raw_response ) )
raise e
"enforce_validation": true
LiteLLM will validate the response against the schema, and raise a JSONSchemaValidationError if the response does not match the schema.
JSONSchemaValidationError inherits from openai.APIError
Access the raw response with e.raw_response
Add to prompt yourself
"content" : """
List 5 popular cookie recipes.
Using this JSON schema:
Recipe = {"recipe_name": str}
Return a `list[Recipe]`
"""
completion ( model = "vertex_ai/gemini-1.5-flash-preview-0514" , messages = messages , response_format = { "type" : "json_object" } )
Google Hosted Tools (Web Search, Code Execution, etc.) ​
Web Search ​
Add Google Search Result grounding to vertex ai calls.
Relevant VertexAI Docs
See the grounding metadata with response_obj._hidden_params["vertex_ai_grounding_metadata"]
tools = [ { "googleSearch" : { } } ] # 👈 ADD GOOGLE SEARCH
resp = litellm . completion (
model = "vertex_ai/gemini-1.0-pro-001" ,
messages = [ { "role" : "user" , "content" : "Who won the world cup?" } ] ,
tools = tools ,
print ( resp )
OpenAI Python SDK
cURL
from openai import OpenAI
client = OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000/v1/" # point to litellm proxy
response = client . chat . completions . create (
model = "gemini-2.5-pro" ,
tools = [ { "googleSearch" : { } } ] ,
print ( response )
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
{"role": "user", "content": "Who won the world cup?"}
"tools": [
"googleSearch": {}
}'
Url Context ​
Using the URL context tool, you can provide Gemini with URLs as additional context for your prompt. The model can then retrieve content from the URLs and use that content to inform and shape its response.
Relevant Docs
See the grounding metadata with response_obj._hidden_params["vertex_ai_url_context_metadata"]
import os
os . environ [ "GEMINI_API_KEY" ] = ".."
# 👇 ADD URL CONTEXT
tools = [ { "urlContext" : { } } ]
model = "gemini/gemini-2.0-flash" ,
messages = [ { "role" : "user" , "content" : "Summarize this document: https://ai.google.dev/gemini-api/docs/models" } ] ,
# Access URL context metadata
url_context_metadata = response . model_extra [ 'vertex_ai_url_context_metadata' ]
urlMetadata = url_context_metadata [ 0 ] [ 'urlMetadata' ] [ 0 ]
print ( f"Retrieved URL: { urlMetadata [ 'retrievedUrl' ] } " )
print ( f"Retrieval Status: { urlMetadata [ 'urlRetrievalStatus' ] } " )
Setup config.yaml
- model_name : gemini - 2.0 - flash
model : gemini/gemini - 2.0 - flash
api_key : os.environ/GEMINI_API_KEY
-H "Authorization: Bearer <YOUR-LITELLM-KEY>" \
"model": "gemini-2.0-flash",
"messages": [{"role": "user", "content": "Summarize this document: https://ai.google.dev/gemini-api/docs/models"}],
"tools": [{"urlContext": {}}]
Enterprise Web Search ​
You can also use the enterpriseWebSearch tool for an enterprise compliant search .
tools = [ { "enterpriseWebSearch" : { } } ] # 👈 ADD GOOGLE ENTERPRISE SEARCH
tools = [ { "enterpriseWebSearch" : { } } ] ,
"enterpriseWebSearch": {}
Code Execution ​
tools = [ { "codeExecution" : { } } ] # 👈 ADD CODE EXECUTION
model = "vertex_ai/gemini-2.0-flash" ,
messages = [ { "role" : "user" , "content" : "What is the weather in San Francisco?" } ] ,
"messages": [{"role": "user", "content": "What is the weather in San Francisco?"}],
"tools": [{"codeExecution": {}}]
Google Maps ​
Use Google Maps to provide location-based context to your Gemini models.
Relevant Vertex AI Docs
Basic Usage - Enable Widget Only
tools = [ { "googleMaps" : { "enableWidget" : "ENABLE_WIDGET" } } ] # 👈 ADD GOOGLE MAPS
messages = [ { "role" : "user" , "content" : "What restaurants are nearby?" } ] ,
With Location Data
You can specify a location to ground the model's responses with location-specific information:
tools = [ {
"googleMaps" : {
"enableWidget" : "ENABLE_WIDGET" ,
"latitude" : 37.7749 , # San Francisco latitude
"longitude" : - 122.4194 , # San Francisco longitude
"languageCode" : "en_US" # Optional: language for results
} ] # 👈 ADD GOOGLE MAPS WITH LOCATION
model = "gemini-2.0-flash" ,
tools = [ { "googleMaps" : { "enableWidget" : "ENABLE_WIDGET" } } ] ,
} ] ,
{"role": "user", "content": "What restaurants are nearby?"}
"googleMaps": {"enableWidget": "ENABLE_WIDGET"}
"googleMaps": {
"enableWidget": "ENABLE_WIDGET",
"latitude": 37.7749,
"longitude": -122.4194,
"languageCode": "en_US"
Moving from Vertex AI SDK to LiteLLM (GROUNDING) ​
If this was your initial VertexAI Grounding code,
import vertexai
from vertexai . generative_models import GenerativeModel , GenerationConfig , Tool , grounding
vertexai . init ( project = project_id , location = "us-central1" )
model = GenerativeModel ( "gemini-1.5-flash-001" )
# Use Google Search for grounding
tool = Tool . from_google_search_retrieval ( grounding . GoogleSearchRetrieval ( ) )
prompt = "When is the next total solar eclipse in US?"
response = model . generate_content (
prompt ,
tools = [ tool ] ,
generation_config = GenerationConfig (
temperature = 0.0 ,
) ,
then, this is what it looks like now
tools = [ { "googleSearch" : { "disable_attributon" : False } } ] # 👈 ADD GOOGLE SEARCH
vertex_project = "project-id"
Thinking / reasoning_content ​
LiteLLM translates OpenAI's reasoning_effort to Gemini's thinking parameter. Code
Added an additional non-OpenAI standard "disable" value for non-reasoning Gemini requests.
Mapping
reasoning_effort thinking "disable" "budget_tokens": 0 "low" "budget_tokens": 1024 "medium" "budget_tokens": 2048 "high" "budget_tokens": 4096
resp = completion (
model = "vertex_ai/gemini-2.5-flash-preview-04-17" ,
messages = [ { "role" : "user" , "content" : "What is the capital of France?" } ] ,
reasoning_effort = "low" ,
vertex_project = "project-id" ,
vertex_location = "us-central1"
- model_name : gemini - 2.5 - flash
model : vertex_ai/gemini - 2.5 - flash - preview - 04 - 17
vertex_credentials : { "project_id" : "project-id" , "location" : "us-central1" , "project_key" : "project-key" }
Start proxy
litellm --config /path/to/config.yaml
Test it!
curl http://0.0.0.0:4000/v1/chat/completions \
"model": "gemini-2.5-flash",
"messages": [{"role": "user", "content": "What is the capital of France?"}],
"reasoning_effort": "low"
Expected Response
ModelResponse (
id = 'chatcmpl-c542d76d-f675-4e87-8e5f-05855f5d0f5e' ,
created = 1740470510 ,
model = 'claude-3-7-sonnet-20250219' ,
object = 'chat.completion' ,
system_fingerprint = None ,
choices = [
Choices (
finish_reason = 'stop' ,
index = 0 ,
message = Message (
content = "The capital of France is Paris." ,
role = 'assistant' ,
tool_calls = None ,
function_call = None ,
reasoning_content = 'The capital of France is Paris. This is a very straightforward factual question.'
] ,
usage = Usage (
completion_tokens = 68 ,
prompt_tokens = 42 ,
total_tokens = 110 ,
completion_tokens_details = None ,
prompt_tokens_details = PromptTokensDetailsWrapper (
audio_tokens = None ,
cached_tokens = 0 ,
text_tokens = None ,
image_tokens = None
cache_creation_input_tokens = 0 ,
cache_read_input_tokens = 0
Pass thinking to Gemini models ​
You can also pass the thinking parameter to Gemini models.
This is translated to Gemini's thinkingConfig parameter .
response = litellm . completion (
thinking = { "type" : "enabled" , "budget_tokens" : 1024 } ,
-H "Authorization: Bearer $LITELLM_KEY" \
"model": "vertex_ai/gemini-2.5-flash-preview-04-17",
"thinking": {"type": "enabled", "budget_tokens": 1024}
Context Caching ​
Unified Endpoint ​
Use Vertex AI context caching in the same way as Google AI Studio - Context Caching
Example usage ​
SDK with Custom TTL
for _ in range ( 2 ) :
# System Message
"content" : [
"type" : "text" ,
"text" : "Here is the full text of a complex legal agreement" * 4000 ,
"cache_control" : { "type" : "ephemeral" } , # 👈 KEY CHANGE
# marked for caching with the cache_control parameter, so that this checkpoint can read from the previous cache.
"text" : "What are the key terms and conditions in this agreement?" ,
"cache_control" : { "type" : "ephemeral" } ,
} ]
print ( resp . usage ) # 👈 2nd usage block will be less, since cached tokens used
# Cache for 2 hours (7200 seconds)
"cache_control" : {
"type" : "ephemeral" ,
"ttl" : "7200s" # 👈 Cache for 2 hours
"ttl" : "3600s" # 👈 This TTL will be ignored (first one is used)
print ( resp . usage )
vertex_credentials : "/path/to/service_account.json"
"role": "system",
"content": [
"type": "text",
"text": "Long cache message (must be >= 1024 tokens)",
"cache_control": {
"type": "ephemeral",
"ttl": "7200s"
"role": "user",
"text": "What is the text about?"
Calling provider api directly ​
Go straight to provider
1. Create the Cache ​
First, create the cache by sending a POST request to the cachedContents endpoint via the LiteLLM proxy.
curl http://0.0.0.0:4000/vertex_ai/v1/projects/{project_id}/locations/{location}/cachedContents \
"model": "projects/{project_id}/locations/{location}/publishers/google/models/gemini-2.5-flash",
"displayName": "example_cache",
"contents": [{
"parts": [{
"text": ".... a long book to be cached"
}]
2. Get the Cache Name from the Response ​
Vertex AI will return a response containing the name of the cached content. This name is the identifier for your cached data.
"name" : "projects/12341234/locations/{location}/cachedContents/123123123123123" ,
"model" : "projects/{project_id}/locations/{location}/publishers/google/models/gemini-2.5-flash" ,
"createTime" : "2025-09-23T19:13:50.674976Z" ,
"updateTime" : "2025-09-23T19:13:50.674976Z" ,
"expireTime" : "2025-09-23T20:13:50.655988Z" ,
"displayName" : "example_cache" ,
"usageMetadata" : {
"totalTokenCount" : 1246 ,
"textCount" : 5132
3. Use the Cached Content ​
Use the name from the response as cachedContent or cached_content in subsequent API calls to reuse the cached information. This is passed in the body of your request to /chat/completions .
curl http://0.0.0.0:4000/chat/completions \
"cachedContent": "projects/545201925769/locations/us-central1/cachedContents/4511135542628319232",
"content": "what is the book about?"
Pre-requisites ​
uv add google-cloud-aiplatform (pre-installed on proxy docker image)
Authentication:
run gcloud auth application-default login See Google Cloud Docs
Alternatively you can set GOOGLE_APPLICATION_CREDENTIALS
Here's how: Jump to Code
Create a service account on GCP
Export the credentials as a json
load the json and json.dump the json as a string
store the json string in your environment as GOOGLE_APPLICATION_CREDENTIALS
Sample Usage ​
import litellm
litellm . vertex_project = "hardy-device-38811" # Your Project ID
litellm . vertex_location = "us-central1" # proj location
response = litellm . completion ( model = "gemini-2.5-pro" , messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ] )
Usage with LiteLLM Proxy Server ​
Here's how to use Vertex AI with the LiteLLM Proxy Server
Modify the config.yaml
Different location per model
One location all vertex models
Use this when you need to set a different location for each vertex model
- model_name : gemini - vision
model : vertex_ai/gemini - 1.0 - pro - vision - 001
vertex_project : "project-id2"
vertex_location : "us-east"
Use this when you have one vertex location for all models
litellm_settings :
vertex_project : "hardy-device-38811" # Your Project ID
vertex_location : "us-central1" # proj location
-model_name : team1 - gemini - 2.5 - pro
model : gemini - 2.5 - pro
Start the proxy
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
model = "team1-gemini-2.5-pro" ,
"content" : "what llm are you"
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "team1-gemini-2.5-pro",
"content": "what llm are you"
Authentication - vertex_project, vertex_location, etc. ​
Set your vertex credentials via:
dynamic params
OR
env vars
Dynamic Params ​
You can set:
vertex_credentials (str) - can be a json string or filepath to your vertex ai service account.json
vertex_location (str) - place where vertex model is deployed (us-central1, asia-southeast1, etc.). Some models support the global location, please see Vertex AI documentation
vertex_project Optional[str] - use if vertex project different from the one in vertex_credentials
as dynamic params for a litellm.completion call.
vertex_credentials = vertex_credentials_json ,
vertex_project = "my-special-project" ,
vertex_location = "my-special-location"
- model_name : gemini - 1.5 - pro
model : gemini - 1.5 - pro
vertex_credentials : os.environ/VERTEX_FILE_PATH_ENV_VAR # os.environ["VERTEX_FILE_PATH_ENV_VAR"] = "/path/to/service_account.json"
vertex_project : "my-special-project"
vertex_location : "my - special - location :
Workload Identity Federation ​
LiteLLM supports Google Cloud Workload Identity Federation (WIF) , which allows you to grant on-premises or multi-cloud workloads access to Google Cloud resources without using a service account key. This is the recommended approach for workloads running in other cloud environments (AWS, Azure, etc.) or on-premises.
To use Workload Identity Federation, pass the path to your WIF credentials configuration file via vertex_credentials :
messages = [ { "role" : "user" , "content" : "Hello!" } ] ,
vertex_credentials = "/path/to/wif-credentials.json" , # 👈 WIF credentials file
vertex_project = "your-gcp-project-id" ,
- model_name : gemini - model
vertex_project : your - gcp - project - id
vertex_location : us - central1
vertex_credentials : /path/to/wif - credentials.json # 👈 WIF credentials file
Alternatively, you can create credentials in LLM Credentials in the LiteLLM UI and use those to authenticate your models:
litellm_credential_name : my - vertex - wif - credential # 👈 Reference credential stored in UI
WIF Credentials File Format
Your WIF credentials JSON file typically looks like this (for AWS federation):
"type" : "external_account" ,
"audience" : "//iam.googleapis.com/projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_ID/providers/PROVIDER_ID" ,
"subject_token_type" : "urn:ietf:params:aws:token-type:aws4_request" ,
"service_account_impersonation_url" : "https://iamcredentials.googleapis.com/v1/projects/-/serviceAccounts/SERVICE_ACCOUNT_EMAIL:generateAccessToken" ,
"token_url" : "https://sts.googleapis.com/v1/token" ,
"credential_source" : {
"environment_id" : "aws1" ,
"region_url" : "http://169.254.169.254/latest/meta-data/placement/availability-zone" ,
"url" : "http://169.254.169.254/latest/meta-data/iam/security-credentials" ,
"regional_cred_verification_url" : "https://sts.{region}.amazonaws.com?Action=GetCallerIdentity&Version=2011-06-15"
For more details on setting up Workload Identity Federation, see Google Cloud WIF documentation .
Explicit AWS Credentials for WIF ​
By default, AWS-based WIF relies on the EC2 instance metadata service to obtain AWS credentials. This works when LiteLLM runs on an EC2 instance or ECS task with an IAM role attached.
If your environment does not have access to the EC2 metadata service (e.g., running on-premises, in a container without host networking, or in a different cloud with security restrictions), you can provide explicit AWS credentials directly in the WIF credential JSON file. LiteLLM will use these to authenticate to AWS before performing the GCP token exchange.
Add the aws_* keys at the top level of your WIF credential JSON (alongside type , audience , etc.):
"aws_role_name" : "arn:aws:iam::123456789012:role/MyWifRole" ,
"aws_region_name" : "us-east-1"
Supported aws_* parameters:
Parameter Required Description aws_region_name Yes AWS region for credential verification (e.g. us-east-1 ) aws_role_name No IAM role ARN for STS AssumeRole aws_access_key_id No Static AWS access key ID aws_secret_access_key No Static AWS secret access key aws_session_token No Temporary session token aws_profile_name No AWS CLI profile name aws_session_name No Session name for AssumeRole aws_web_identity_token No Web identity token for STS aws_sts_endpoint No Custom STS endpoint URL aws_external_id No External ID for cross-account AssumeRole
aws_region_name is always required when using explicit AWS credentials. The other parameters follow the same authentication flows as Bedrock AWS auth -- you can use role assumption, static keys, profiles, or web identity tokens.
vertex_credentials = "/path/to/wif-credentials-with-aws.json" , # WIF JSON with aws_* keys
vertex_credentials : /path/to/wif - credentials - with - aws.json # WIF JSON with aws_* keys
When aws_* keys are present in the JSON, LiteLLM automatically uses explicit AWS authentication instead of the EC2 metadata service. When they are absent, the standard metadata-based flow is used unchanged.
Environment Variables ​
GOOGLE_APPLICATION_CREDENTIALS - store the filepath for your service_account.json in here (used by vertex sdk directly).
VERTEXAI_LOCATION - place where vertex model is deployed (us-central1, asia-southeast1, etc.)
VERTEXAI_PROJECT - Optional[str] - use if vertex project different from the one in vertex_credentials
GOOGLE_APPLICATION_CREDENTIALS
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service_account.json"
VERTEXAI_LOCATION
export VERTEXAI_LOCATION="us-central1" # can be any vertex location
VERTEXAI_PROJECT
export VERTEXAI_PROJECT="my-test-project" # ONLY use if model project is different from service account project
Specifying Safety Settings ​
In certain use-cases you may need to make calls to the models and pass safety settings different from the defaults. To do so, simple pass the safety_settings argument to completion or acompletion . For example:
Set per model/request ​
Proxy
messages = [ { "role" : "user" , "content" : "write code for saying hi from LiteLLM" } ]
safety_settings = [
"category" : "HARM_CATEGORY_HARASSMENT" ,
"threshold" : "BLOCK_NONE" ,
"category" : "HARM_CATEGORY_HATE_SPEECH" ,
"category" : "HARM_CATEGORY_SEXUALLY_EXPLICIT" ,
"category" : "HARM_CATEGORY_DANGEROUS_CONTENT" ,
Option 1: Set in config
- model_name : gemini - experimental
model : vertex_ai/gemini - experimental
vertex_project : litellm - epic
safety_settings :
- category : HARM_CATEGORY_HARASSMENT
threshold : BLOCK_NONE
- category : HARM_CATEGORY_HATE_SPEECH
- category : HARM_CATEGORY_SEXUALLY_EXPLICIT
- category : HARM_CATEGORY_DANGEROUS_CONTENT
Option 2: Set on call
model = "gemini-experimental" ,
"content" : "Can you write exploits?" ,
max_tokens = 8192 ,
stream = False ,
extra_body = {
"safety_settings" : [
Set Globally ​
litellm . set_verbose = True 👈 See RAW REQUEST / RESPONSE
litellm . vertex_ai_safety_settings = [
vertex_ai_safety_settings :
Set Vertex Project & Vertex Location ​
All calls using Vertex AI require the following parameters:
Your Project ID
import os , litellm
# set via env var
os . environ [ "VERTEXAI_PROJECT" ] = "hardy-device-38811" # Your Project ID`
### OR ###
# set directly on module
litellm . vertex_project = "hardy-device-38811" # Your Project ID`
Your Project Location
os . environ [ "VERTEXAI_LOCATION" ] = "us - central1 # Your Location
litellm . vertex_location = "us - central1 # Your Location
Gemini Pro ​
Model Name Function Call gemini-2.5-pro completion('gemini-2.5-pro', messages) , completion('vertex_ai/gemini-2.5-pro', messages) gemini-2.5-flash-preview-09-2025 completion('gemini-2.5-flash-preview-09-2025', messages) , completion('vertex_ai/gemini-2.5-flash-preview-09-2025', messages) gemini-2.5-flash-lite-preview-09-2025 completion('gemini-2.5-flash-lite-preview-09-2025', messages) , completion('vertex_ai/gemini-2.5-flash-lite-preview-09-2025', messages) gemini-3.1-flash-lite-preview completion('gemini-3.1-flash-lite-preview', messages) , completion('vertex_ai/gemini-3.1-flash-lite-preview', messages)
PayGo / Priority Cost Tracking ​
LiteLLM automatically tracks spend for Vertex AI Gemini models using the correct pricing tier based on the response's usageMetadata.trafficType :
Vertex AI trafficType LiteLLM service_tier Pricing applied ON_DEMAND_PRIORITY priority PayGo / priority pricing ( input_cost_per_token_priority , output_cost_per_token_priority ) ON_DEMAND standard Default on-demand pricing FLEX / BATCH flex Batch/flex pricing
When you use Vertex AI PayGo (on-demand priority) or batch workloads, LiteLLM reads trafficType from the response and applies the matching cost per token from the model cost map . No configuration is required — spend tracking works out of the box for both standard and PayGo requests.
See Spend Tracking for general cost tracking setup.
Private Service Connect (PSC) Endpoints ​
LiteLLM supports Vertex AI models deployed to Private Service Connect (PSC) endpoints, allowing you to use custom api_base URLs for private deployments.
Usage ​
# Use PSC endpoint with custom api_base
model = "vertex_ai/1234567890" , # Numeric endpoint ID
api_base = "http://10.96.32.8" , # Your PSC endpoint
vertex_project = "my-project-id" ,
vertex_location = "us-central1" ,
use_psc_endpoint_format = True
Key Features:
Supports both numeric endpoint IDs and custom model names
Works with both completion and embedding endpoints
Automatically constructs full PSC URL: {api_base}/v1/projects/{project}/locations/{location}/endpoints/{model}:{endpoint}
Compatible with streaming requests
Configuration ​
Add PSC endpoints to your config.yaml :
- model_name : psc - gemini
model : vertex_ai/1234567890 # Numeric endpoint ID
api_base : "http://10.96.32.8" # Your PSC endpoint
vertex_project : "my-project-id"
use_psc_endpoint_format : True
- model_name : psc - embedding
model : vertex_ai/text - embedding - 004
Fine-tuned Models ​
You can call fine-tuned Vertex AI Gemini models through LiteLLM
Property Details Provider Route vertex_ai/gemini/{MODEL_ID} Vertex Documentation Vertex AI - Fine-tuned Gemini Models Supported Operations /chat/completions , /completions , /embeddings , /images
To use a model that follows the /gemini request/response format, simply set the model parameter as
Model parameter for calling fine-tuned gemini models
model = "vertex_ai/gemini/<your-finetuned-model>"
LiteLLM Python SDK
LiteLLM Proxy
Example
## set ENV variables
os . environ [ "VERTEXAI_PROJECT" ] = "hardy-device-38811"
os . environ [ "VERTEXAI_LOCATION" ] = "us-central1"
model = "vertex_ai/gemini/<your-finetuned-model>" , # e.g. vertex_ai/gemini/4965075652664360960
Add Vertex Credentials to your env
Authenticate to Vertex AI
!gcloud auth application-default login
Add to litellm config
- model_name : finetuned - gemini
model : vertex_ai/gemini/<ENDPOINT_ID >
vertex_project : <PROJECT_ID >
vertex_location : <LOCATION >
Example request
api_key = "your-litellm-key" ,
base_url = "http://0.0.0.0:4000"
model = "finetuned-gemini" ,
{ "role" : "user" , "content" : "hi" }
curl --location 'https://0.0.0.0:4000/v1/chat/completions' \
--header 'Authorization: <LITELLM_KEY>' \
--data '{"model": "finetuned-gemini" ,"messages":[{"role": "user", "content":[{"type": "text", "text": "hi"}]}]}'
Gemini Pro Vision ​
Model Name Function Call gemini-2.5-pro-vision completion('gemini-2.5-pro-vision', messages) , completion('vertex_ai/gemini-2.5-pro-vision', messages)
Gemini 1.5 Pro (and Vision) ​
Model Name Function Call gemini-1.5-pro completion('gemini-1.5-pro', messages) , completion('vertex_ai/gemini-1.5-pro', messages) gemini-1.5-flash-preview-0514 completion('gemini-1.5-flash-preview-0514', messages) , completion('vertex_ai/gemini-1.5-flash-preview-0514', messages) gemini-1.5-pro-preview-0514 completion('gemini-1.5-pro-preview-0514', messages) , completion('vertex_ai/gemini-1.5-pro-preview-0514', messages) Using Gemini Pro Vision ​
Call gemini-2.5-pro-vision in the same input/output format as OpenAI gpt-4-vision
LiteLLM Supports the following image types passed in url
Images with Cloud Storage URIs - gs://cloud-samples-data/generative-ai/image/boats.jpeg
Images with direct links - https://storage.googleapis.com/github-repo/img/gemini/intro/landmark3.jpg
Videos with Cloud Storage URIs - https://storage.googleapis.com/github-repo/img/gemini/multimodality_usecases_overview/pixel8.mp4
Base64 Encoded Local Images
Example Request - image url
Images with direct links
Local Base64 Images
model = "vertex_ai/gemini-2.5-pro-vision" ,
"text" : "Whats in this image?"
"type" : "image_url" ,
"image_url" : {
"url" : "https://awsmp-logos.s3.amazonaws.com/seller-xw5kijmvmzasy/c233c9ade2ccb5491072ae232c814942.png"
def encode_image ( image_path ) :
import base64
with open ( image_path , "rb" ) as image_file :
return base64 . b64encode ( image_file . read ( ) ) . decode ( "utf-8" )
image_path = "cached_logo.jpg"
# Getting the base64 string
base64_image = encode_image ( image_path )
{ "type" : "text" , "text" : "Whats in this image?" } ,
"url" : "data:image/jpeg;base64," + base64_image
Usage - Function Calling ​
LiteLLM supports Function Calling for Vertex AI gemini models.
# set env
os . environ [ "GOOGLE_APPLICATION_CREDENTIALS" ] = ".."
os . environ [ "VERTEX_AI_PROJECT" ] = ".."
os . environ [ "VERTEX_AI_LOCATION" ] = ".."
"name" : "get_current_weather" ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
messages = [ { "role" : "user" , "content" : "What's the weather like in Boston today?" } ]
# Add any assertions, here to check response args
assert isinstance ( response . choices [ 0 ] . message . tool_calls [ 0 ] . function . name , str )
assert isinstance (
response . choices [ 0 ] . message . tool_calls [ 0 ] . function . arguments , str
Media Resolution Control (Images & Videos) ​
LiteLLM supports per-part media resolution control using OpenAI's detail parameter for all Gemini models. This allows you to specify different resolution levels for individual images and videos in your request, whether using image_url or file content types.
Supported detail values:
"low" - Maps to media_resolution: "low" (280 tokens for images, 70 tokens per frame for videos)
"medium" - Maps to media_resolution: "medium"
"high" - Maps to media_resolution: "high" (1120 tokens for images)
"ultra_high" - Maps to media_resolution: "ultra_high"
"auto" or None - Model decides optimal resolution (no media_resolution set)
Usage Examples:
Images
Videos with Files
"url" : "https://example.com/chart.png" ,
"detail" : "high" # High resolution for detailed chart analysis
"text" : "Analyze this chart"
"url" : "https://example.com/icon.png" ,
"detail" : "low" # Low resolution for simple icon
model = "vertex_ai/gemini-3-pro-preview" ,
"text" : "Analyze this video"
"type" : "file" ,
"file" : {
"file_id" : "gs://my-bucket/video.mp4" ,
"format" : "video/mp4" ,
"detail" : "high" # High resolution for detailed video analysis
info
Per-Part Resolution: Each image or video in your request can have its own detail setting, allowing mixed-resolution requests (e.g., a high-res chart alongside a low-res icon). This feature works with both image_url and file content types across all Gemini models.
Video Metadata Control ​
LiteLLM supports fine-grained video processing control through the video_metadata field for all Gemini models (1.x, 2.x, 3+). This allows you to specify frame extraction rates and time ranges for video analysis.
Supported video_metadata parameters:
Parameter Type Description Example fps Number Frame extraction rate (frames per second) 5 start_offset String Start time for video clip processing "10s" end_offset String End time for video clip processing "60s"
note
Field Name Conversion: LiteLLM automatically converts snake_case field names to camelCase for the Gemini API:
start_offset → startOffset
end_offset → endOffset
fps remains unchanged
tip
Video clipping ( start_offset / end_offset ) and frame rate control ( fps ) are supported by all Gemini models, but analysis quality is significantly higher with the Gemini 2.5 series (e.g., gemini-2.5-flash , gemini-2.5-pro ).
warning
Video Files Recommended: While video_metadata is designed for video files, error handling for other media types is delegated to the Vertex AI API
File Formats Supported: Works with gs:// , https:// , and base64-encoded video files
Basic Video Metadata
Combined with Detail
{ "type" : "text" , "text" : "Analyze this video clip" } ,
"video_metadata" : {
"fps" : 5 , # Extract 5 frames per second
"start_offset" : "10s" , # Start from 10 seconds
"end_offset" : "60s" # End at 60 seconds
print ( response . choices [ 0 ] . message . content )
{ "type" : "text" , "text" : "Provide detailed analysis of this video segment" } ,
"file_id" : "https://example.com/presentation.mp4" ,
"detail" : "high" , # High resolution for detailed analysis
"fps" : 10 , # Extract 10 frames per second
"start_offset" : "30s" , # Start from 30 seconds
"end_offset" : "90s" # End at 90 seconds
- model_name : gemini - 3 - pro
model : vertex_ai/gemini - 3 - pro - preview
vertex_project : your - project
Make request
"model": "gemini-3-pro",
{"type": "text", "text": "Analyze this video clip"},
"type": "file",
"file": {
"file_id": "gs://my-bucket/video.mp4",
"format": "video/mp4",
"detail": "high",
"video_metadata": {
"fps": 5,
"start_offset": "10s",
"end_offset": "60s"
Usage - PDF / Videos / Audio etc. Files ​
Pass any file supported by Vertex AI, through LiteLLM.
LiteLLM Supports the following file types passed in url.
Using file message type for VertexAI is live from v1.65.1+
Files with Cloud Storage URIs - gs://cloud-samples-data/generative-ai/image/boats.jpeg
Files with direct links - https://storage.googleapis.com/github-repo/img/gemini/intro/landmark3.jpg
Base64 Encoded Local Files
Using gs:// or any URL ​
model = "vertex_ai/gemini-1.5-flash" ,
{ "type" : "text" , "text" : "You are a very professional document summarization specialist. Please summarize the given document." } ,
"file_id" : "gs://cloud-samples-data/generative-ai/pdf/2403.05530.pdf" ,
"format" : "application/pdf" # OPTIONAL - specify mime-type
max_tokens = 300 ,
print ( response . choices [ 0 ] )
using base64 ​
import requests
# URL of the file
url = "https://storage.googleapis.com/cloud-samples-data/generative-ai/pdf/2403.05530.pdf"
# Download the file
response = requests . get ( url )
file_data = response . content
encoded_file = base64 . b64encode ( file_data ) . decode ( "utf-8" )
"file_data" : f"data:application/pdf;base64, { encoded_file } " , # 👈 PDF
"type" : "audio_input" ,
"audio_input {
"audio_input" : f"data:audio/mp3;base64, { encoded_file } " , # 👈 AUDIO File ('file' message works as too)
Add model to config
- model_name : gemini - 1.5 - flash
model : vertex_ai/gemini - 1.5 - flash
Using gs://
"model": "gemini-1.5-flash",
"text": "You are a very professional document summarization specialist. Please summarize the given document"
"file_id": "gs://cloud-samples-data/generative-ai/pdf/2403.05530.pdf",
"format": "application/pdf" # OPTIONAL
"max_tokens": 300
"file_data": f"data:application/pdf;base64,{encoded_file}", # 👈 PDF
"type": "audio_input",
"audio_input": f"data:audio/mp3;base64,{encoded_file}", # 👈 AUDIO File ('file' message works as too)
Chat Models ​
Model Name Function Call chat-bison-32k completion('chat-bison-32k', messages) chat-bison completion('chat-bison', messages) chat-bison@001 completion('chat-bison@001', messages)
Code Chat Models ​
Model Name Function Call codechat-bison completion('codechat-bison', messages) codechat-bison-32k completion('codechat-bison-32k', messages) codechat-bison@001 completion('codechat-bison@001', messages)
Text Models ​
Model Name Function Call text-bison completion('text-bison', messages) text-bison@001 completion('text-bison@001', messages)
Code Text Models ​
Model Name Function Call code-bison completion('code-bison', messages) code-bison@001 completion('code-bison@001', messages) code-gecko@001 completion('code-gecko@001', messages) code-gecko@latest completion('code-gecko@latest', messages)
Embedding Models ​
Usage - Embedding ​
LiteLLM PROXY
from litellm import embedding
response = embedding (
model = "vertex_ai/textembedding-gecko" ,
input = [ "good morning from litellm" ] ,
- model_name : snowflake - arctic - embed - m - long - 1731622468876
model : vertex_ai/<your - model - id >
vertex_project : "adroit-crow-413218"
vertex_credentials : adroit - crow - 413218 - a956eef1a2a8.json
drop_params : True
Make Request using OpenAI Python SDK, Langchain Python SDK
client = openai . OpenAI ( api_key = "sk-1234" , base_url = "http://0.0.0.0:4000" )
response = client . embeddings . create (
model = "snowflake-arctic-embed-m-long-1731622468876" ,
input = [ "good morning from litellm" , "this is another item" ] ,
Supported Embedding Models ​
All models listed here are supported
Model Name Function Call text-embedding-004 embedding(model="vertex_ai/text-embedding-004", input) text-multilingual-embedding-002 embedding(model="vertex_ai/text-multilingual-embedding-002", input) textembedding-gecko embedding(model="vertex_ai/textembedding-gecko", input) textembedding-gecko-multilingual embedding(model="vertex_ai/textembedding-gecko-multilingual", input) textembedding-gecko-multilingual@001 embedding(model="vertex_ai/textembedding-gecko-multilingual@001", input) textembedding-gecko@001 embedding(model="vertex_ai/textembedding-gecko@001", input) textembedding-gecko@003 embedding(model="vertex_ai/textembedding-gecko@003", input) text-embedding-preview-0409 embedding(model="vertex_ai/text-embedding-preview-0409", input) text-multilingual-embedding-preview-0409 embedding(model="vertex_ai/text-multilingual-embedding-preview-0409", input) Fine-tuned OR Custom Embedding models embedding(model="vertex_ai/<your-model-id>", input)
Supported OpenAI (Unified) Params ​
param type vertex equivalent input string or List[string] instances dimensions int output_dimensionality input_type Literal["RETRIEVAL_QUERY","RETRIEVAL_DOCUMENT", "SEMANTIC_SIMILARITY", "CLASSIFICATION", "CLUSTERING", "QUESTION_ANSWERING", "FACT_VERIFICATION"] task_type Usage with OpenAI (Unified) Params ​
response = litellm . embedding (
model = "vertex_ai/text-embedding-004" ,
input = [ "good morning from litellm" , "gm" ]
input_type = "RETRIEVAL_DOCUMENT" ,
dimensions = 1 ,
model = "text-embedding-004" ,
input = [ "good morning from litellm" , "gm" ] ,
"input_type" : "RETRIEVAL_QUERY" ,
Supported Vertex Specific Params ​
param type auto_truncate bool task_type Literal["RETRIEVAL_QUERY","RETRIEVAL_DOCUMENT", "SEMANTIC_SIMILARITY", "CLASSIFICATION", "CLUSTERING", "QUESTION_ANSWERING", "FACT_VERIFICATION"] title str Usage with Vertex Specific Params (Use task_type and title ) ​
You can pass any vertex specific params to the embedding model. Just pass them to the embedding function like this:
Relevant Vertex AI doc with all embedding params
task_type = "RETRIEVAL_DOCUMENT" ,
title = "test" ,
auto_truncate = True ,
"task_type" : "RETRIEVAL_QUERY" ,
"auto_truncate" : True ,
"title" : "test" ,
Multi-Modal Embeddings ​
Known Limitations:
Only supports 1 image / video / image per request
Only supports GCS or base64 encoded images / videos
LiteLLM PROXY (Unified Endpoint)
LiteLLM PROXY (Vertex SDK)
Using GCS Images
response = await litellm . aembedding (
model = "vertex_ai/multimodalembedding@001" ,
input = "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" # will be sent as a gcs image
Using base 64 encoded images
input = "data:image/jpeg;base64,..." # will be sent as a base64 encoded image
- model_name : multimodalembedding@001
model : vertex_ai/multimodalembedding@001
Make Request use OpenAI Python SDK, Langchain Python SDK
OpenAI SDK
Langchain
Requests with GCS Image / Video URI
# # request sent to model set on litellm proxy, `litellm --model`
model = "multimodalembedding@001" ,
input = "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ,
Requests with base64 encoded images
input = "data:image/jpeg;base64,..." ,
from langchain_openai import OpenAIEmbeddings
embeddings_models = "multimodalembedding@001"
embeddings = OpenAIEmbeddings (
base_url = "http://0.0.0.0:4000" ,
api_key = "sk-1234" , # type: ignore
query_result = embeddings . embed_query (
"gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png"
print ( query_result )
"data:image/jpeg;base64,..."
default_vertex_config :
Make Request use OpenAI Python SDK
from vertexai . vision_models import Image , MultiModalEmbeddingModel , Video
from vertexai . vision_models import VideoSegmentConfig
from google . auth . credentials import Credentials
LITELLM_PROXY_API_KEY = "sk-1234"
LITELLM_PROXY_BASE = "http://0.0.0.0:4000/vertex-ai"
import datetime
class CredentialsWrapper ( Credentials ) :
def __init__ ( self , token = None ) :
super ( ) . __init__ ( )
self . token = token
self . expiry = None # or set to a future date if needed
def refresh ( self , request ) :
pass
def apply ( self , headers , token = None ) :
headers [ 'Authorization' ] = f'Bearer { self . token } '
@property
def expired ( self ) :
return False # Always consider the token as non-expired
def valid ( self ) :
return True # Always consider the credentials as valid
credentials = CredentialsWrapper ( token = LITELLM_PROXY_API_KEY )
vertexai . init (
project = "adroit-crow-413218" ,
location = "us-central1" ,
api_endpoint = LITELLM_PROXY_BASE ,
credentials = credentials ,
api_transport = "rest" ,
model = MultiModalEmbeddingModel . from_pretrained ( "multimodalembedding" )
image = Image . load_from_file (
embeddings = model . get_embeddings (
image = image ,
contextual_text = "Colosseum" ,
dimension = 1408 ,
print ( f"Image Embedding: { embeddings . image_embedding } " )
print ( f"Text Embedding: { embeddings . text_embedding } " )
Text + Image + Video Embeddings ​
Text + Image
input = [ "hey" , "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ] # will be sent as a gcs image
Text + Video
input = [ "hey" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] # will be sent as a gcs image
Image + Video
input = [ "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] # will be sent as a gcs image
input = [ "hey" , "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" ] ,
input = [ "hey" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] ,
input = [ "gs://cloud-samples-data/vertex-ai/llm/prompts/landmark1.png" , "gs://my-bucket/embeddings/supermarket-video.mp4" ] ,
Fine Tuning APIs ​
Property Details Description Create Fine Tuning Jobs in Vertex AI ( /tuningJobs ) using OpenAI Python SDK Vertex Fine Tuning Documentation Vertex Fine Tuning
1. Add finetune_settings to your config.yaml ​
- model_name : gpt - 4
model : openai/fake
api_key : fake - key
api_base : https : //exampleopenaiendpoint - production.up.railway.app/
# 👇 Key change: For /fine_tuning/jobs endpoints
finetune_settings :
- custom_llm_provider : "vertex_ai"
vertex_credentials : "/Users/ishaanjaffer/Downloads/adroit-crow-413218-a956eef1a2a8.json"
2. Create a Fine Tuning Job ​
ft_job = await client . fine_tuning . jobs . create (
model = "gemini-1.0-pro-002" , # Vertex model you want to fine-tune
training_file = "gs://cloud-samples-data/ai-platform/generative_ai/sft_train_data.jsonl" , # file_id from create file response
extra_headers = { "custom-llm-provider" : "vertex_ai" } , # tell litellm proxy which provider to use
curl http://localhost:4000/v1/fine_tuning/jobs \
-H "custom-llm-provider: vertex_ai" \
"model": "gemini-1.0-pro-002",
"training_file": "gs://cloud-samples-data/ai-platform/generative_ai/sft_train_data.jsonl"
Advanced use case - Passing adapter_size to the Vertex AI API
Set hyper_parameters, such as n_epochs , learning_rate_multiplier and adapter_size . See Vertex Advanced Hyperparameters
ft_job = client . fine_tuning . jobs . create (
hyperparameters = {
"n_epochs" : 3 , # epoch_count on Vertex
"learning_rate_multiplier" : 0.1 , # learning_rate_multiplier on Vertex
"adapter_size" : "ADAPTER_SIZE_ONE" # type: ignore, vertex specific hyperparameter
extra_headers = { "custom-llm-provider" : "vertex_ai" } ,
"training_file": "gs://cloud-samples-data/ai-platform/generative_ai/sft_train_data.jsonl",
"hyperparameters": {
"n_epochs": 3,
"learning_rate_multiplier": 0.1,
"adapter_size": "ADAPTER_SIZE_ONE"
Labels ​
Google enables you to add custom metadata to its generateContent and streamGenerateContent calls.
This mechanism is useful in Vertex AI because it allows costs and usage tracking over multiple
different applications or users.
You can use that feature through LiteLLM by sending labels or metadata field in your requests.
If the client sets the labels field in the request to the LiteLLM,
the LiteLLM will pass the labels field to the Vertex AI backend.
If the client sets the metadata field in the request to the LiteLLM and the labels field is not set,
the LiteLLM will create the labels field filled with metadata key/value pairs for all string values and
pass it to the Vertex AI backend.
Here is an example JSON request demonstrating the labels usage:
"model" : "gemini-2.0-flash-lite" ,
"messages" : [
{ "role" : "user" , "content" : "respond in 20 words. who are you?" }
"labels" : {
"client_app" : "acme_comp_financial_app" ,
"department" : "finance" ,
"project" : "acme_ai"
Extra ​
Using GOOGLE_APPLICATION_CREDENTIALS ​
Here's the code for storing your service account credentials as GOOGLE_APPLICATION_CREDENTIALS environment variable:
import tempfile
def load_vertex_ai_credentials ( ) :
# Define the path to the vertex_key.json file
print ( "loading vertex ai credentials" )
filepath = os . path . dirname ( os . path . abspath ( __file__ ) )
vertex_key_path = filepath + "/vertex_key.json"
# Read the existing content of the file or create an empty dictionary
with open ( vertex_key_path , "r" ) as file :
# Read the file content
print ( "Read vertexai file path" )
content = file . read ( )
# If the file is empty or not valid JSON, create an empty dictionary
if not content or not content . strip ( ) :
service_account_key_data = { }
else :
# Attempt to load the existing JSON content
file . seek ( 0 )
service_account_key_data = json . load ( file )
except FileNotFoundError :
# If the file doesn't exist, create an empty dictionary
# Create a temporary file
with tempfile . NamedTemporaryFile ( mode = "w+" , delete = False ) as temp_file :
# Write the updated content to the temporary file
json . dump ( service_account_key_data , temp_file , indent = 2 )
# Export the temporary file as GOOGLE_APPLICATION_CREDENTIALS
os . environ [ "GOOGLE_APPLICATION_CREDENTIALS" ] = os . path . abspath ( temp_file . name )
Using GCP Service Account ​
Trying to deploy LiteLLM on Google Cloud Run? Tutorial here
Figure out the Service Account bound to the Google Cloud Run service
Get the FULL EMAIL address of the corresponding Service Account
Next, go to IAM & Admin > Manage Resources , select your top-level project that houses your Google Cloud Run Service
Click Add Principal
Specify the Service Account as the principal and Vertex AI User as the role
Once that's done, when you deploy the new container in the Google Cloud Run service, LiteLLM will have automatic access to all Vertex AI endpoints.
s/o @ Darien Kindlund for this tutorial
Rerank API ​
Vertex AI supports reranking through the Discovery Engine API, providing semantic ranking capabilities for document retrieval.
Setup ​
Set your Google Cloud project ID:
export VERTEXAI_PROJECT="your-project-id"
from litellm import rerank
# Using the latest model (recommended)
response = rerank (
model = "vertex_ai/semantic-ranker-default@latest" ,
query = "What is Google Gemini?" ,
documents = [
"Gemini is a cutting edge large language model created by Google." ,
"The Gemini zodiac symbol often depicts two figures standing side-by-side." ,
"Gemini is a constellation that can be seen in the night sky."
top_n = 2 ,
return_documents = True # Set to False for ID-only responses
# Using specific model versions
response_v003 = rerank (
model = "vertex_ai/semantic-ranker-default-003" ,
documents = documents ,
top_n = 2
print ( response . results )
Parameters ​
Parameter Type Description model string Model name (e.g., vertex_ai/semantic-ranker-default@latest ) query string Search query documents list Documents to rank top_n int Number of top results to return return_documents bool Return full content (True) or IDs only (False)
Supported Models ​
semantic-ranker-default@latest
semantic-ranker-fast@latest
semantic-ranker-default-003
semantic-ranker-default-002
For detailed model specifications, see the Google Cloud ranking API documentation .
Proxy Usage ​
Add to your config.yaml :
- model_name : semantic - ranker - default@latest
model : vertex_ai/semantic - ranker - default@latest
vertex_ai_project : "your-project-id"
vertex_ai_location : "us-central1"
vertex_ai_credentials : "path/to/service-account.json"
Start the proxy:
Test with curl:
curl http://0.0.0.0:4000/rerank \
"model": "semantic-ranker-default@latest",
"query": "What is Google Gemini?",
"documents": [
"Gemini is a cutting edge large language model created by Google.",
"The Gemini zodiac symbol often depicts two figures standing side-by-side.",
"top_n": 2
Overview
vertex_ai/ route
System Message
Function Calling
JSON Schema
Google Hosted Tools (Web Search, Code Execution, etc.)
Thinking / reasoning_content
Context Caching
Pre-requisites
Sample Usage
Usage with LiteLLM Proxy Server
Authentication - vertex_project, vertex_location, etc.
Dynamic Params
Workload Identity Federation
Environment Variables
Specifying Safety Settings
Set per model/request
Set Globally
Set Vertex Project & Vertex Location
Gemini Pro
PayGo / Priority Cost Tracking
Private Service Connect (PSC) Endpoints
Usage
Configuration
Fine-tuned Models
Gemini Pro Vision
Gemini 1.5 Pro (and Vision)
Usage - Function Calling
Media Resolution Control (Images & Videos)
Video Metadata Control
Usage - PDF / Videos / Audio etc. Files
Using gs:// or any URL
using base64
Chat Models
Code Chat Models
Text Models
Code Text Models
Embedding Models
Supported OpenAI (Unified) Params
Supported Vertex Specific Params
Multi-Modal Embeddings
Text + Image + Video Embeddings
Fine Tuning APIs
Labels
Extra
Using GOOGLE_APPLICATION_CREDENTIALS
Using GCP Service Account
Rerank API
Setup
Parameters
Supported Models
Proxy Usage
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
