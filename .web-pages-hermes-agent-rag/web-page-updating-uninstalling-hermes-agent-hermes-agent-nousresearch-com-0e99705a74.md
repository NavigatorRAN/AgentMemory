# Updating & Uninstalling | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/getting-started/updating
- Final URL: https://hermes-agent.nousresearch.com/docs/getting-started/updating
- Canonical URL: https://hermes-agent.nousresearch.com/docs/getting-started/updating
- Fetched at: 2026-06-23T14:14:50Z
- Content type: text/html; charset=utf-8

## Description

How to update Hermes Agent to the latest version or uninstall it

## Extracted Text

Skip to main content
On this page
Updating ​
Git installs ​
Update to the latest version with a single command:
hermes update
This pulls the latest code from main , updates dependencies, and prompts you to configure any new options that were added since your last update.
pip installs ​
PyPI releases track tagged versions (major and minor releases), not every commit on main . Check for updates and upgrade with:
hermes update --check # see if a newer release is on PyPI
hermes update # runs pip install --upgrade hermes-agent
Or manually:
pip install --upgrade hermes-agent # or: uv pip install --upgrade hermes-agent
tip
hermes update automatically detects new configuration options and prompts you to add them. If you skipped that prompt, you can manually run hermes config check to see missing options, then hermes config migrate to interactively add them.
What happens during an update (git installs) ​
When you run hermes update , the following steps occur:
Pairing-data snapshot — a lightweight pre-update state snapshot is saved (covers ~/.hermes/pairing/ , Feishu comment rules, and other state files that get modified at runtime). Recoverable via the snapshot restore flow described under Snapshots and rollback , or by extracting the most recent quick-snapshot zip Hermes wrote next to your ~/.hermes/ directory.
Git pull — pulls the latest code from the main branch and updates submodules
Post-pull syntax validation + auto-rollback — after the pull, Hermes compiles the eight critical files every hermes invocation imports at startup. If any fails to parse (e.g. an orphan merge-conflict marker, an accidentally truncated file), Hermes runs git reset --hard <pre-pull-sha> to roll the install back so your shell stays bootable. Re-run hermes update once the upstream fix lands.
Dependency install — runs uv pip install -e ".[all]" to pick up new or changed dependencies
Config migration — detects new config options added since your version and prompts you to set them
Gateway auto-restart — running gateways are refreshed after the update completes so the new code takes effect immediately. Service-managed gateways (systemd on Linux, launchd on macOS) are restarted through the service manager. Manual gateways are relaunched automatically when Hermes can map the running PID back to a profile.
Updating against a non-default branch: --branch ​
By default hermes update tracks origin/main . Pass --branch <name> to update against a different branch — useful for QA channels, feature branches, or release-candidate testing:
hermes update --branch release-candidate
hermes update --check --branch experimental # preview behindness only
If your local checkout is on a different branch, Hermes auto-stashes any uncommitted work, switches HEAD to the target branch, and then pulls. Branches that don't exist locally are auto-tracked from origin/<name> ( git checkout -B <name> origin/<name> ). Branches that don't exist anywhere fail cleanly — your stashed changes are restored before exit so you're never stranded in a weird state. The main -only fork-upstream sync logic is automatically skipped on non- main branches.
Local changes on non-interactive updates ​
When you run hermes update in a terminal, Hermes stashes any uncommitted source-tree changes, pulls, then asks whether to restore them — exactly as it always has. Nothing changes for interactive updates.
When the update runs without a terminal — from the desktop/chat app's "Update" button or a gateway-triggered update — there's no prompt to answer. The updates.non_interactive_local_changes setting decides what happens to your stashed changes:
# ~/.hermes/config.yaml
updates :
non_interactive_local_changes : stash # default: keep + auto-restore
# non_interactive_local_changes: discard # throw local source edits away
stash (default) — auto-stash, pull, then auto-restore your changes on top of the updated code. Nothing is lost; if a restore hits conflicts they're preserved in a git stash for manual recovery.
discard — auto-stash and drop the stash after the pull, so the update always lands on a clean tree. Use this only on machines where you never intend to keep local edits to the Hermes source. It stash-drops (not git reset --hard + git clean -fd ), so ignored paths like node_modules , venv , and build outputs are never touched.
In the desktop app this is Settings → Advanced → In-App Update Local Changes .
Preview-only: hermes update --check ​
Want to know if an update is available before pulling? Run hermes update --check — for git installs it fetches and compares commits against origin/main ; for pip installs it queries PyPI for the latest release. No files are modified, no gateway is restarted. Useful in scripts and cron jobs that gate on "is there an update".
Full pre-update backup: --backup ​
For high-value profiles (production gateways, shared team installs) you can opt into a full pre-pull backup of HERMES_HOME (config, auth, sessions, skills, pairing):
hermes update --backup
Or make it the default for every run:
pre_update_backup : true
--backup was the always-on behavior in earlier builds, but it was adding minutes to every update on large homes, so it's now opt-in. The lightweight pairing-data snapshot above still runs unconditionally.
Windows: another hermes.exe is running ​
On Windows, hermes update will refuse to run if it detects another hermes.exe process holding the venv's entry-point executable open — most commonly the Hermes Desktop app's spawned backend, an open hermes REPL in another terminal, or a running gateway:
$ hermes update
✗ Another hermes.exe is running:
PID 12345 hermes.exe
Updating now would fail to overwrite ...\venv\Scripts\hermes.exe because
Windows blocks REPLACE on a running executable.
Close Hermes Desktop, exit any open `hermes` REPLs, and
stop the gateway (`hermes gateway stop`) before retrying.
Override with `hermes update --force` if you've already
confirmed those processes will not write to the venv.
Close the listed processes and re-run. If you're sure the concurrent process won't interfere (rare — usually only useful when an antivirus shim is mis-attributed), pass --force to skip the check. In that case the updater will still retry the .exe rename with exponential backoff and, on stubborn locks, schedule the replacement for next reboot via MoveFileEx(MOVEFILE_DELAY_UNTIL_REBOOT) so the update can complete.
Expected output looks like:
Updating Hermes Agent...
📥 Pulling latest code...
Already up to date. (or: Updating abc1234..def5678)
📦 Updating dependencies...
✅ Dependencies updated
🔍 Checking for new config options...
✅ Config is up to date (or: Found 2 new options — running migration...)
🔄 Restarting gateways...
✅ Gateway restarted
✅ Hermes Agent updated successfully!
Recommended Post-Update Validation ​
hermes update handles the main update path, but a quick validation confirms everything landed cleanly:
git status --short — if the tree is unexpectedly dirty, inspect before continuing
hermes doctor — checks config, dependencies, and service health
hermes --version — confirm the version bumped as expected
If you use the gateway: hermes gateway status
If doctor reports npm audit issues: run npm audit fix in the flagged directory
Dirty working tree after update
If git status --short shows unexpected changes after hermes update , stop and inspect them before continuing. This usually means local modifications were reapplied on top of the updated code, or a dependency step refreshed lockfiles.
If your terminal disconnects mid-update ​
hermes update protects itself against accidental terminal loss:
The update ignores SIGHUP , so closing your SSH session or terminal window no longer kills it mid-install. pip and git child processes inherit this protection, so the Python environment cannot be left half-installed by a dropped connection.
All output is mirrored to ~/.hermes/logs/update.log while the update runs. If your terminal disappears, reconnect and inspect the log to see whether the update finished and whether the gateway restart succeeded:
tail -f ~/.hermes/logs/update.log
Ctrl-C (SIGINT) and system shutdown (SIGTERM) are still honored — those are deliberate cancellations, not accidents.
You no longer need to wrap hermes update in screen or tmux to survive a terminal drop.
Checking your current version ​
hermes version
Compare against the latest release at the GitHub releases page .
Updating from Messaging Platforms ​
You can also update directly from Telegram, Discord, Slack, WhatsApp, or Teams by sending:
/update
This pulls the latest code, updates dependencies, and restarts running gateways. The bot will briefly go offline during the restart (typically 5–15 seconds) and then resume.
Manual Update ​
If you installed manually (not via the quick installer):
cd /path/to/hermes-agent
export VIRTUAL_ENV = " $( pwd ) /venv"
# Pull latest code
git pull origin main
# Reinstall (picks up new dependencies)
uv pip install -e ".[all]"
# Check for new config options
hermes config check
hermes config migrate # Interactively add any missing options
Rollback instructions ​
If an update introduces a problem, you can roll back to a previous version:
# List recent versions
git log --oneline -10
# Roll back to a specific commit
git checkout < commit-hash >
# Restart the gateway if running
hermes gateway restart
To roll back to a specific release tag (substitute your previous tag — e.g. a recent release like v2026.5.16 , or any earlier tag from git tag --sort=-version:refname ):
git checkout vX.Y.Z
warning
Rolling back may cause config incompatibilities if new options were added. Run hermes config check after rolling back and remove any unrecognized options from config.yaml if you encounter errors.
Note for Nix users ​
If you installed via Nix flake, updates are managed through the Nix package manager:
# Update the flake input
nix flake update hermes-agent
# Or rebuild with the latest
nix profile upgrade hermes-agent
Nix installations are immutable — rollback is handled by Nix's generation system:
nix profile rollback
See Nix Setup for more details.
Uninstalling ​
hermes uninstall
The uninstaller gives you the option to keep your configuration files ( ~/.hermes/ ) for a future reinstall.
pip uninstall hermes-agent
rm -rf ~/.hermes # Optional — keep if you plan to reinstall
Manual Uninstall ​
rm -f ~/.local/bin/hermes
rm -rf /path/to/hermes-agent
info
If you installed the gateway as a system service, stop and disable it first:
hermes gateway stop
# Linux: systemctl --user disable hermes-gateway
# macOS: launchctl remove ai.hermes.gateway
Updating
Git installs
pip installs
What happens during an update (git installs)
Updating against a non-default branch: --branch
Local changes on non-interactive updates
Preview-only: hermes update --check
Full pre-update backup: --backup
Windows: another hermes.exe is running
Recommended Post-Update Validation
If your terminal disconnects mid-update
Checking your current version
Updating from Messaging Platforms
Manual Update
Rollback instructions
Note for Nix users
Uninstalling
Manual Uninstall
