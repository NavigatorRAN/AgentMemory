# Permission modes - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/permission-modes
- Final URL: https://docs.openclaw.ai/tools/permission-modes
- Canonical URL: https://docs.openclaw.ai/tools/permission-modes
- Fetched at: 2026-06-23T14:58:08Z
- Content type: text/html; charset=utf-8

## Description

Permission modes for host exec, Codex Guardian approvals, and ACPX harness sessions

## Extracted Text

Close
Capabilities Tools
Permission modes decide how much authority an agent has before it can run host commands, write files, or ask a backend harness for extra access. Start with tools.exec.mode: "auto" when you want OpenClaw to use allowlists first, then Codex native auto-review or a human approval route for misses.
Note
Permission mode is separate from tools.exec.host=auto . tools.exec.host
chooses where a command runs. tools.exec.mode chooses how host exec is
approved.
Recommended default
Use auto for coding agents that need useful host access without making every miss a human prompt:
bash Copy code openclaw config set tools.exec.mode auto openclaw approvals get openclaw gateway restart
Then verify the effective policy:
bash Copy code openclaw exec-policy show
In auto mode, OpenClaw runs deterministic allowlist matches directly. Approval misses go through OpenClaw's native auto reviewer first, then fall back to the configured human approval route when needed.
OpenClaw host exec modes
tools.exec.mode is the normalized policy surface for host exec .
Mode Behavior Use when deny Block host exec. No host commands are allowed. allowlist Run only allowlisted commands. You have a known-safe command set. ask Run allowlist matches and ask on misses. A human should review new commands. auto Run allowlist matches, then use auto-review. Coding sessions need practical guarded access. full Run host exec without prompts. This trusted host/session should skip approval gates.
For the full host exec policy, local approvals file, allowlist schema, safe bins, and forwarding behavior, see Exec approvals .
Codex Guardian mapping
For native Codex app-server sessions, tools.exec.mode: "auto" maps to Codex Guardian-reviewed approvals when the local Codex requirements allow it. OpenClaw usually sends:
Codex field Typical value approvalPolicy on-request approvalsReviewer auto_review sandbox workspace-write
In auto mode, OpenClaw does not preserve legacy unsafe Codex overrides such as approvalPolicy: "never" or sandbox: "danger-full-access" . Use tools.exec.mode: "full" only when you intentionally want the no-approval posture.
For app-server setup, auth order, and native Codex runtime details, see Codex harness .
ACPX harness permissions
ACPX sessions are non-interactive, so they cannot click a TTY permission prompt. ACPX uses separate harness-level settings under plugins.entries.acpx.config :
Setting Common value Meaning permissionMode approve-reads Auto-approve reads only. permissionMode approve-all Auto-approve writes and shell commands. permissionMode deny-all Deny all permission prompts. nonInteractivePermissions fail Abort when a prompt would be required. nonInteractivePermissions deny Deny the prompt and continue when possible.
Set ACPX permissions separately from OpenClaw exec approvals:
bash Copy code openclaw config set plugins.entries.acpx.config.permissionMode approve-all openclaw config set plugins.entries.acpx.config.nonInteractivePermissions fail openclaw gateway restart
Use approve-all as the ACPX break-glass equivalent of a no-prompt harness session. For setup details and failure modes, see ACP agents setup .
Choosing a mode
Goal Configure Block host commands completely tools.exec.mode: "deny" Let known-safe commands run only tools.exec.mode: "allowlist" Ask a human for every new command shape tools.exec.mode: "ask" Use Codex/OpenClaw auto-review before humans tools.exec.mode: "auto" Skip host exec approvals entirely tools.exec.mode: "full" plus matching host approvals file Make non-interactive ACPX sessions write/exec plugins.entries.acpx.config.permissionMode: "approve-all"
If a command still prompts or fails after changing mode, inspect both layers:
bash Copy code openclaw approvals get openclaw exec-policy show
Host exec uses the stricter result of OpenClaw config and the host-local approvals file. ACPX harness permissions do not loosen host exec approvals, and host exec approvals do not loosen ACPX harness prompts.
Related
Exec approvals
Exec approvals - advanced
Codex harness
ACP agents setup
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
