# Predibase | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/predibase
- Final URL: https://docs.litellm.ai/docs/providers/predibase
- Canonical URL: https://docs.litellm.ai/docs/providers/predibase
- Fetched at: 2026-06-23T14:28:46Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all models on Predibase

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all models on Predibase
Usage ​
SDK
PROXY
API KEYS ​
import os
os . environ [ "PREDIBASE_API_KEY" ] = ""
Example Call ​
from litellm import completion
## set ENV variables
os . environ [ "PREDIBASE_API_KEY" ] = "predibase key"
os . environ [ "PREDIBASE_TENANT_ID" ] = "predibase tenant id"
# predibase llama-3 call
response = completion (
model = "predibase/llama-3-8b-instruct" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
Add models to your config.yaml
model_list :
- model_name : llama - 3
litellm_params :
model : predibase/llama - 3 - 8b - instruct
api_key : os.environ/PREDIBASE_API_KEY
tenant_id : os.environ/PREDIBASE_TENANT_ID
Start the proxy
$ litellm --config /path/to/config.yaml --debug
Send Request to LiteLLM Proxy Server
OpenAI Python v1.0.0+
curl
import openai
client = openai . OpenAI (
api_key = "sk-1234" , # pass litellm proxy key, if you're using virtual keys
base_url = "http://0.0.0.0:4000" # litellm-proxy-base url
response = client . chat . completions . create (
model = "llama-3" ,
messages = [
{
"role" : "system" ,
"content" : "Be a good human!"
} ,
"role" : "user" ,
"content" : "What do you know about earth?"
}
]
print ( response )
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Authorization: Bearer sk-1234' \
--header 'Content-Type: application/json' \
--data '{
"model": "llama-3",
"messages": [
"role": "system",
"content": "Be a good human!"
},
"role": "user",
"content": "What do you know about earth?"
],
}'
Advanced Usage - Prompt Formatting ​
LiteLLM has prompt template mappings for all meta-llama llama3 instruct models. See Code
To apply a custom prompt template:
import litellm
# Create your own custom prompt template
litellm . register_prompt_template (
model = "togethercomputer/LLaMA-2-7B-32K" ,
initial_prompt_value = "You are a good assistant" # [OPTIONAL]
roles = {
"system" : {
"pre_message" : "[INST] <<SYS>>\n" , # [OPTIONAL]
"post_message" : "\n<</SYS>>\n [/INST]\n" # [OPTIONAL]
"user" : {
"pre_message" : "[INST] " , # [OPTIONAL]
"post_message" : " [/INST]" # [OPTIONAL]
"assistant" : {
"pre_message" : "\n" # [OPTIONAL]
"post_message" : "\n" # [OPTIONAL]
final_prompt_value = "Now answer as best you can:" # [OPTIONAL]
def predibase_custom_model ( ) :
model = "predibase/togethercomputer/LLaMA-2-7B-32K"
response = completion ( model = model , messages = messages )
print ( response [ 'choices' ] [ 0 ] [ 'message' ] [ 'content' ] )
return response
predibase_custom_model ( )
# Model-specific parameters
- model_name : mistral - 7b # model alias
litellm_params : # actual params for litellm.completion()
model : "predibase/mistralai/Mistral-7B-Instruct-v0.1"
initial_prompt_value : "\n"
roles : { "system" : { "pre_message" : "<|im_start|>system\n" , "post_message" : "<|im_end|>" } , "assistant" : { "pre_message" : "<|im_start|>assistant\n" , "post_message" : "<|im_end|>" } , "user" : { "pre_message" : "<|im_start|>user\n" , "post_message" : "<|im_end|>" } }
final_prompt_value : "\n"
bos_token : "<s>"
eos_token : "</s>"
max_tokens : 4096
Passing additional params - max_tokens, temperature ​
See all litellm.completion supported params here
# !uv add litellm
# predibae llama-3 call
model = "predibase/llama3-8b-instruct" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
max_tokens = 20 ,
temperature = 0.5
proxy
max_tokens : 20
temperature : 0.5
Passings Predibase specific params - adapter_id, adapter_source, ​
Send params not supported by litellm.completion() but supported by Predibase by passing them to litellm.completion
Example adapter_id , adapter_source are Predibase specific param - See List
# predibase llama3 call
adapter_id = "my_repo/3" ,
adapter_source = "pbase" ,
adapter_id : my_repo/3
adapter_source : pbase
Usage
API KEYS
Example Call
Advanced Usage - Prompt Formatting
Passing additional params - max_tokens, temperature
Passings Predibase specific params - adapter_id, adapter_source,
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
