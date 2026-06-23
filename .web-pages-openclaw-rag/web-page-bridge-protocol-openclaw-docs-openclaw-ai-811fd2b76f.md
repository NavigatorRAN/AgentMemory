# Bridge protocol - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/gateway/bridge-protocol
- Final URL: https://docs.openclaw.ai/gateway/bridge-protocol
- Canonical URL: https://docs.openclaw.ai/gateway/bridge-protocol
- Fetched at: 2026-06-23T14:43:31Z
- Content type: text/html; charset=utf-8

## Description

Historical bridge protocol (legacy nodes): TCP JSONL, pairing, scoped RPC

## Extracted Text

Close
Gateway & Ops Gateway
Warning
The TCP bridge has been removed . Current OpenClaw builds do not ship the bridge listener and bridge.* config keys are no longer in the schema. This page is kept for historical reference only. Use the Gateway Protocol for all node/operator clients.
Why it existed
Security boundary : the bridge exposes a small allowlist instead of the
full gateway API surface.
Pairing + node identity : node admission is owned by the gateway and tied
to a per-node token.
Discovery UX : nodes can discover gateways via Bonjour on LAN, or connect
directly over a tailnet.
Loopback WS : the full WS control plane stays local unless tunneled via SSH.
Transport
TCP, one JSON object per line (JSONL).
Optional TLS (when bridge.tls.enabled is true).
Historical default listener port was 18790 (current builds do not start a
TCP bridge).
When TLS is enabled, discovery TXT records include bridgeTls=1 plus
bridgeTlsSha256 as a non-secret hint. Note that Bonjour/mDNS TXT records are
unauthenticated; clients must not treat the advertised fingerprint as an
authoritative pin without explicit user intent or other out-of-band verification.
Handshake + pairing
Client sends hello with node metadata + token (if already paired).
If not paired, gateway replies error ( NOT_PAIRED / UNAUTHORIZED ).
Client sends pair-request .
Gateway waits for approval, then sends pair-ok and hello-ok .
Historically, hello-ok returned serverName ; hosted plugin surfaces are now
advertised through pluginSurfaceUrls . Canvas/A2UI uses
pluginSurfaceUrls.canvas ; the deprecated canvasHostUrl alias is not part of
the refactored protocol.
Frames
Client → Gateway:
req / res : scoped gateway RPC (chat, sessions, config, health, voicewake, skills.bins)
event : node signals (voice transcript, agent request, chat subscribe, exec lifecycle)
Gateway → Client:
invoke / invoke-res : node commands ( canvas.* , camera.* , screen.record ,
location.get , sms.send )
event : chat updates for subscribed sessions
ping / pong : keepalive
Legacy allowlist enforcement lived in src/gateway/server-bridge.ts (removed).
Exec lifecycle events
Nodes can emit exec.finished events to surface completed system.run activity.
These are mapped to system events in the gateway. (Legacy nodes may still emit exec.started .)
Nodes may emit exec.denied for denied system.run attempts; the gateway accepts
the event as a terminal denial and does not enqueue a system event or wake agent work.
Payload fields (all optional unless noted):
sessionKey (required): agent session for event correlation and, for
exec.finished , system event delivery.
runId : unique exec id for grouping.
command : raw or formatted command string.
exitCode , timedOut , success , output : completion details (finished only).
reason : denial reason (denied only).
Historical tailnet usage
Bind the bridge to a tailnet IP: bridge.bind: "tailnet" in
~/.openclaw/openclaw.json (historical only; bridge.* is no longer valid).
Clients connect via MagicDNS name or tailnet IP.
Bonjour does not cross networks; use manual host/port or wide-area DNS-SD
when needed.
Versioning
The bridge was implicit v1 (no min/max negotiation). This section is
historical reference only; current node/operator clients use the WebSocket
Gateway Protocol .
Related
Gateway protocol
Nodes
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
