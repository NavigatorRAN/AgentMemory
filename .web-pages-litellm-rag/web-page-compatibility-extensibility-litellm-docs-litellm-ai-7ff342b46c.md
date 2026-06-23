# Compatibility & Extensibility | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/guides/compatibility_extensibility
- Final URL: https://docs.litellm.ai/docs/guides/compatibility_extensibility
- Canonical URL: https://docs.litellm.ai/docs/guides/compatibility_extensibility
- Fetched at: 2026-06-23T14:24:04Z
- Content type: text/html; charset=utf-8

## Description

Provider-specific params, model aliases, fine-tuned models, and adapters

## Extracted Text

Skip to main content
📄️ Provider-specific Params
Providers might offer params not supported by OpenAI (e.g. top_k). LiteLLM treats any non-openai param, as a provider-specific param, and passes it to the provider in the request body, as a kwarg. See Reserved Params
📄️ Drop Unsupported Params
Drop unsupported OpenAI params by your LLM Provider.
📄️ Model Alias
The model name you show an end-user might be different from the one you pass to LiteLLM - e.g. Displaying GPT-3.5 while calling gpt-3.5-turbo-16k on the backend.
📄️ Calling Finetuned Models
OpenAI
📄️ Call any LiteLLM model in your custom format
Use this to call any LiteLLM supported .completion() model, in your custom format. Useful if you have a custom API and want to support any LiteLLM supported model.
