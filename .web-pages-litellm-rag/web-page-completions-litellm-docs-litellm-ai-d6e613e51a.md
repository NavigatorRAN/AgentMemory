# /completions | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/text_completion
- Final URL: https://docs.litellm.ai/docs/text_completion
- Canonical URL: https://docs.litellm.ai/docs/text_completion
- Fetched at: 2026-06-23T14:33:28Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
Feature Supported Notes Cost Tracking ✅ Works with all supported models Logging ✅ Works across all integrations End-user Tracking ✅ Streaming ✅ Fallbacks ✅ Works between supported models Loadbalancing ✅ Works between supported models Guardrails ✅ Applies to input prompts and output text (non-streaming only) Supported Providers All Chat Completion Providers
Usage ​
LiteLLM Python SDK
LiteLLM Proxy Server
from litellm import text_completion
response = text_completion (
model = "gpt-3.5-turbo-instruct" ,
prompt = "Say this is a test" ,
max_tokens = 7
)
Define models on config.yaml
model_list :
- model_name : gpt - 3.5 - turbo - instruct
litellm_params :
model : text - completion - openai/gpt - 3.5 - turbo - instruct # The `text-completion-openai/` prefix will call openai.completions.create
api_key : os.environ/OPENAI_API_KEY
- model_name : text - davinci - 003
model : text - completion - openai/text - davinci - 003
Start litellm proxy server
litellm --config config.yaml
OpenAI Python SDK
Curl Request
from openai import OpenAI
# set base_url to your proxy server
# set api_key to send to proxy server
client = OpenAI ( api_key = "<proxy-api-key>" , base_url = "http://0.0.0.0:4000" )
response = client . completions . create (
print ( response )
curl --location 'http://0.0.0.0:4000/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer sk-1234' \
--data '{
"model": "gpt-3.5-turbo-instruct",
"prompt": "Say this is a test",
"max_tokens": 7
}'
Input Params ​
LiteLLM accepts and translates the OpenAI Text Completion params across all supported providers.
Required Fields ​
model : string - ID of the model to use
prompt : string or array - The prompt(s) to generate completions for
Optional Fields ​
best_of : integer - Generates best_of completions server-side and returns the "best" one
echo : boolean - Echo back the prompt in addition to the completion.
frequency_penalty : number - Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency.
logit_bias : map - Modify the likelihood of specified tokens appearing in the completion
logprobs : integer - Include the log probabilities on the logprobs most likely tokens. Max value of 5
max_tokens : integer - The maximum number of tokens to generate.
n : integer - How many completions to generate for each prompt.
presence_penalty : number - Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far.
seed : integer - If specified, system will attempt to make deterministic samples
stop : string or array - Up to 4 sequences where the API will stop generating tokens
stream : boolean - Whether to stream back partial progress. Defaults to false
suffix : string - The suffix that comes after a completion of inserted text
temperature : number - What sampling temperature to use, between 0 and 2.
top_p : number - An alternative to sampling with temperature, called nucleus sampling.
user : string - A unique identifier representing your end-user
Output Format ​
Here's the exact JSON output format you can expect from completion calls:
Follows OpenAI's output format
Non-Streaming Response
Streaming Response
{
"id" : "cmpl-uqkvlQyYK7bGYrRHQ0eXlWi7" ,
"object" : "text_completion" ,
"created" : 1589478378 ,
"model" : "gpt-3.5-turbo-instruct" ,
"system_fingerprint" : "fp_44709d6fcb" ,
"choices" : [
"text" : "\n\nThis is indeed a test" ,
"index" : 0 ,
"logprobs" : null ,
"finish_reason" : "length"
}
] ,
"usage" : {
"prompt_tokens" : 5 ,
"completion_tokens" : 7 ,
"total_tokens" : 12
"id" : "cmpl-7iA7iJjj8V2zOkCGvWF2hAkDWBQZe" ,
"created" : 1690759702 ,
"text" : "This" ,
"finish_reason" : null
"model" : "gpt-3.5-turbo-instruct"
Supported Providers ​
Provider Link to Usage OpenAI Usage Azure OpenAI Usage
Overview
Usage
Input Params
Required Fields
Optional Fields
Output Format
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
