# Oobabooga Text Web API Tutorial | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/oobabooga
- Final URL: https://docs.litellm.ai/docs/tutorials/oobabooga
- Canonical URL: https://docs.litellm.ai/docs/tutorials/oobabooga
- Fetched at: 2026-06-23T14:34:31Z
- Content type: text/html; charset=utf-8

## Description

Install + Import LiteLLM

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Install + Import LiteLLM ​
!uv add litellm
from litellm import completion
import os
Call your oobabooga model ​
Remember to set your api_base
response = completion (
model = "oobabooga/WizardCoder-Python-7B-V1.0-GPTQ" ,
messages = [ { "content" : "can you write a binary tree traversal preorder" , "role" : "user" } ] ,
api_base = "http://localhost:5000" ,
max_tokens = 4000
)
See your response ​
print ( response )
Credits to Shuai Shao , for this tutorial.
Install + Import LiteLLM
Call your oobabooga model
See your response
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
