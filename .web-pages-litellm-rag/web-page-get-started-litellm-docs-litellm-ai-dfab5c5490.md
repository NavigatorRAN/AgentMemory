# Get Started | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/default_code_snippet
- Final URL: https://docs.litellm.ai/docs/default_code_snippet
- Canonical URL: https://docs.litellm.ai/docs/default_code_snippet
- Fetched at: 2026-06-23T14:23:47Z
- Content type: text/html; charset=utf-8

## Description

This section assumes you've already added your API keys in

## Extracted Text

Skip to main content
Copy as Markdown
info
This section assumes you've already added your API keys in
If you want to use the non-hosted version, go here
uv add litellm
from litellm import completion
## set ENV variables
os.environ["OPENAI_API_KEY"] = "openai key"
os.environ["COHERE_API_KEY"] = "cohere key"
messages = [{ "content": "Hello, how are you?","role": "user"}]
# openai call
response = completion(model="gpt-3.5-turbo", messages=messages)
# cohere call
response = completion("command-nightly", messages)
