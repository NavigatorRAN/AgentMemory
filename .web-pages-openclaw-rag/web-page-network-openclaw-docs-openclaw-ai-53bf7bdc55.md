# Network - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/network
- Final URL: https://docs.openclaw.ai/network
- Canonical URL: https://docs.openclaw.ai/network
- Fetched at: 2026-06-23T14:47:04Z
- Content type: text/html; charset=utf-8

## Description

Network hub: gateway surfaces, pairing, discovery, and security

## Extracted Text

Close
Gateway & Ops Gateway
This hub links the core docs for how OpenClaw connects, pairs, and secures
devices across localhost, LAN, and tailnet.
Core model
Most operations flow through the Gateway ( openclaw gateway ), a single long-running process that owns channel connections and the WebSocket control plane.
Loopback first : the Gateway WS defaults to ws://127.0.0.1:18789 .
Non-loopback binds require a valid gateway auth path: shared-secret
token/password auth, or a correctly configured non-loopback
trusted-proxy deployment.
One Gateway per host is recommended. For isolation, run multiple gateways with isolated profiles and ports ( Multiple Gateways ).
Canvas host is served on the same port as the Gateway ( /__openclaw__/canvas/ , /__openclaw__/a2ui/ ), protected by Gateway auth when bound beyond loopback.
Remote access is typically SSH tunnel or Tailscale VPN ( Remote Access ).
Key references:
Gateway architecture
Gateway protocol
Gateway runbook
Web surfaces + bind modes
Pairing + identity
Pairing overview (DM + nodes)
Gateway-owned node pairing
Devices CLI (pairing + token rotation)
Pairing CLI (DM approvals)
Local trust:
Direct local loopback connects can be auto-approved for pairing to keep
same-host UX smooth.
OpenClaw also has a narrow backend/container-local self-connect path for
trusted shared-secret helper flows.
Tailnet and LAN clients, including same-host tailnet binds, still require
explicit pairing approval.
Discovery + transports
Discovery and transports
Bonjour / mDNS
Remote access (SSH)
Tailscale
Nodes + transports
Nodes overview
Bridge protocol (legacy nodes, historical)
Node runbook: iOS
Node runbook: Android
Security
Security overview
Gateway config reference
Troubleshooting
Doctor
Related
Remote access
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
