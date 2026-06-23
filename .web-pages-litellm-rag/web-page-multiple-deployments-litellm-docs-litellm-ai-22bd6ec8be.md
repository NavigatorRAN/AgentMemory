# Multiple Deployments | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/completion/multiple_deployments
- Final URL: https://docs.litellm.ai/docs/completion/multiple_deployments
- Canonical URL: https://docs.litellm.ai/docs/completion/multiple_deployments
- Fetched at: 2026-06-23T14:23:19Z
- Content type: text/html; charset=utf-8

## Description

If you have multiple deployments of the same model, you can pass the list of deployments, and LiteLLM will return the first result.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
If you have multiple deployments of the same model, you can pass the list of deployments, and LiteLLM will return the first result.
Quick Start ​
Multiple providers offer Mistral-7B-Instruct.
Here's how you can use litellm to return the first result:
from litellm import completion
messages = [ { "role" : "user" , "content" : "Hey, how's it going?" } ]
## All your mistral deployments ##
model_list = [ {
"model_name" : "mistral-7b-instruct" ,
"litellm_params" : { # params for litellm completion/embedding call
"model" : "replicate/mistralai/mistral-7b-instruct-v0.1:83b6a56e7c828e667f21fd596c338fd4f0039b46bcfa18d973e8e70e455fda70" ,
"api_key" : "replicate_api_key" ,
}
} , {
"model" : "together_ai/mistralai/Mistral-7B-Instruct-v0.1" ,
"api_key" : "togetherai_api_key" ,
"model" : "perplexity/mistral-7b-instruct" ,
"api_key" : "perplexity_api_key"
"litellm_params" : {
"model" : "deepinfra/mistralai/Mistral-7B-Instruct-v0.1" ,
"api_key" : "deepinfra_api_key"
} ]
## LiteLLM completion call ## returns first response
response = completion ( model = "mistral-7b-instruct" , messages = messages , model_list = model_list )
print ( response )
Quick Start
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
