# Integrations | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/integrations
- Final URL: https://hermes-agent.nousresearch.com/docs/integrations
- Canonical URL: https://hermes-agent.nousresearch.com/docs/integrations/
- Fetched at: 2026-06-23T14:15:26Z
- Content type: text/html; charset=utf-8

## Description

Hermes Agent connects to external systems for AI inference, tool servers, IDE workflows, programmatic access, and more. These integrations extend what Hermes can do and where it can run.

## Extracted Text

Skip to main content
On this page
Hermes Agent connects to external systems for AI inference, tool servers, IDE workflows, programmatic access, and more. These integrations extend what Hermes can do and where it can run.
Start here
If you only have time to set up one integration, set up Nous Portal — a single OAuth login covers 300+ models plus the four Tool Gateway tools (web search, image generation, TTS, and browser automation).
AI Providers & Routing ​
Hermes supports multiple AI inference providers out of the box. Use hermes model to configure interactively, or set them in config.yaml .
AI Providers — OpenRouter, Anthropic, OpenAI, Google, and any OpenAI-compatible endpoint. Hermes auto-detects capabilities like vision, streaming, and tool use per provider.
Provider Routing — Fine-grained control over which underlying providers handle your OpenRouter requests. Optimize for cost, speed, or quality with sorting, whitelists, blacklists, and explicit priority ordering.
Fallback Providers — Automatic failover to backup LLM providers when your primary model encounters errors. Includes primary model fallback and independent auxiliary task fallback for vision, compression, and web extraction.
Tool Servers (MCP) ​
MCP Servers — Connect Hermes to external tool servers via Model Context Protocol. Access tools from GitHub, databases, file systems, browser stacks, internal APIs, and more without writing native Hermes tools. Supports both stdio and SSE transports, per-server tool filtering, and capability-aware resource/prompt registration.
Web Search Backends ​
The web_search and web_extract tools support eight backend providers, configured via config.yaml or hermes tools :
Backend Env Var Search Extract Crawl Firecrawl (default) FIRECRAWL_API_KEY ✔ ✔ ✔ SearXNG SEARXNG_URL ✔ — — Brave (free tier) BRAVE_SEARCH_API_KEY ✔ — — DuckDuckGo (ddgs) (none) ✔ — — Tavily TAVILY_API_KEY ✔ ✔ ✔ Exa EXA_API_KEY ✔ ✔ — Parallel PARALLEL_API_KEY ✔ ✔ — xAI XAI_API_KEY ✔ — —
Quick setup example:
web :
backend : firecrawl # firecrawl | searxng | brave-free | ddgs | tavily | exa | parallel | xai
If web.backend is not set, the backend is auto-detected from whichever API key is available. Self-hosted Firecrawl is also supported via FIRECRAWL_API_URL .
Browser Automation ​
Hermes includes full browser automation with multiple backend options for navigating websites, filling forms, and extracting information:
Browserbase — Managed cloud browsers with anti-bot tooling, CAPTCHA solving, and residential proxies
Browser Use — Alternative cloud browser provider
Local Chromium-family CDP — Connect to your running Chrome, Brave, Chromium, or Edge browser using /browser connect
Local Chromium — Headless local browser via the agent-browser CLI
See Browser Automation for setup and usage.
Voice & TTS Providers ​
Text-to-speech and speech-to-text across all messaging platforms:
Provider Quality Cost API Key Edge TTS (default) Good Free None needed ElevenLabs Excellent Paid ELEVENLABS_API_KEY OpenAI TTS Good Paid VOICE_TOOLS_OPENAI_KEY MiniMax Good Paid MINIMAX_API_KEY xAI TTS Good Paid XAI_API_KEY NeuTTS Good Free None needed
Speech-to-text supports six providers: local faster-whisper (free, runs on-device), a local command wrapper, Groq, OpenAI Whisper API, Mistral, and xAI. Voice message transcription works across Telegram, Discord, WhatsApp, and other messaging platforms. See Voice & TTS and Voice Mode for details.
IDE & Editor Integration ​
IDE Integration (ACP) — Use Hermes Agent inside ACP-compatible editors such as VS Code, Zed, and JetBrains. Hermes runs as an ACP server, rendering chat messages, tool activity, file diffs, and terminal commands inside your editor.
Programmatic Access ​
API Server — Expose Hermes as an OpenAI-compatible HTTP endpoint. Any frontend that speaks the OpenAI format — Open WebUI, LobeChat, LibreChat, NextChat, ChatBox — can connect and use Hermes as a backend with its full toolset.
Memory & Personalization ​
Built-in Memory — Persistent, curated memory via MEMORY.md and USER.md files. The agent maintains bounded stores of personal notes and user profile data that survive across sessions.
Memory Providers — Plug in external memory backends for deeper personalization. Eight providers are supported: Honcho (dialectic reasoning), OpenViking (tiered retrieval), Mem0 (cloud extraction), Hindsight (knowledge graphs), Holographic (local SQLite), RetainDB (hybrid search), ByteRover (CLI-based), and Supermemory.
Messaging Platforms ​
Hermes runs as a gateway bot on 27+ messaging platforms, all configured through the same gateway subsystem:
Telegram , Discord , Slack , WhatsApp , Signal , Matrix , Mattermost , Email , SMS , DingTalk , Feishu/Lark , WeCom , WeCom Callback , Weixin , BlueBubbles , QQ Bot , Yuanbao , Home Assistant , Microsoft Teams , Microsoft Teams Meetings , Microsoft Graph Webhook , Google Chat , LINE , ntfy , SimpleX , Open WebUI , Webhooks
See the Messaging Gateway overview for the platform comparison table and setup guide.
Home Automation ​
Home Assistant — Control smart home devices via four dedicated tools ( ha_list_entities , ha_get_state , ha_list_services , ha_call_service ). The Home Assistant toolset activates automatically when HASS_TOKEN is configured.
Plugins ​
Plugin System — Extend Hermes with custom tools, lifecycle hooks, and CLI commands without modifying core code. Plugins are discovered from ~/.hermes/plugins/ , project-local .hermes/plugins/ , and pip-installed entry points.
Build a Plugin — Step-by-step guide for creating Hermes plugins with tools, hooks, and CLI commands.
Training & Evaluation ​
Batch Processing — Run the agent across hundreds of prompts in parallel, generating structured ShareGPT-format trajectory data for training data generation or evaluation.
AI Providers & Routing
Tool Servers (MCP)
Web Search Backends
Browser Automation
Voice & TTS Providers
IDE & Editor Integration
Programmatic Access
Memory & Personalization
Messaging Platforms
Home Automation
Plugins
Training & Evaluation
