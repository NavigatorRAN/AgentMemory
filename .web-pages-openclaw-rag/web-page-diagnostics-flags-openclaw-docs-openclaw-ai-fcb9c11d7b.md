# Diagnostics flags - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/diagnostics/flags
- Final URL: https://docs.openclaw.ai/diagnostics/flags
- Canonical URL: https://docs.openclaw.ai/diagnostics/flags
- Fetched at: 2026-06-23T14:39:26Z
- Content type: text/html; charset=utf-8

## Description

Diagnostics flags for targeted debug logs

## Extracted Text

Close
Help Diagnostics
Diagnostics flags let you enable targeted debug logs without turning on verbose logging everywhere. Flags are opt-in and have no effect unless a subsystem checks them.
How it works
Flags are strings (case-insensitive).
You can enable flags in config or via an env override.
Wildcards are supported:
telegram.* matches telegram.http
* enables all flags
Enable via config
json Copy code { "diagnostics" : { "flags" : [ "telegram.http" ] } }
Multiple flags:
json Copy code { "diagnostics" : { "flags" : [ "telegram.http" , "brave.http" , "gateway.*" ] } }
Restart the gateway after changing flags.
Env override (one-off)
bash Copy code OPENCLAW_DIAGNOSTICS=telegram.http,telegram.payload
Disable all flags:
bash Copy code OPENCLAW_DIAGNOSTICS=0
OPENCLAW_DIAGNOSTICS=0 is a process-level disable override: it disables
flags from both env and config for that process.
Profiling flags
Profiler flags enable targeted timing spans without raising global logging
levels. They are disabled by default.
Enable all profiler-gated spans for one gateway run:
bash Copy code OPENCLAW_DIAGNOSTICS=profiler openclaw gateway run
Enable only reply-dispatch profiler spans:
bash Copy code OPENCLAW_DIAGNOSTICS=reply.profiler openclaw gateway run
Enable only Codex app-server startup/tool/thread profiler spans:
bash Copy code OPENCLAW_DIAGNOSTICS=codex.profiler openclaw gateway run
Enable profiler flags from config:
json Copy code { "diagnostics" : { "flags" : [ "reply.profiler" , "codex.profiler" ] } }
Restart the gateway after changing config flags. To disable a profiler flag,
remove it from diagnostics.flags and restart. To temporarily disable every
diagnostics flag even when config enables profiler flags, start the process with:
bash Copy code OPENCLAW_DIAGNOSTICS=0 openclaw gateway run
Timeline artifacts
The timeline flag writes structured startup and runtime timing events for
external QA harnesses:
bash Copy code OPENCLAW_DIAGNOSTICS=timeline \ OPENCLAW_DIAGNOSTICS_TIMELINE_PATH=/tmp/openclaw-timeline.jsonl \ openclaw gateway run
You can also enable it in config:
json Copy code { "diagnostics" : { "flags" : [ "timeline" ] } }
The timeline file path still comes from
OPENCLAW_DIAGNOSTICS_TIMELINE_PATH . When timeline is enabled only from
config, the earliest config-loading spans are not emitted because OpenClaw has
not read config yet; subsequent startup spans use the config flag.
OPENCLAW_DIAGNOSTICS=1 , OPENCLAW_DIAGNOSTICS=all , and
OPENCLAW_DIAGNOSTICS=* also enable the timeline because they enable every
diagnostics flag. Prefer timeline when you only want the JSONL timing
artifact.
Timeline records use the openclaw.diagnostics.v1 envelope. Events can include
process ids, phase names, span names, durations, plugin ids, dependency counts,
event-loop delay samples, provider operation names, child-process exit state,
and startup error names/messages. Treat timeline files as local diagnostics
artifacts; review them before sharing outside your machine.
Where logs go
Flags emit logs into the standard diagnostics log file. By default:
Code Copy code /tmp/openclaw/openclaw-YYYY-MM-DD.log
If you set logging.file , use that path instead. Logs are JSONL (one JSON object per line). Redaction still applies based on logging.redactSensitive .
Extract logs
Pick the latest log file:
bash Copy code ls -t /tmp/openclaw/openclaw-*. log | head -n 1
Filter for Telegram HTTP diagnostics:
bash Copy code rg "telegram http error" /tmp/openclaw/openclaw-*. log
Filter for Brave Search HTTP diagnostics:
bash Copy code rg "brave http" /tmp/openclaw/openclaw-*. log
Or tail while reproducing:
bash Copy code tail -f /tmp/openclaw/openclaw-$( date +%F). log | rg "telegram http error"
For remote gateways, you can also use openclaw logs --follow (see /cli/logs ).
Notes
If logging.level is set higher than warn , these logs may be suppressed. Default info is fine.
brave.http logs Brave Search request URLs/query params, response status/timing, and cache hit/miss/write events. It does not log API keys or response bodies, but search queries can be sensitive.
Flags are safe to leave enabled; they only affect log volume for the specific subsystem.
Use /logging to change log destinations, levels, and redaction.
Related
Gateway diagnostics
Gateway troubleshooting
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
