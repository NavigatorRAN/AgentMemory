# Steer - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/steer
- Final URL: https://docs.openclaw.ai/tools/steer
- Canonical URL: https://docs.openclaw.ai/tools/steer
- Fetched at: 2026-06-23T14:58:19Z
- Content type: text/html; charset=utf-8

## Description

Steer an active run without changing queue mode

## Extracted Text

Close
Capabilities Agent coordination
/steer first tries to send guidance to an already-active run. It is for
"adjust this run while it is still working" moments. If the current runtime
cannot accept steering, OpenClaw sends the message as a normal prompt instead
of dropping it.
Current session
Use top-level /steer to target the active run for the current session:
text Copy code /steer prefer the smaller patch and keep the tests focused /tell summarize before making the next tool call
Behavior:
Targets only the current session's active run.
Works independently of the session's /queue mode.
Starts a normal turn with the same message when the session is idle or the
active run cannot accept steering.
Uses the active runtime's steering path, so the model sees the guidance at
the next supported runtime boundary.
Steer vs queue
/queue steer makes normal inbound messages try to steer the active run when
they arrive while a run is active. /steer <message> is an explicit command
that tries to inject that command's message into the active run at the next
supported runtime boundary, regardless of the stored /queue setting. When
that injection is not available, the command prefix is stripped and <message>
continues as a normal prompt.
Use:
/steer <message> when you want to guide the active run right now.
/queue steer when you want future normal messages to steer active runs by
default.
/queue collect or /queue followup when future normal messages should wait
for a later turn instead of steering the active run.
/queue interrupt when the newest message should replace the active run
instead of steering it.
For queue modes and steering boundaries, see Command queue and
Steering queue .
Sub-agents
Top-level /steer targets the current session's active run. Sub-agents report
back to their parent/requester session; /subagents is for visibility only.
ACP sessions
Use /acp steer when the target is an ACP harness session:
text Copy code /acp steer --session agent:main:acp:codex tighten the repro
See ACP agents for ACP session selection and runtime
behavior.
Related
Slash commands
Command queue
Steering queue
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
