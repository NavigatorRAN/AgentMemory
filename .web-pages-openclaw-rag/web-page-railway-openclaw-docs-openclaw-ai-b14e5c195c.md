# Railway - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/railway
- Final URL: https://docs.openclaw.ai/install/railway
- Canonical URL: https://docs.openclaw.ai/install/railway
- Fetched at: 2026-06-23T14:45:01Z
- Content type: text/html; charset=utf-8

## Description

Deploy OpenClaw on Railway with one-click template

## Extracted Text

Close
Install Hosting
Railway
Deploy OpenClaw on Railway with a one-click template and access it through the web Control UI.
This is the easiest "no terminal on the server" path: Railway runs the Gateway for you.
Quick checklist (new users)
Click Deploy on Railway (below).
Add a Volume mounted at /data .
Set the required Variables (at least OPENCLAW_GATEWAY_PORT and OPENCLAW_GATEWAY_TOKEN ).
Enable HTTP Proxy on port 8080 .
Open https://<your-railway-domain>/openclaw and connect using the configured shared secret. This template uses OPENCLAW_GATEWAY_TOKEN by default; if you replace it with password auth, use that password instead.
One-click deploy
Deploy on Railway
After deploy, find your public URL in Railway → your service → Settings → Domains .
Railway will either:
give you a generated domain (often https://<something>.up.railway.app ), or
use your custom domain if you attached one.
Then open:
https://<your-railway-domain>/openclaw — Control UI
What you get
Hosted OpenClaw Gateway + Control UI
Persistent storage via Railway Volume ( /data ) so openclaw.json ,
per-agent auth-profiles.json , channel/provider state, sessions, and
workspace survive redeploys
Required Railway settings
Public Networking
Enable HTTP Proxy for the service.
Port: 8080
Volume (required)
Attach a volume mounted at:
/data
Variables
Set these variables on the service:
OPENCLAW_GATEWAY_PORT=8080 (required — must match the port in Public Networking)
OPENCLAW_GATEWAY_TOKEN (required; treat as an admin secret)
OPENCLAW_STATE_DIR=/data/.openclaw (recommended)
OPENCLAW_WORKSPACE_DIR=/data/workspace (recommended)
Connect a channel
Use the Control UI at /openclaw or run openclaw onboard via Railway's shell for channel setup instructions:
Telegram (fastest — just a bot token)
Discord
All channels
Backups & migration
Export your state, config, auth profiles, and workspace:
bash Copy code openclaw backup create
This creates a portable backup archive with OpenClaw state plus any configured
workspace. See Backup for details.
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
