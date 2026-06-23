# Scripts - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/help/scripts
- Final URL: https://docs.openclaw.ai/help/scripts
- Canonical URL: https://docs.openclaw.ai/help/scripts
- Fetched at: 2026-06-23T14:44:24Z
- Content type: text/html; charset=utf-8

## Description

Repository scripts: purpose, scope, and safety notes

## Extracted Text

Close
Reference Release and CI
The scripts/ directory contains helper scripts for local workflows and ops tasks.
Use these when a task is clearly tied to a script; otherwise prefer the CLI.
Conventions
Scripts are optional unless referenced in docs or release checklists.
Prefer CLI surfaces when they exist (example: auth monitoring uses openclaw models status --check ).
Assume scripts are host-specific; read them before running on a new machine.
Auth monitoring scripts
Auth monitoring is covered in Authentication . The scripts under scripts/ are optional extras for systemd/Termux phone workflows.
GitHub read helper
Use scripts/gh-read when you want gh to use a GitHub App installation token for repo-scoped read calls while leaving normal gh on your personal login for write actions.
Required env:
OPENCLAW_GH_READ_APP_ID
OPENCLAW_GH_READ_PRIVATE_KEY_FILE
Optional env:
OPENCLAW_GH_READ_INSTALLATION_ID when you want to skip repo-based installation lookup
OPENCLAW_GH_READ_PERMISSIONS as a comma-separated override for the read permission subset to request
Repo resolution order:
gh ... -R owner/repo
GH_REPO
git remote origin
Examples:
scripts/gh-read pr view 123
scripts/gh-read run list -R openclaw/openclaw
scripts/gh-read api repos/openclaw/openclaw/pulls/123
When adding scripts
Keep scripts focused and documented.
Add a short entry in the relevant doc (or create one if missing).
Related
Testing
Testing live
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
