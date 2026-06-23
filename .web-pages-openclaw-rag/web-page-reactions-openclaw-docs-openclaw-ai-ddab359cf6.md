# Reactions - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/reactions
- Final URL: https://docs.openclaw.ai/tools/reactions
- Canonical URL: https://docs.openclaw.ai/tools/reactions
- Fetched at: 2026-06-23T14:58:12Z
- Content type: text/html; charset=utf-8

## Description

Reaction tool semantics across all supported channels

## Extracted Text

Close
Capabilities Tools
The agent can add and remove emoji reactions on messages using the message
tool with the react action. Reaction behavior varies by channel and transport.
How it works
json Copy code { "action" : "react" , "messageId" : "msg-123" , "emoji" : "thumbsup" }
emoji is required when adding a reaction.
Set emoji to an empty string ( "" ) to remove the bot's reaction(s).
Set remove: true to remove a specific emoji (requires non-empty emoji ).
On channels that support status reactions, trackToolCalls: true on a
reaction lets the runtime use that reacted message for subsequent tool
progress reactions during the same turn.
Channel behavior
Discord and Slack
Empty emoji removes all of the bot's reactions on the message.
remove: true removes just the specified emoji.
Google Chat
Empty emoji removes the app's reactions on the message.
Nextcloud Talk
Adding reactions only: emoji is required and must be non-empty.
Reaction removal is not supported yet; calls with remove: true (or empty emoji ) are rejected with a clear error rather than silently no-oping.
Requires the Talk bot to be registered with the reaction feature (see Nextcloud Talk channel docs ).
Telegram
Empty emoji removes the bot's reactions.
remove: true also removes reactions but still requires a non-empty emoji for tool validation.
WhatsApp
Empty emoji removes the bot reaction.
remove: true maps to empty emoji internally (still requires emoji in the tool call).
WhatsApp has one bot reaction slot per message; status reaction updates replace that slot rather than stacking multiple emoji.
Zalo Personal (zalouser)
Requires non-empty emoji .
remove: true removes that specific emoji reaction.
Feishu/Lark
Use the feishu_reaction tool with actions add , remove , and list .
Add/remove requires emoji_type ; remove also requires reaction_id .
Signal
Inbound reaction notifications are controlled by channels.signal.reactionNotifications : "off" disables them, "own" (default) emits events when users react to bot messages, and "all" emits events for all reactions.
iMessage
Outbound reactions are iMessage tapbacks ( love , like , dislike , laugh , emphasize , and question ).
Inbound tapback notifications are controlled by channels.imessage.reactionNotifications : "off" disables them, "own" (default) emits events when users react to bot-authored messages, and "all" emits events for all tapbacks from authorized senders.
Reaction level
Per-channel reactionLevel config controls how broadly the agent uses reactions. Values are typically off , ack , minimal , or extensive .
Telegram reactionLevel — channels.telegram.reactionLevel
WhatsApp reactionLevel — channels.whatsapp.reactionLevel
Set reactionLevel on individual channels to tune how actively the agent reacts to messages on each platform.
Related
Agent Send — the message tool that includes react
Channels — channel-specific configuration
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
