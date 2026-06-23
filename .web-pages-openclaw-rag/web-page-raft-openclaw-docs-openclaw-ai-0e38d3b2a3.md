# Raft - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels/raft
- Final URL: https://docs.openclaw.ai/channels/raft
- Canonical URL: https://docs.openclaw.ai/channels/raft
- Fetched at: 2026-06-23T14:36:32Z
- Content type: text/html; charset=utf-8

## Description

Raft External Agent support through the Raft CLI wake bridge

## Extracted Text

Close
Channels Developer and self-hosted
Raft support connects an OpenClaw agent to a Raft External Agent through the local
Raft CLI. Raft sends authenticated wake hints to the Gateway. The agent then uses
the Raft CLI to check and send messages.
Install
Raft is an official external plugin. Install it on the Gateway host:
bash Copy code openclaw plugins install @openclaw/raft openclaw gateway restart
Details: Plugins
Prerequisites
A Raft workspace with an External Agent.
The Raft CLI installed on the same host as the OpenClaw Gateway.
A Raft CLI profile that is already signed in and associated with that External Agent.
The plugin does not store Raft credentials. The Raft CLI keeps that authentication
in its own profile.
Configure
Set the profile in config:
json5 Copy code { channels : { raft : { enabled : true , profile : "openclaw" , }, }, }
For the default account, you can instead set RAFT_PROFILE in the Gateway
environment:
bash Copy code RAFT_PROFILE=openclaw
Use a named account when one Gateway connects to more than one Raft External Agent:
json5 Copy code { channels : { raft : { accounts : { support : { profile : "support-agent" , }, engineering : { profile : "engineering-agent" , }, }, }, }, }
The interactive setup flow records the same profile:
bash Copy code openclaw channels setup raft
How It Works
When the Gateway starts, the plugin:
Opens a loopback-only HTTP wake endpoint on an ephemeral port.
Starts raft --profile <profile> agent bridge with that endpoint and a
per-process token.
Accepts only authenticated, content-free wake hints with a replay identity from the local bridge.
Requires one of eventId , attemptId , messageId , delivery_id , wake_id , or id .
Deduplicates recent retried wake deliveries by bridge event id, including across Gateway restarts.
Returns a stable runtime session for the current bridge and an empty activity-drain batch for the Raft CLI protocol.
Starts one serialized OpenClaw agent turn for each accepted wake.
The bridge owns Raft delivery retries and reconnects. The OpenClaw turn receives
only a wake notice, not a copied Raft message body. It uses the CLI to read
pending messages and to send its response:
bash Copy code raft --profile openclaw message check raft --profile openclaw message send Note
Raft is not a normal push-message transport. OpenClaw does not automatically
send the model's final text back through the bridge, so the agent must use the
Raft CLI after processing a wake.
Verify
Check that OpenClaw can find the CLI and has a configured profile:
bash Copy code openclaw channels status --probe openclaw plugins inspect raft --runtime --json
Then send a message to the Raft External Agent. The Gateway log should show the
Raft bridge starting, followed by an inbound wake. The agent should use the
configured Raft profile to check its pending messages.
Troubleshooting
Raft CLI is missing
Install the Raft CLI on the Gateway host and make raft available on the
service's PATH . Verify it with raft --help , then restart the Gateway.
The bridge exits immediately
Verify the configured profile is signed in and belongs to the intended
Raft External Agent. Run raft --profile <profile> agent bridge directly
to see the CLI diagnostic.
A wake arrives but no Raft response is sent
This is expected when the agent does not invoke the Raft CLI. The wake
bridge does not carry message bodies or automatic final replies. Check the
agent's tool policy and ensure it can run raft --profile <profile> message check and message send .
References
Raft
Raft documentation
Hermes Raft integration
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
