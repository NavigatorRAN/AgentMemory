# Getting started - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/start/getting-started
- Final URL: https://docs.openclaw.ai/start/getting-started
- Canonical URL: https://docs.openclaw.ai/start/getting-started
- Fetched at: 2026-06-23T14:57:06Z
- Content type: text/html; charset=utf-8

## Description

Get OpenClaw installed and run your first chat in minutes.

## Extracted Text

Close
Get started First steps
Install OpenClaw, run onboarding, and chat with your AI assistant — all in
about 5 minutes. By the end you will have a running Gateway, configured auth,
and a working chat session.
What you need
Node.js — Node 24 recommended (Node 22.19+ also supported)
An API key from a model provider (Anthropic, OpenAI, Google, etc.) — onboarding will prompt you
Tip
Check your Node version with node --version .
Windows users: the native Windows Hub app is the easiest desktop path. The
PowerShell installer and WSL2 Gateway paths are also supported. See Windows .
Need to install Node? See Node setup .
Quick setup
Install OpenClaw
macOS / Linux
bash Copy code curl -fsSL https://openclaw.ai/install.sh | bash
Windows (PowerShell)
powershell Copy code iwr -useb https://openclaw.ai/install.ps1 | iex
Note
Other install methods (Docker, Nix, npm): Install .
Run onboarding
bash Copy code openclaw onboard --install-daemon
The wizard walks you through choosing a model provider, setting an API key,
and configuring the Gateway. It takes about 2 minutes.
See Onboarding (CLI) for the full reference.
Verify the Gateway is running
bash Copy code openclaw gateway status
You should see the Gateway listening on port 18789.
Open the dashboard
bash Copy code openclaw dashboard
This opens the Control UI in your browser. If it loads, everything is working.
Send your first message
Type a message in the Control UI chat and you should get an AI reply.
Want to chat from your phone instead? The fastest channel to set up is
Telegram (just a bot token). See Channels
for all options.
Advanced: mount a custom Control UI build
If you maintain a localized or customized dashboard build, point
gateway.controlUi.root to a directory that contains your built static
assets and index.html .
bash Copy code mkdir -p " $HOME /.openclaw/control-ui-custom" # Copy your built static files into that directory.
Then set:
json Copy code { "gateway" : { "controlUi" : { "enabled" : true , "root" : "$HOME/.openclaw/control-ui-custom" } } }
Restart the gateway and reopen the dashboard:
bash Copy code openclaw gateway restart openclaw dashboard
What to do next
Connect a channel
Discord, Feishu, iMessage, Matrix, Microsoft Teams, Signal, Slack, Telegram, WhatsApp, Zalo, and more.
Pairing and safety
Control who can message your agent.
Configure the Gateway
Models, tools, sandbox, and advanced settings.
Browse tools
Browser, exec, web search, skills, and plugins.
Advanced: environment variables
If you run OpenClaw as a service account or want custom paths:
OPENCLAW_HOME — home directory for internal path resolution
OPENCLAW_STATE_DIR — override the state directory
OPENCLAW_CONFIG_PATH — override the config file path
Full reference: Environment variables .
Related
Install overview
Channels overview
Setup
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
