# SAP Generative AI Hub | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/sap
- Final URL: https://docs.litellm.ai/docs/providers/sap
- Canonical URL: https://docs.litellm.ai/docs/providers/sap
- Fetched at: 2026-06-23T14:28:57Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports SAP Generative AI Hub's Orchestration Service.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports SAP Generative AI Hub's Orchestration Service.
Property Details Description SAP's Generative AI Hub provides access to OpenAI, Anthropic, Gemini, Mistral, NVIDIA, Amazon, and SAP LLMs through the AI Core orchestration service. Provider Route on LiteLLM sap/ Supported Endpoints /chat/completions , /embeddings API Reference SAP AI Core Documentation
Prerequisites ​
Before you begin, ensure you have:
SAP BTP Account with access to SAP AI Core
AI Core Service Instance provisioned in your subaccount
Service Key created for your AI Core instance (this contains your credentials)
Resource Group with deployed AI models (check with your SAP administrator)
Where to Find Your Credentials
Your credentials come from the Service Key you create in SAP BTP Cockpit:
Navigate to your Subaccount → Instances and Subscriptions
Find your AI Core instance and click on it
Go to Service Keys and create one (or use existing)
The JSON contains all values needed below
The service key JSON looks like this:
{
"clientid" : "sb-abc123..." ,
"clientsecret" : "xyz789..." ,
"url" : "https://myinstance.authentication.eu10.hana.ondemand.com" ,
"serviceurls" : {
"AI_API_URL" : "https://api.ai.prod.eu-central-1.aws.ml.hana.ondemand.com"
}
Resource Group
The resource group is typically configured separately in your AI Core deployment, not in the service key itself. You can set it via the AICORE_RESOURCE_GROUP environment variable (defaults to "default").
Quick Start ​
Step 1: Install LiteLLM ​
uv add litellm
Step 2: Set Your Credentials ​
Choose one of these authentication methods:
Breaking change : credential resolution is "first-source-wins"
Credential resolution no longer merges individual fields across sources.
Resolution order is:
kwargs → service key → env (AICORE_*) → config → VCAP service
Important behavior: once LiteLLM finds any credential value in a source, it takes all credentials from that source exclusively (except resource_group , which may still be resolved separately).
Service Key JSON (Recommended)
Individual Variables
The simplest approach - paste your entire service key as a single environment variable.
Note: the service key no more needs to be wrapped in a "credentials" key.
export AICORE_SERVICE_KEY='{
"clientid": "your-client-id",
"clientsecret": "your-client-secret",
"url": "https://<your-instance>.authentication.sap.hana.ondemand.com",
"serviceurls": {
"AI_API_URL": "https://api.ai.<your-region>.aws.ml.hana.ondemand.com"
}'
export AICORE_RESOURCE_GROUP="default"
Alternatively, instead of using the service key above, you could set each credential separately:
export AICORE_AUTH_URL="https://<your-instance>.authentication.sap.hana.ondemand.com/oauth/token"
export AICORE_CLIENT_ID="your-client-id"
export AICORE_CLIENT_SECRET="your-client-secret"
export AICORE_BASE_URL="https://api.ai.<your-region>.aws.ml.hana.ondemand.com/v2"
Step 3: Make Your First Request ​
test_sap.py
from litellm import completion
response = completion (
model = "sap/gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hello from LiteLLM!" } ]
)
print ( response . choices [ 0 ] . message . content )
Run it:
python test_sap.py
Expected output:
Hello! How can I assist you today?
Step 4: Verify Your Setup (Optional) ​
Test that everything is working with this diagnostic script:
verify_sap_setup.py
import os
import litellm
# Enable debug logging to see what's happening
os . environ [ "LITELLM_LOG" ] = "DEBUG"
# Either use AICORE_SERVICE_KEY (contains all credentials including resourcegroup)
# OR use individual variables (all required together)
individual_vars = [ "AICORE_AUTH_URL" , "AICORE_CLIENT_ID" , "AICORE_CLIENT_SECRET" , "AICORE_BASE_URL" , "AICORE_RESOURCE_GROUP" ]
print ( "=== SAP Gen AI Hub Setup Verification ===\n" )
# Check for service key method
if os . environ . get ( "AICORE_SERVICE_KEY" ) :
print ( "✓ Using AICORE_SERVICE_KEY authentication (includes resource group)" )
else :
# Check individual variables
missing = [ v for v in individual_vars if not os . environ . get ( v ) ]
if missing :
print ( f"✗ Missing environment variables: { missing } " )
print ( "✓ Using individual variable authentication" )
print ( f"✓ Resource group: { os . environ . get ( 'AICORE_RESOURCE_GROUP' ) } " )
# Test API connection
print ( "\n=== Testing API Connection ===\n" )
try :
response = litellm . completion (
messages = [ { "role" : "user" , "content" : "Say 'Connection successful!' and nothing else." } ] ,
max_tokens = 20
print ( f"✓ API Response: { response . choices [ 0 ] . message . content } " )
print ( "\n🎉 Setup complete! You're ready to use SAP Gen AI Hub with LiteLLM." )
except Exception as e :
print ( f"✗ API Error: { e } " )
print ( "\nTroubleshooting tips:" )
print ( " 1. Verify your service key credentials are correct" )
print ( " 2. Check that 'gpt-4o' is deployed in your resource group" )
print ( " 3. Ensure your SAP AI Core instance is running" )
Run the verification:
python verify_sap_setup.py
Expected output on success:
=== SAP Gen AI Hub Setup Verification ===
✓ Using AICORE_SERVICE_KEY authentication
✓ Resource group: default
=== Testing API Connection ===
✓ API Response: Connection successful!
🎉 Setup complete! You're ready to use SAP Gen AI Hub with LiteLLM.
Authentication ​
SAP Generative AI Hub uses OAuth2 service keys for authentication. See Quick Start for setup instructions.
Environment Variables Reference ​
Variable Required Description AICORE_SERVICE_KEY Yes* Complete service key JSON (recommended method) AICORE_RESOURCE_GROUP Yes Your AI Core resource group name AICORE_AUTH_URL Yes* OAuth token URL (alternative to service key) AICORE_CLIENT_ID Yes* OAuth client ID (alternative to service key) AICORE_CLIENT_SECRET Yes* OAuth client secret (alternative to service key) AICORE_BASE_URL Yes* AI Core API base URL (alternative to service key)
*Choose either AICORE_SERVICE_KEY OR the individual variables ( AICORE_AUTH_URL , AICORE_CLIENT_ID , AICORE_CLIENT_SECRET , AICORE_BASE_URL ).
Model Naming Conventions ​
Understanding model naming is crucial for using SAP Gen AI Hub correctly. The naming pattern differs depending on whether you're using the SDK directly or through the proxy.
Direct SDK Usage ​
When calling LiteLLM's SDK directly, you must include the sap/ prefix in the model name:
# Correct - includes sap/ prefix
model = "sap/gpt-4o"
model = "sap/anthropic--claude-4.5-sonnet"
model = "sap/gemini-2.5-pro"
# Incorrect - missing prefix
model = "gpt-4o" # ❌ Won't work
Environment variables - Set the following list of credentials in .env file
AICORE_AUTH_URL = "https://* * * .authentication.sap.hana.ondemand.com/oauth/token",
AICORE_CLIENT_ID = " *** ",
AICORE_CLIENT_SECRET = " *** ",
AICORE_RESOURCE_GROUP = " *** ",
AICORE_BASE_URL = " https://api.ai.***.cfapps.sap.hana.ondemand.com/v2 "
Other credential configuration options are also available. For more information, see the SAP AI Core Documentation .
Usage - LiteLLM Python SDK ​
Proxy Usage ​
When using the LiteLLM Proxy, you use the friendly model_name defined in your configuration. The proxy automatically handles the sap/ prefix routing.
# In config.yaml, define the mapping
model_list :
- model_name : gpt - 4o # ← Use this name in client requests
litellm_params :
model : sap/gpt - 4o # ← Proxy handles the sap/ prefix
# Client request - no sap/ prefix needed
client . chat . completions . create (
model = "gpt-4o" , # ✓ Correct for proxy usage
messages = [ . . . ]
Anthropic Models Special Syntax ​
Anthropic models use a double-dash ( -- ) prefix convention:
Provider Model Example LiteLLM Format OpenAI GPT-4o sap/gpt-4o Anthropic Claude 4.5 Sonnet sap/anthropic--claude-4.5-sonnet Google Gemini 2.5 Pro sap/gemini-2.5-pro Mistral Mistral Large sap/mistral-large
Quick Reference Table ​
Usage Type Model Format Example Direct SDK sap/<model-name> sap/gpt-4o Direct SDK (Anthropic) sap/anthropic--<model> sap/anthropic--claude-4.5-sonnet Proxy Client <friendly-name> gpt-4o or claude-sonnet
Using the Python SDK ​
The LiteLLM Python SDK automatically detects your authentication method. Simply set your environment variables and make requests.
Basic Completion
# Assumes AICORE_AUTH_URL, AICORE_CLIENT_ID, etc. are set
model = "sap/anthropic--claude-4.5-sonnet" ,
messages = [ { "role" : "user" , "content" : "Explain quantum computing" } ]
Both authentication methods (individual variables or service key JSON) work automatically - no code changes required.
Using the Proxy Server ​
The LiteLLM Proxy provides a unified OpenAI-compatible API for your SAP models.
Configuration ​
Create a config.yaml file in your project directory with your model mappings and credentials:
config.yaml
# OpenAI models
- model_name : gpt - 5
model : sap/gpt - 5
# Anthropic models (note the double-dash)
- model_name : claude - sonnet
model : sap/anthropic - - claude - 4.5 - sonnet
- model_name : claude - opus
model : sap/anthropic - - claude - 4.5 - opus
# Embeddings
- model_name : text - embedding - 3 - small
model : sap/text - embedding - 3 - small
litellm_settings :
drop_params : true
set_verbose : false
request_timeout : 600
num_retries : 2
forward_client_headers_to_llm_api : [ "anthropic-version" ]
general_settings :
master_key : "sk-1234" # Enter here your desired master key starting with 'sk-'.
# UI Admin is not required but helpful including the management of keys for your team(s). If you are using a database, these parameters are required:
database_url : "Enter you database URL."
UI_USERNAME : "Your desired UI admin account name"
UI_PASSWORD : "Your desired and strong pwd"
# Authentication
environment_variables :
AICORE_SERVICE_KEY : '{"credentials": {"clientid": "...", "clientsecret": "...", "url": "...", "serviceurls": {"AI_API_URL": "..."}}}'
AICORE_RESOURCE_GROUP : "default"
Starting the Proxy ​
Start Proxy
litellm --config config.yaml
The proxy will start on http://localhost:4000 by default.
Making Requests ​
cURL
OpenAI SDK
LiteLLM SDK
Test Request
curl http://localhost:4000/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer sk-1234" \
-d '{
"model": "gpt-4o",
"messages": [{"role": "user", "content": "Hello"}]
from openai import OpenAI
client = OpenAI (
base_url = "http://localhost:4000" ,
api_key = "sk-1234"
response = client . chat . completions . create (
model = "gpt-4o" ,
messages = [ { "role" : "user" , "content" : "Hello" } ]
os . environ [ "LITELLM_PROXY_API_KEY" ] = "sk-1234"
litellm . use_litellm_proxy = True
model = "claude-sonnet" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
api_base = "http://localhost:4000"
print ( response )
Features ​
Streaming Responses ​
Stream responses in real-time for better user experience:
Streaming Chat Completion
messages = [ { "role" : "user" , "content" : "Count from 1 to 10" } ] ,
stream = True
for chunk in response :
if chunk . choices [ 0 ] . delta . content :
print ( chunk . choices [ 0 ] . delta . content , end = "" , flush = True )
Structured Output ​
JSON Schema (Recommended) ​
Use JSON Schema for structured output with strict validation:
JSON Schema Response
messages = [ {
"role" : "user" ,
"content" : "Generate info about Tokyo"
} ] ,
response_format = {
"type" : "json_schema" ,
"json_schema" : {
"name" : "city_info" ,
"schema" : {
"type" : "object" ,
"properties" : {
"name" : { "type" : "string" } ,
"population" : { "type" : "number" } ,
"country" : { "type" : "string" }
} ,
"required" : [ "name" , "population" , "country" ] ,
"additionalProperties" : False
"strict" : True
# Output: {"name":"Tokyo","population":37000000,"country":"Japan"}
JSON Object Format ​
For flexible JSON output without schema validation:
JSON Object Response
"content" : "Generate a person object in JSON format with name and age"
response_format = { "type" : "json_object" }
SAP Platform Requirement
When using json_object type, SAP's orchestration service requires the word "json" to appear in your prompt. This ensures explicit intent for JSON formatting. For schema-validated output without this requirement, use json_schema instead (recommended).
Multi-turn Conversations ​
Maintain conversation context across multiple turns:
Multi-turn Conversation
messages = [
{ "role" : "user" , "content" : "My name is Alice" } ,
{ "role" : "assistant" , "content" : "Hello Alice! Nice to meet you." } ,
{ "role" : "user" , "content" : "What is my name?" }
]
# Output: Your name is Alice.
Embeddings ​
Generate vector embeddings for semantic search and retrieval:
Create Embeddings
from litellm import embedding
response = embedding (
model = "sap/text-embedding-3-small" ,
input = [ "Hello world" , "Machine learning is fascinating" ]
print ( response . data [ 0 ] [ "embedding" ] ) # Vector representation
Additional Modules ​
The SAP Gen AI Hub includes additional modules for advanced use cases:
Grounding
Translation
Data Masking
Content Filtering
Grounding ​
Grounding is a service designed to handle data-related tasks, such as grounding and retrieval, using vector databases. It provides specialized data retrieval through these databases, grounding the retrieval process with your own external and context-relevant data. Grounding combines generative AI capabilities with the ability to use real-time, precise data to improve decision-making and business operations for specific AI-driven business solutions.
To use the Grounding module in the orchestration pipeline, you need to prepare the knowledge base in advance.
Generative AI hub offers multiple options for users to provide data (prepare a knowledge base):
For Option 1: Upload the documents to a supported data repository and run the data pipeline to vectorize the documents.
For Option 2: Provide the chunks of document via Vector API directly.
To use grounding, choose from one of the following options.
Usage example:
Grounding Example
grounding_config = {
'type' : 'document_grounding_service' ,
'config' : {
'filters' : [
{ 'id' : 's3-docs' ,
'data_repository_type' : 'vector' ,
'search_config' : { 'max_chunk_count' : 2 } ,
'data_repositories' : [ '012345-6789-0123-4567-890123456789' ]
] ,
'placeholders' : { 'input' : [ 'user_query' ] , 'output' : 'grounding_response' } ,
'metadata_params' : [ 'source' , 'webUrl' , 'title' , 'mimeType' , 'fileSuffix' ]
response = completion ( model = "sap/gpt-4o" ,
{ "content" : """Facility Solutions Company provides services to luxury residential complexes,
apartments, individual homes, and commercial properties such as office buildings, retail
spaces, industrial facilities, and educational institutions. Customers are encouraged to
reach out with maintenance requests, service deficiencies, follow-ups, or any issues they
need by email.""" , "role" : "system" } ,
{ "content" : """You are a helpful assistant for any queries for answering questions.
Answer the request by providing relevant answers that fit to the request.
Request: {{ ?user_query }}
Context:{{ ?grounding_response }}""" , "role" : "user" }
placeholder_values = { "user_query" : "Is there a complaint?" } ,
grounding = grounding_config
For more information about all available grounding configurations, see the documentation .
Translation ​
The translation module allows you to translate LLM text prompts into a chosen target language.
Translation Example
translation_config = {
'input' :
{ 'type' : 'sap_document_translation' ,
'config' :
{ 'source_language' : 'en-US' ,
'target_language' : 'de-DE' }
'output' :
{ 'source_language' : 'de-DE' ,
'target_language' : 'fr-FR' }
messages = [ { "role" : "user" , "content" : "Hello world!" } ] ,
translation = translation_config )
For more information about all available translation configurations, see the documentation
Data Masking ​
The data masking module serves to anonymize or pseudonymize personally identifiable information from the input for selected entities.
Data Masking Example
from litellm import completion , embedding
masking_config = {
'providers' :
[
'type' : 'sap_data_privacy_integration' ,
'method' : 'anonymization' ,
'entities' : [
{ 'type' : 'profile-address' } ,
{ 'type' : 'profile-email' } ,
{ 'type' : 'profile-phone' } ,
{ 'type' : 'profile-person' } ,
{ 'type' : 'profile-location' }
mock_cv = "some text with personal information"
messages = [ { "role" : "user" , "content" : "Give a one sentence summary of the CV. CV: {{?cv}}?" } ] ,
placeholder_values = { "cv" : mock_cv } ,
masking = masking_config )
# Data masking module also available for embedding
response = embedding ( model = "sap/text-embedding-3-small" ,
input = mock_cv ,
print ( response . data [ 0 ] )
For more information about all available data masking configurations, see the documentation
Content Filtering ​
The content filtering module allows you to filter input and output based on content safety criteria.
The module supports two services:
Azure Content Safety
Llama Guard 3
Content Filtering Example
filtering_config_azure = {
'filters' :
{ 'type' : 'azure_content_safety' ,
{ 'hate' : 0 ,
'sexual' : 0 ,
'violence' : 0 ,
'self_harm' : 0
'config' : { 'hate' : 0 ,
filtering = filtering_config_azure )
# The model responds normally because the content does not violate any safety rules.
messages = [ { "role" : "user" , "content" : "I hate you" } ] ,
print ( e )
# The service raises an error:
# "Input Filter: Content filtered due to safety violations. Please modify the prompt and try again."
For more information about all available content filtering configurations, see the documentation
List of modules configuration for fallback ​
SAP GEN AI Hub supports a fallback mechanism for handling errors. This mechanism allows you to specify a list of fallback modules to use in case of errors. The fallback modules should contain all parameters that are required for configuring the request.
Required parameters:
model
messages
Optional parameters:
filtering
grounding
translation
masking
tools
and any of model's specific parameters.
Fallback Example
translation = translation_config ,
fallback_sap_modules = [ {
"model" : "sap/gemini-2.5-flash" ,
"messages" : [ { "role" : "user" , "content" : "Hello world!" } ] ,
"translation" : translation_config
} ] )
# In case of error with the first configuration (model gpt-4o), the fallback module is used.
Reference ​
Supported Parameters ​
Parameter Type Description model string Model identifier (with sap/ prefix for SDK) messages array Conversation messages temperature float Controls randomness (0-2) max_tokens integer Maximum tokens in response top_p float Nucleus sampling threshold stream boolean Enable streaming responses response_format object Output format ( json_object , json_schema ) tools array Function calling tool definitions tool_choice string/object Tool selection behavior
Supported Models ​
For the complete and up-to-date list of available models provided by SAP Gen AI Hub, please refer to the SAP AI Core Generative AI Hub documentation .
Model Availability
Model availability varies by SAP deployment region and your subscription. Contact your SAP administrator to confirm which models are available in your environment.
Troubleshooting ​
Authentication Errors
If you receive authentication errors:
Verify all required environment variables are set correctly
Check that your service key hasn't expired
Confirm your resource group has access to the desired models
Ensure the AICORE_AUTH_URL and AICORE_BASE_URL match your SAP region
Model Not Found
If a model returns "not found":
Verify the model is available in your SAP deployment
Check you're using the correct model name format ( sap/ prefix for SDK)
Confirm your resource group has access to that specific model
For Anthropic models, ensure you're using the anthropic-- double-dash prefix
Rate Limiting
SAP Gen AI Hub enforces rate limits based on your subscription. If you hit limits:
Implement exponential backoff retry logic
Consider using the proxy's built-in rate limiting features
Contact your SAP administrator to review quota allocations
Prerequisites
Quick Start
Step 1: Install LiteLLM
Step 2: Set Your Credentials
Step 3: Make Your First Request
Step 4: Verify Your Setup (Optional)
Authentication
Environment Variables Reference
Model Naming Conventions
Direct SDK Usage
Usage - LiteLLM Python SDK
Proxy Usage
Anthropic Models Special Syntax
Quick Reference Table
Using the Python SDK
Using the Proxy Server
Configuration
Starting the Proxy
Making Requests
Features
Streaming Responses
Structured Output
Multi-turn Conversations
Embeddings
Additional Modules
Reference
Supported Parameters
Supported Models
Troubleshooting
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
