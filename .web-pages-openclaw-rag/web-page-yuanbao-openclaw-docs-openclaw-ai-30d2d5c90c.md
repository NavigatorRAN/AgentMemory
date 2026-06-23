# Yuanbao - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels/yuanbao
- Final URL: https://docs.openclaw.ai/channels/yuanbao
- Canonical URL: https://docs.openclaw.ai/channels/yuanbao
- Fetched at: 2026-06-23T14:36:45Z
- Content type: text/html; charset=utf-8

## Description

Yuanbao bot overview, features, and configuration

## Extracted Text

Close
Channels Regional platforms
Tencent Yuanbao is Tencent's AI assistant platform. The OpenClaw channel plugin
connects Yuanbao bots to OpenClaw over WebSocket so they can interact with users
through direct messages and group chats.
Status: production-ready for bot DMs + group chats. WebSocket is the only supported connection mode.
Quick start
Requires OpenClaw 2026.4.10 or above. Run openclaw --version to check. Upgrade with openclaw update .
Add the Yuanbao channel with your credentials
bash Copy code openclaw channels add --channel yuanbao --token "appKey:appSecret"
The --token value uses colon-separated appKey:appSecret format. You can obtain these from the Yuanbao app by creating a robot in your application settings.
After setup completes, restart the gateway to apply the changes
bash Copy code openclaw gateway restart
Interactive setup (alternative)
You can also use the interactive wizard:
bash Copy code openclaw channels login --channel yuanbao
Follow the prompts to enter your App ID and App Secret.
Access control
Direct messages
Configure dmPolicy to control who can DM the bot:
"pairing" - unknown users receive a pairing code; approve via CLI
"allowlist" - only users listed in allowFrom can chat
"open" - allow all users (default)
"disabled" - disable all DMs
Approve a pairing request:
bash Copy code openclaw pairing list yuanbao openclaw pairing approve yuanbao <CODE>
Group chats
Mention requirement ( channels.yuanbao.requireMention ):
true - require @mention (default)
false - respond without @mention
Replying to the bot's message in a group chat is treated as an implicit mention.
Configuration examples
Basic setup with open DM policy
json5 Copy code { channels : { yuanbao : { appKey : "your_app_key" , appSecret : "your_app_secret" , dm : { policy : "open" , }, }, }, }
Restrict DMs to specific users
json5 Copy code { channels : { yuanbao : { appKey : "your_app_key" , appSecret : "your_app_secret" , dm : { policy : "allowlist" , allowFrom : [ "user_id_1" , "user_id_2" ], }, }, }, }
Disable @mention requirement in groups
json5 Copy code { channels : { yuanbao : { requireMention : false , }, }, }
Optimize outbound message delivery
json5 Copy code { channels : { yuanbao : { // Send each chunk immediately without buffering outboundQueueStrategy : "immediate" , }, }, }
Tune merge-text strategy
json5 Copy code { channels : { yuanbao : { outboundQueueStrategy : "merge-text" , minChars : 2800 , // buffer until this many chars maxChars : 3000 , // force split above this limit idleMs : 5000 , // auto-flush after idle timeout (ms) }, }, }
Common commands
Command Description /help Show available commands /status Show bot status /new Start a new session /stop Stop the current run /restart Restart OpenClaw /compact Compact the session context
Yuanbao supports native slash-command menus. Commands are synced to the platform automatically when the gateway starts.
Troubleshooting
Bot does not respond in group chats
Ensure the bot is added to the group
Ensure you @mention the bot (required by default)
Check logs: openclaw logs --follow
Bot does not receive messages
Ensure the bot is created and approved in the Yuanbao app
Ensure appKey and appSecret are correctly configured
Ensure the gateway is running: openclaw gateway status
Bot sends empty or fallback replies
Check if the AI model is returning valid content
The default fallback reply is: "暂时无法解答，你可以换个问题问问我哦"
Customize it via channels.yuanbao.fallbackReply
App Secret leaked
Reset the App Secret in YuanBao APP
Update the value in your config
Restart the gateway: openclaw gateway restart
Advanced configuration
Multiple accounts
json5 Copy code { channels : { yuanbao : { defaultAccount : "main" , accounts : { main : { appKey : "key_xxx" , appSecret : "secret_xxx" , name : "Primary bot" , }, backup : { appKey : "key_yyy" , appSecret : "secret_yyy" , name : "Backup bot" , enabled : false , }, }, }, }, }
defaultAccount controls which account is used when outbound APIs do not specify an accountId .
Message limits
maxChars - single message max character count (default: 3000 chars)
mediaMaxMb - media upload/download limit (default: 20 MB)
overflowPolicy - behavior when message exceeds limit: "split" (default) or "stop"
Streaming
Yuanbao supports block-level streaming output. When enabled, the bot sends text in chunks as it generates.
json5 Copy code { channels : { yuanbao : { disableBlockStreaming : false , // block streaming enabled (default) }, }, }
Set disableBlockStreaming: true to send the complete reply in one message.
Group chat history context
Control how many historical messages are included in the AI context for group chats:
json5 Copy code { channels : { yuanbao : { historyLimit : 100 , // default: 100, set 0 to disable }, }, }
Reply-to mode
Control how the bot quotes messages when replying in group chats:
json5 Copy code { channels : { yuanbao : { replyToMode : "first" , // "off" | "first" | "all" (default: "first") }, }, }
Value Behavior "off" No quote reply "first" Quote only the first reply per inbound message (default) "all" Quote every reply
Markdown hint injection
By default, the bot injects instructions in the system prompt to prevent the AI model from wrapping the entire reply in markdown code blocks.
json5 Copy code { channels : { yuanbao : { markdownHintEnabled : true , // default: true }, }, }
Debug mode
Enable unsanitized log output for specific bot IDs:
json5 Copy code { channels : { yuanbao : { debugBotIds : [ "bot_user_id_1" , "bot_user_id_2" ], }, }, }
Multi-agent routing
Use bindings to route Yuanbao DMs or groups to different agents.
json5 Copy code { agents : { list : [ { id : "main" }, { id : "agent-a" , workspace : "/home/user/agent-a" }, { id : "agent-b" , workspace : "/home/user/agent-b" }, ], }, bindings : [ { agentId : "agent-a" , match : { channel : "yuanbao" , peer : { kind : "direct" , id : "user_xxx" }, }, }, { agentId : "agent-b" , match : { channel : "yuanbao" , peer : { kind : "group" , id : "group_zzz" }, }, }, ], }
Routing fields:
match.channel : "yuanbao"
match.peer.kind : "direct" (DM) or "group" (group chat)
match.peer.id : user ID or group code
Configuration reference
Full configuration: Gateway configuration
Setting Description Default channels.yuanbao.enabled Enable/disable the channel true channels.yuanbao.defaultAccount Default account for outbound routing default channels.yuanbao.accounts.<id>.appKey App Key (used for signing and ticket generation) - channels.yuanbao.accounts.<id>.appSecret App Secret (used for signing) - channels.yuanbao.accounts.<id>.token Pre-signed token (skips automatic ticket signing) - channels.yuanbao.accounts.<id>.name Account display name - channels.yuanbao.accounts.<id>.enabled Enable/disable a specific account true channels.yuanbao.dm.policy DM policy open channels.yuanbao.dm.allowFrom DM allowlist (user ID list) - channels.yuanbao.requireMention Require @mention in groups true channels.yuanbao.overflowPolicy Long message handling ( split or stop ) split channels.yuanbao.replyToMode Group reply-to strategy ( off , first , all ) first channels.yuanbao.outboundQueueStrategy Outbound strategy ( merge-text or immediate ) merge-text channels.yuanbao.minChars Merge-text: min chars to trigger send 2800 channels.yuanbao.maxChars Merge-text: max chars per message 3000 channels.yuanbao.idleMs Merge-text: idle timeout before auto-flush (ms) 5000 channels.yuanbao.mediaMaxMb Media size limit (MB) 20 channels.yuanbao.historyLimit Group chat history context entries 100 channels.yuanbao.disableBlockStreaming Disable block-level streaming output false channels.yuanbao.fallbackReply Fallback reply when AI returns no content 暂时无法解答，你可以换个问题问问我哦 channels.yuanbao.markdownHintEnabled Inject markdown anti-wrapping instructions true channels.yuanbao.debugBotIds Debug whitelist bot IDs (unsanitized logs) []
Supported message types
Receive
✅ Text
✅ Images
✅ Files
✅ Audio / Voice
✅ Video
✅ Stickers / Custom emoji
✅ Custom elements (link cards, etc.)
Send
✅ Text (with markdown support)
✅ Audio
✅ Stickers
Threads and replies
✅ Quote replies (configurable via replyToMode )
❌ Thread replies (not supported by platform)
Related
Channels Overview - all supported channels
Pairing - DM authentication and pairing flow
Groups - group chat behavior and mention gating
Channel Routing - session routing for messages
Security - access model and hardening
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
