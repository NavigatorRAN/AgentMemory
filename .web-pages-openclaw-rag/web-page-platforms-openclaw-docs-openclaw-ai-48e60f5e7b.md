# Platforms - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/platforms
- Final URL: https://docs.openclaw.ai/platforms
- Canonical URL: https://docs.openclaw.ai/platforms
- Fetched at: 2026-06-23T14:49:20Z
- Content type: text/html; charset=utf-8

## Description

Platform support overview (Gateway + companion apps)

## Extracted Text

Close
Platforms Platforms overview
OpenClaw core is written in TypeScript. Node is the recommended runtime .
Bun is not recommended for the Gateway — known issues with WhatsApp and
Telegram channels; see Bun (experimental) for details.
Companion apps exist for Windows Hub, macOS (menu bar app), and mobile nodes
(iOS/Android). Linux companion apps are planned, but the Gateway is fully
supported today. On Windows, choose Windows Hub for the desktop app, native
PowerShell install for terminal-first use, or WSL2 for the most
Linux-compatible Gateway runtime.
Choose your OS
macOS: macOS
iOS: iOS
Android: Android
Windows: Windows
Linux: Linux
VPS and hosting
VPS hub: VPS hosting
Fly.io: Fly.io
Hetzner (Docker): Hetzner
GCP (Compute Engine): GCP
Azure (Linux VM): Azure
exe.dev (VM + HTTPS proxy): exe.dev
EasyRunner (Podman + Caddy): EasyRunner
Common links
Install guide: Getting Started
Windows Hub: Windows
Gateway runbook: Gateway
Gateway configuration: Configuration
Service status: openclaw gateway status
Gateway service install (CLI)
Use one of these (all supported):
Wizard (recommended): openclaw onboard --install-daemon
Direct: openclaw gateway install
Configure flow: openclaw configure → select Gateway service
Repair/migrate: openclaw doctor (offers to install or fix the service)
The service target depends on OS:
macOS: LaunchAgent ( ai.openclaw.gateway or ai.openclaw.<profile> ; legacy com.openclaw.* )
Linux/WSL2: systemd user service ( openclaw-gateway[-<profile>].service )
Native Windows: Scheduled Task ( OpenClaw Gateway or OpenClaw Gateway (<profile>) ), with a per-user Startup-folder login item fallback if task creation is denied
Related
Install overview
Windows Hub
macOS app
iOS app
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
