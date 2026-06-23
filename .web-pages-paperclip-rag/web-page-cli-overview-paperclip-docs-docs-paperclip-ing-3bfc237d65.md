# CLI Overview | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/cli/overview
- Final URL: https://docs.paperclip.ing/reference/cli/overview/
- Canonical URL: https://docs.paperclip.ing/reference/cli/overview
- Fetched at: 2026-06-23T13:39:44Z
- Content type: text/html; charset=utf-8

## Description

The Paperclip CLI (paperclipai) stands up a Paperclip instance and gives you a full-parity, terminal-based way to operate a company against it. Paperclip is UI-first — the web UI i

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
CLI Overview
The Paperclip CLI ( paperclipai ) stands up a Paperclip instance and gives you a full-parity, terminal-based way to operate a company against it. Paperclip is UI-first — the web UI is the primary surface most operators use — and the CLI is the alternative for when the terminal is the better tool: installing and configuring an instance, automation and CI, scripted or bulk operations, and operating headless without a browser. Reach for this page first: it explains the two layers the CLI is built from, who you authenticate as, and where every reference page and guide lives.
Keep one thing in mind as you read: the CLI and the UI are two surfaces over the same control plane and the same data. Anything in this documentation can equally be done on screen; the CLI just lets you do it from the shell. (If you want to go further and hand the CLI to an AI so it operates a company without a browser at all, that's the optional Autonomous Operation track — one use of the CLI, not its premise.)
The two layers
Everything the CLI does falls into one of two layers, and they have different prerequisites.
Layer What it does Talks to Needs a credential? Setup Onboard, diagnose, configure, and run a local instance Local config files and the local server process No Control plane Manage companies, agents, issues, goals, runs, budgets, and more The Paperclip server API Yes
Setup commands get a server up and healthy. They work against config on disk (under ~/.paperclip by default) and the local process. The headline commands are onboard , doctor , configure , env , allowed-hostname , db:backup , and run (with no subcommand). See Setup commands and the Dev environments reference for the env-lab and worktree tooling.
Control-plane commands are HTTP clients for the server API. They need to know where the server is ( API base resolution ) and who you are ( credentials ). This is the bulk of the CLI: companies, projects, goals, issues, agents, prompts, runs, routines, approvals, activity, dashboards, cost, workspaces, access, adapters, assets, skills, secrets, cloud, plugins, and feedback.
Note: run is overloaded on purpose. paperclipai run with no subcommand bootstraps and starts a local instance (a setup action). paperclipai run <subcommand> ( list , live , get , events , log , cancel , and friends) inspects and controls heartbeat runs through the API (a control-plane action). Two different concepts under one verb — see run reference .
What runs where
This is the single most important thing to internalize before you script against the CLI: the CLI does not run the model. An agent's actual work — the LLM calls, the coding, the research — executes server-side inside the Paperclip runtime and its adapters. The CLI triggers that work and observes it.
When you call agent wake or heartbeat run , the CLI POSTs to the server ( /api/agents/:id/wakeup ); the server runs the adapter and the CLI streams the resulting run events and logs back to your terminal. You are conducting, not computing.
The one exception is agent local-cli <agent> . It sets up your local environment so a human or a local AI (Claude, Codex) can run as that agent on your own machine and report results back through the API. See Key concepts for the full picture.
Personas and credentials
Every control-plane call is made as somebody . Paperclip has exactly two personas, and your CLI profile records which one you are.
Persona Authority Typical use Board operator Full board authorization across the whole instance Bootstrapping, building the org, minting credentials, steering everything Agent Scoped to exactly one company and one agent An agent operating its own work, or a local CLI acting as that agent
There are two matching credential types.
Credential Created with Properties Board API token token board create Named, supports expiry and revocation, audited server-side Agent API key token agent create Scoped to one company + one agent, plaintext shown once at creation
How you get your first credential depends on the instance mode:
local_trusted — the CLI can create and approve its own auth challenge with no browser; the server treats loopback as an implicit board ("local-board"). This is the headless bootstrap path.
authenticated — the first credential comes from either auth bootstrap-ceo (which mints a one-time DB invite) or a browser board-claim. After that, a board token can mint further board tokens and agent keys non-interactively.
See Authentication for the credential commands and Installation for the zero-browser flow.
The fast ways to authenticate
paperclipai connect — the interactive wizard (TTY only). It resolves the API base, health-checks it, logs in as board, lets you pick persona/company/agent, mints a token, saves a persona-aware profile, and prints the shell exports to run. Start here when you have a terminal in front of you.
paperclipai auth login — the device-code / browser-approval flow that stores a board credential keyed by API base. Good for non-interactive board login.
paperclipai agent local-cli <agent-id> — the all-in-one for handing the CLI to an AI: it creates a long-lived agent API key, installs Paperclip skills into ~/.codex/skills and ~/.claude/skills , and prints export lines for PAPERCLIP_API_URL , PAPERCLIP_COMPANY_ID , PAPERCLIP_AGENT_ID , and PAPERCLIP_API_KEY .
paperclipai connect
# or, for an AI operator on this machine:
paperclipai agent local-cli <agent-id> -C <company-id>
See CLI auth for the judgement calls.
How the CLI finds the server
Control-plane commands resolve the API base in this exact order. The first source that yields a URL wins.
--api-base <url>
PAPERCLIP_API_URL
the selected context profile's apiBase
the local Paperclip config server port
http://localhost:3100
Tip: If a command can't connect, the error includes the URL it actually tried and a hint to check GET /api/health . Most "it won't connect" problems are an API base resolving to the wrong place — read that URL before anything else.
Context profiles
So you aren't retyping the same flags forever, the CLI stores defaults in ~/.paperclip/context.json . Profiles are persona-aware: a board profile records persona=board ; an agent profile records persona=agent plus its agentId and agentName .
Crucially, a profile stores an apiKeyEnvVarName — the name of an environment variable — not a plaintext token. The key stays in your environment; the profile just remembers where to look.
paperclipai context set --api-base http://localhost:3100 --company-id <company-id>
paperclipai context set --api-key-env-var-name PAPERCLIP_API_KEY
export PAPERCLIP_API_KEY=...
paperclipai context show
paperclipai context use default
See Common options for the full flag set and Authentication for profile management.
Common flags
Most control-plane commands share the same flags. Learn them once.
Flag Use --data-dir <path> Isolate all local state (config, context, db, logs, storage, secrets) away from ~/.paperclip . Ideal for test instances and worktrees. --api-base <url> Point at a remote or non-default server. --api-key <token> Authenticate directly without a profile. --context <path> Read and write a specific context file. --profile <name> Select which context profile to use. --json Emit machine-readable output for scripting.
Company-scoped commands additionally take --company-id <id> (with a short -C alias on some, like run ). For scripting and --json patterns, see Output and scripting .
The shortest paths
Fresh local install:
paperclipai onboard
paperclipai run
Already running, just want to operate: skip onboarding, connect, and go.
paperclipai company list
Hand the wheel to an AI: set up agent credentials and skills in one shot.
Reference map
Every command family has its own page.
Setup and instance
Installation — getting the binary and the in-repo dev alias
Setup commands — onboard , doctor , configure , env , allowed-hostname , db:backup , run
Dev environments — env-lab and worktree tooling
Common options — shared flags, profiles, data-dir
Output and scripting — --json and automation patterns
Identity
Authentication — connect , auth , token , context
Access — access control
The org
Company · Project · Goal · Issue · Agent
Driving and observing work
Prompt — task handoff to agents
Run — heartbeat run inspection and control
Routine — recurring scheduled work
Approval · Activity · Dashboard · Cost
Platform and extension
Workspace · Adapter · Asset · Skills · Secrets · Cloud · Plugin · Feedback
Guides
If you'd rather follow a path than read a reference, these product guides cover the same ground from the UI side — everything here maps onto a CLI command family above:
Getting started: Installation · Your first company · Hire your first agent
Day to day: Dashboard · Issues · Approvals · Costs & budgets
The org: Org structure · Delegation · Projects · Goals · Routines
Credentials: CLI auth
Coming soon: a dedicated CLI-operator track — driving and bootstrapping a whole company from the terminal, including handing the CLI to an AI operator — is being written. For now the command pages above plus these guides cover the full surface.
Next steps
New here? Start with Installation , then connect with Authentication & tokens .
Going headless? The Installation page covers the zero-browser onboard → run flow.
Building the company? Jump to Your first company , then drive it with Company , Project , and Issue .
