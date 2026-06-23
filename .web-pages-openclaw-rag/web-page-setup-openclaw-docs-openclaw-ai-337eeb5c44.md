# Setup - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/setup
- Final URL: https://docs.openclaw.ai/cli/setup
- Canonical URL: https://docs.openclaw.ai/cli/setup
- Fetched at: 2026-06-23T14:38:08Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw setup` (initialize config plus workspace, optionally run onboarding)

## Extracted Text

Close
Reference CLI commands
openclaw setup
Initialize the baseline config and agent workspace. With any onboarding flag present, also runs the wizard.
Note
openclaw setup is for mutable config installs. In Nix mode ( OPENCLAW_NIX_MODE=1 ) OpenClaw refuses setup writes because the config file is managed by Nix. Use the first-party nix-openclaw Quick Start or the equivalent source config for another Nix package.
Options
Flag Description --workspace <dir> Agent workspace directory (default ~/.openclaw/workspace ; stored as agents.defaults.workspace ). --wizard Run interactive onboarding. --non-interactive Run onboarding without prompts. --accept-risk Acknowledge full-system agent access risk; required with --non-interactive . --mode <mode> Onboarding mode: local or remote . --import-from <provider> Migration provider to run during onboarding. --import-source <path> Source agent home for --import-from . --import-secrets Import supported secrets during onboarding migration. --remote-url <url> Remote Gateway WebSocket URL. --remote-token <token> Remote Gateway token (optional).
Wizard auto-trigger
openclaw setup runs the wizard when any of these flags are explicitly present, even without --wizard :
--wizard , --non-interactive , --accept-risk , --mode , --import-from , --import-source , --import-secrets , --remote-url , --remote-token .
Examples
bash Copy code openclaw setup openclaw setup --workspace ~/.openclaw/workspace openclaw setup --wizard openclaw setup --wizard --import-from hermes --import-source ~/.hermes openclaw setup --non-interactive --accept-risk --mode remote --remote-url wss://gateway-host:18789 --remote-token <token>
Notes
Plain openclaw setup initializes config and workspace without running the full onboarding flow.
After plain setup, run openclaw onboard for the full guided journey, openclaw configure for targeted changes, or openclaw channels add to add channel accounts.
If Hermes state is detected, interactive onboarding can offer migration automatically. Import onboarding requires a fresh setup; use Migrate for dry-run plans, backups, and overwrite mode outside onboarding.
Related
CLI reference
Onboarding (CLI)
Getting started
Install overview
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
