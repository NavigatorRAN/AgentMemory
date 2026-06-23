# Local Development | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/deploy/local-development
- Final URL: https://docs.paperclip.ing/reference/deploy/local-development/
- Canonical URL: https://docs.paperclip.ing/reference/deploy/local-development
- Fetched at: 2026-06-23T13:40:03Z
- Content type: text/html; charset=utf-8

## Description

This is the fastest way to run Paperclip locally. The default path uses embedded PostgreSQL, local disk storage, and the local trusted deployment mode.

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Local Development
This is the fastest way to run Paperclip locally. The default path uses embedded PostgreSQL, local disk storage, and the local trusted deployment mode.
Use this page if you want to get the app running quickly, reset a local install, or start a private-network dev instance.
Prerequisites
Node.js 20+
pnpm 9+
Note: You do not need a separate PostgreSQL install for the normal local workflow.
Start The Server
pnpm install
pnpm dev
This starts:
the API server at http://localhost:3100
the UI from the API server in dev middleware mode
The first start automatically uses embedded PostgreSQL if DATABASE_URL is unset. See Database for the storage modes behind that behavior.
One-Command Bootstrap
If you want setup and startup in one step, use:
pnpm paperclipai run
This is the best command for a first-time install because it:
auto-onboards if no config exists
runs paperclipai doctor with repair enabled
starts the server once checks pass
Use this when you want Paperclip to behave like an app, not a manually assembled stack.
Managed Dev Runner
The dev runner is idempotent for the current repo and instance. If the matching Paperclip dev runner is already alive, Paperclip reports the existing process instead of starting a duplicate.
Inspect or stop it with:
pnpm dev:list
pnpm dev:stop
Private Network Dev
If you want to access a local instance over Tailscale or another private network, run the authenticated private dev mode:
pnpm dev --tailscale-auth
Alias:
pnpm dev --authenticated-private
This configures the instance for authenticated private exposure and binds the server to 0.0.0.0 .
If you need to allow additional private hostnames:
pnpm paperclipai allowed-hostname dotta-macbook-pro
See Tailscale Private Access for the full workflow.
Health Checks
After startup, verify the instance is alive:
curl http://localhost:3100/api/health
Expected response:
{"status":"ok"}
You can also confirm the API is serving company data:
curl http://localhost:3100/api/companies
Reset Local Data
To wipe the embedded database and start over:
rm -rf ~/.paperclip/instances/default/db
This removes the local database only. It does not change your repo checkout or any other workspace data.
Worktrees And Isolated Instances
If you work from multiple git worktrees, do not point two Paperclip servers at the same embedded PostgreSQL data directory.
Create a repo-local isolated instance instead:
pnpm paperclipai worktree init
That command creates a repo-local .paperclip config and an isolated instance under ~/.paperclip-worktrees so the new worktree does not share the default embedded database.
Tip: This is the safest way to test docs or feature work in parallel across multiple branches.
Default Data Paths
Data Path Config ~/.paperclip/instances/default/config.json Database ~/.paperclip/instances/default/db Storage ~/.paperclip/instances/default/data/storage Secrets key ~/.paperclip/instances/default/secrets/master.key Logs ~/.paperclip/instances/default/logs
These paths are under PAPERCLIP_HOME and PAPERCLIP_INSTANCE_ID . Override them when you want an isolated local instance:
PAPERCLIP_HOME=/custom/path PAPERCLIP_INSTANCE_ID=dev pnpm paperclipai run
Tip: If you are working in a second checkout or worktree, give it its own instance ID so you do not share the same embedded database by accident.
