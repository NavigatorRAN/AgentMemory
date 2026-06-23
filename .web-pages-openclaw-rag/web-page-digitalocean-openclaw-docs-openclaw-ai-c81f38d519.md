# DigitalOcean - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/digitalocean
- Final URL: https://docs.openclaw.ai/install/digitalocean
- Canonical URL: https://docs.openclaw.ai/install/digitalocean
- Fetched at: 2026-06-23T14:44:37Z
- Content type: text/html; charset=utf-8

## Description

Host OpenClaw on a DigitalOcean Droplet

## Extracted Text

Close
Install Hosting
Run a persistent OpenClaw Gateway on a DigitalOcean Droplet (~$6/month for the 1 GB Basic plan).
DigitalOcean is the simplest paid VPS path. If you prefer cheaper or free options:
Hetzner — €3.79/mo, more cores/RAM per dollar.
Oracle Cloud — Always Free ARM (up to 4 OCPU, 24 GB RAM), but signup can be finicky and ARM-only.
Prerequisites
DigitalOcean account ( signup )
SSH key pair (or willingness to use password auth)
About 20 minutes
Setup
Create a Droplet
Warning
Use a clean base image (Ubuntu 24.04 LTS). Avoid third-party Marketplace 1-click images unless you have reviewed their startup scripts and firewall defaults.
Log into DigitalOcean .
Click Create > Droplets .
Choose:
Region: Closest to you
Image: Ubuntu 24.04 LTS
Size: Basic, Regular, 1 vCPU / 1 GB RAM / 25 GB SSD
Authentication: SSH key (recommended) or password
Click Create Droplet and note the IP address.
Connect and install
bash Copy code ssh root@YOUR_DROPLET_IP apt update && apt upgrade -y # Install Node.js 24 curl -fsSL https://deb.nodesource.com/setup_24.x | bash - apt install -y nodejs # Install OpenClaw curl -fsSL https://openclaw.ai/install.sh | bash # Create the non-root user that will own OpenClaw state and services. adduser openclaw usermod -aG sudo openclaw loginctl enable-linger openclaw su - openclaw openclaw --version
Use the root shell only for system bootstrap. Run OpenClaw commands as the non-root openclaw user so state lives under /home/openclaw/.openclaw/ and the Gateway installs as that user's systemd service.
Run onboarding
bash Copy code openclaw onboard --install-daemon
The wizard walks you through model auth, channel setup, gateway token generation, and daemon installation (systemd).
Add swap (recommended for 1 GB Droplets)
bash Copy code fallocate -l 2G /swapfile chmod 600 /swapfile mkswap /swapfile swapon /swapfile echo '/swapfile none swap sw 0 0' >> /etc/fstab
Verify the gateway
bash Copy code openclaw status systemctl --user status openclaw-gateway.service journalctl --user -u openclaw-gateway.service -f
Access the Control UI
The gateway binds to loopback by default. Pick one of these options.
Option A: SSH tunnel (simplest)
bash Copy code # From your local machine ssh -L 18789:localhost:18789 root@YOUR_DROPLET_IP
Then open http://localhost:18789 .
Option B: Tailscale Serve
bash Copy code curl -fsSL https://tailscale.com/install.sh | sudo sh sudo tailscale up openclaw config set gateway.tailscale.mode serve openclaw gateway restart
Then open https://<magicdns>/ from any device on your tailnet.
Tailscale Serve authenticates Control UI and WebSocket traffic via tailnet identity headers, which assumes the gateway host itself is trusted. HTTP API endpoints follow the gateway's normal auth mode (token/password) regardless. To require explicit shared-secret credentials over Serve, set gateway.auth.allowTailscale: false and use gateway.auth.mode: "token" or "password" .
Option C: Tailnet bind (no Serve)
bash Copy code openclaw config set gateway.bind tailnet openclaw gateway restart
Then open http://<tailscale-ip>:18789 (token required).
Persistence and backups
OpenClaw state lives under:
~/.openclaw/ — openclaw.json , per-agent auth-profiles.json , channel/provider state, and session data.
~/.openclaw/workspace/ — the agent workspace (SOUL.md, memory, artifacts).
These survive Droplet reboots. To take a portable snapshot:
bash Copy code openclaw backup create
DigitalOcean snapshots back the whole Droplet up; openclaw backup create is portable across hosts.
1 GB RAM tips
The $6 Droplet only has 1 GB RAM. To keep things smooth:
Make sure the swap step above is in /etc/fstab so it survives reboots.
Prefer API-based models (Claude, GPT) over local ones — local LLM inference does not fit in 1 GB.
Set agents.defaults.model.primary to a smaller model if you hit OOMs on large prompts.
Monitor with free -h and htop .
Troubleshooting
Gateway will not start -- Run openclaw doctor --non-interactive and check logs with journalctl --user -u openclaw-gateway.service -n 50 .
Port already in use -- Run lsof -i :18789 to find the process, then stop it.
Out of memory -- Verify swap is active with free -h . If still hitting OOM, use API-based models (Claude, GPT) rather than local models, or upgrade to a 2 GB Droplet.
Next steps
Channels -- connect Telegram, WhatsApp, Discord, and more
Gateway configuration -- all config options
Updating -- keep OpenClaw up to date
Related
Install overview
Fly.io
Hetzner
VPS hosting
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
