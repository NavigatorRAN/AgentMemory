# Agent bootstrapping - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/start/bootstrapping
- Final URL: https://docs.openclaw.ai/start/bootstrapping
- Canonical URL: https://docs.openclaw.ai/start/bootstrapping
- Fetched at: 2026-06-23T14:57:03Z
- Content type: text/html; charset=utf-8

## Description

Agent bootstrapping ritual that seeds the workspace and identity files

## Extracted Text

Close
Agents Fundamentals
Bootstrapping is the first-run ritual that prepares an agent workspace and
collects identity details. It happens after onboarding, when the agent starts
for the first time.
What bootstrapping does
On the first agent run, OpenClaw bootstraps the workspace (default
~/.openclaw/workspace ):
Seeds AGENTS.md , BOOTSTRAP.md , IDENTITY.md , USER.md .
Runs a short Q&A ritual (one question at a time).
Writes identity + preferences to IDENTITY.md , USER.md , SOUL.md .
Removes BOOTSTRAP.md when finished so it only runs once.
For embedded/local model runs, OpenClaw keeps BOOTSTRAP.md out of the
privileged system context. On the primary interactive first run, it still passes
the file contents in the user prompt so models that do not reliably call the
read tool can complete the ritual. If the current run cannot safely access the
workspace, the agent gets a limited bootstrap note instead of a generic greeting.
Skipping bootstrapping
To skip this for a pre-seeded workspace, run openclaw onboard --skip-bootstrap .
Where it runs
Bootstrapping always runs on the gateway host . If the macOS app connects to
a remote Gateway, the workspace and bootstrapping files live on that remote
machine.
Note
When the Gateway runs on another machine, edit workspace files on the gateway
host (for example, user@gateway-host:~/.openclaw/workspace ).
Related docs
macOS app onboarding: Onboarding
Workspace layout: Agent workspace
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
