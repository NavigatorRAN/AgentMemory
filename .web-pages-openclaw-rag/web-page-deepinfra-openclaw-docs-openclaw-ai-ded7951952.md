# DeepInfra - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/deepinfra
- Final URL: https://docs.openclaw.ai/providers/deepinfra
- Canonical URL: https://docs.openclaw.ai/providers/deepinfra
- Fetched at: 2026-06-23T14:55:12Z
- Content type: text/html; charset=utf-8

## Description

Use DeepInfra's unified API to access the most popular open source and frontier models in OpenClaw

## Extracted Text

Close
Models Providers
DeepInfra provides a unified API that routes requests to the most popular open source and frontier models behind a single
endpoint and API key. It is OpenAI-compatible, so most OpenAI SDKs work by switching the base URL.
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/deepinfra-provider openclaw gateway restart
Getting an API key
Go to https://deepinfra.com/
Sign in or create an account
Navigate to Dashboard / Keys and generate a new API key or use the auto created one
CLI setup
bash Copy code openclaw onboard --deepinfra-api-key <key>
Or set the environment variable:
bash Copy code export DEEPINFRA_API_KEY= "<your-deepinfra-api-key>" # pragma: allowlist secret
Config snippet
json5 Copy code { env : { DEEPINFRA_API_KEY : "<your-deepinfra-api-key>" }, // pragma: allowlist secret agents : { defaults : { model : { primary : "deepinfra/deepseek-ai/DeepSeek-V4-Flash" }, }, }, }
Supported OpenClaw surfaces
The plugin registers all DeepInfra surfaces that match current
OpenClaw provider contracts. Chat, image generation, and video generation
refresh their model catalogues live from /v1/openai/models?sort_by=openclaw&filter=with_meta
when DEEPINFRA_API_KEY is configured; the other surfaces use the curated
static defaults below.
Surface Default model OpenClaw config/tool Chat / model provider first chat-tagged entry from live catalog (manifest fallback deepseek-ai/DeepSeek-V4-Flash ) agents.defaults.model Image generation/editing first image-gen -tagged entry from live catalog (static fallback black-forest-labs/FLUX-1-schnell ) image_generate , agents.defaults.imageGenerationModel Media understanding moonshotai/Kimi-K2.5 for images inbound image understanding Speech-to-text openai/whisper-large-v3-turbo inbound audio transcription Text-to-speech hexgrad/Kokoro-82M messages.tts.provider: "deepinfra" Video generation first video-gen -tagged entry from live catalog (static fallback Pixverse/Pixverse-T2V ) video_generate , agents.defaults.videoGenerationModel Memory embeddings BAAI/bge-m3 agents.defaults.memorySearch.provider: "deepinfra"
DeepInfra also exposes reranking, classification, object-detection, and other
native model types. OpenClaw does not currently have first-class provider
contracts for those categories, so this plugin does not register them yet.
Available models
OpenClaw dynamically discovers available DeepInfra models at startup. Use
/models deepinfra to see the full list of models available.
Any model available on DeepInfra.com can be used with the deepinfra/ prefix:
Code Copy code deepinfra/deepseek-ai/DeepSeek-V4-Flash deepinfra/deepseek-ai/DeepSeek-V3.2 deepinfra/MiniMaxAI/MiniMax-M2.5 deepinfra/moonshotai/Kimi-K2.5 deepinfra/nvidia/NVIDIA-Nemotron-3-Super-120B-A12B deepinfra/zai-org/GLM-5.1 ...and many more
Notes
Model refs are deepinfra/<provider>/<model> (e.g., deepinfra/Qwen/Qwen3-Max ).
Default model: deepinfra/deepseek-ai/DeepSeek-V4-Flash
Base URL: https://api.deepinfra.com/v1/openai
Native video generation uses https://api.deepinfra.com/v1/inference/<model> .
Related
Model providers
All providers
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
