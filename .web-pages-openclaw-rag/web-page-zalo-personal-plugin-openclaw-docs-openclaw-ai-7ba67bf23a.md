# Zalo personal plugin - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/plugins/zalouser
- Final URL: https://docs.openclaw.ai/plugins/zalouser
- Canonical URL: https://docs.openclaw.ai/plugins/zalouser
- Fetched at: 2026-06-23T14:54:50Z
- Content type: text/html; charset=utf-8

## Description

Zalo Personal plugin: QR login + messaging via native zca-js (plugin install + channel config + tool)

## Extracted Text

Close
Capabilities Bundled plugin guides
Zalo Personal support for OpenClaw via a plugin, using native zca-js to automate a normal Zalo user account.
Warning
Unofficial automation may lead to account suspension or ban. Use at your own risk.
Naming
Channel id is zalouser to make it explicit this automates a personal Zalo user account (unofficial). We keep zalo reserved for a potential future official Zalo API integration.
Where it runs
This plugin runs inside the Gateway process .
If you use a remote Gateway, install/configure it on the machine running the Gateway , then restart the Gateway.
No external zca / openzca CLI binary is required.
Install
Option A: install from npm
bash Copy code openclaw plugins install @openclaw/zalouser
Use the bare package to follow the current official release tag. Pin an exact
version only when you need a reproducible install.
Restart the Gateway afterwards.
Option B: install from a local folder (dev)
bash Copy code PLUGIN_SRC=./path/to/local/zalouser-plugin openclaw plugins install " $PLUGIN_SRC " cd " $PLUGIN_SRC " && pnpm install
Config
Channel config lives under channels.zalouser (not plugins.entries.* ):
json5 Copy code { channels : { zalouser : { enabled : true , dmPolicy : "pairing" , }, }, }
CLI
bash Copy code openclaw channels login --channel zalouser openclaw channels logout --channel zalouser openclaw channels status --probe openclaw message send --channel zalouser --target <threadId> --message "Hello from OpenClaw" openclaw directory peers list --channel zalouser --query "name"
Agent tool
Tool name: zalouser
Actions: send , image , link , friends , groups , me , status
Channel message actions also support react for message reactions.
Related
Building plugins
ClawHub
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
