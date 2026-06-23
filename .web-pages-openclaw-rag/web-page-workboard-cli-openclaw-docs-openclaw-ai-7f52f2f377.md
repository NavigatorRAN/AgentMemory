# Workboard CLI - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/workboard
- Final URL: https://docs.openclaw.ai/cli/workboard
- Canonical URL: https://docs.openclaw.ai/cli/workboard
- Fetched at: 2026-06-23T14:38:22Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw workboard` cards, dispatch, and worker runs

## Extracted Text

Close
Reference CLI commands
openclaw workboard is the terminal surface for the bundled
Workboard plugin . It lets an operator list cards, create a
card, inspect one card, and ask the running Gateway to dispatch ready work into
subagent worker runs.
Enable the plugin before using the command:
bash Copy code openclaw plugins enable workboard openclaw gateway restart
Usage
bash Copy code openclaw workboard list [--board < id >] [--status <status>] [--json] openclaw workboard create <title...> [--notes <text>] [--status <status>] [--priority <priority>] [--agent < id >] [--board < id >] [--labels <items>] [--json] openclaw workboard show < id > [--json] openclaw workboard dispatch [--url <url>] [--token <token>] [-- timeout <ms>] [--json]
The command reads and writes the same plugin-owned SQLite database used by the
dashboard and Workboard agent tools. Card ids can be passed by full id or by an
unambiguous prefix when a command accepts a card id.
list
bash Copy code openclaw workboard list openclaw workboard list --board default --status ready openclaw workboard list --json
Text output is compact:
text Copy code 7f4a2c10 ready high default agent-a Fix stale worker heartbeat
Columns are id prefix, status, priority, board id, optional agent id, and title.
Flags:
Flag Purpose --board <id> Limit results to one board namespace --status <status> Limit results to one Workboard status --json Print the full card list as machine JSON
create
bash Copy code openclaw workboard create "Fix stale worker heartbeat" --priority high --labels bug,workboard openclaw workboard create "Write Workboard docs" --status ready --agent docs-agent --board docs --notes "Cover CLI, slash command, dispatch, and SQLite state."
Flag Purpose --notes <text> Initial card notes --status <status> Initial status, default todo --priority <priority> Priority, default normal --agent <id> Assign the card to an agent or owner id --board <id> Store the card on a board namespace --labels <items> Comma-separated labels --json Print the created card as machine JSON
create writes directly to Workboard SQLite state. The card is immediately
visible in the Control UI Workboard tab and to Workboard tools.
show
bash Copy code openclaw workboard show 7f4a2c10 openclaw workboard show 7f4a2c10 --json
Text output prints the compact card line and notes. JSON output returns the full
card record, including execution metadata, attempts, comments, links, proof,
artifacts, worker logs, protocol state, diagnostics, and automation metadata.
dispatch
bash Copy code openclaw workboard dispatch openclaw workboard dispatch --json openclaw workboard dispatch --url http://127.0.0.1:18789 --token " $OPENCLAW_GATEWAY_TOKEN "
dispatch first calls the running Gateway RPC method
workboard.cards.dispatch . That path uses the same subagent runtime as the
dashboard dispatch action, so ready cards become task-tracked worker runs with
linked session keys. Cards with an assigned agent use agent-scoped subagent
session keys; unassigned cards keep an unscoped subagent key so the Gateway's
configured default agent is preserved.
The dispatch loop:
Promotes dependency-ready children to ready .
Blocks expired claims or timed-out worker runs.
Records dispatch metadata on ready cards.
Selects a small batch of unclaimed ready cards.
Claims each selected card for the dispatcher or assigned agent.
Starts a subagent worker run with bounded card context and the card claim
token.
Stores the worker run id, session key, task linkage when the Gateway task
ledger reports it, execution status, and worker log on the card.
Selection is intentionally conservative. One dispatch starts at most three
workers by default, skips archived or already-claimed cards, and starts only one
card per owner or agent in a single pass. Cards already owned by active running
or review work are left for a later dispatch.
If worker start fails after a card is claimed, Workboard blocks that card,
clears the claim, and records the failure in card execution and worker-log
metadata. This keeps failed starts visible instead of silently returning the
card to the queue.
If no explicit Gateway target is provided and the local Gateway is unavailable
or does not expose the Workboard dispatch method yet, the CLI falls back to
data-only dispatch against local Workboard state. Data-only dispatch can still
promote dependencies, clean stale claims, and block timed-out runs, but it does
not start workers. Auth, permission, validation failures, and failures for an
explicit --url or --token target are reported directly.
Text output reports worker starts:
text Copy code dispatch complete: started=2 failures=0
Fallback output is explicit:
text Copy code gateway unavailable; data dispatch only: promoted=1 blocked=0
JSON output includes the dispatch result. Gateway-backed dispatch can include
started and startFailures ; data-only fallback includes
gatewayUnavailable: true . Claim tokens are redacted from card JSON output.
In the dashboard, the same dispatch result is shown as a short summary so an
operator can see how many cards started, promoted, blocked, reclaimed, or
failed without opening card details.
Slash Command Parity
Command-capable channels can use the matching slash command:
text Copy code /workboard list /workboard show 7f4a2c10 /workboard create Fix stale worker heartbeat /workboard dispatch
Slash command dispatch also uses the Gateway subagent runtime, so it follows the
same claim, worker-start, and failure behavior as the dashboard and CLI Gateway
path.
/workboard list and /workboard show are read commands for authorized command
senders. /workboard create and /workboard dispatch mutate board state and
require owner status on chat surfaces or a Gateway client with operator.write
or operator.admin .
Permissions
The CLI dispatch path calls Gateway RPC with operator.read and
operator.write scopes. A read-only Gateway token can inspect Workboard data
through read methods, but it cannot create cards or dispatch workers.
Local list , create , and show commands operate on the local OpenClaw state
directory used by the current profile. Use --dev or --profile <name> on the
top-level openclaw command when you need a different state root.
Troubleshooting
No Cards Appear
Confirm the plugin is enabled for the same profile and state root:
bash Copy code openclaw plugins inspect workboard --runtime --json
If the dashboard shows cards but the CLI does not, check that both commands use
the same --dev or --profile setting.
Dispatch Says Data-Only
Start or restart the Gateway:
bash Copy code openclaw gateway restart openclaw gateway status --deep
Then retry openclaw workboard dispatch . Data-only fallback is useful for local
state cleanup, but worker runs need a live Gateway.
Dispatch Starts Nothing
Check for at least one ready card without an active claim:
bash Copy code openclaw workboard list --status ready
Cards can also be skipped when the same owner already has running or review
work. Move completed work to done , release stale claims through the Workboard
tools, or run dispatch again after the active worker finishes.
Related
Workboard plugin
CLI reference
Slash commands
Control UI
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
