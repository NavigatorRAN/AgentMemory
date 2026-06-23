# Drop Unsupported Params | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/drop_params
- Final URL: https://docs.litellm.ai/docs/completion/drop_params
- Canonical URL: https://docs.litellm.ai/docs/completion/drop_params
- Fetched at: 2026-06-23T14:23:08Z
- Content type: text/html; charset=utf-8

## Description

Drop unsupported OpenAI params by your LLM Provider.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Drop unsupported OpenAI params by your LLM Provider.
Default Behavior ​
By default, LiteLLM raises an exception if you send a parameter to a model that doesn't support it.
For example, if you send temperature=0.2 to a model that doesn't support the temperature parameter, LiteLLM will raise an exception.
When drop_params=True is set , LiteLLM will drop the unsupported parameter instead of raising an exception. This allows your code to work seamlessly across different providers without having to customize parameters for each one.
Quick Start ​
import litellm
import os
# set keys
os . environ [ "COHERE_API_KEY" ] = "co-.."
litellm . drop_params = True # 👈 KEY CHANGE
response = litellm . completion (
model = "command-r" ,
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ] ,
response_format = { "key" : "value" } ,
)
LiteLLM maps all supported openai params by provider + model (e.g. function calling is supported by anthropic on bedrock but not titan).
See litellm.get_supported_openai_params("command-r") Code
If a provider/model doesn't support a particular param, you can drop it.
OpenAI Proxy Usage ​
litellm_settings :
drop_params : true
Pass drop_params in completion(..) ​
Just drop_params when calling specific models
SDK
PROXY
drop_params = True
- litellm_params :
api_base : my - base
model : openai/my - model
drop_params : true # 👈 KEY CHANGE
model_name : my - model
Specify params to drop ​
To drop specific params when calling a provider (E.g. 'logit_bias' for vllm)
Use additional_drop_params
additional_drop_params = [ "response_format" ]
additional_drop_params : [ "response_format" ] # 👈 KEY CHANGE
additional_drop_params : List or null - Is a list of openai params you want to drop when making a call to the model.
Nested Field Removal ​
Drop nested fields within complex objects using JSONPath-like notation:
model = "bedrock/us.anthropic.claude-sonnet-4-5-20250929-v1:0" ,
messages = [ { "role" : "user" , "content" : "Hello" } ] ,
tools = [ {
"name" : "search" ,
"description" : "Search files" ,
"input_schema" : { "type" : "object" , "properties" : { "query" : { "type" : "string" } } } ,
"input_examples" : [ { "query" : "test" } ] # Will be removed
} ] ,
additional_drop_params = [ "tools[*].input_examples" ] # Remove from all tools
model_list :
- model_name : my - bedrock - model
litellm_params :
model : bedrock/us.anthropic.claude - sonnet - 4 - 5 - 20250929 - v1 : 0
additional_drop_params : [ "tools[*].input_examples" ] # Remove from all tools
Supported syntax:
field - Top-level field
parent.child - Nested object field
array[*] - All array elements
array[0] - Specific array index
tools[*].input_examples - Field in all array elements
tools[0].metadata.field - Specific index + nested field
Example use cases:
Remove input_examples from tool definitions (Claude Code + AWS Bedrock)
Drop provider-specific fields from nested structures
Clean up nested parameters before sending to LLM
Specify allowed openai params in a request ​
Tell litellm to allow specific openai params in a request. Use this if you get a litellm.UnsupportedParamsError and want to allow a param. LiteLLM will pass the param as is to the model.
LiteLLM Python SDK
LiteLLM Proxy
In this example we pass allowed_openai_params=["tools"] to allow the tools param.
Pass allowed_openai_params to LiteLLM Python SDK
await litellm . acompletion (
model = "azure/o_series/<my-deployment-name>" ,
api_key = "xxxxx" ,
api_base = api_base ,
messages = [ { "role" : "user" , "content" : "Hello! return a json object" } ] ,
tools = [ { "type" : "function" , "function" : { "name" : "get_current_time" , "description" : "Get the current time in a given location." , "parameters" : { "type" : "object" , "properties" : { "location" : { "type" : "string" , "description" : "The city name, e.g. San Francisco" } } , "required" : [ "location" ] } } } ]
allowed_openai_params = [ "tools" ] ,
When using litellm proxy you can pass allowed_openai_params in two ways:
Dynamically pass allowed_openai_params in a request
Set allowed_openai_params on the config.yaml file for a specific model
Dynamically pass allowed_openai_params in a request ​
In this example we pass allowed_openai_params=["tools"] to allow the tools param for a request sent to the model set on the proxy.
import openai
from openai import AsyncAzureOpenAI
client = openai . OpenAI (
api_key = "anything" ,
base_url = "http://0.0.0.0:4000"
response = client . chat . completions . create (
model = "gpt-3.5-turbo" ,
messages = [
{
"role" : "user" ,
"content" : "this is a test request, write a short poem"
}
] ,
extra_body = {
"allowed_openai_params" : [ "tools" ]
Set allowed_openai_params on config.yaml ​
You can also set allowed_openai_params on the config.yaml file for a specific model. This means that all requests to this deployment are allowed to pass in the tools param.
Set allowed_openai_params on config.yaml
- model_name : azure - o1 - preview
model : azure/o_series/<my - deployment - name >
api_key : xxxxx
api_base : https : //openai - prod - test.openai.azure.com/openai/deployments/o1/chat/completions ? api - version=2025 - 01 - 01 - preview
allowed_openai_params : [ "tools" ]
Default Behavior
Quick Start
OpenAI Proxy Usage
Pass drop_params in completion(..)
Specify params to drop
Nested Field Removal
Specify allowed openai params in a request
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
