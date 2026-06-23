# Promptlayer Tutorial | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/observability/promptlayer_integration
- Final URL: https://docs.litellm.ai/docs/observability/promptlayer_integration
- Canonical URL: https://docs.litellm.ai/docs/observability/promptlayer_integration
- Fetched at: 2026-06-23T14:25:29Z
- Content type: text/html; charset=utf-8

## Description

This is community maintained, Please make an issue if you run into a bug

## Extracted Text

Skip to main content
On this page
Copy as Markdown
tip
This is community maintained, Please make an issue if you run into a bug
https://github.com/BerriAI/litellm
Promptlayer is a platform for prompt engineers. Log OpenAI requests. Search usage history. Track performance. Visually manage prompt templates.
Use Promptlayer to log requests across all LLM Providers (OpenAI, Azure, Anthropic, Cohere, Replicate, PaLM) ​
liteLLM provides callbacks , making it easy for you to log data depending on the status of your responses.
Using Callbacks ​
Get your PromptLayer API Key from https://promptlayer.com/
Use just 2 lines of code, to instantly log your responses across all providers with promptlayer:
litellm . success_callback = [ "promptlayer" ]
Complete code
from litellm import completion
## set env variables
os . environ [ "PROMPTLAYER_API_KEY" ] = "your-promptlayer-key"
os . environ [ "OPENAI_API_KEY" ] , os . environ [ "COHERE_API_KEY" ] = "" , ""
# set callbacks
#openai call
response = completion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm openai" } ] )
#cohere call
response = completion ( model = "command-nightly" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm cohere" } ] )
Logging Metadata ​
You can also log completion call metadata to Promptlayer.
You can add metadata to a completion call through the metadata param:
completion ( model , messages , metadata = { "model" : "ai21" } )
Complete Code
#openai call - log llm provider is openai
response = completion ( model = "gpt-3.5-turbo" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm openai" } ] , metadata = { "provider" : "openai" } )
#cohere call - log llm provider is cohere
response = completion ( model = "command-nightly" , messages = [ { "role" : "user" , "content" : "Hi 👋 - i'm cohere" } ] , metadata = { "provider" : "cohere" } )
Credits to Nick Bradford , from Vim-GPT , for the suggestion.
Support & Talk to Founders ​
Schedule Demo 👋
Community Discord 💭
Our emails ✉️ ishaan@berri.ai / krrish@berri.ai
Use Promptlayer to log requests across all LLM Providers (OpenAI, Azure, Anthropic, Cohere, Replicate, PaLM)
Using Callbacks
Logging Metadata
Support & Talk to Founders
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
