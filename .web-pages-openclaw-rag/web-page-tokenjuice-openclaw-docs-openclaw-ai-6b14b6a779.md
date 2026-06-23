# Tokenjuice - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/tokenjuice
- Final URL: https://docs.openclaw.ai/tools/tokenjuice
- Canonical URL: https://docs.openclaw.ai/tools/tokenjuice
- Fetched at: 2026-06-23T14:58:24Z
- Content type: text/html; charset=utf-8

## Description

Compact noisy exec and bash tool results with the optional Tokenjuice plugin

## Extracted Text

Close
Capabilities Tools
tokenjuice is an optional external plugin that compacts noisy exec and bash
tool results after the command has already run.
It changes the returned tool_result , not the command itself. Tokenjuice does
not rewrite shell input, rerun commands, or change exit codes.
Today this applies to OpenClaw embedded runs and OpenClaw dynamic tools in the Codex
app-server harness. Tokenjuice hooks OpenClaw's tool-result middleware and
trims the output before it goes back into the active harness session.
Enable the plugin
Install once:
bash Copy code openclaw plugins install clawhub:@openclaw/tokenjuice
Then enable it:
bash Copy code openclaw config set plugins.entries.tokenjuice.enabled true
Equivalent:
bash Copy code openclaw plugins enable tokenjuice
If you prefer editing config directly:
json5 Copy code { plugins : { entries : { tokenjuice : { enabled : true , }, }, }, }
What tokenjuice changes
Compacts noisy exec and bash results before they are fed back into the session.
Keeps the original command execution untouched.
Preserves exact file-content reads and other commands that tokenjuice should leave raw.
Stays opt-in: disable the plugin if you want verbatim output everywhere.
Verify it is working
Enable the plugin.
Start a session that can call exec .
Run a noisy command such as git status .
Check that the returned tool result is shorter and more structured than the raw shell output.
Disable the plugin
bash Copy code openclaw config set plugins.entries.tokenjuice.enabled false
Or:
bash Copy code openclaw plugins disable tokenjuice
Related
Exec tool
Thinking levels
Context engine
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
