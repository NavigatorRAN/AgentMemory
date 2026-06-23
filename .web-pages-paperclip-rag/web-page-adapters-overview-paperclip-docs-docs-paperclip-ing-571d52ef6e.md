# Adapters Overview | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/adapters/overview
- Final URL: https://docs.paperclip.ing/reference/adapters/overview/
- Canonical URL: https://docs.paperclip.ing/reference/adapters/overview
- Fetched at: 2026-06-23T13:38:59Z
- Content type: text/html; charset=utf-8

## Description

Adapters connect Paperclip's control plane to the runtime that actually does the work. Use this section when you need to choose an adapter, understand what Paperclip expects from o

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Adapters Overview
Adapters connect Paperclip's control plane to the runtime that actually does the work. Use this section when you need to choose an adapter, understand what Paperclip expects from one, or build a new adapter package.
What An Adapter Does
Every adapter is responsible for the same core jobs:
Launch or call the underlying runtime.
Pass the agent's company, task, and wake context through.
Capture results, session state, and usage metadata.
Validate the environment before a run starts.
Optionally provide a custom UI transcript parser and skills sync behavior.
Note: Paperclip orchestrates agents. The adapter decides how the runtime starts, how it keeps state, and how its output is interpreted.
Choose An Adapter
Use case Start here Claude Code on your machine Claude Local OpenAI Codex CLI on your machine Codex Local Gemini CLI on your machine Gemini Local Cursor Agent CLI on your machine Cursor Local OpenCode CLI with provider/model routing OpenCode Local Pi CLI with its built-in tool set Pi Local Hermes Agent with persistent memory and 30+ tools Hermes Local Grok Build CLI on your machine Grok Local OpenClaw over a WebSocket gateway OpenClaw Gateway A custom shell command or script Process A webhook or cloud service you control HTTP A standalone npm package or local plugin External Adapters Writing a new adapter package from scratch Creating an Adapter Building a custom run-log parser Adapter UI Parser Contract
If you are starting from scratch, the most common path is:
Pick a local adapter if the agent runs on the same machine as Paperclip.
Pick process if the runtime is just a command.
Pick http if the runtime lives behind an API or webhook.
Use an external adapter plugin when you want independent versioning and installation.
Built-In Adapters
These adapters ship with Paperclip and are always available in the host:
Adapter Type key UI availability Best for Claude Local claude_local Selectable (recommended) Claude Code runs with session persistence, skills sync, and structured transcript parsing. Codex Local codex_local Selectable (recommended) Codex CLI runs with session persistence and managed CODEX_HOME . Gemini Local gemini_local Selectable Gemini CLI runs with resume support and local skills sync. Cursor Local cursor Selectable Cursor Agent CLI runs with --resume session continuity and structured stream output. OpenCode Local opencode_local Selectable OpenCode CLI runs with provider/model routing and --session resume. Pi Local pi_local Selectable Pi CLI runs with its built-in tool set and provider/model routing. Hermes Local hermes_local Selectable Hermes Agent runs with persistent memory, 30+ tools, 80+ skills, and multi-provider routing. Grok Local grok_local Selectable Grok Build CLI runs with --resume session continuity, streaming reasoning output, and skills staged into .claude/skills . OpenClaw Gateway openclaw_gateway Coming soon (use OpenClaw invite flow) Remote OpenClaw instances reached over the WebSocket gateway protocol. Process process Coming soon (API / import only) Shell commands, scripts, and custom local runtimes. HTTP http Coming soon (API / import only) Webhook-style invocation into your own service.
Info: The agent-config adapter-type dropdown currently marks openclaw_gateway , process , and http as "Coming soon" . They're fully functional in the runtime — they just can't be picked manually from the UI yet. Configure them via the API or an imported company export until direct UI selection lands.
External Adapters
External adapters are installed separately and loaded at startup from the adapter plugin store. They behave like built-ins once installed, but they live in their own package and can be versioned independently.
Install them from the Board UI or via POST /api/adapters/install .
See:
Adapter UI Parser Contract
Creating an Adapter
Common Concepts
Concept Why it matters cwd The adapter's working directory. Most local adapters require an absolute path. env Environment variables passed into the runtime. Secret refs are preferred for sensitive values. Session state Lets an adapter resume the same conversation or command state on the next heartbeat. Skills Adapter-specific logic for making Paperclip skills visible to the runtime. testEnvironment() The adapter's readiness check. The UI uses it before you save or run the adapter. UI parser Converts stdout into structured transcript entries for the run viewer.
Tip: If you are unsure which page to read first, start with the adapter that matches the runtime you already use, then open the external or custom adapter docs only if you need to package or extend it.
Next Steps
Claude Local
Codex Local
Gemini Local
Cursor Local
OpenCode Local
Pi Local
Hermes Local
Grok Local
OpenClaw Gateway
Process
HTTP
