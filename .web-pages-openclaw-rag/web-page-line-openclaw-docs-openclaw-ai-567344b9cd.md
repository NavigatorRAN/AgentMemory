# LINE - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels/line
- Final URL: https://docs.openclaw.ai/channels/line
- Canonical URL: https://docs.openclaw.ai/channels/line
- Fetched at: 2026-06-23T14:36:12Z
- Content type: text/html; charset=utf-8

## Description

LINE Messaging API plugin setup, config, and usage

## Extracted Text

Close
Channels Regional platforms
LINE connects to OpenClaw via the LINE Messaging API. The plugin runs as a webhook
receiver on the gateway and uses your channel access token + channel secret for
authentication.
Status: downloadable plugin. Direct messages, group chats, media, locations, Flex
messages, template messages, and quick replies are supported. Reactions and threads
are not supported.
Install
Install LINE before configuring the channel:
bash Copy code openclaw plugins install @openclaw/line
Local checkout (when running from a git repo):
bash Copy code openclaw plugins install ./path/to/local/line-plugin
Setup
Create a LINE Developers account and open the Console:
https://developers.line.biz/console/
Create (or pick) a Provider and add a Messaging API channel.
Copy the Channel access token and Channel secret from the channel settings.
Enable Use webhook in the Messaging API settings.
Set the webhook URL to your gateway endpoint (HTTPS required):
Code Copy code https://gateway-host/line/webhook
The gateway responds to LINE's webhook verification (GET) and acknowledges signed
inbound events (POST) immediately after signature and payload validation; agent
processing continues asynchronously.
If you need a custom path, set channels.line.webhookPath or
channels.line.accounts.<id>.webhookPath and update the URL accordingly.
Security note:
LINE signature verification is body-dependent (HMAC over the raw body), so OpenClaw applies strict pre-auth body limits and timeout before verification.
OpenClaw processes webhook events from the verified raw request bytes. Upstream middleware-transformed req.body values are ignored for signature-integrity safety.
Configure
Minimal config:
json5 Copy code { channels : { line : { enabled : true , channelAccessToken : "LINE_CHANNEL_ACCESS_TOKEN" , channelSecret : "LINE_CHANNEL_SECRET" , dmPolicy : "pairing" , }, }, }
Public DM config:
json5 Copy code { channels : { line : { enabled : true , channelAccessToken : "LINE_CHANNEL_ACCESS_TOKEN" , channelSecret : "LINE_CHANNEL_SECRET" , dmPolicy : "open" , allowFrom : [ "*" ], }, }, }
Env vars (default account only):
LINE_CHANNEL_ACCESS_TOKEN
LINE_CHANNEL_SECRET
Token/secret files:
json5 Copy code { channels : { line : { tokenFile : "/path/to/line-token.txt" , secretFile : "/path/to/line-secret.txt" , }, }, }
tokenFile and secretFile must point to regular files. Symlinks are rejected.
Multiple accounts:
json5 Copy code { channels : { line : { accounts : { marketing : { channelAccessToken : "..." , channelSecret : "..." , webhookPath : "/line/marketing" , }, }, }, }, }
Access control
Direct messages default to pairing. Unknown senders get a pairing code and their
messages are ignored until approved.
bash Copy code openclaw pairing list line openclaw pairing approve line <CODE>
Allowlists and policies:
channels.line.dmPolicy : pairing | allowlist | open | disabled
channels.line.allowFrom : allowlisted LINE user IDs for DMs; dmPolicy: "open" requires ["*"]
channels.line.groupPolicy : allowlist | open | disabled
channels.line.groupAllowFrom : allowlisted LINE user IDs for groups
Per-group overrides: channels.line.groups.<groupId>.allowFrom
Static sender access groups can be referenced from allowFrom , groupAllowFrom , and per-group allowFrom with accessGroup:<name> .
Runtime note: if channels.line is completely missing, runtime falls back to groupPolicy="allowlist" for group checks (even if channels.defaults.groupPolicy is set).
LINE IDs are case-sensitive. Valid IDs look like:
User: U + 32 hex chars
Group: C + 32 hex chars
Room: R + 32 hex chars
Message behavior
Text is chunked at 5000 characters.
Markdown formatting is stripped; code blocks and tables are converted into Flex
cards when possible.
Streaming responses are buffered; LINE receives full chunks with a loading
animation while the agent works.
Media downloads are capped by channels.line.mediaMaxMb (default 10).
Inbound media is saved under ~/.openclaw/media/inbound/ before it is passed
to the agent, matching the shared media store used by other bundled channel
plugins.
Channel data (rich messages)
Use channelData.line to send quick replies, locations, Flex cards, or template
messages.
json5 Copy code { text : "Here you go" , channelData : { line : { quickReplies : [ "Status" , "Help" ], location : { title : "Office" , address : "123 Main St" , latitude : 35.681236 , longitude : 139.767125 , }, flexMessage : { altText : "Status card" , contents : { /* Flex payload */ }, }, templateMessage : { type : "confirm" , text : "Proceed?" , confirmLabel : "Yes" , confirmData : "yes" , cancelLabel : "No" , cancelData : "no" , }, }, }, }
The LINE plugin also ships a /card command for Flex message presets:
Code Copy code /card info "Welcome" "Thanks for joining!"
ACP support
LINE supports ACP (Agent Communication Protocol) conversation bindings:
/acp spawn <agent> --bind here binds the current LINE chat to an ACP session without creating a child thread.
Configured ACP bindings and active conversation-bound ACP sessions work on LINE like other conversation channels.
See ACP agents for details.
Outbound media
The LINE plugin supports sending images, videos, and audio files through the agent message tool. Media is sent via the LINE-specific delivery path with appropriate preview and tracking handling:
Images : sent as LINE image messages with automatic preview generation.
Videos : sent with explicit preview and content-type handling.
Audio : sent as LINE audio messages.
Outbound media URLs must be public HTTPS URLs. OpenClaw validates the target hostname before handing the URL to LINE and rejects loopback, link-local, and private-network targets.
Generic media sends fall back to the existing image-only route when a LINE-specific path is not available.
Troubleshooting
Webhook verification fails: ensure the webhook URL is HTTPS and the
channelSecret matches the LINE console.
No inbound events: confirm the webhook path matches channels.line.webhookPath
and that the gateway is reachable from LINE.
Media download errors: raise channels.line.mediaMaxMb if media exceeds the
default limit.
Related
Channels Overview — all supported channels
Pairing — DM authentication and pairing flow
Groups — group chat behavior and mention gating
Channel Routing — session routing for messages
Security — access model and hardening
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
