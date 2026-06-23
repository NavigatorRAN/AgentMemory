# Imessage — Send and receive iMessages/SMS via the imsg CLI on macOS | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/bundled/apple/apple-imessage
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/bundled/apple/apple-imessage
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/bundled/apple/apple-imessage
- Fetched at: 2026-06-23T14:17:36Z
- Content type: text/html; charset=utf-8

## Description

Send and receive iMessages/SMS via the imsg CLI on macOS

## Extracted Text

Skip to main content
On this page
Send and receive iMessages/SMS via the imsg CLI on macOS.
Skill metadata ​
Source Bundled (installed by default) Path skills/apple/imessage Version 1.0.0 Author Hermes Agent License MIT Platforms macos Tags iMessage , SMS , messaging , macOS , Apple
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
iMessage
Use imsg to read and send iMessage/SMS via macOS Messages.app.
Prerequisites ​
macOS with Messages.app signed in
Install: brew install steipete/tap/imsg
Grant Full Disk Access for terminal (System Settings → Privacy → Full Disk Access)
Grant Automation permission for Messages.app when prompted
When to Use ​
User asks to send an iMessage or text message
Reading iMessage conversation history
Checking recent Messages.app chats
Sending to phone numbers or Apple IDs
When NOT to Use ​
Telegram/Discord/Slack/WhatsApp messages → use the appropriate gateway channel
Group chat management (adding/removing members) → not supported
Bulk/mass messaging → always confirm with user first
Quick Reference ​
List Chats ​
imsg chats --limit 10 --json
View History ​
# By chat ID
imsg history --chat-id 1 --limit 20 --json
# With attachments info
imsg history --chat-id 1 --limit 20 --attachments --json
Send Messages ​
# Text only
imsg send --to "+14155551212" --text "Hello!"
# With attachment
imsg send --to "+14155551212" --text "Check this out" --file /path/to/image.jpg
# Force iMessage or SMS
imsg send --to "+14155551212" --text "Hi" --service imessage
imsg send --to "+14155551212" --text "Hi" --service sms
Watch for New Messages ​
imsg watch --chat-id 1 --attachments
Service Options ​
--service imessage — Force iMessage (requires recipient has iMessage)
--service sms — Force SMS (green bubble)
--service auto — Let Messages.app decide (default)
Rules ​
Always confirm recipient and message content before sending
Never send to unknown numbers without explicit user approval
Verify file paths exist before attaching
Don't spam — rate-limit yourself
Example Workflow ​
User: "Text mom that I'll be late"
# 1. Find mom's chat
imsg chats --limit 20 --json | jq '.[] | select(.displayName | contains("Mom"))'
# 2. Confirm with user: "Found Mom at +1555123456. Send 'I'll be late' via iMessage?"
# 3. Send after confirmation
imsg send --to "+1555123456" --text "I'll be late"
Skill metadata
Reference: full SKILL.md
Prerequisites
When to Use
When NOT to Use
Quick Reference
List Chats
View History
Send Messages
Watch for New Messages
Service Options
Rules
Example Workflow
