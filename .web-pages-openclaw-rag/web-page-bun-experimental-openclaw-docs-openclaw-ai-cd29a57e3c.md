# Bun (experimental) - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/bun
- Final URL: https://docs.openclaw.ai/install/bun
- Canonical URL: https://docs.openclaw.ai/install/bun
- Fetched at: 2026-06-23T14:44:34Z
- Content type: text/html; charset=utf-8

## Description

Bun workflow (experimental): installs and gotchas vs pnpm

## Extracted Text

Close
Install Containers
Warning
Bun is not recommended for gateway runtime (known issues with WhatsApp and Telegram). Use Node for production.
Bun is an optional local runtime for running TypeScript directly ( bun run ... , bun --watch ... ). The default package manager remains pnpm , which is fully supported and used by docs tooling. Bun cannot use pnpm-lock.yaml and will ignore it.
Install
Install dependencies
sh Copy code bun install
bun.lock / bun.lockb are gitignored, so there is no repo churn. To skip lockfile writes entirely:
sh Copy code bun install --no-save
Build and test
sh Copy code bun run build bun run vitest run
Lifecycle scripts
Bun blocks dependency lifecycle scripts unless explicitly trusted. For this repo, the commonly blocked scripts are not required:
baileys preinstall -- checks Node major >= 20 (OpenClaw defaults to Node 24 and still supports Node 22 LTS, currently 22.19+ )
protobufjs postinstall -- emits warnings about incompatible version schemes (no build artifacts)
If you hit a runtime issue that requires these scripts, trust them explicitly:
sh Copy code bun pm trust baileys protobufjs
Caveats
Some scripts still hardcode pnpm (for example check:docs , ui:* , protocol:check ). Run those via pnpm for now.
Related
Install overview
Node.js
Updating
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
