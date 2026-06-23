# Linux server - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/vps
- Final URL: https://docs.openclaw.ai/vps
- Canonical URL: https://docs.openclaw.ai/vps
- Fetched at: 2026-06-23T14:58:34Z
- Content type: text/html; charset=utf-8

## Description

Run OpenClaw on a Linux server or cloud VPS — provider picker, architecture, and tuning

## Extracted Text

Close
Install Hosting
Run the OpenClaw Gateway on any Linux server or cloud VPS. This page helps you
pick a provider, explains how cloud deployments work, and covers generic Linux
tuning that applies everywhere.
Pick a provider
Railway
Northflank
DigitalOcean
Oracle Cloud
Fly.io
Hetzner
Hostinger
GCP
Azure
exe.dev
Raspberry Pi
AWS (EC2 / Lightsail / free tier) also works well.
A community video walkthrough is available at
x.com/techfrenAJ/status/2014934471095812547
(community resource -- may become unavailable).
How cloud setups work
The Gateway runs on the VPS and owns state + workspace.
You connect from your laptop or phone via the Control UI or Tailscale/SSH .
Treat the VPS as the source of truth and back up the state + workspace regularly.
Secure default: keep the Gateway on loopback and access it via SSH tunnel or Tailscale Serve.
If you bind to lan or tailnet , require gateway.auth.token or gateway.auth.password .
Related pages: Gateway remote access , Platforms hub .
Harden admin access first
Before you install OpenClaw on a public VPS, decide how you want to administer
the box itself.
If you want Tailnet-only admin access, install Tailscale first, join the VPS
to your tailnet, verify a second SSH session over the Tailscale IP or
MagicDNS name, then restrict public SSH.
If you are not using Tailscale, apply the equivalent hardening for your SSH
path before exposing more services.
This is separate from Gateway access. You can still keep OpenClaw bound to
loopback and use an SSH tunnel or Tailscale Serve for the dashboard.
Tailscale-specific Gateway options live in Tailscale .
Shared company agent on a VPS
Running a single agent for a team is a valid setup when every user is in the same trust boundary and the agent is business-only.
Keep it on a dedicated runtime (VPS/VM/container + dedicated OS user/accounts).
Do not sign that runtime into personal Apple/Google accounts or personal browser/password-manager profiles.
If users are adversarial to each other, split by gateway/host/OS user.
Security model details: Security .
Using nodes with a VPS
You can keep the Gateway in the cloud and pair nodes on your local devices
(Mac/iOS/Android/headless). Nodes provide local screen/camera/canvas and system.run
capabilities while the Gateway stays in the cloud.
Docs: Nodes , Nodes CLI .
Startup tuning for small VMs and ARM hosts
If CLI commands feel slow on low-power VMs (or ARM hosts), enable Node's module compile cache:
bash Copy code grep -q 'NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache' ~/.bashrc || cat >> ~/.bashrc << 'EOF' export NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache mkdir -p /var/tmp/openclaw-compile-cache export OPENCLAW_NO_RESPAWN=1 EOF source ~/.bashrc
NODE_COMPILE_CACHE improves repeated command startup times.
OPENCLAW_NO_RESPAWN=1 keeps routine Gateway restarts in-process, which avoids extra process handoffs and keeps PID tracking simple on small hosts.
First command run warms the cache; subsequent runs are faster.
For Raspberry Pi specifics, see Raspberry Pi .
systemd tuning checklist (optional)
For VM hosts using systemd , consider:
Add service env for a stable startup path:
OPENCLAW_NO_RESPAWN=1
NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache
Keep restart behavior explicit:
Restart=always
RestartSec=2
TimeoutStartSec=90
Prefer SSD-backed disks for state/cache paths to reduce random-I/O cold-start penalties.
For the standard openclaw onboard --install-daemon path, edit the user unit:
bash Copy code systemctl --user edit openclaw-gateway.service ini Copy code [Service] Environment =OPENCLAW_NO_RESPAWN= 1 Environment =NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache Restart =always RestartSec = 2 TimeoutStartSec = 90
If you deliberately installed a system unit instead, edit
openclaw-gateway.service via sudo systemctl edit openclaw-gateway.service .
How Restart= policies help automated recovery:
systemd can automate service recovery .
For Linux OOM behavior, child process victim selection, and exit 137
diagnostics, see Linux memory pressure and OOM kills .
Related
Install overview
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
