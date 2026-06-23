# Northflank - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/northflank
- Final URL: https://docs.openclaw.ai/install/northflank
- Canonical URL: https://docs.openclaw.ai/install/northflank
- Fetched at: 2026-06-23T14:44:57Z
- Content type: text/html; charset=utf-8

## Description

Deploy OpenClaw on Northflank with one-click template

## Extracted Text

Close
Install Hosting
Northflank
Deploy OpenClaw on Northflank with a one-click template and access it through the web Control UI.
This is the easiest "no terminal on the server" path: Northflank runs the Gateway for you.
How to get started
Click Deploy OpenClaw to open the template.
Create an account on Northflank if you don't already have one.
Click Deploy OpenClaw now .
Set the required environment variable: OPENCLAW_GATEWAY_TOKEN (use a strong random value).
Click Deploy stack to build and run the OpenClaw template.
Wait for the deployment to complete, then click View resources .
Open the OpenClaw service.
Open the public OpenClaw URL at /openclaw and connect using the configured shared secret. This template uses OPENCLAW_GATEWAY_TOKEN by default; if you replace it with password auth, use that password instead.
What you get
Hosted OpenClaw Gateway + Control UI
Persistent storage via Northflank Volume ( /data ) so openclaw.json ,
per-agent auth-profiles.json , channel/provider state, sessions, and
workspace survive redeploys
Connect a channel
Use the Control UI at /openclaw or run openclaw onboard via SSH for channel setup instructions:
Telegram (fastest — just a bot token)
Discord
All channels
Next steps
Set up messaging channels: Channels
Configure the Gateway: Gateway configuration
Keep OpenClaw up to date: Updating
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
