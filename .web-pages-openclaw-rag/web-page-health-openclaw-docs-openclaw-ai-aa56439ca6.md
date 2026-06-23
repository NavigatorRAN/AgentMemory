# Health - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/health
- Final URL: https://docs.openclaw.ai/cli/health
- Canonical URL: https://docs.openclaw.ai/cli/health
- Fetched at: 2026-06-23T14:37:42Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw health` (gateway health snapshot via RPC)

## Extracted Text

Close
Reference CLI commands
openclaw health
Fetch health from the running Gateway.
Options
Flag Default Description --json false Print machine-readable JSON instead of text. --timeout <ms> 10000 Connection timeout in milliseconds. --verbose false Verbose logging. Forces a live probe and expands per-agent output. --debug false Alias for --verbose .
Examples:
bash Copy code openclaw health openclaw health --json openclaw health -- timeout 2500 openclaw health --verbose openclaw health --debug
Notes:
Default openclaw health asks the running gateway for its health snapshot. When the
gateway already has a fresh cached snapshot, it can return that cached payload and
refresh in the background.
--verbose forces a live probe, prints gateway connection details, and expands the
human-readable output across all configured accounts and agents.
Output includes per-agent session stores when multiple agents are configured.
Related
CLI reference
Gateway health
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
