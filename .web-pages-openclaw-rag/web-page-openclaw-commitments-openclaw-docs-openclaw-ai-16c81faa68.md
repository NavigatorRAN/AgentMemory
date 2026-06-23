# `openclaw commitments` - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/commitments
- Final URL: https://docs.openclaw.ai/cli/commitments
- Canonical URL: https://docs.openclaw.ai/cli/commitments
- Fetched at: 2026-06-23T14:37:22Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw commitments` (inspect and dismiss inferred follow-ups)

## Extracted Text

Close
Reference CLI commands
List and manage inferred follow-up commitments.
Commitments are opt-in, short-lived follow-up memories created from
conversation context. See Inferred commitments for the
conceptual guide.
With no subcommand, openclaw commitments lists pending commitments.
Usage
bash Copy code openclaw commitments [--all] [--agent < id >] [--status <status>] [--json] openclaw commitments list [--all] [--agent < id >] [--status <status>] [--json] openclaw commitments dismiss < id ...> [--json]
Options
--all : show all statuses instead of only pending commitments.
--agent <id> : filter to one agent id.
--status <status> : filter by status. Values: pending , sent ,
dismissed , snoozed , or expired .
--json : output machine-readable JSON.
Examples
List pending commitments:
bash Copy code openclaw commitments
List every stored commitment:
bash Copy code openclaw commitments --all
Filter to one agent:
bash Copy code openclaw commitments --agent main
Find snoozed commitments:
bash Copy code openclaw commitments --status snoozed
Dismiss one or more commitments:
bash Copy code openclaw commitments dismiss cm_abc123 cm_def456
Export as JSON:
bash Copy code openclaw commitments --all --json
Output
Text output includes:
commitment id
status
kind
earliest due time
scope
suggested check-in text
JSON output also includes the commitment store path and full stored records.
Related
Inferred commitments
Memory overview
Heartbeat
Scheduled tasks
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
