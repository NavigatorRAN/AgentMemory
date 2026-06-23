# Reset - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/reset
- Final URL: https://docs.openclaw.ai/cli/reset
- Canonical URL: https://docs.openclaw.ai/cli/reset
- Fetched at: 2026-06-23T14:38:03Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw reset` (reset local state/config)

## Extracted Text

Close
Reference CLI commands
openclaw reset
Reset local config/state (keeps the CLI installed).
Options:
--scope <scope> : config , config+creds+sessions , or full
--yes : skip confirmation prompts
--non-interactive : disable prompts; requires --scope and --yes
--dry-run : print actions without removing files
Examples:
bash Copy code openclaw backup create openclaw reset openclaw reset --dry-run openclaw reset --scope config -- yes --non-interactive openclaw reset --scope config+creds+sessions -- yes --non-interactive openclaw reset --scope full -- yes --non-interactive
Notes:
Run openclaw backup create first if you want a restorable snapshot before removing local state.
If you omit --scope , openclaw reset uses an interactive prompt to choose what to remove.
--non-interactive is only valid when both --scope and --yes are set.
Related
CLI reference
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
