# Oracle Cloud - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/oracle
- Final URL: https://docs.openclaw.ai/install/oracle
- Canonical URL: https://docs.openclaw.ai/install/oracle
- Fetched at: 2026-06-23T14:44:58Z
- Content type: text/html; charset=utf-8

## Description

Host OpenClaw on Oracle Cloud's Always Free ARM tier

## Extracted Text

Close
Install Hosting
Run a persistent OpenClaw Gateway on Oracle Cloud's Always Free ARM tier (up to 4 OCPU, 24 GB RAM, 200 GB storage) at no cost.
Prerequisites
Oracle Cloud account ( signup ) -- see community signup guide if you hit issues
Tailscale account (free at tailscale.com )
An SSH key pair
About 30 minutes
Setup
Create an OCI instance
Log into Oracle Cloud Console .
Navigate to Compute > Instances > Create Instance .
Configure:
Name: openclaw
Image: Ubuntu 24.04 (aarch64)
Shape: VM.Standard.A1.Flex (Ampere ARM)
OCPUs: 2 (or up to 4)
Memory: 12 GB (or up to 24 GB)
Boot volume: 50 GB (up to 200 GB free)
SSH key: Add your public key
Click Create and note the public IP address.
Tip
If instance creation fails with "Out of capacity", try a different availability domain or retry later. Free tier capacity is limited.
Connect and update the system
bash Copy code ssh ubuntu@YOUR_PUBLIC_IP sudo apt update && sudo apt upgrade -y sudo apt install -y build-essential
build-essential is required for ARM compilation of some dependencies.
Configure user and hostname
bash Copy code sudo hostnamectl set-hostname openclaw sudo passwd ubuntu sudo loginctl enable-linger ubuntu
Enabling linger keeps user services running after logout.
Install Tailscale
bash Copy code curl -fsSL https://tailscale.com/install.sh | sh sudo tailscale up --ssh --hostname=openclaw
From now on, connect via Tailscale: ssh ubuntu@openclaw .
Install OpenClaw
bash Copy code curl -fsSL https://openclaw.ai/install.sh | bash source ~/.bashrc
When prompted "How do you want to hatch your bot?", select Do this later .
Configure the gateway
Use token auth with Tailscale Serve for secure remote access.
bash Copy code openclaw config set gateway.bind loopback openclaw config set gateway.auth.mode token openclaw doctor --generate-gateway-token openclaw config set gateway.tailscale.mode serve openclaw config set gateway.trustedProxies '["127.0.0.1"]' systemctl --user restart openclaw-gateway.service
gateway.trustedProxies=["127.0.0.1"] here is only for the local Tailscale Serve proxy's forwarded-IP/local-client handling. It is not gateway.auth.mode: "trusted-proxy" . Diff viewer routes keep fail-closed behavior in this setup: raw 127.0.0.1 viewer requests without forwarded proxy headers can return Diff not found . Use mode=file / mode=both for attachments, or intentionally enable remote viewers and set plugins.entries.diffs.config.viewerBaseUrl (or pass a proxy baseUrl ) if you need shareable viewer links.
Lock down VCN security
Block all traffic except Tailscale at the network edge:
Go to Networking > Virtual Cloud Networks in the OCI Console.
Click your VCN, then Security Lists > Default Security List .
Remove all ingress rules except 0.0.0.0/0 UDP 41641 (Tailscale).
Keep default egress rules (allow all outbound).
This blocks SSH on port 22, HTTP, HTTPS, and everything else at the network edge. You can only connect via Tailscale from this point on.
Verify
bash Copy code openclaw --version systemctl --user status openclaw-gateway.service tailscale serve status curl http://localhost:18789
Access the Control UI from any device on your tailnet:
Code Copy code https://openclaw.<tailnet-name>.ts.net/
Replace <tailnet-name> with your tailnet name (visible in tailscale status ).
Verify the security posture
With the VCN locked down (only UDP 41641 open) and the Gateway bound to loopback, public traffic is blocked at the network edge and admin access is tailnet-only. That removes the need for several traditional VPS hardening steps:
Traditional step Needed? Why UFW firewall No The VCN blocks traffic before it reaches the instance. fail2ban No Port 22 is blocked at the VCN; no brute-force surface. sshd hardening No Tailscale SSH does not use sshd. Disable root login No Tailscale authenticates by tailnet identity, not system users. SSH key-only auth No Same — tailnet identity replaces system SSH keys. IPv6 hardening Usually not Depends on VCN/subnet settings; verify what is actually assigned/exposed.
Still recommended:
chmod 700 ~/.openclaw to restrict credential file permissions.
openclaw security audit for an OpenClaw-specific posture check.
Regular sudo apt update && sudo apt upgrade for OS patches.
Review devices in the Tailscale admin console periodically.
Quick verification commands:
bash Copy code # Confirm no public ports are listening sudo ss -tlnp | grep -v '127.0.0.1\|::1' # Verify Tailscale SSH is active tailscale status | grep -q 'offers: ssh' && echo "Tailscale SSH active" # Optional: disable sshd entirely once Tailscale SSH is confirmed working sudo systemctl disable --now ssh
ARM notes
The Always Free tier is ARM ( aarch64 ). Most OpenClaw features work fine; a small number of native binaries need ARM builds:
Node.js, Telegram, WhatsApp (Baileys): pure JavaScript, no issues.
Most npm packages with native code: pre-built linux-arm64 artifacts available.
Optional CLI helpers (e.g. Go/Rust binaries shipped by skills): check for an aarch64 / linux-arm64 release before installing.
Verify the architecture with uname -m (should print aarch64 ). For binaries without an ARM build, install from source or skip them.
Persistence and backups
OpenClaw state lives under:
~/.openclaw/ — openclaw.json , per-agent auth-profiles.json , channel/provider state, and session data.
~/.openclaw/workspace/ — the agent workspace (SOUL.md, memory, artifacts).
These survive reboots. To take a portable snapshot:
bash Copy code openclaw backup create
Fallback: SSH tunnel
If Tailscale Serve is not working, use an SSH tunnel from your local machine:
bash Copy code ssh -L 18789:127.0.0.1:18789 ubuntu@openclaw
Then open http://localhost:18789 .
Troubleshooting
Instance creation fails ("Out of capacity") -- Free tier ARM instances are popular. Try a different availability domain or retry during off-peak hours.
Tailscale will not connect -- Run sudo tailscale up --ssh --hostname=openclaw --reset to re-authenticate.
Gateway will not start -- Run openclaw doctor --non-interactive and check logs with journalctl --user -u openclaw-gateway.service -n 50 .
ARM binary issues -- Most npm packages work on ARM64. For native binaries, look for linux-arm64 or aarch64 releases. Verify architecture with uname -m .
Next steps
Channels -- connect Telegram, WhatsApp, Discord, and more
Gateway configuration -- all config options
Updating -- keep OpenClaw up to date
Related
Install overview
GCP
VPS hosting
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
