# Channel message API - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/plugins/sdk-channel-message
- Final URL: https://docs.openclaw.ai/plugins/sdk-channel-message
- Canonical URL: https://docs.openclaw.ai/plugins/sdk-channel-message
- Fetched at: 2026-06-23T14:54:26Z
- Content type: text/html; charset=utf-8

## Description

Redirect to /plugins/sdk-channel-outbound

## Extracted Text

Close
Get started
This page moved to Channel outbound API .
openclaw/plugin-sdk/channel-message and
openclaw/plugin-sdk/channel-message-runtime remain deprecated compatibility
subpaths for older plugins. New channel plugins should use
openclaw/plugin-sdk/channel-outbound for message lifecycle, receipt, durable
send, and live preview helpers. The deprecated subpaths are thin aliases over
the shared channel message core and the focused inbound/outbound SDK surfaces;
do not add new helpers there.
Removal plan: keep these aliases through the external plugin migration window,
then remove them in the next major SDK cleanup after callers have moved to
channel-outbound .
Was this useful? Yes No
Open issue
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
