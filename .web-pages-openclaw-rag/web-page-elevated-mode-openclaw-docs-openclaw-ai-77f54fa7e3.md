# Elevated mode - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/elevated
- Final URL: https://docs.openclaw.ai/tools/elevated
- Canonical URL: https://docs.openclaw.ai/tools/elevated
- Fetched at: 2026-06-23T14:57:42Z
- Content type: text/html; charset=utf-8

## Description

Elevated exec mode: run commands outside the sandbox from a sandboxed agent

## Extracted Text

Close
Capabilities Tools
When an agent runs inside a sandbox, its exec commands are confined to the
sandbox environment. Elevated mode lets the agent break out and run commands
outside the sandbox instead, with configurable approval gates.
Info
Elevated mode only changes behavior when the agent is sandboxed . For
unsandboxed agents, exec already runs on the host.
Directives
Control elevated mode per-session with slash commands:
Directive What it does /elevated on Run outside the sandbox on the configured host path, keep approvals /elevated ask Same as on (alias) /elevated full Run outside the sandbox on the configured host path and skip approvals /elevated off Return to sandbox-confined execution
Also available as /elev on|off|ask|full .
Send /elevated with no argument to see the current level.
How it works
Check availability
Elevated must be enabled in config and the sender must be on the allowlist:
json5 Copy code { tools : { elevated : { enabled : true , allowFrom : { discord : [ "user-id-123" ], whatsapp : [ "+15555550123" ], }, }, }, }
Set the level
Send a directive-only message to set the session default:
Code Copy code /elevated full
Or use it inline (applies to that message only):
Code Copy code /elevated on run the deployment script
Commands run outside the sandbox
With elevated active, exec calls leave the sandbox. The effective host is
gateway by default, or node when the configured/session exec target is
node . In full mode, exec approvals are skipped. In on / ask mode,
configured approval rules still apply.
Resolution order
Inline directive on the message (applies only to that message)
Session override (set by sending a directive-only message)
Global default ( agents.defaults.elevatedDefault in config)
Availability and allowlists
Global gate : tools.elevated.enabled (must be true )
Sender allowlist : tools.elevated.allowFrom with per-channel lists
Per-agent gate : agents.list[].tools.elevated.enabled (can only further restrict)
Per-agent allowlist : agents.list[].tools.elevated.allowFrom (sender must match both global + per-agent)
Discord fallback : if tools.elevated.allowFrom.discord is omitted, channels.discord.allowFrom is used as fallback
All gates must pass ; otherwise elevated is treated as unavailable
Allowlist entry formats:
Prefix Matches (none) Sender ID, E.164, or From field name: Sender display name username: Sender username tag: Sender tag id: , from: , e164: Explicit identity targeting
What elevated does not control
Tool policy : if exec is denied by tool policy, elevated cannot override it.
Host selection policy : elevated does not turn auto into a free cross-host override. It uses the configured/session exec target rules, choosing node only when the target is already node .
Separate from /exec : the /exec directive adjusts per-session exec defaults for authorized senders and does not require elevated mode.
Note
The bash chat command ( ! prefix; /bash alias) is a separate gate that requires tools.elevated to be enabled in addition to its own tools.bash.enabled flag. Disabling elevated locks ! shell commands out as well.
Related
Exec tool
Shell command execution from the agent.
Exec approvals
Approval and allowlist system for exec .
Sandboxing
Gateway-level sandbox configuration.
Sandbox vs Tool Policy vs Elevated
How the three gates compose during a tool call.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
