# RPC adapters - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/reference/rpc
- Final URL: https://docs.openclaw.ai/reference/rpc
- Canonical URL: https://docs.openclaw.ai/reference/rpc
- Fetched at: 2026-06-23T14:56:34Z
- Content type: text/html; charset=utf-8

## Description

RPC adapters for external CLIs (signal-cli, imsg) and gateway patterns

## Extracted Text

Close
Reference RPC and API
OpenClaw integrates external CLIs via JSON-RPC. Two patterns are used today.
Pattern A: HTTP daemon (signal-cli)
signal-cli runs as a daemon with JSON-RPC over HTTP.
Event stream is SSE ( /api/v1/events ).
Health probe: /api/v1/check .
OpenClaw owns lifecycle when channels.signal.autoStart=true .
See Signal for setup and endpoints.
Pattern B: stdio child process (imsg)
OpenClaw spawns imsg rpc as a child process for iMessage .
JSON-RPC is line-delimited over stdin/stdout (one JSON object per line).
No TCP port, no daemon required.
Core methods used:
watch.subscribe → notifications ( method: "message" )
watch.unsubscribe
send
chats.list (probe/diagnostics)
See iMessage for legacy setup and addressing ( chat_id preferred).
Adapter guidelines
Gateway owns the process (start/stop tied to provider lifecycle).
Keep RPC clients resilient: timeouts, restart on exit.
Prefer stable IDs (e.g., chat_id ) over display strings.
Related
Gateway protocol
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
