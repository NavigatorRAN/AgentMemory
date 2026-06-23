# Chat channels - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels
- Final URL: https://docs.openclaw.ai/channels
- Canonical URL: https://docs.openclaw.ai/channels
- Fetched at: 2026-06-23T14:35:54Z
- Content type: text/html; charset=utf-8

## Description

Messaging platforms OpenClaw can connect to

## Extracted Text

Close
Channels Overview
OpenClaw can talk to you on any chat app you already use. Each channel connects via the Gateway.
Text is supported everywhere; media and reactions vary by channel.
Delivery notes
Telegram replies that contain markdown image syntax, such as ![alt](url) ,
are converted into media replies on the final outbound path when possible.
Slack multi-person DMs route as group chats, so group policy, mention
behavior, and group-session rules apply to MPIM conversations.
WhatsApp setup is install-on-demand: onboarding can show the setup flow before
the plugin package is installed, and the Gateway loads the external
ClawHub/npm plugin only when the channel is actually active.
Channels that accept bot-authored inbound messages can use shared
bot loop protection to prevent bot pairs from
replying to each other indefinitely.
Supported always-on rooms can use ambient room events
so unmentioned room chatter becomes quiet context unless the agent sends with
the message tool.
Supported channels
Discord - Discord Bot API + Gateway; supports servers, channels, and DMs.
Feishu - Feishu/Lark bot via WebSocket (bundled plugin).
Google Chat - Google Chat API app via HTTP webhook (downloadable plugin).
iMessage - Native macOS integration via the imsg bridge on a signed-in Mac (or SSH wrapper when the Gateway runs elsewhere), including private API actions for replies, tapbacks, effects, attachments, and group management. Preferred for new OpenClaw iMessage setups when host permissions and Messages access fit.
IRC - Classic IRC servers; channels + DMs with pairing/allowlist controls.
LINE - LINE Messaging API bot (downloadable plugin).
Matrix - Matrix protocol (downloadable plugin).
Mattermost - Bot API + WebSocket; channels, groups, DMs (downloadable plugin).
Microsoft Teams - Bot Framework; enterprise support (bundled plugin).
Nextcloud Talk - Self-hosted chat via Nextcloud Talk (bundled plugin).
Nostr - Decentralized DMs via NIP-04 (bundled plugin).
QQ Bot - QQ Bot API; private chat, group chat, and rich media (bundled plugin).
Raft - Raft CLI wake bridge for human and agent collaboration (external plugin).
Signal - signal-cli; privacy-focused.
Slack - Bolt SDK; workspace apps.
SMS - Twilio-backed SMS through the Gateway webhook (official plugin).
Synology Chat - Synology NAS Chat via outgoing+incoming webhooks (bundled plugin).
Telegram - Bot API via grammY; supports groups.
Tlon - Urbit-based messenger (bundled plugin).
Twitch - Twitch chat via IRC connection (bundled plugin).
Voice Call - Telephony via Plivo or Twilio (plugin, installed separately).
WebChat - Gateway WebChat UI over WebSocket.
WeChat - Tencent iLink Bot plugin via QR login; private chats only (external plugin).
WhatsApp - Most popular; uses Baileys and requires QR pairing.
Yuanbao - Tencent Yuanbao bot (external plugin).
Zalo - Zalo Bot API; Vietnam's popular messenger (bundled plugin).
Zalo ClawBot - Personal Zalo assistant via QR login; owner-bound (external plugin).
Zalo Personal - Zalo personal account via QR login (bundled plugin).
Notes
Channels can run simultaneously; configure multiple and OpenClaw will route per chat.
Fastest setup is usually Telegram (simple bot token). WhatsApp requires QR pairing and
stores more state on disk.
Group behavior varies by channel; see Groups .
DM pairing and allowlists are enforced for safety; see Security .
Troubleshooting: Channel troubleshooting .
Model providers are documented separately; see Model Providers .
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
