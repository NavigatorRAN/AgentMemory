# Linux app - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/platforms/linux
- Final URL: https://docs.openclaw.ai/platforms/linux
- Canonical URL: https://docs.openclaw.ai/platforms/linux
- Fetched at: 2026-06-23T14:49:27Z
- Content type: text/html; charset=utf-8

## Description

Linux support + companion app status

## Extracted Text

Close
Platforms Platforms overview
The Gateway is fully supported on Linux. Node is the recommended runtime .
Bun is not recommended for the Gateway (WhatsApp/Telegram bugs).
Native Linux companion apps are planned. Contributions are welcome if you want to help build one.
Beginner quick path (VPS)
Install Node 24 (recommended; Node 22 LTS, currently 22.19+ , still works for compatibility)
npm i -g openclaw@latest
openclaw onboard --install-daemon
From your laptop: ssh -N -L 18789:127.0.0.1:18789 <user>@<host>
Open http://127.0.0.1:18789/ and authenticate with the configured shared secret (token by default; password if you set gateway.auth.mode: "password" )
Full Linux server guide: Linux Server . Step-by-step VPS example: exe.dev
Install
Getting Started
Install & updates
Optional flows: Bun (experimental) , Nix , Docker
Gateway
Gateway runbook
Configuration
Gateway service install (CLI)
Use one of these:
Code Copy code openclaw onboard --install-daemon
Or:
Code Copy code openclaw gateway install
Code Copy code openclaw configure
Select Gateway service when prompted.
Repair/migrate:
Code Copy code openclaw doctor
System control (systemd user unit)
OpenClaw installs a systemd user service by default. Use a system
service for shared or always-on servers. openclaw gateway install and
openclaw onboard --install-daemon already render the current canonical unit
for you; write one by hand only when you need a custom system/service-manager
setup. The full service guidance lives in the Gateway runbook .
Minimal setup:
Create ~/.config/systemd/user/openclaw-gateway[-<profile>].service :
Code Copy code [Unit] Description=OpenClaw Gateway (profile: <profile>, v<version>) After=network-online.target Wants=network-online.target [Service] ExecStart=/usr/local/bin/openclaw gateway --port 18789 Restart=always RestartSec=5 TimeoutStopSec=30 TimeoutStartSec=30 SuccessExitStatus=0 143 OOMPolicy=continue KillMode=control-group [Install] WantedBy=default.target
Enable it:
Code Copy code systemctl --user enable --now openclaw-gateway[-<profile>].service
Memory pressure and OOM kills
On Linux, the kernel chooses an OOM victim when a host, VM, or container cgroup
runs out of memory. The Gateway can be a poor victim because it owns long-lived
sessions and channel connections. OpenClaw therefore biases transient child
processes to be killed before the Gateway when possible.
For eligible Linux child spawns, OpenClaw starts the child through a short
/bin/sh wrapper that raises the child's own oom_score_adj to 1000 , then
exec s the real command. This is an unprivileged operation because the child is
only increasing its own OOM kill likelihood.
Covered child process surfaces include:
supervisor-managed command children,
PTY shell children,
MCP stdio server children,
OpenClaw-launched browser/Chrome processes.
The wrapper is Linux-only and is skipped when /bin/sh is unavailable. It is
also skipped if the child env sets OPENCLAW_CHILD_OOM_SCORE_ADJ=0 , false ,
no , or off .
To verify a child process:
bash Copy code cat /proc/<child-pid>/oom_score_adj
Expected value for covered children is 1000 . The Gateway process should keep
its normal score, usually 0 .
The recommended systemd unit also sets OOMPolicy=continue . This keeps the
Gateway unit alive when a transient child process is selected by the OOM killer;
the child command/session can fail and report its error without systemd marking
the entire gateway service failed and restarting all channels.
This does not replace normal memory tuning. If a VPS or container repeatedly
kills children, increase the memory limit, reduce concurrency, or add stronger
resource controls such as systemd MemoryMax= or container-level memory limits.
Related
Install overview
Linux server
Raspberry Pi
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
