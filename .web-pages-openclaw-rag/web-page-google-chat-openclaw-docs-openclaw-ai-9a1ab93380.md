# Google Chat - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/channels/googlechat
- Final URL: https://docs.openclaw.ai/channels/googlechat
- Canonical URL: https://docs.openclaw.ai/channels/googlechat
- Fetched at: 2026-06-23T14:36:05Z
- Content type: text/html; charset=utf-8

## Description

Google Chat app support status, capabilities, and configuration

## Extracted Text

Close
Channels Mainstream messaging
Status: downloadable plugin for DMs + spaces via Google Chat API webhooks (HTTP only).
Install
Install Google Chat before configuring the channel:
bash Copy code openclaw plugins install @openclaw/googlechat
Local checkout (when running from a git repo):
bash Copy code openclaw plugins install ./path/to/local/googlechat-plugin
Quick setup (beginner)
Create a Google Cloud project and enable the Google Chat API .
Go to: Google Chat API Credentials
Enable the API if it is not already enabled.
Create a Service Account :
Press Create Credentials > Service Account .
Name it whatever you want (e.g., openclaw-chat ).
Leave permissions blank (press Continue ).
Leave principals with access blank (press Done ).
Create and download the JSON Key :
In the list of service accounts, click on the one you just created.
Go to the Keys tab.
Click Add Key > Create new key .
Select JSON and press Create .
Store the downloaded JSON file on your gateway host (e.g., ~/.openclaw/googlechat-service-account.json ).
Create a Google Chat app in the Google Cloud Console Chat Configuration :
Fill in the Application info :
App name : (e.g. OpenClaw )
Avatar URL : (e.g. https://openclaw.ai/logo.png )
Description : (e.g. Personal AI Assistant )
Enable Interactive features .
Under Functionality , check Join spaces and group conversations .
Under Connection settings , select HTTP endpoint URL .
Under Triggers , select Use a common HTTP endpoint URL for all triggers and set it to your gateway's public URL followed by /googlechat .
Tip: Run openclaw status to find your gateway's public URL.
Under Visibility , check Make this Chat app available to specific people and groups in <Your Domain> .
Enter your email address (e.g. user@example.com ) in the text box.
Click Save at the bottom.
Enable the app status :
After saving, refresh the page .
Look for the App status section (usually near the top or bottom after saving).
Change the status to Live - available to users .
Click Save again.
Configure OpenClaw with the service account path + webhook audience:
Env: GOOGLE_CHAT_SERVICE_ACCOUNT_FILE=/path/to/service-account.json
Or config: channels.googlechat.serviceAccountFile: "/path/to/service-account.json" .
Set the webhook audience type + value (matches your Chat app config).
Start the gateway. Google Chat will POST to your webhook path.
Add to Google Chat
Once the gateway is running and your email is added to the visibility list:
Go to Google Chat .
Click the + (plus) icon next to Direct Messages .
In the search bar (where you usually add people), type the App name you configured in the Google Cloud Console.
Note : The bot will not appear in the "Marketplace" browse list because it is a private app. You must search for it by name.
Select your bot from the results.
Click Add or Chat to start a 1:1 conversation.
Send "Hello" to trigger the assistant!
Public URL (Webhook-only)
Google Chat webhooks require a public HTTPS endpoint. For security, only expose the /googlechat path to the internet. Keep the OpenClaw dashboard and other sensitive endpoints on your private network.
Option A: Tailscale Funnel (Recommended)
Use Tailscale Serve for the private dashboard and Funnel for the public webhook path. This keeps / private while exposing only /googlechat .
Check what address your gateway is bound to:
bash Copy code ss -tlnp | grep 18789
Note the IP address (e.g., 127.0.0.1 , 0.0.0.0 , or your Tailscale IP like 100.x.x.x ).
Expose the dashboard to the tailnet only (port 8443):
bash Copy code # If bound to localhost (127.0.0.1 or 0.0.0.0): tailscale serve -- bg --https 8443 http://127.0.0.1:18789 # If bound to Tailscale IP only (e.g., 100.106.161.80): tailscale serve -- bg --https 8443 http://100.106.161.80:18789
Expose only the webhook path publicly:
bash Copy code # If bound to localhost (127.0.0.1 or 0.0.0.0): tailscale funnel -- bg --set-path /googlechat http://127.0.0.1:18789/googlechat # If bound to Tailscale IP only (e.g., 100.106.161.80): tailscale funnel -- bg --set-path /googlechat http://100.106.161.80:18789/googlechat
Authorize the node for Funnel access:
If prompted, visit the authorization URL shown in the output to enable Funnel for this node in your tailnet policy.
Verify the configuration:
bash Copy code tailscale serve status tailscale funnel status
Your public webhook URL will be:
https://<node-name>.<tailnet>.ts.net/googlechat
Your private dashboard stays tailnet-only:
https://<node-name>.<tailnet>.ts.net:8443/
Use the public URL (without :8443 ) in the Google Chat app config.
Note: This configuration persists across reboots. To remove it later, run tailscale funnel reset and tailscale serve reset .
Option B: Reverse Proxy (Caddy)
If you use a reverse proxy like Caddy, only proxy the specific path:
caddy Copy code your-domain.com { reverse_proxy /googlechat* localhost:18789 }
With this config, any request to your-domain.com/ will be ignored or returned as 404, while your-domain.com/googlechat is safely routed to OpenClaw.
Option C: Cloudflare Tunnel
Configure your tunnel's ingress rules to only route the webhook path:
Path : /googlechat -> http://localhost:18789/googlechat
Default Rule : HTTP 404 (Not Found)
How it works
Google Chat sends webhook POSTs to the gateway. Each request includes an Authorization: Bearer <token> header.
OpenClaw verifies bearer auth before reading/parsing full webhook bodies when the header is present.
Google Workspace Add-on requests that carry authorizationEventObject.systemIdToken in the body are supported via a stricter pre-auth body budget.
OpenClaw verifies the token against the configured audienceType + audience :
audienceType: "app-url" → audience is your HTTPS webhook URL.
audienceType: "project-number" → audience is the Cloud project number.
Messages are routed by space:
DMs use session key agent:<agentId>:googlechat:direct:<spaceId> .
Spaces use session key agent:<agentId>:googlechat:group:<spaceId> .
DM access is pairing by default. Unknown senders receive a pairing code; approve with:
openclaw pairing approve googlechat <code>
Group spaces require @-mention by default. Use botUser if mention detection needs the app's user name.
When an exec or plugin approval request starts from Google Chat and a stable users/<id> approver is configured, OpenClaw posts a native Google Chat approval card in the originating space or thread. The card buttons use opaque callback tokens, and the manual /approve <id> <decision> prompt is only shown when native approval delivery is unavailable.
Targets
Use these identifiers for delivery and allowlists:
Direct messages: users/<userId> (recommended).
Raw email name@example.com is mutable and only used for direct allowlist matching when channels.googlechat.dangerouslyAllowNameMatching: true .
Deprecated: users/<email> is treated as a user id, not an email allowlist.
Spaces: spaces/<spaceId> .
Config highlights
json5 Copy code { channels : { googlechat : { enabled : true , serviceAccountFile : "/path/to/service-account.json" , // or serviceAccountRef: { source: "file", provider: "filemain", id: "/channels/googlechat/serviceAccount" } audienceType : "app-url" , audience : "https://gateway.example.com/googlechat" , webhookPath : "/googlechat" , botUser : "users/1234567890" , // optional; helps mention detection allowBots : false , dm : { policy : "pairing" , allowFrom : [ "users/1234567890" ], }, groupPolicy : "allowlist" , groups : { "spaces/AAAA" : { enabled : true , requireMention : true , users : [ "users/1234567890" ], systemPrompt : "Short answers only." , }, }, actions : { reactions : true }, typingIndicator : "message" , mediaMaxMb : 20 , }, }, }
Notes:
Service account credentials can also be passed inline with serviceAccount (JSON string).
serviceAccountRef is also supported (env/file SecretRef), including per-account refs under channels.googlechat.accounts.<id>.serviceAccountRef .
Default webhook path is /googlechat if webhookPath isn't set.
dangerouslyAllowNameMatching re-enables mutable email principal matching for allowlists (break-glass compatibility mode).
Reactions are available via the reactions tool and channels action when actions.reactions is enabled.
Native approval cards use Google Chat cardsV2 button clicks, not reaction events. Approvers come from dm.allowFrom or defaultTo and must be stable numeric users/<id> values.
Message actions expose send for text and upload-file for explicit attachment sends. upload-file accepts media / filePath / path plus optional message , filename , and thread targeting.
typingIndicator supports message (default), none , and reaction (reaction requires user OAuth).
Attachments are downloaded through the Chat API and stored in the media pipeline (size capped by mediaMaxMb ).
Bot-authored Google Chat messages are ignored by default. If you intentionally set allowBots: true , accepted bot-authored messages use shared bot loop protection . Configure channels.defaults.botLoopProtection , then override with channels.googlechat.botLoopProtection or channels.googlechat.groups.<space>.botLoopProtection when one space needs a different budget.
Secrets reference details: Secrets Management .
Troubleshooting
405 Method Not Allowed
If Google Cloud Logs Explorer shows errors like:
Code Copy code status code: 405, reason phrase: HTTP error response: HTTP/1.1 405 Method Not Allowed
This means the webhook handler isn't registered. Common causes:
Channel not configured : The channels.googlechat section is missing from your config. Verify with:
bash Copy code openclaw config get channels.googlechat
If it returns "Config path not found", add the configuration (see Config highlights ).
Plugin not enabled : Check plugin status:
bash Copy code openclaw plugins list | grep googlechat
If it shows "disabled", add plugins.entries.googlechat.enabled: true to your config.
Gateway not restarted : After adding config, restart the gateway:
bash Copy code openclaw gateway restart
Verify the channel is running:
bash Copy code openclaw channels status # Should show: Google Chat default: enabled, configured, ...
Other issues
Check openclaw channels status --probe for auth errors or missing audience config.
If no messages arrive, confirm the Chat app's webhook URL + event subscriptions.
If mention gating blocks replies, set botUser to the app's user resource name and verify requireMention .
Use openclaw logs --follow while sending a test message to see if requests reach the gateway.
Related docs:
Gateway configuration
Security
Reactions
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
