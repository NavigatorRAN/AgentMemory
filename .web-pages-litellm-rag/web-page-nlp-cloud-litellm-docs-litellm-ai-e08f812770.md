# NLP Cloud | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/nlp_cloud
- Final URL: https://docs.litellm.ai/docs/providers/nlp_cloud
- Canonical URL: https://docs.litellm.ai/docs/providers/nlp_cloud
- Fetched at: 2026-06-23T14:28:25Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM supports all LLMs on NLP Cloud.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM supports all LLMs on NLP Cloud.
API Keys ​
import os
os . environ [ "NLP_CLOUD_API_KEY" ] = "your-api-key"
Sample Usage ​
from litellm import completion
# set env
messages = [ { "role" : "user" , "content" : "Hey! how's it going?" } ]
response = completion ( model = "dolphin" , messages = messages )
print ( response )
streaming ​
Just set stream=True when calling completion.
response = completion ( model = "dolphin" , messages = messages , stream = True )
for chunk in response :
print ( chunk [ "choices" ] [ 0 ] [ "delta" ] [ "content" ] ) # same as openai format
non-dolphin models ​
By default, LiteLLM will map dolphin and chatdolphin to nlp cloud.
If you're trying to call any other model (e.g. GPT-J, Llama-2, etc.) with nlp cloud, just set it as your custom llm provider.
# set env - [OPTIONAL] replace with your nlp cloud key
# e.g. to call Llama2 on NLP Cloud
response = completion ( model = "nlp_cloud/finetuned-llama-2-70b" , messages = messages , stream = True )
API Keys
Sample Usage
streaming
non-dolphin models
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
