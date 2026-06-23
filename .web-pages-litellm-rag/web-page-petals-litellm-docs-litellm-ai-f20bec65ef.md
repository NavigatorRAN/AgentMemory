# Petals | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/providers/petals
- Final URL: https://docs.litellm.ai/docs/providers/petals
- Canonical URL: https://docs.litellm.ai/docs/providers/petals
- Fetched at: 2026-06-23T14:28:43Z
- Content type: text/html; charset=utf-8

## Description

Petals//github.com/bigscience-workshop/petals

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Petals: https://github.com/bigscience-workshop/petals
Pre-Requisites ​
Ensure you have petals installed
uv add git+https://github.com/bigscience-workshop/petals
Usage ​
Ensure you add petals/ as a prefix for all petals LLMs. This sets the custom_llm_provider to petals
from litellm import completion
response = completion (
model = "petals/petals-team/StableBeluga2" ,
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ]
)
print ( response )
Usage with Streaming ​
messages = [ { "content" : "Hello, how are you?" , "role" : "user" } ] ,
stream = True
for chunk in response :
print ( chunk )
Model Details ​
Model Name Function Call petals-team/StableBeluga completion('petals/petals-team/StableBeluga2', messages) huggyllama/llama-65b completion('petals/huggyllama/llama-65b', messages)
Pre-Requisites
Usage
Usage with Streaming
Model Details
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
