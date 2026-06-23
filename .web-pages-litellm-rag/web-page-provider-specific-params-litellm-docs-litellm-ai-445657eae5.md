# provider_specific_params | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/provider_specific_params
- Final URL: https://docs.litellm.ai/docs/tutorials/provider_specific_params
- Canonical URL: https://docs.litellm.ai/docs/tutorials/provider_specific_params
- Fetched at: 2026-06-23T14:34:38Z
- Content type: text/html; charset=utf-8

## Description

Setting provider-specific Params

## Extracted Text

Skip to main content
On this page
Setting provider-specific Params ​
Goal: Set max tokens across OpenAI + Cohere
1. via completion
LiteLLM will automatically translate max_tokens to the naming convention followed by that specific model provider.
from litellm import completion
import os
## set ENV variables
os . environ [ "OPENAI_API_KEY" ] = "your-openai-key"
os . environ [ "COHERE_API_KEY" ] = "your-cohere-key"
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
# openai call
response = completion ( model = "gpt-3.5-turbo" , messages = messages , max_tokens = 100 )
# cohere call
response = completion ( model = "command-nightly" , messages = messages , max_tokens = 100 )
print ( response )
2. via provider-specific config
For every provider on LiteLLM, we've gotten their specific params (following their naming conventions, etc.). You can just set it for that provider by pulling up that provider via litellm.<provider_name>Config .
All provider configs are typed and have docstrings, so you should see them autocompleted for you in VSCode with an explanation of what it means.
Here's an example of setting max tokens through provider configs.
Setting provider-specific Params
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
