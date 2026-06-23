# Oracle Cloud Infrastructure (OCI) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/oci
- Final URL: https://docs.litellm.ai/docs/providers/oci
- Canonical URL: https://docs.litellm.ai/docs/providers/oci
- Fetched at: 2026-06-23T14:28:31Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports the following models for OCI on-demand GenAI API.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports the following models for OCI on-demand GenAI API.
Check the OCI Models List to see if the model is available for your region.
Supported Models ​
For model lifecycle, retirement dates, and recommended replacements, see OCI's on-demand model retirement page — Oracle is the authoritative source.
Chat / Text Generation ​
Meta Llama Models ​
meta.llama-4-maverick-17b-128e-instruct-fp8 (multimodal)
meta.llama-4-scout-17b-16e-instruct (multimodal)
meta.llama-3.3-70b-instruct
meta.llama-3.3-70b-instruct-fp8-dynamic
meta.llama-3.2-90b-vision-instruct (multimodal)
meta.llama-3.2-11b-vision-instruct (multimodal)
xAI Grok Models ​
xai.grok-4.3
xai.grok-4.20
xai.grok-4.20-multi-agent
xai.grok-4
xai.grok-4-fast
xai.grok-4.1-fast
xai.grok-3
xai.grok-3-fast
xai.grok-3-mini
xai.grok-3-mini-fast
xai.grok-code-fast-1
Cohere Models ​
cohere.command-latest
cohere.command-a-03-2025
cohere.command-a-reasoning-08-2025
cohere.command-a-vision-07-2025 (multimodal)
cohere.command-a-translate-08-2025
cohere.command-plus-latest
cohere.command-r-plus-08-2024
cohere.command-r-08-2024
Google Gemini Models (via OCI) ​
google.gemini-2.5-pro (multimodal)
google.gemini-2.5-flash (multimodal)
google.gemini-2.5-flash-lite (multimodal)
OpenAI Open-Source Models (via OCI) ​
openai.gpt-oss-120b
openai.gpt-oss-20b
Embedding Models ​
cohere.embed-v4.0 (1536 dimensions, multimodal)
cohere.embed-english-v3.0 (1024 dimensions)
cohere.embed-english-light-v3.0 (384 dimensions)
cohere.embed-multilingual-v3.0 (1024 dimensions)
cohere.embed-multilingual-light-v3.0 (384 dimensions)
cohere.embed-english-image-v3.0 (1024 dimensions, multimodal)
cohere.embed-english-light-image-v3.0 (384 dimensions, multimodal)
cohere.embed-multilingual-image-v3.0 (1024 dimensions, multimodal)
cohere.embed-multilingual-light-image-v3.0 (384 dimensions, multimodal)
Authentication ​
LiteLLM supports two authentication methods for OCI:
Method 1: Manual Credentials ​
Provide individual OCI credentials directly to LiteLLM. Follow the official Oracle tutorial to create a signing key and obtain the following parameters:
user
fingerprint
tenancy
region
key_file or key
compartment_id
This is the default method for LiteLLM AI Gateway (LLM Proxy) access to OCI GenAI models.
Environment Variables
Instead of passing credentials in code, you can set the following environment variables — LiteLLM will read them automatically:
export OCI_REGION="us-chicago-1"
export OCI_USER="ocid1.user.oc1.."
export OCI_FINGERPRINT="xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
export OCI_TENANCY="ocid1.tenancy.oc1.."
export OCI_COMPARTMENT_ID="ocid1.compartment.oc1.."
# Provide either the private key content OR the path to the key file:
export OCI_KEY_FILE="/path/to/oci_api_key.pem"
# export OCI_KEY="-----BEGIN PRIVATE KEY-----\n..."
Method 2: OCI SDK Signer ​
Use an OCI SDK Signer object for authentication. This method:
Leverages the official OCI SDK for signing
Supports additional authentication methods (instance principals, workload identity, etc.)
To use this method, install the OCI SDK:
uv add oci
This method is an alternative when using the LiteLLM SDK on Oracle Cloud Infrastructure (instances or Oracle Kubernetes Engine).
Usage ​
Manual Credentials
OCI SDK Signer
Input the parameters obtained from the OCI signing key creation process into the completion function:
from litellm import completion
messages = [ { "role" : "user" , "content" : "Hey! how's it going?" } ]
response = completion (
model = "oci/xai.grok-4" ,
messages = messages ,
oci_region = < your_oci_region > ,
oci_user = < your_oci_user > ,
oci_fingerprint = < your_oci_fingerprint > ,
oci_tenancy = < your_oci_tenancy > ,
oci_serving_mode = "ON_DEMAND" , # Optional, default is "ON_DEMAND". Other option is "DEDICATED"
# Provide either the private key string OR the path to the key file:
# Option 1: pass the private key as a string
oci_key = < string_with_content_of_oci_key > ,
# Option 2: pass the private key file path
# oci_key_file="<path/to/oci_key.pem>",
oci_compartment_id = < oci_compartment_id > ,
)
print ( response )
Use the OCI SDK Signer for authentication:
from oci . signer import Signer
# Create an OCI Signer
signer = Signer (
tenancy = "ocid1.tenancy.oc1.." ,
user = "ocid1.user.oc1.." ,
fingerprint = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx" ,
private_key_file_location = "~/.oci/key.pem" ,
# Or use private_key_content="<your_private_key_content>"
oci_signer = signer ,
oci_region = "us-chicago-1" , # Optional, defaults to us-ashburn-1
oci_compartment_id = "<oci_compartment_id>" ,
Alternative: Use OCI Config File
The OCI SDK can automatically load credentials from ~/.oci/config :
from oci . config import from_file
# Load config from file
config = from_file ( "~/.oci/config" , "DEFAULT" ) # "DEFAULT" is the profile name
tenancy = config [ "tenancy" ] ,
user = config [ "user" ] ,
fingerprint = config [ "fingerprint" ] ,
private_key_file_location = config [ "key_file" ] ,
pass_phrase = config . get ( "pass_phrase" ) # Optional if key is encrypted
oci_region = config [ "region" ] ,
Instance Principal Authentication
For applications running on OCI compute instances:
from oci . auth . signers import InstancePrincipalsSecurityTokenSigner
# Use instance principal authentication
signer = InstancePrincipalsSecurityTokenSigner ( )
oci_region = "us-chicago-1" ,
Workload Identity Authentication
For applications running in Oracle Kubernetes Engine (OKE):
from oci . auth . signers import get_oke_workload_identity_resource_principal_signer
# Use workload identity authentication
signer = get_oke_workload_identity_resource_principal_signer ( )
LiteLLM Proxy Usage ​
Here's how to call OCI GenAI through the LiteLLM Proxy Server.
1. Setup config.yaml ​
model_list :
- model_name : oci - grok - 4
litellm_params :
model : oci/xai.grok - 4
oci_region : os.environ/OCI_REGION
oci_user : os.environ/OCI_USER
oci_fingerprint : os.environ/OCI_FINGERPRINT
oci_tenancy : os.environ/OCI_TENANCY
oci_key_file : os.environ/OCI_KEY_FILE
oci_compartment_id : os.environ/OCI_COMPARTMENT_ID
- model_name : oci - cohere - command
model : oci/cohere.command - latest
All possible auth params:
oci_region: Optional[str],
oci_user: Optional[str],
oci_fingerprint: Optional[str],
oci_tenancy: Optional[str],
oci_key: Optional[str], # private key content as string
oci_key_file: Optional[str], # path to .pem file
oci_compartment_id: Optional[str],
oci_serving_mode: Optional[str], # "ON_DEMAND" (default) or "DEDICATED"
oci_endpoint_id: Optional[str], # only used with DEDICATED
2. Start the proxy ​
litellm --config /path/to/config.yaml
3. Test it ​
Curl Request
OpenAI v1.0.0+
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "oci-grok-4",
"messages": [
{"role": "user", "content": "what llm are you"}
]
}'
import openai
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "oci-grok-4" ,
messages = [ { "role" : "user" , "content" : "write a short poem" } ] ,
Usage - Streaming ​
Just set stream=True when calling completion.
stream = True ,
for chunk in response :
print ( chunk [ "choices" ] [ 0 ] [ "delta" ] [ "content" ] ) # same as openai format
Usage Examples by Model Type ​
Using Cohere Models ​
messages = [ { "role" : "user" , "content" : "Explain quantum computing" } ]
model = "oci/cohere.command-latest" ,
Using Dedicated Endpoints ​
OCI supports dedicated endpoints for hosting models. Use the oci_serving_mode="DEDICATED" parameter along with oci_endpoint_id to specify the endpoint ID.
model = "oci/xai.grok-4" , # Must match the model type hosted on the endpoint
oci_serving_mode = "DEDICATED" ,
oci_endpoint_id = "ocid1.generativeaiendpoint.oc1..." , # Your dedicated endpoint OCID
Important: When using oci_serving_mode="DEDICATED" :
The model parameter must match the type of model hosted on your dedicated endpoint (e.g., use "oci/cohere.command-latest" for Cohere models, "oci/xai.grok-4" for Grok models)
The model name determines the API format and vendor-specific handling (Cohere vs Generic)
The oci_endpoint_id parameter specifies your dedicated endpoint's OCID
If oci_endpoint_id is not provided, the model parameter will be used as the endpoint ID (for backward compatibility)
Example with Cohere Dedicated Endpoint:
# For a dedicated endpoint hosting a Cohere model
model = "oci/cohere.command-latest" , # Use Cohere model name to get Cohere API format
oci_endpoint_id = "ocid1.generativeaiendpoint.oc1..." , # Your Cohere endpoint OCID
Usage - Function Calling / Tool Calling ​
OCI GenAI supports OpenAI-compatible function calling. LiteLLM normalizes the request and response shape so the same code that targets OpenAI works with OCI Cohere and Generic (xAI Grok, Meta Llama, Google Gemini) models.
SDK
PROXY
tools = [
{
"type" : "function" ,
"function" : {
"name" : "get_current_weather" ,
"description" : "Get the current weather in a given location" ,
"parameters" : {
"type" : "object" ,
"properties" : {
"location" : {
"type" : "string" ,
"description" : "The city and state, e.g. San Francisco, CA" ,
} ,
"unit" : { "type" : "string" , "enum" : [ "celsius" , "fahrenheit" ] } ,
"required" : [ "location" ] ,
}
messages = [ { "role" : "user" , "content" : "What's the weather in Boston today?" } ] ,
tools = tools ,
tool_choice = "auto" ,
oci_user = "<your_oci_user>" ,
oci_fingerprint = "<your_oci_fingerprint>" ,
oci_tenancy = "<your_oci_tenancy>" ,
oci_key_file = "<path/to/oci_key.pem>" ,
# Inspect the tool call
print ( response . choices [ 0 ] . message . tool_calls )
client = openai . OpenAI ( api_key = "anything" , base_url = "http://0.0.0.0:4000" )
"location" : { "type" : "string" } ,
] ,
Tool calling works with both Cohere ( cohere.command-* ) and Generic ( xai.grok-* , meta.llama-* , google.gemini-* ) model families — LiteLLM adapts the OpenAI tool schema to each vendor's native format internally.
Usage - Vision / Multimodal ​
OCI GenAI exposes vision-capable models that accept images alongside text. Pass images using the standard OpenAI image_url content block.
model = "oci/meta.llama-4-maverick-17b-128e-instruct-fp8" ,
messages = [
"role" : "user" ,
"content" : [
{ "type" : "text" , "text" : "What is in this image?" } ,
"type" : "image_url" ,
"image_url" : {
"url" : "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
print ( response . choices [ 0 ] . message . content )
Vision-capable models on OCI include:
meta.llama-4-maverick-17b-128e-instruct-fp8
meta.llama-4-scout-17b-16e-instruct
meta.llama-3.2-11b-vision-instruct
meta.llama-3.2-90b-vision-instruct
cohere.command-a-vision-07-2025
google.gemini-2.5-pro , google.gemini-2.5-flash , google.gemini-2.5-flash-lite
Both URL and base64-encoded data URIs are supported.
Usage - Reasoning / Thinking ​
OCI Generic-vendor models (xAI Grok reasoning variants, Google Gemini, etc.) support a reasoning step. LiteLLM exposes this via the OpenAI-compatible reasoning_effort parameter — accepted values are "low" , "medium" , "high" , and "disable" (mapped to OCI's NONE ).
Returned reasoning tokens are surfaced on usage.completion_tokens_details.reasoning_tokens , matching the OpenAI shape.
model = "oci/xai.grok-3-mini" ,
messages = [ { "role" : "user" , "content" : "If 3x + 7 = 22, what is x? Show your reasoning." } ] ,
reasoning_effort = "high" , # "low" | "medium" | "high" | "disable"
print ( "Reasoning tokens:" , response . usage . completion_tokens_details . reasoning_tokens )
model = "oci-grok-mini" ,
messages = [ { "role" : "user" , "content" : "If 3x + 7 = 22, what is x?" } ] ,
reasoning_effort = "high" ,
note
reasoning_effort is only honored on Generic-vendor reasoning models (e.g., xai.grok-3-mini , xai.grok-4 , google.gemini-2.5-pro ). It is silently ignored for OCI Cohere models, which are not reasoning models.
Optional Parameters ​
Parameter Type Default Environment Variable Description oci_region string us-ashburn-1 OCI_REGION OCI region where the GenAI service is deployed oci_serving_mode string ON_DEMAND – Service mode: ON_DEMAND for managed models or DEDICATED for dedicated endpoints oci_endpoint_id string Same as model – (For DEDICATED mode) The OCID of your dedicated endpoint oci_compartment_id string Required OCI_COMPARTMENT_ID The OCID of the OCI compartment containing your resources oci_user string – OCI_USER (Manual auth) The OCID of the OCI user oci_fingerprint string – OCI_FINGERPRINT (Manual auth) The fingerprint of the API signing key oci_tenancy string – OCI_TENANCY (Manual auth) The OCID of your OCI tenancy oci_key string – OCI_KEY (Manual auth) The private key content as a string oci_key_file string – OCI_KEY_FILE (Manual auth) Path to the private key file oci_signer object – – (SDK auth) OCI SDK Signer object for authentication reasoning_effort string – – Reasoning level for Generic-vendor reasoning models: low , medium , high , disable
Embeddings ​
LiteLLM supports OCI Generative AI embedding models. These models use the same authentication methods described above.
from litellm import embedding
response = embedding (
model = "oci/cohere.embed-english-v3.0" ,
input = [ "Hello world" , "Goodbye world" ] ,
oci_region = "us-ashburn-1" ,
Embedding Optional Parameters ​
Parameter Type Default Description input_type string - The type of input: search_document , search_query , classification , clustering truncate string END Truncation strategy when input exceeds max tokens: END or START
Using Dedicated Embedding Endpoints ​
input = [ "Hello world" ] ,
oci_endpoint_id = "ocid1.generativeaiendpoint.oc1..." ,
# ... auth params
Supported Models
Chat / Text Generation
Embedding Models
Authentication
Method 1: Manual Credentials
Method 2: OCI SDK Signer
Usage
LiteLLM Proxy Usage
1. Setup config.yaml
2. Start the proxy
3. Test it
Usage - Streaming
Usage Examples by Model Type
Using Cohere Models
Using Dedicated Endpoints
Usage - Function Calling / Tool Calling
Usage - Vision / Multimodal
Usage - Reasoning / Thinking
Optional Parameters
Embeddings
Embedding Optional Parameters
Using Dedicated Embedding Endpoints
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
