# Twitch - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels/twitch
- Final URL: https://docs.openclaw.ai/channels/twitch
- Canonical URL: https://docs.openclaw.ai/channels/twitch
- Fetched at: 2026-06-23T14:36:42Z
- Content type: text/html; charset=utf-8

## Description

Twitch chat bot configuration and setup

## Extracted Text

Close
Channels Developer and self-hosted
Twitch chat support via IRC connection. OpenClaw connects as a Twitch user (bot account) to receive and send messages in channels.
Bundled plugin
Note
Twitch ships as a bundled plugin in current OpenClaw releases, so normal packaged builds do not need a separate install.
If you are on an older build or a custom install that excludes Twitch, install the npm package directly:
npm registry
bash Copy code openclaw plugins install @openclaw/twitch
Local checkout
bash Copy code openclaw plugins install ./path/to/local/twitch-plugin
Use the bare package to follow the current official release tag. Pin an exact
version only when you need a reproducible install.
Details: Plugins
Quick setup (beginner)
Ensure plugin is available
Current packaged OpenClaw releases already bundle it. Older/custom installs can add it manually with the commands above.
Create a Twitch bot account
Create a dedicated Twitch account for the bot (or use an existing account).
Generate credentials
Use Twitch Token Generator :
Select Bot Token
Verify scopes chat:read and chat:write are selected
Copy the Client ID and Access Token
Find your Twitch user ID
Use https://www.streamweasels.com/tools/convert-twitch-username-to-user-id/ to convert a username to a Twitch user ID.
Configure the token
Env: OPENCLAW_TWITCH_ACCESS_TOKEN=... (default account only)
Or config: channels.twitch.accessToken
If both are set, config takes precedence (env fallback is default-account only).
Start the gateway
Start the gateway with the configured channel.
Warning
Add access control ( allowFrom or allowedRoles ) to prevent unauthorized users from triggering the bot. requireMention defaults to true .
Minimal config:
json5 Copy code { channels : { twitch : { enabled : true , username : "openclaw" , // Bot's Twitch account accessToken : "oauth:abc123..." , // OAuth Access Token (or use OPENCLAW_TWITCH_ACCESS_TOKEN env var) clientId : "xyz789..." , // Client ID from Token Generator channel : "vevisk" , // Which Twitch channel's chat to join (required) allowFrom : [ "123456789" ], // (recommended) Your Twitch user ID only - get it from https://www.streamweasels.com/tools/convert-twitch-username-to-user-id/ }, }, }
What it is
A Twitch channel owned by the Gateway.
Deterministic routing: replies always go back to Twitch.
Each account maps to an isolated session key agent:<agentId>:twitch:<accountName> .
username is the bot's account (who authenticates), channel is which chat room to join.
Setup (detailed)
No manual app registration needed. Tokens expire after several hours.
Configure the bot
Env var (default account only)
bash Copy code OPENCLAW_TWITCH_ACCESS_TOKEN=oauth:abc123...
Config
json5 Copy code { channels : { twitch : { enabled : true , username : "openclaw" , accessToken : "oauth:abc123..." , clientId : "xyz789..." , channel : "vevisk" , }, }, }
If both env and config are set, config takes precedence.
Access control (recommended)
json5 Copy code { channels : { twitch : { allowFrom : [ "123456789" ], // (recommended) Your Twitch user ID only }, }, }
Prefer allowFrom for a hard allowlist. Use allowedRoles instead if you want role-based access.
Available roles: "moderator" , "owner" , "vip" , "subscriber" , "all" .
Why user IDs? Usernames can change, allowing impersonation. User IDs are permanent.
Find your Twitch user ID: https://www.streamweasels.com/tools/convert-twitch-username-to-user-id/ (Convert your Twitch username to ID)
Token refresh (optional)
Tokens from Twitch Token Generator cannot be automatically refreshed - regenerate when expired.
For automatic token refresh, create your own Twitch application at Twitch Developer Console and add to config:
json5 Copy code { channels : { twitch : { clientSecret : "your_client_secret" , refreshToken : "your_refresh_token" , }, }, }
The bot automatically refreshes tokens before expiration and logs refresh events.
Multi-account support
Use channels.twitch.accounts with per-account tokens. See Configuration for the shared pattern.
Example (one bot account in two channels):
json5 Copy code { channels : { twitch : { accounts : { channel1 : { username : "openclaw" , accessToken : "oauth:abc123..." , clientId : "xyz789..." , channel : "vevisk" , }, channel2 : { username : "openclaw" , accessToken : "oauth:def456..." , clientId : "uvw012..." , channel : "secondchannel" , }, }, }, }, } Note
Each account needs its own token (one token per channel).
Access control
User ID allowlist (most secure)
json5 Copy code { channels : { twitch : { accounts : { default : { allowFrom : [ "123456789" , "987654321" ], }, }, }, }, }
Role-based
json5 Copy code { channels : { twitch : { accounts : { default : { allowedRoles : [ "moderator" , "vip" ], }, }, }, }, }
allowFrom is a hard allowlist. When set, only those user IDs are allowed. If you want role-based access, leave allowFrom unset and configure allowedRoles instead.
Disable @mention requirement
By default, requireMention is true . To disable and respond to all messages:
json5 Copy code { channels : { twitch : { accounts : { default : { requireMention : false , }, }, }, }, }
Troubleshooting
First, run diagnostic commands:
bash Copy code openclaw doctor openclaw channels status --probe
Bot does not respond to messages
Check access control: Ensure your user ID is in allowFrom , or temporarily remove allowFrom and set allowedRoles: ["all"] to test.
Check the bot is in the channel: The bot must join the channel specified in channel .
Token issues
"Failed to connect" or authentication errors:
Verify accessToken is the OAuth access token value (typically starts with oauth: prefix)
Check token has chat:read and chat:write scopes
If using token refresh, verify clientSecret and refreshToken are set
Token refresh not working
Check logs for refresh events:
Code Copy code Using env token source for mybot Access token refreshed for user 123456 (expires in 14400s)
If you see "token refresh disabled (no refresh token)":
Ensure clientSecret is provided
Ensure refreshToken is provided
Account config
Bot username.
OAuth access token with chat:read and chat:write .
Twitch Client ID (from Token Generator or your app).
Channel to join.
Enable this account.
Optional: for automatic token refresh.
Token expiry in seconds.
Token obtained timestamp.
User ID allowlist.
Require @mention.
Provider options
channels.twitch.enabled - Enable/disable channel startup
channels.twitch.username - Bot username (simplified single-account config)
channels.twitch.accessToken - OAuth access token (simplified single-account config)
channels.twitch.clientId - Twitch Client ID (simplified single-account config)
channels.twitch.channel - Channel to join (simplified single-account config)
channels.twitch.accounts.<accountName> - Multi-account config (all account fields above)
Full example:
json5 Copy code { channels : { twitch : { enabled : true , username : "openclaw" , accessToken : "oauth:abc123..." , clientId : "xyz789..." , channel : "vevisk" , clientSecret : "secret123..." , refreshToken : "refresh456..." , allowFrom : [ "123456789" ], allowedRoles : [ "moderator" , "vip" ], accounts : { default : { username : "mybot" , accessToken : "oauth:abc123..." , clientId : "xyz789..." , channel : "your_channel" , enabled : true , clientSecret : "secret123..." , refreshToken : "refresh456..." , expiresIn : 14400 , obtainmentTimestamp : 1706092800000 , allowFrom : [ "123456789" , "987654321" ], allowedRoles : [ "moderator" ], }, }, }, }, }
Tool actions
The agent can call twitch with action:
send - Send a message to a channel
Example:
json5 Copy code { action : "twitch" , params : { message : "Hello Twitch!" , to : "#mychannel" , }, }
Safety and ops
Treat tokens like passwords — Never commit tokens to git.
Use automatic token refresh for long-running bots.
Use user ID allowlists instead of usernames for access control.
Monitor logs for token refresh events and connection status.
Scope tokens minimally — Only request chat:read and chat:write .
If stuck : Restart the gateway after confirming no other process owns the session.
Limits
500 characters per message (auto-chunked at word boundaries).
Markdown is stripped before chunking.
No rate limiting (uses Twitch's built-in rate limits).
Related
Channel Routing — session routing for messages
Channels Overview — all supported channels
Groups — group chat behavior and mention gating
Pairing — DM authentication and pairing flow
Security — access model and hardening
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
