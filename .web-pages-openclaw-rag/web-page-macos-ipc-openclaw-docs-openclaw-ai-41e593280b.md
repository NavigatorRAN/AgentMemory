# macOS IPC - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/platforms/mac/xpc
- Final URL: https://docs.openclaw.ai/platforms/mac/xpc
- Canonical URL: https://docs.openclaw.ai/platforms/mac/xpc
- Fetched at: 2026-06-23T14:49:49Z
- Content type: text/html; charset=utf-8

## Description

macOS IPC architecture for OpenClaw app, gateway node transport, and PeekabooBridge

## Extracted Text

Close
Platforms macOS companion app
OpenClaw macOS IPC architecture
Current model: a local Unix socket connects the node host service to the macOS app for exec approvals + system.run . A openclaw-mac debug CLI exists for discovery/connect checks; agent actions still flow through the Gateway WebSocket and node.invoke . UI automation uses PeekabooBridge.
Goals
Single GUI app instance that owns all TCC-facing work (notifications, screen recording, mic, speech, AppleScript).
A small surface for automation: Gateway + node commands, plus PeekabooBridge for UI automation.
Predictable permissions: always the same signed bundle ID, launched by launchd, so TCC grants stick.
How it works
Gateway + node transport
The app runs the Gateway (local mode) and connects to it as a node.
Agent actions are performed via node.invoke (e.g. system.run , system.notify , canvas.* ).
Node service + app IPC
A headless node host service connects to the Gateway WebSocket.
system.run requests are forwarded to the macOS app over a local Unix socket.
The app performs the exec in UI context, prompts if needed, and returns output.
Diagram (SCI):
Code Copy code Agent -> Gateway -> Node Service (WS) | IPC (UDS + token + HMAC + TTL) v Mac App (UI + TCC + system.run)
PeekabooBridge (UI automation)
UI automation uses a separate UNIX socket named bridge.sock and the PeekabooBridge JSON protocol.
Host preference order (client-side): Peekaboo.app → Claude.app → OpenClaw.app → local execution.
Security: bridge hosts require an allowed TeamID; DEBUG-only same-UID escape hatch is guarded by PEEKABOO_ALLOW_UNSIGNED_SOCKET_CLIENTS=1 (Peekaboo convention).
See: PeekabooBridge usage for details.
Operational flows
Restart/rebuild: SIGN_IDENTITY="Apple Development: <Developer Name> (<TEAMID>)" scripts/restart-mac.sh
Kills existing instances
Swift build + package
Writes/bootstraps/kickstarts the LaunchAgent
Single instance: app exits early if another instance with the same bundle ID is running.
Hardening notes
Prefer requiring a TeamID match for all privileged surfaces.
PeekabooBridge: PEEKABOO_ALLOW_UNSIGNED_SOCKET_CLIENTS=1 (DEBUG-only) may allow same-UID callers for local development.
All communication remains local-only; no network sockets are exposed.
TCC prompts originate only from the GUI app bundle; keep the signed bundle ID stable across rebuilds.
IPC hardening: socket mode 0600 , token, peer-UID checks, HMAC challenge/response, short TTL.
Related
macOS app
macOS IPC flow (Exec approvals)
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
