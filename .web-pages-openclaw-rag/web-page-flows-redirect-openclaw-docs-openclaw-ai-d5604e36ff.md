# Flows (redirect) - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/flows
- Final URL: https://docs.openclaw.ai/cli/flows
- Canonical URL: https://docs.openclaw.ai/cli/flows
- Fetched at: 2026-06-23T14:37:39Z
- Content type: text/html; charset=utf-8

## Description

Redirect: flow commands live under `openclaw tasks flow`

## Extracted Text

Close
Reference CLI commands
openclaw tasks flow
There is no top-level openclaw flows command. Durable TaskFlow inspection lives under openclaw tasks flow .
Subcommands
bash Copy code openclaw tasks flow list [--json] [--status <name>] openclaw tasks flow show <lookup> [--json] openclaw tasks flow cancel <lookup>
Subcommand Description Arguments / options list List tracked TaskFlows. --json machine-readable output; --status <name> filter (see status values below). show Show one TaskFlow. <lookup> flow id or owner key; --json machine-readable output. cancel Cancel a running TaskFlow. <lookup> flow id or owner key.
<lookup> accepts either a flow id (returned by list / show ) or the flow's owner key (the stable identifier the owning subsystem uses to track the flow).
Status filter values
--status on list accepts one of:
queued , running , waiting , blocked , succeeded , failed , cancelled , lost
Examples
bash Copy code openclaw tasks flow list openclaw tasks flow list --status running openclaw tasks flow list --json openclaw tasks flow show flow_abc123 openclaw tasks flow show flow_abc123 --json openclaw tasks flow cancel flow_abc123
For full TaskFlow concepts and authoring see TaskFlow . For the parent tasks command see tasks CLI reference .
Related
CLI reference
Automation
TaskFlow
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
