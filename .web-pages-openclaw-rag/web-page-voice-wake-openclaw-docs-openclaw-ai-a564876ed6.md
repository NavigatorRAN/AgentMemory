# Voice wake - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/nodes/voicewake
- Final URL: https://docs.openclaw.ai/nodes/voicewake
- Canonical URL: https://docs.openclaw.ai/nodes/voicewake
- Fetched at: 2026-06-23T14:49:14Z
- Content type: text/html; charset=utf-8

## Description

Global voice wake words (Gateway-owned) and how they sync across nodes

## Extracted Text

Close
Gateway & Ops Nodes and media
OpenClaw treats wake words as a single global list owned by the Gateway .
There are no per-node custom wake words .
Any node/app UI may edit the list; changes are persisted by the Gateway and broadcast to everyone.
macOS and iOS keep local Voice Wake enabled/disabled toggles (local UX + permissions differ).
Android currently keeps Voice Wake off and uses a manual mic flow in the Voice tab.
Storage (Gateway host)
Wake words and routing rules are stored in the gateway state database:
~/.openclaw/state/openclaw.sqlite
The active tables are:
voicewake_triggers
voicewake_routing_config
voicewake_routing_routes
Legacy settings/voicewake.json and settings/voicewake-routing.json files are
doctor migration inputs only; runtime reads and writes the SQLite tables.
Protocol
Methods
voicewake.get → { triggers: string[] }
voicewake.set with params { triggers: string[] } → { triggers: string[] }
Notes:
Triggers are normalized (trimmed, empties dropped). Empty lists fall back to defaults.
Limits are enforced for safety (count/length caps).
Routing methods (trigger → target)
voicewake.routing.get → { config: VoiceWakeRoutingConfig }
voicewake.routing.set with params { config: VoiceWakeRoutingConfig } → { config: VoiceWakeRoutingConfig }
VoiceWakeRoutingConfig shape:
json Copy code { "version" : 1 , "defaultTarget" : { "mode" : "current" } , "routes" : [ { "trigger" : "robot wake" , "target" : { "sessionKey" : "agent:main:main" } } ] , "updatedAtMs" : 1730000000000 }
Route targets support exactly one of:
{ "mode": "current" }
{ "agentId": "main" }
{ "sessionKey": "agent:main:main" }
Events
voicewake.changed payload { triggers: string[] }
voicewake.routing.changed payload { config: VoiceWakeRoutingConfig }
Who receives it:
All WebSocket clients (macOS app, WebChat, etc.)
All connected nodes (iOS/Android), and also on node connect as an initial "current state" push.
Client behavior
macOS app
Uses the global list to gate VoiceWakeRuntime triggers.
Editing "Trigger words" in Voice Wake settings calls voicewake.set and then relies on the broadcast to keep other clients in sync.
iOS node
Uses the global list for VoiceWakeManager trigger detection.
Editing Wake Words in Settings calls voicewake.set (over the Gateway WS) and also keeps local wake-word detection responsive.
Android node
Voice Wake is currently disabled in Android runtime/Settings.
Android voice uses manual mic capture in the Voice tab instead of wake-word triggers.
Related
Talk mode
Audio and voice notes
Media understanding
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
