# Plugin inventory - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/plugins/plugin-inventory
- Final URL: https://docs.openclaw.ai/plugins/plugin-inventory
- Canonical URL: https://docs.openclaw.ai/plugins/plugin-inventory
- Fetched at: 2026-06-23T14:50:30Z
- Content type: text/html; charset=utf-8

## Description

Generated inventory of OpenClaw plugins shipped in core, published externally, or kept source-only

## Extracted Text

Close
Reference Plugin reference
Plugin inventory
This page is generated from extensions/*/package.json , openclaw.plugin.json ,
and the root npm package files exclusions. Regenerate it with:
bash Copy code pnpm plugins:inventory:gen
Definitions
Core npm package: built into the openclaw npm package and available without a separate plugin install.
Official external package: OpenClaw-maintained plugin omitted from the core npm package, kept in this official inventory, and installed on demand through ClawHub and/or npm.
Source checkout only: repo-local plugin omitted from published npm artifacts and not advertised as an installable package.
Source checkouts are different from npm installs: after pnpm install , bundled
plugins load from extensions/<id> so local edits and package-local workspace
dependencies are available.
Install a plugin
Use the install route in each entry to decide whether install is needed. Plugins
that say included in OpenClaw are already present in the core package.
Official external packages need one install, then a Gateway restart.
For example, Discord is an official external package:
bash Copy code openclaw plugins install @openclaw/discord openclaw gateway restart openclaw plugins inspect discord --runtime --json
During the launch cutover, ordinary bare package specs still install from npm.
Use clawhub:@openclaw/discord or npm:@openclaw/discord when you need an
explicit source. After install, follow the plugin's setup doc, such as
Discord , to add credentials and channel config. See
Manage plugins for update, uninstall, and publishing
commands.
Each entry lists the package, distribution route, and description.
Core npm package
59 plugins
admin-http-rpc ( @openclaw/admin-http-rpc ) - included in OpenClaw. OpenClaw admin HTTP RPC endpoint.
alibaba ( @openclaw/alibaba-provider ) - included in OpenClaw. Adds video generation provider support.
anthropic ( @openclaw/anthropic-provider ) - included in OpenClaw. Adds Anthropic model provider support to OpenClaw.
azure-speech ( @openclaw/azure-speech ) - included in OpenClaw. Azure AI Speech text-to-speech (MP3, native Ogg/Opus voice notes, PCM telephony).
bonjour ( @openclaw/bonjour ) - included in OpenClaw. Advertise the local OpenClaw gateway over Bonjour/mDNS.
browser ( @openclaw/browser-plugin ) - included in OpenClaw. Adds agent-callable tools.
byteplus ( @openclaw/byteplus-provider ) - included in OpenClaw. Adds BytePlus, BytePlus Plan model provider support to OpenClaw.
canvas ( @openclaw/canvas-plugin ) - included in OpenClaw. Experimental Canvas control and A2UI rendering surfaces for paired nodes.
codex-supervisor ( @openclaw/codex-supervisor ) - included in OpenClaw. Supervise Codex app-server sessions from OpenClaw.
cohere ( @openclaw/cohere-provider ) - included in OpenClaw; npm; ClawHub: clawhub:@openclaw/cohere-provider . OpenClaw Cohere provider plugin.
comfy ( @openclaw/comfy-provider ) - included in OpenClaw. Adds ComfyUI model provider support to OpenClaw.
copilot-proxy ( @openclaw/copilot-proxy ) - included in OpenClaw. Adds Copilot Proxy model provider support to OpenClaw.
deepgram ( @openclaw/deepgram-provider ) - included in OpenClaw. Adds media understanding provider support. Adds realtime transcription provider support.
document-extract ( @openclaw/document-extract-plugin ) - included in OpenClaw. Extract text and fallback page images from local document attachments.
duckduckgo ( @openclaw/duckduckgo-plugin ) - included in OpenClaw. Adds web search provider support.
elevenlabs ( @openclaw/elevenlabs-speech ) - included in OpenClaw. Adds media understanding provider support. Adds realtime transcription provider support. Adds text-to-speech provider support.
fal ( @openclaw/fal-provider ) - included in OpenClaw. Adds fal model provider support to OpenClaw.
file-transfer ( @openclaw/file-transfer ) - included in OpenClaw. Fetch, list, and write files on paired nodes via dedicated node commands. Bypasses bash stdout truncation by using base64 over node.invoke for binaries up to 16 MB.
github-copilot ( @openclaw/github-copilot-provider ) - included in OpenClaw. Adds GitHub Copilot model provider support to OpenClaw.
google ( @openclaw/google-plugin ) - included in OpenClaw. Adds Google, Google Gemini CLI, Google Vertex model provider support to OpenClaw.
huggingface ( @openclaw/huggingface-provider ) - included in OpenClaw. Adds Hugging Face model provider support to OpenClaw.
imessage ( @openclaw/imessage ) - included in OpenClaw. Adds the iMessage channel surface for sending and receiving OpenClaw messages.
litellm ( @openclaw/litellm-provider ) - included in OpenClaw. Adds LiteLLM model provider support to OpenClaw.
llm-task ( @openclaw/llm-task ) - included in OpenClaw. Generic JSON-only LLM tool for structured tasks callable from workflows.
lmstudio ( @openclaw/lmstudio-provider ) - included in OpenClaw. Adds LM Studio model provider support to OpenClaw.
memory-core ( @openclaw/memory-core ) - included in OpenClaw. Adds agent-callable tools.
memory-wiki ( @openclaw/memory-wiki ) - included in OpenClaw. Persistent wiki compiler and Obsidian-friendly knowledge vault for OpenClaw.
microsoft ( @openclaw/microsoft-speech ) - included in OpenClaw. Adds text-to-speech provider support.
microsoft-foundry ( @openclaw/microsoft-foundry ) - included in OpenClaw. Adds Microsoft Foundry model provider support to OpenClaw.
migrate-claude ( @openclaw/migrate-claude ) - included in OpenClaw. Imports Claude Code and Claude Desktop instructions, MCP servers, skills, and safe configuration into OpenClaw.
migrate-hermes ( @openclaw/migrate-hermes ) - included in OpenClaw. Imports Hermes configuration, memories, skills, and supported credentials into OpenClaw.
minimax ( @openclaw/minimax-provider ) - included in OpenClaw. Adds MiniMax, MiniMax Portal model provider support to OpenClaw.
mistral ( @openclaw/mistral-provider ) - included in OpenClaw. Adds Mistral model provider support to OpenClaw.
novita ( @openclaw/novita-provider ) - included in OpenClaw. Adds Novita, Novita AI, Novitaai model provider support to OpenClaw.
nvidia ( @openclaw/nvidia-provider ) - included in OpenClaw. Adds NVIDIA model provider support to OpenClaw.
oc-path ( @openclaw/oc-path ) - included in OpenClaw. Adds the openclaw path CLI for oc:// workspace file addressing.
ollama ( @openclaw/ollama-provider ) - included in OpenClaw. Adds Ollama, Ollama Cloud model provider support to OpenClaw.
open-prose ( @openclaw/open-prose ) - included in OpenClaw. OpenProse VM skill pack with a /prose slash command.
openai ( @openclaw/openai-provider ) - included in OpenClaw. Adds OpenAI model provider support to OpenClaw.
opencode ( @openclaw/opencode-provider ) - included in OpenClaw. Adds OpenCode model provider support to OpenClaw.
opencode-go ( @openclaw/opencode-go-provider ) - included in OpenClaw. Adds OpenCode Go model provider support to OpenClaw.
openrouter ( @openclaw/openrouter-provider ) - included in OpenClaw. Adds OpenRouter model provider support to OpenClaw.
policy ( @openclaw/policy ) - included in OpenClaw. Adds policy-backed doctor checks for workspace conformance.
runway ( @openclaw/runway-provider ) - included in OpenClaw. Adds video generation provider support.
senseaudio ( @openclaw/senseaudio-provider ) - included in OpenClaw. Adds media understanding provider support.
sglang ( @openclaw/sglang-provider ) - included in OpenClaw. Adds SGLang model provider support to OpenClaw.
synthetic ( @openclaw/synthetic-provider ) - included in OpenClaw. Adds Synthetic model provider support to OpenClaw.
telegram ( @openclaw/telegram ) - included in OpenClaw. Adds the Telegram channel surface for sending and receiving OpenClaw messages.
together ( @openclaw/together-provider ) - included in OpenClaw. Adds Together model provider support to OpenClaw.
tts-local-cli ( @openclaw/tts-local-cli ) - included in OpenClaw. Adds text-to-speech provider support.
vllm ( @openclaw/vllm-provider ) - included in OpenClaw. Adds vLLM model provider support to OpenClaw.
volcengine ( @openclaw/volcengine-provider ) - included in OpenClaw. Adds Volcengine, Volcengine Plan model provider support to OpenClaw.
voyage ( @openclaw/voyage-provider ) - included in OpenClaw. Adds memory embedding provider support.
vydra ( @openclaw/vydra-provider ) - included in OpenClaw. Adds Vydra model provider support to OpenClaw.
web-readability ( @openclaw/web-readability-plugin ) - included in OpenClaw. Extract readable article content from local HTML web fetch responses.
webhooks ( @openclaw/webhooks ) - included in OpenClaw. Authenticated inbound webhooks that bind external automation to OpenClaw TaskFlows.
workboard ( @openclaw/workboard ) - included in OpenClaw. Dashboard workboard for agent-owned issues and sessions.
xai ( @openclaw/xai-plugin ) - included in OpenClaw. Adds xAI model provider support to OpenClaw.
xiaomi ( @openclaw/xiaomi-provider ) - included in OpenClaw. Adds Xiaomi, Xiaomi Token Plan model provider support to OpenClaw.
Official external packages
68 plugins
acpx ( @openclaw/acpx ) - npm; ClawHub. OpenClaw ACP runtime backend with plugin-owned session and transport management.
amazon-bedrock ( @openclaw/amazon-bedrock-provider ) - npm; ClawHub. OpenClaw Amazon Bedrock provider plugin with model discovery, embeddings, and guardrail support.
amazon-bedrock-mantle ( @openclaw/amazon-bedrock-mantle-provider ) - npm; ClawHub. OpenClaw Amazon Bedrock Mantle provider plugin for OpenAI-compatible model routing.
anthropic-vertex ( @openclaw/anthropic-vertex-provider ) - npm; ClawHub. OpenClaw Anthropic Vertex provider plugin for Claude models on Google Vertex AI.
arcee ( @openclaw/arcee-provider ) - npm; ClawHub: clawhub:@openclaw/arcee-provider . Adds Arcee model provider support to OpenClaw.
brave ( @openclaw/brave-plugin ) - npm; ClawHub. OpenClaw Brave Search provider plugin for web search.
cerebras ( @openclaw/cerebras-provider ) - npm; ClawHub: clawhub:@openclaw/cerebras-provider . Adds Cerebras model provider support to OpenClaw.
chutes ( @openclaw/chutes-provider ) - npm; ClawHub: clawhub:@openclaw/chutes-provider . Adds Chutes model provider support to OpenClaw.
clickclack ( @openclaw/clickclack ) - npm; ClawHub: clawhub:@openclaw/clickclack . Adds the Clickclack channel surface for sending and receiving OpenClaw messages.
cloudflare-ai-gateway ( @openclaw/cloudflare-ai-gateway-provider ) - npm; ClawHub: clawhub:@openclaw/cloudflare-ai-gateway-provider . Adds Cloudflare AI Gateway model provider support to OpenClaw.
codex ( @openclaw/codex ) - npm; ClawHub. OpenClaw Codex app-server harness and model provider plugin with a Codex-managed GPT catalog.
copilot ( @openclaw/copilot ) - npm; ClawHub: clawhub:@openclaw/copilot . Registers the GitHub Copilot agent runtime.
deepinfra ( @openclaw/deepinfra-provider ) - npm; ClawHub: clawhub:@openclaw/deepinfra-provider . Adds DeepInfra model provider support to OpenClaw.
deepseek ( @openclaw/deepseek-provider ) - npm; ClawHub: clawhub:@openclaw/deepseek-provider . Adds DeepSeek model provider support to OpenClaw.
diagnostics-otel ( @openclaw/diagnostics-otel ) - npm; ClawHub: clawhub:@openclaw/diagnostics-otel . OpenClaw diagnostics OpenTelemetry exporter for metrics, traces, and logs.
diagnostics-prometheus ( @openclaw/diagnostics-prometheus ) - npm; ClawHub: clawhub:@openclaw/diagnostics-prometheus . OpenClaw diagnostics Prometheus exporter for runtime metrics.
diffs ( @openclaw/diffs ) - npm; ClawHub. OpenClaw read-only diff viewer plugin and file renderer for agents.
diffs-language-pack ( @openclaw/diffs-language-pack ) - npm; ClawHub: clawhub:@openclaw/diffs-language-pack . Adds syntax highlighting for languages outside the default diffs viewer set.
discord ( @openclaw/discord ) - npm; ClawHub. OpenClaw Discord channel plugin for channels, DMs, commands, and app events.
exa ( @openclaw/exa-plugin ) - npm; ClawHub: clawhub:@openclaw/exa-plugin . Adds web search provider support.
feishu ( @openclaw/feishu ) - npm; ClawHub. OpenClaw Feishu/Lark channel plugin for chats and workplace tools (community maintained by @m1heng).
firecrawl ( @openclaw/firecrawl-plugin ) - npm; ClawHub: clawhub:@openclaw/firecrawl-plugin . Adds agent-callable tools. Adds web fetch provider support. Adds web search provider support.
fireworks ( @openclaw/fireworks-provider ) - npm; ClawHub: clawhub:@openclaw/fireworks-provider . Adds Fireworks model provider support to OpenClaw.
gmi ( @openclaw/gmi-provider ) - npm; ClawHub: clawhub:@openclaw/gmi-provider . OpenClaw GMI Cloud provider plugin.
google-meet ( @openclaw/google-meet ) - npm; ClawHub. OpenClaw Google Meet participant plugin for joining calls through Chrome or Twilio transports.
googlechat ( @openclaw/googlechat ) - npm; ClawHub. OpenClaw Google Chat channel plugin for spaces and direct messages.
gradium ( @openclaw/gradium-speech ) - npm; ClawHub: clawhub:@openclaw/gradium-speech . Adds text-to-speech provider support.
groq ( @openclaw/groq-provider ) - npm; ClawHub: clawhub:@openclaw/groq-provider . Adds Groq model provider support to OpenClaw.
inworld ( @openclaw/inworld-speech ) - npm; ClawHub: clawhub:@openclaw/inworld-speech . Inworld streaming text-to-speech (MP3, OGG_OPUS, PCM telephony).
irc ( @openclaw/irc ) - npm; ClawHub: clawhub:@openclaw/irc . Adds the IRC channel surface for sending and receiving OpenClaw messages.
kilocode ( @openclaw/kilocode-provider ) - npm; ClawHub: clawhub:@openclaw/kilocode-provider . Adds Kilocode model provider support to OpenClaw.
kimi ( @openclaw/kimi-provider ) - npm; ClawHub: clawhub:@openclaw/kimi-provider . Adds Kimi, Kimi Coding model provider support to OpenClaw.
line ( @openclaw/line ) - npm; ClawHub. OpenClaw LINE channel plugin for LINE Bot API chats.
llama-cpp ( @openclaw/llama-cpp-provider ) - npm; ClawHub. Local GGUF embeddings through node-llama-cpp.
lobster ( @openclaw/lobster ) - npm; ClawHub. Lobster workflow tool plugin for typed pipelines and resumable approvals.
matrix ( @openclaw/matrix ) - ClawHub: clawhub:@openclaw/matrix ; npm. OpenClaw Matrix channel plugin for rooms and direct messages.
mattermost ( @openclaw/mattermost ) - npm; ClawHub: clawhub:@openclaw/mattermost . Adds the Mattermost channel surface for sending and receiving OpenClaw messages.
memory-lancedb ( @openclaw/memory-lancedb ) - npm; ClawHub. OpenClaw LanceDB-backed long-term memory plugin with auto-recall, auto-capture, and vector search.
moonshot ( @openclaw/moonshot-provider ) - npm; ClawHub: clawhub:@openclaw/moonshot-provider . Adds Moonshot model provider support to OpenClaw.
msteams ( @openclaw/msteams ) - npm; ClawHub. OpenClaw Microsoft Teams channel plugin for bot conversations.
nextcloud-talk ( @openclaw/nextcloud-talk ) - npm; ClawHub. OpenClaw Nextcloud Talk channel plugin for conversations.
nostr ( @openclaw/nostr ) - npm; ClawHub. OpenClaw Nostr channel plugin for NIP-04 encrypted direct messages.
openshell ( @openclaw/openshell-sandbox ) - npm; ClawHub. OpenClaw sandbox backend for the NVIDIA OpenShell CLI with mirrored local workspaces and SSH command execution.
parallel ( @openclaw/parallel-plugin ) - npm; ClawHub: clawhub:@openclaw/parallel-plugin . Adds web search provider support.
perplexity ( @openclaw/perplexity-plugin ) - npm; ClawHub: clawhub:@openclaw/perplexity-plugin . Adds web search provider support.
pixverse ( @openclaw/pixverse-provider ) - npm; ClawHub: clawhub:@openclaw/pixverse-provider . OpenClaw PixVerse video generation provider plugin.
qianfan ( @openclaw/qianfan-provider ) - npm; ClawHub: clawhub:@openclaw/qianfan-provider . Adds Qianfan model provider support to OpenClaw.
qqbot ( @openclaw/qqbot ) - npm; ClawHub. OpenClaw QQ Bot channel plugin for group and direct-message workflows.
qwen ( @openclaw/qwen-provider ) - npm; ClawHub: clawhub:@openclaw/qwen-provider . Adds Qwen, Qwen Cloud, Model Studio, DashScope, Qwen Oauth, Qwen Portal, Qwen CLI model provider support to OpenClaw.
raft ( @openclaw/raft ) - npm; ClawHub. OpenClaw Raft channel plugin for secure CLI wake bridges.
searxng ( @openclaw/searxng-plugin ) - npm; ClawHub: clawhub:@openclaw/searxng-plugin . Adds web search provider support.
signal ( @openclaw/signal ) - npm; ClawHub: clawhub:@openclaw/signal . Adds the Signal channel surface for sending and receiving OpenClaw messages.
slack ( @openclaw/slack ) - npm; ClawHub. OpenClaw Slack channel plugin for channels, DMs, commands, and app events.
sms ( @openclaw/sms ) - npm; ClawHub: clawhub:@openclaw/sms . Twilio SMS channel plugin for OpenClaw text messages.
stepfun ( @openclaw/stepfun-provider ) - npm; ClawHub: clawhub:@openclaw/stepfun-provider . Adds StepFun, StepFun Plan model provider support to OpenClaw.
synology-chat ( @openclaw/synology-chat ) - npm; ClawHub. Synology Chat channel plugin for OpenClaw channels and direct messages.
tavily ( @openclaw/tavily-plugin ) - npm; ClawHub: clawhub:@openclaw/tavily-plugin . Adds agent-callable tools. Adds web search provider support.
tencent ( @openclaw/tencent-provider ) - npm; ClawHub: clawhub:@openclaw/tencent-provider . Adds Tencent TokenHub model provider support to OpenClaw.
tlon ( @openclaw/tlon ) - npm; ClawHub. OpenClaw Tlon/Urbit channel plugin for chat workflows.
tokenjuice ( @openclaw/tokenjuice ) - npm; ClawHub: clawhub:@openclaw/tokenjuice . Compacts exec and bash tool results with tokenjuice reducers.
twitch ( @openclaw/twitch ) - npm; ClawHub. OpenClaw Twitch channel plugin for chat and moderation workflows.
venice ( @openclaw/venice-provider ) - npm; ClawHub: clawhub:@openclaw/venice-provider . Adds Venice model provider support to OpenClaw.
vercel-ai-gateway ( @openclaw/vercel-ai-gateway-provider ) - npm; ClawHub: clawhub:@openclaw/vercel-ai-gateway-provider . Adds Vercel AI Gateway model provider support to OpenClaw.
voice-call ( @openclaw/voice-call ) - npm; ClawHub. OpenClaw voice-call plugin for Twilio, Telnyx, and Plivo phone calls.
whatsapp ( @openclaw/whatsapp ) - ClawHub: clawhub:@openclaw/whatsapp ; npm. OpenClaw WhatsApp channel plugin for WhatsApp Web chats.
zai ( @openclaw/zai-provider ) - npm; ClawHub: clawhub:@openclaw/zai-provider . Adds Z.AI model provider support to OpenClaw.
zalo ( @openclaw/zalo ) - npm; ClawHub. OpenClaw Zalo channel plugin for bot and webhook chats.
zalouser ( @openclaw/zalouser ) - npm; ClawHub. OpenClaw Zalo Personal Account plugin via native zca-js integration.
Source checkout only
3 plugins
qa-channel ( @openclaw/qa-channel ) - source checkout only. Adds the QA Channel surface for sending and receiving OpenClaw messages.
qa-lab ( @openclaw/qa-lab ) - source checkout only. OpenClaw QA lab plugin with private debugger UI and scenario runner.
qa-matrix ( @openclaw/qa-matrix ) - source checkout only. Matrix QA transport runner and substrate.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
