# Model provider quickstart - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/models
- Final URL: https://docs.openclaw.ai/providers/models
- Canonical URL: https://docs.openclaw.ai/providers/models
- Fetched at: 2026-06-23T14:55:35Z
- Content type: text/html; charset=utf-8

## Description

Model providers (LLMs) supported by OpenClaw

## Extracted Text

Close
Models Overview
OpenClaw can use many LLM providers. Pick one, authenticate, then set the default
model as provider/model .
Quick start (two steps)
Authenticate with the provider (usually via openclaw onboard ).
Set the default model:
json5 Copy code { agents : { defaults : { model : { primary : "anthropic/claude-opus-4-6" } } }, }
Supported providers (starter set)
Alibaba Model Studio
Amazon Bedrock
Anthropic (API + Claude CLI)
BytePlus (International)
Chutes
Cohere
ComfyUI
Cloudflare AI Gateway
DeepInfra
fal
Fireworks
MiniMax
Mistral
Moonshot AI (Kimi + Kimi Coding)
OpenAI (API + Codex)
OpenCode (Zen + Go)
OpenRouter
Qianfan
Qwen
Runway
StepFun
Synthetic
Vercel AI Gateway
Venice (Venice AI)
xAI
Z.AI (GLM)
Additional provider variants
anthropic-vertex - install @openclaw/anthropic-vertex-provider for implicit Anthropic on Google Vertex support when Vertex credentials are available; no separate onboarding auth choice
copilot-proxy - local VS Code Copilot Proxy bridge; use openclaw onboard --auth-choice copilot-proxy
google-gemini-cli - unofficial Gemini CLI OAuth flow; requires a local gemini install ( brew install gemini-cli or npm install -g @google/gemini-cli ); default model google-gemini-cli/gemini-3-flash-preview ; use openclaw onboard --auth-choice google-gemini-cli or openclaw models auth login --provider google-gemini-cli --set-default
For the full provider catalog (xAI, Groq, Mistral, etc.) and advanced configuration,
see Model providers .
Related
Model selection
Model failover
Models CLI
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
