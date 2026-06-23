# [BETA] Image Variations | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/image_variations
- Final URL: https://docs.litellm.ai/docs/image_variations
- Canonical URL: https://docs.litellm.ai/docs/image_variations
- Fetched at: 2026-06-23T14:24:14Z
- Content type: text/html; charset=utf-8

## Description

OpenAI's /image/variations endpoint is now supported.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
OpenAI's /image/variations endpoint is now supported.
Quick Start ​
from litellm import image_variation
import os
# set env vars
os . environ [ "OPENAI_API_KEY" ] = ""
os . environ [ "TOPAZ_API_KEY" ] = ""
# openai call
response = image_variation (
model = "dall-e-2" , image = image_url
)
# topaz call
model = "topaz/Standard V2" , image = image_url
print ( response )
Supported Providers ​
OpenAI
Topaz
Quick Start
Supported Providers
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
