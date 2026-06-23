# Pairing - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/pairing
- Final URL: https://docs.openclaw.ai/cli/pairing
- Canonical URL: https://docs.openclaw.ai/cli/pairing
- Fetched at: 2026-06-23T14:37:56Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw pairing` (approve/list pairing requests)

## Extracted Text

Close
Reference CLI commands
openclaw pairing
Approve or inspect DM pairing requests (for channels that support pairing).
Related:
Pairing flow: Pairing
Commands
bash Copy code openclaw pairing list telegram openclaw pairing list --channel telegram --account work openclaw pairing list telegram --json openclaw pairing approve <code> openclaw pairing approve telegram <code> openclaw pairing approve --channel telegram --account work <code> --notify
pairing list
List pending pairing requests for one channel.
Options:
[channel] : positional channel id
--channel <channel> : explicit channel id
--account <accountId> : account id for multi-account channels
--json : machine-readable output
Notes:
If multiple pairing-capable channels are configured, you must provide a channel either positionally or with --channel .
Extension channels are allowed as long as the channel id is valid.
pairing approve
Approve a pending pairing code and allow that sender.
Usage:
openclaw pairing approve <channel> <code>
openclaw pairing approve --channel <channel> <code>
openclaw pairing approve <code> when exactly one pairing-capable channel is configured
--notify : send a confirmation back to the requester on the same channel
Owner bootstrap:
If commands.ownerAllowFrom is empty when you approve a pairing code, OpenClaw also records the approved sender as the command owner, using a channel-scoped entry such as telegram:123456789 .
This only bootstraps the first owner. Later pairing approvals do not replace or expand commands.ownerAllowFrom .
The command owner is the human operator account allowed to run owner-only commands and approve dangerous actions such as /diagnostics , /export-trajectory , /config , and exec approvals.
Notes
Channel input: pass it positionally ( pairing list telegram ) or with --channel <channel> .
pairing list supports --account <accountId> for multi-account channels.
pairing approve supports --account <accountId> and --notify .
If only one pairing-capable channel is configured, pairing approve <code> is allowed.
If you approved a sender before this bootstrap existed, run openclaw doctor ; it warns when no command owner is configured and shows the openclaw config set commands.ownerAllowFrom ... command to fix it.
Related
CLI reference
Channel pairing
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
