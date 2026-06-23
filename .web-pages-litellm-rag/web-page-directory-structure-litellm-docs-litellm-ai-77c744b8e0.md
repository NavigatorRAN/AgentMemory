# Directory Structure | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/adding_provider/directory_structure
- Final URL: https://docs.litellm.ai/docs/adding_provider/directory_structure
- Canonical URL: https://docs.litellm.ai/docs/adding_provider/directory_structure
- Fetched at: 2026-06-23T14:22:36Z
- Content type: text/html; charset=utf-8

## Description

When adding a new provider, you need to create a directory for the provider that follows the following structure:

## Extracted Text

Skip to main content
Copy as Markdown
When adding a new provider, you need to create a directory for the provider that follows the following structure:
litellm/llms/
└── provider_name/
├── completion/ # use when endpoint is equivalent to openai's `/v1/completions`
│ ├── handler.py
│ └── transformation.py
├── chat/ # use when endpoint is equivalent to openai's `/v1/chat/completions`
├── embed/ # use when endpoint is equivalent to openai's `/v1/embeddings`
├── audio_transcription/ # use when endpoint is equivalent to openai's `/v1/audio/transcriptions`
└── rerank/ # use when endpoint is equivalent to cohere's `/rerank` endpoint.
├── handler.py
└── transformation.py
