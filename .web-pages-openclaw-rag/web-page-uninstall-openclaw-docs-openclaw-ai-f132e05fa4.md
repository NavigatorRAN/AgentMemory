# Uninstall - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/install/uninstall
- Final URL: https://docs.openclaw.ai/install/uninstall
- Canonical URL: https://docs.openclaw.ai/install/uninstall
- Fetched at: 2026-06-23T14:45:07Z
- Content type: text/html; charset=utf-8

## Description

Uninstall OpenClaw completely (CLI, service, state, workspace)

## Extracted Text

Close
Install Maintenance
Two paths:
Easy path if openclaw is still installed.
Manual service removal if the CLI is gone but the service is still running.
Easy path (CLI still installed)
Recommended: use the built-in uninstaller:
bash Copy code openclaw uninstall
When using the CLI, state removal preserves configured workspace directories unless you also select --workspace .
Preview what will be removed (safe):
bash Copy code openclaw uninstall --dry-run --all
Non-interactive (automation / npx). Use with caution and only after confirming scopes:
bash Copy code openclaw uninstall --all -- yes --non-interactive npx -y openclaw uninstall --all -- yes --non-interactive
Manual steps (same result):
Stop the gateway service:
bash Copy code openclaw gateway stop
Uninstall the gateway service (launchd/systemd/schtasks):
bash Copy code openclaw gateway uninstall
Delete state + config:
bash Copy code rm -rf " ${OPENCLAW_STATE_DIR:- $HOME /.openclaw} "
If you set OPENCLAW_CONFIG_PATH to a custom location outside the state dir, delete that file too.
If you want to keep a workspace inside the state dir, such as ~/.openclaw/workspace , move it aside before running rm -rf or delete state contents selectively.
Delete your workspace (optional, removes agent files):
bash Copy code rm -rf ~/.openclaw/workspace
Remove the CLI install (pick the one you used):
bash Copy code npm rm -g openclaw pnpm remove -g openclaw bun remove -g openclaw
If you installed the macOS app:
bash Copy code rm -rf /Applications/OpenClaw.app
Notes:
If you used profiles ( --profile / OPENCLAW_PROFILE ), repeat step 3 for each state dir (defaults are ~/.openclaw-<profile> ).
In remote mode, the state dir lives on the gateway host , so run steps 1-4 there too.
Manual service removal (CLI not installed)
Use this if the gateway service keeps running but openclaw is missing.
macOS (launchd)
Default label is ai.openclaw.gateway (or ai.openclaw.<profile> ; legacy com.openclaw.* may still exist):
bash Copy code launchctl bootout gui/ $UID /ai.openclaw.gateway rm -f ~/Library/LaunchAgents/ai.openclaw.gateway.plist
If you used a profile, replace the label and plist name with ai.openclaw.<profile> . Remove any legacy com.openclaw.* plists if present.
Linux (systemd user unit)
Default unit name is openclaw-gateway.service (or openclaw-gateway-<profile>.service ):
bash Copy code systemctl --user disable --now openclaw-gateway.service rm -f ~/.config/systemd/user/openclaw-gateway.service systemctl --user daemon-reload
Windows (Scheduled Task)
Default task name is OpenClaw Gateway (or OpenClaw Gateway (<profile>) ).
The task script lives under your state dir as gateway.cmd ; current installs may
also create a windowless gateway.vbs launcher that Task Scheduler runs instead
of opening gateway.cmd directly.
powershell Copy code schtasks /Delete /F /TN "OpenClaw Gateway" Remove-Item -Force " $env:USERPROFILE \.openclaw\gateway.cmd" -ErrorAction SilentlyContinue Remove-Item -Force " $env:USERPROFILE \.openclaw\gateway.vbs" -ErrorAction SilentlyContinue
If you used a profile, delete the matching task name and the gateway.cmd /
gateway.vbs files under ~\.openclaw-<profile> .
Normal install vs source checkout
Normal install (install.sh / npm / pnpm / bun)
If you used https://openclaw.ai/install.sh or install.ps1 , the CLI was installed with npm install -g openclaw@latest .
Remove it with npm rm -g openclaw (or pnpm remove -g / bun remove -g if you installed that way).
Source checkout (git clone)
If you run from a repo checkout ( git clone + openclaw ... / bun run openclaw ... ):
Uninstall the gateway service before deleting the repo (use the easy path above or manual service removal).
Delete the repo directory.
Remove state + workspace as shown above.
Related
Install overview
Migration guide
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
