# Uninstall - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/uninstall
- Final URL: https://docs.openclaw.ai/cli/uninstall
- Canonical URL: https://docs.openclaw.ai/cli/uninstall
- Fetched at: 2026-06-23T14:38:16Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw uninstall` (remove gateway service + local data)

## Extracted Text

Close
Reference CLI commands
openclaw uninstall
Uninstall the gateway service + local data (CLI remains).
Options:
--service : remove the gateway service
--state : remove state and config
--workspace : remove workspace directories
--app : remove the macOS app
--all : remove service, state, workspace, and app
--yes : skip confirmation prompts
--non-interactive : disable prompts; requires --yes
--dry-run : print actions without removing files
Examples:
bash Copy code openclaw backup create openclaw uninstall openclaw uninstall --service -- yes --non-interactive openclaw uninstall --state --workspace -- yes --non-interactive openclaw uninstall --all -- yes openclaw uninstall --dry-run
Notes:
Run openclaw backup create first if you want a restorable snapshot before removing state or workspaces.
--state preserves configured workspace directories unless --workspace is also selected.
--all is shorthand for removing service, state, workspace, and app together.
--non-interactive requires --yes .
Related
CLI reference
Uninstall
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
