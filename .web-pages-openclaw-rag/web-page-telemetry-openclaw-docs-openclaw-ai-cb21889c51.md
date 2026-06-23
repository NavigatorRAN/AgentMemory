# Telemetry - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/clawhub/telemetry
- Final URL: https://docs.openclaw.ai/clawhub/telemetry
- Canonical URL: https://docs.openclaw.ai/clawhub/telemetry
- Fetched at: 2026-06-23T14:37:09Z
- Content type: text/html; charset=utf-8

## Description

Install telemetry collected by the ClawHub CLI and how to opt out.

## Extracted Text

Close
ClawHub Using ClawHub
Telemetry
ClawHub uses minimal CLI telemetry to compute aggregate install counts.
When telemetry is collected
Telemetry is only sent when:
You are logged in in the CLI.
You run clawhub install <slug> .
Telemetry is not disabled (see “How to disable” below).
If you are not logged in, nothing is reported.
What we collect
On each reported clawhub install , the CLI sends one best-effort install event.
The event includes:
slug : the installed skill slug.
version : the installed version, when known.
What we do not collect
No folder paths or folder-derived identifiers.
No file contents.
No per-run logs, prompts, or other CLI output.
Install counts
ClawHub maintains aggregate counters per skill:
installsAllTime : unique users who have reported at least one CLI install for the skill.
installsCurrent : unique users who have reported an install and have not deleted their
telemetry.
Transparency + user controls
Everyone only sees aggregated install counters .
Deleting your account also deletes your telemetry data.
How to disable telemetry
Set the environment variable:
bash Copy code export CLAWHUB_DISABLE_TELEMETRY=1
With this set, the CLI will not send install telemetry.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
