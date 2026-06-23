# Completion - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/completion
- Final URL: https://docs.openclaw.ai/cli/completion
- Canonical URL: https://docs.openclaw.ai/cli/completion
- Fetched at: 2026-06-23T14:37:24Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw completion` (generate/install shell completion scripts)

## Extracted Text

Close
Reference CLI commands
openclaw completion
Generate shell completion scripts and optionally install them into your shell profile.
Usage
bash Copy code openclaw completion openclaw completion --shell zsh openclaw completion --install openclaw completion --shell fish --install openclaw completion --write-state openclaw completion --shell bash --write-state
Options
-s, --shell <shell> : shell target ( zsh , bash , powershell , fish ; default: zsh )
-i, --install : install completion by adding a source line to your shell profile
--write-state : write completion script(s) to $OPENCLAW_STATE_DIR/completions without printing to stdout
-y, --yes : skip install confirmation prompts
Notes
--install writes a small "OpenClaw Completion" block into your shell profile and points it at the cached script.
Without --install or --write-state , the command prints the script to stdout.
Completion generation eagerly loads command trees so nested subcommands are included.
Related
CLI reference
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
