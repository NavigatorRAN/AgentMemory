# Image URL Handling | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/image_handling
- Final URL: https://docs.litellm.ai/docs/proxy/image_handling
- Canonical URL: https://docs.litellm.ai/docs/proxy/image_handling
- Fetched at: 2026-06-23T14:31:10Z
- Content type: text/html; charset=utf-8

## Description

Some LLM API's don't support url's for images, but do support base-64 strings.

## Extracted Text

Skip to main content
Copy as Markdown
Some LLM API's don't support url's for images, but do support base-64 strings.
For those, LiteLLM will:
Detect a URL being passed
Check if the LLM API supports a URL
Else, will download the base64
Send the provider a base64 string.
LiteLLM also caches this result, in-memory to reduce latency for subsequent calls.
The limit for an in-memory cache is 1MB.
