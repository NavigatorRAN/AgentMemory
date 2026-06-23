# Upstash Box - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/upstash
- Final URL: https://docs.openclaw.ai/install/upstash
- Canonical URL: https://docs.openclaw.ai/install/upstash
- Fetched at: 2026-06-23T14:45:09Z
- Content type: text/html; charset=utf-8

## Description

Host OpenClaw on Upstash Box with keep-alive and SSH tunnel access

## Extracted Text

Close
Install Hosting
Run a persistent OpenClaw Gateway on Upstash Box, a managed Linux environment
with keep-alive lifecycle support.
Use an SSH tunnel for dashboard access. Do not expose the Gateway port directly
to the public internet.
Prerequisites
Upstash account
Keep-alive Upstash Box
SSH client on your local machine
Create a Box
Create a keep-alive Box in the Upstash Console. Note the Box ID, such as
right-flamingo-14486 , and your Box API key.
Upstash maintains its current OpenClaw Box walkthrough at
OpenClaw Setup .
Connect with an SSH tunnel
Forward the OpenClaw dashboard port to your local machine. Use your Box API key
as the SSH password when prompted:
bash Copy code ssh -o ServerAliveInterval=15 -o ServerAliveCountMax=3 -L 18789:127.0.0.1:18789 <box-id>@us-east-1.box.upstash.com
The keepalive options reduce idle tunnel drops during onboarding.
Install OpenClaw
Inside the Box:
bash Copy code sudo npm install -g openclaw
Run onboarding
bash Copy code openclaw onboard --install-daemon
Follow the prompts. Copy the dashboard URL and token when onboarding finishes.
Start the Gateway
Configure the Gateway for the Box network and start it in the background:
bash Copy code openclaw config set gateway.bind lan nohup openclaw gateway > gateway.log 2>&1 &
With the SSH tunnel active, open the dashboard URL locally:
text Copy code http://127.0.0.1:18789/#token=<your-token>
Auto-restart
Set this command as the Box init script so the Gateway restarts when the Box
starts:
bash Copy code nohup openclaw gateway > gateway.log 2>&1 &
Troubleshooting
If SSH freezes during onboarding, reconnect with a clean SSH config and
keepalives:
bash Copy code ssh -F /dev/null -o ControlMaster=no -o ServerAliveInterval=15 -o ServerAliveCountMax=3 -L 18789:127.0.0.1:18789 <box-id>@us-east-1.box.upstash.com
This bypasses stale local ~/.ssh/config settings and keeps the tunnel active
through idle network periods.
Related
Remote access
Gateway security
Updating OpenClaw
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
