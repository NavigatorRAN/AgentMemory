# Claude Max API proxy - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/claude-max-api-proxy
- Final URL: https://docs.openclaw.ai/providers/claude-max-api-proxy
- Canonical URL: https://docs.openclaw.ai/providers/claude-max-api-proxy
- Fetched at: 2026-06-23T14:55:06Z
- Content type: text/html; charset=utf-8

## Description

Community proxy to expose Claude subscription credentials as an OpenAI-compatible endpoint

## Extracted Text

Close
Models Providers
claude-max-api-proxy is a community tool that exposes your Claude Max/Pro subscription as an OpenAI-compatible API endpoint. This allows you to use your subscription with any tool that supports the OpenAI API format.
Warning
This path is technical compatibility only. Anthropic has blocked some subscription
usage outside Claude Code in the past. You must decide for yourself whether to use
it and verify Anthropic's current billing rules before relying on it.
Anthropic's current support docs say claude -p is Agent SDK/programmatic usage.
Starting June 15, 2026, subscription-plan claude -p usage draws from a separate
monthly Agent SDK credit first, then from usage credits at standard API rates if
usage credits are enabled.
Why use this?
Approach Cost route Best for Anthropic API Pay per token through Claude Console or cloud Production apps, shared automation, volume Claude subscription proxy Claude Code / claude -p plan and credit rules Personal experiments with compatible tools
If you have a Claude Max or Pro subscription and want to use it with
OpenAI-compatible tools, this proxy may fit some personal workflows. It is not an
unlimited flat-rate path. API keys remain the clearer policy and billing path for
production use.
How it works
Code Copy code Your App → claude-max-api-proxy → Claude Code CLI / claude -p → Anthropic (OpenAI format) (converts format) (uses your login)
The proxy:
Accepts OpenAI-format requests at http://localhost:3456/v1/chat/completions
Converts them to Claude Code CLI commands
Returns responses in OpenAI format (streaming supported)
Getting started
Install the proxy
Requires Node.js 22+ and Claude Code CLI.
bash Copy code npm install -g claude-max-api-proxy # Verify Claude CLI is authenticated claude --version
Start the server
bash Copy code claude-max-api # Server runs at http://localhost:3456
Test the proxy
bash Copy code # Health check curl http://localhost:3456/health # List models curl http://localhost:3456/v1/models # Chat completion curl http://localhost:3456/v1/chat/completions \ -H "Content-Type: application/json" \ -d '{ "model" : "claude-opus-4" , "messages" : [{ "role" : "user" , "content" : "Hello!" }] } '
Configure OpenClaw
Point OpenClaw at the proxy as a custom OpenAI-compatible endpoint:
json5 Copy code { env : { OPENAI_API_KEY : "not-needed" , OPENAI_BASE_URL : "http://localhost:3456/v1" , }, agents : { defaults : { model : { primary : "openai/claude-opus-4" }, }, }, }
Built-in catalog
Model ID Maps To claude-opus-4 Claude Opus 4 claude-sonnet-4 Claude Sonnet 4 claude-haiku-4 Claude Haiku 4
Advanced configuration
Proxy-style OpenAI-compatible notes
This path uses the same proxy-style OpenAI-compatible route as other custom
/v1 backends:
Native OpenAI-only request shaping does not apply
No service_tier , no Responses store , no prompt-cache hints, and no
OpenAI reasoning-compat payload shaping
Hidden OpenClaw attribution headers ( originator , version , User-Agent )
are not injected on the proxy URL
Auto-start on macOS with LaunchAgent
Create a LaunchAgent to run the proxy automatically:
bash Copy code cat > ~/Library/LaunchAgents/com.claude-max-api.plist << 'EOF' <?xml version= "1.0" encoding= "UTF-8" ?> <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd" > <plist version= "1.0" > <dict> <key>Label</key> <string>com.claude-max-api</string> <key>RunAtLoad</key> < true /> <key>KeepAlive</key> < true /> <key>ProgramArguments</key> <array> <string>/usr/local/bin/node</string> <string>/usr/local/lib/node_modules/claude-max-api-proxy/dist/server/standalone.js</string> </array> <key>EnvironmentVariables</key> <dict> <key>PATH</key> <string>/usr/local/bin:/opt/homebrew/bin:~/.local/bin:/usr/bin:/bin</string> </dict> </dict> </plist> EOF launchctl bootstrap gui/$( id -u) ~/Library/LaunchAgents/com.claude-max-api.plist
Notes
This is a community tool , not officially supported by Anthropic or OpenClaw
Requires an active Claude Max/Pro subscription with Claude Code CLI authenticated
Inherits Claude Code claude -p billing, usage-credit, and rate-limit behavior
The proxy runs locally and does not send data to any third-party servers
Streaming responses are fully supported
Note
For native Anthropic integration with Claude CLI or API keys, see Anthropic provider . For OpenAI/Codex subscriptions, see OpenAI provider .
Related
Anthropic provider
Native OpenClaw integration with Claude CLI or API keys.
OpenAI provider
For OpenAI/Codex subscriptions.
Model selection
Overview of all providers, model refs, and failover behavior.
Configuration
Full config reference.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
