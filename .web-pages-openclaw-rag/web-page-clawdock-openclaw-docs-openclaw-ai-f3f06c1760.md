# ClawDock - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/clawdock
- Final URL: https://docs.openclaw.ai/install/clawdock
- Canonical URL: https://docs.openclaw.ai/install/clawdock
- Fetched at: 2026-06-23T14:44:35Z
- Content type: text/html; charset=utf-8

## Description

ClawDock shell helpers for Docker-based OpenClaw installs

## Extracted Text

Close
Install Containers
ClawDock is a small shell-helper layer for Docker-based OpenClaw installs.
It gives you short commands like clawdock-start , clawdock-dashboard , and clawdock-fix-token instead of longer docker compose ... invocations.
If you have not set up Docker yet, start with Docker .
Install
Use the canonical helper path:
bash Copy code mkdir -p ~/.clawdock && curl -sL https://raw.githubusercontent.com/openclaw/openclaw/main/scripts/clawdock/clawdock-helpers.sh -o ~/.clawdock/clawdock-helpers.sh echo 'source ~/.clawdock/clawdock-helpers.sh' >> ~/.zshrc && source ~/.zshrc
If you previously installed ClawDock from scripts/shell-helpers/clawdock-helpers.sh , reinstall from the new scripts/clawdock/clawdock-helpers.sh path. The old raw GitHub path was removed.
What you get
Basic operations
Command Description clawdock-start Start the gateway clawdock-stop Stop the gateway clawdock-restart Restart the gateway clawdock-status Check container status clawdock-logs Follow gateway logs
Container access
Command Description clawdock-shell Open a shell inside the gateway container clawdock-cli <command> Run OpenClaw CLI commands in Docker clawdock-exec <command> Execute an arbitrary command in the container
Web UI and pairing
Command Description clawdock-dashboard Open the Control UI URL clawdock-devices List pending device pairings clawdock-approve <id> Approve a pairing request
Setup and maintenance
Command Description clawdock-fix-token Configure the gateway token inside the container clawdock-update Pull, rebuild, and restart clawdock-rebuild Rebuild the Docker image only clawdock-clean Remove containers and volumes
Utilities
Command Description clawdock-health Run a gateway health check clawdock-token Print the gateway token clawdock-cd Jump to the OpenClaw project directory clawdock-config Open ~/.openclaw clawdock-show-config Print config files with redacted values clawdock-workspace Open the workspace directory
First-time flow
bash Copy code clawdock-start clawdock-fix-token clawdock-dashboard
If the browser says pairing is required:
bash Copy code clawdock-devices clawdock-approve <request-id>
Config and secrets
ClawDock works with the same Docker config split described in Docker :
<project>/.env for Docker-specific values like image name, ports, and the gateway token
~/.openclaw/.env for env-backed provider keys and bot tokens
~/.openclaw/agents/<agentId>/agent/auth-profiles.json for stored provider OAuth/API-key auth
~/.openclaw/openclaw.json for behavior config
Use clawdock-show-config when you want to inspect the .env files and openclaw.json quickly. It redacts .env values in its printed output.
Related
Docker
Canonical Docker install for OpenClaw.
Docker VM runtime
Docker-managed VM runtime for hardened isolation.
Updating
Updating the OpenClaw package and managed services.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
