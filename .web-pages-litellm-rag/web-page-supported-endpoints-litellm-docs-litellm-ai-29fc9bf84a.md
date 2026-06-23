# Supported Endpoints | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/supported_endpoints
- Final URL: https://docs.litellm.ai/docs/supported_endpoints
- Canonical URL: https://docs.litellm.ai/docs/supported_endpoints
- Fetched at: 2026-06-23T14:33:26Z
- Content type: text/html; charset=utf-8

## Description

Learn how to deploy + call models from different providers on LiteLLM

## Extracted Text

Skip to main content
📄️ /a2a - A2A Agent Gateway
📄️ /assistants
OpenAI has deprecated the Assistants API. It will shut down on August 26, 2026.
📄️ /audio/transcriptions
Overview
📄️ /audio/speech
🗃️ /batches
2 items
📄️ /containers
Manage OpenAI code interpreter containers (sessions) for executing code in isolated environments.
📄️ /containers/files
Manage files within Code Interpreter containers. Files are created automatically when code interpreter generates outputs (charts, CSVs, images, etc.).
🗃️ /chat/completions
4 items
📄️ /completions
📄️ /converse
Call Bedrock's /converse endpoint through LiteLLM Proxy.
📄️ /embeddings
Quick Start
🗃️ /files
🗃️ /fine_tuning
📄️ /evals
LiteLLM Proxy supports OpenAI's Evaluations (Evals) API, allowing you to create, manage, and run evaluations to measure model performance against defined testing criteria.
📄️ /generateContent
Use LiteLLM to call Google AI's generateContent endpoints for text generation, multimodal interactions, and streaming responses.
📄️ /guardrails/apply_guardrail
Use this endpoint to directly call a guardrail configured on your LiteLLM instance. This is useful when you have services that need to directly call a guardrail.
📄️ /invoke
Call Bedrock's /invoke endpoint through LiteLLM Proxy.
📄️ /interactions
| Feature | Supported | Notes |
📄️ /v1beta/agents (Gemini Managed Agents)
LiteLLM now supports the Google AI Studio Managed Agents API. Create, manage, and run custom agents through LiteLLM.
📄️ /memory
CRUD endpoints for storing and retrieving user/team-scoped memory entries on the LiteLLM proxy. Use these to persist conversation context, agent memory, team playbooks, or any key-value data scoped to users and teams.
📄️ /images/edits
LiteLLM provides image editing functionality that maps to OpenAI's /images/edits API endpoint. Now supports both single and multiple image editing.
📄️ Image Generations
📄️ [BETA] Image Variations
OpenAI's /image/variations endpoint is now supported.
📄️ /videos
| Feature | Supported |
📄️ /vector_stores/\{vector_store_id\}/files
Vector store files represent the individual files that live inside a vector store.
📄️ /vector_stores - Create Vector Store
Create a vector store which can be used to store and search document chunks for retrieval-augmented generation (RAG) use cases.
📄️ /vector_stores/search - Search Vector Store
Search a vector store for relevant chunks based on a query and file attributes filter. This is useful for retrieval-augmented generation (RAG) use cases.
🗃️ /mcp - Model Context Protocol
17 items
🗃️ /v1/messages
3 items
📄️ Token Counting
📄️ /v1/messages/count_tokens
📄️ /moderations
Usage
📄️ /ocr
🗃️ Pass-through Endpoints (Anthropic SDK, etc.)
16 items
📄️ /rag/ingest
All-in-one document ingestion pipeline: Upload → Chunk → Embed → Vector Store
📄️ /rag/query
RAG Query endpoint: Search Vector Store → (Rerank) → LLM Completion
📄️ /realtime
Use this to loadbalance across Azure + OpenAI + xAI and more.
📄️ /realtime - WebRTC Support
Connect to the Realtime API via WebRTC from browser/mobile clients. LiteLLM handles auth; audio streams directly to OpenAI/Azure.
📄️ /rerank
LiteLLM Follows the cohere api request / response for the rerank api
📄️ /responses
LiteLLM provides an endpoint in the spec of OpenAI's /responses API
📄️ Prompt Management with Responses API
Use LiteLLM Prompt Management with /v1/responses by passing promptid and optional promptvariables.
📄️ /responses/compact
Compress conversation history using OpenAI's /responses/compact endpoint.
🗃️ /search
14 items
📄️ /skills - Anthropic Skills API
