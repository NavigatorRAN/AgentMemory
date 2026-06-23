# Agent workspace - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/concepts/agent-workspace
- Final URL: https://docs.openclaw.ai/concepts/agent-workspace
- Canonical URL: https://docs.openclaw.ai/concepts/agent-workspace
- Fetched at: 2026-06-23T14:38:29Z
- Content type: text/html; charset=utf-8

## Description

Agent workspace: location, layout, and backup strategy

## Extracted Text

Close
Agents Fundamentals
The workspace is the agent's home. It is the only working directory used for file tools and for workspace context. Keep it private and treat it as memory.
This is separate from ~/.openclaw/ , which stores config, credentials, and sessions.
Warning
The workspace is the default cwd , not a hard sandbox. Tools resolve relative paths against the workspace, but absolute paths can still reach elsewhere on the host unless sandboxing is enabled. If you need isolation, use agents.defaults.sandbox (and/or per-agent sandbox config).
When sandboxing is enabled and workspaceAccess is not "rw" , tools operate inside a sandbox workspace under ~/.openclaw/sandboxes , not your host workspace.
Default location
Default: ~/.openclaw/workspace
If OPENCLAW_PROFILE is set and not "default" , the default becomes ~/.openclaw/workspace-<profile> .
Override in ~/.openclaw/openclaw.json :
json5 Copy code { agents : { defaults : { workspace : "~/.openclaw/workspace" , }, }, }
openclaw onboard , openclaw configure , or openclaw setup will create the workspace and seed the bootstrap files if they are missing.
Note
Sandbox seed copies only accept regular in-workspace files; symlink/hardlink aliases that resolve outside the source workspace are ignored.
If you already manage the workspace files yourself, you can disable bootstrap file creation:
json5 Copy code { agents : { defaults : { skipBootstrap : true } } }
Extra workspace folders
Older installs may have created ~/openclaw . Keeping multiple workspace directories around can cause confusing auth or state drift, because only one workspace is active at a time.
Recommendation: keep a single active workspace. If you no longer use the extra folders, archive or move them to Trash (for example trash ~/openclaw ). If you intentionally keep multiple workspaces, make sure agents.defaults.workspace points to the active one.
openclaw doctor warns when it detects extra workspace directories.
Workspace file map
These are the standard files OpenClaw expects inside the workspace:
AGENTS.md - operating instructions
Operating instructions for the agent and how it should use memory. Loaded at the start of every session. Good place for rules, priorities, and "how to behave" details.
SOUL.md - persona and tone
Persona, tone, and boundaries. Loaded every session. Guide: SOUL.md personality guide .
USER.md - who the user is
Who the user is and how to address them. Loaded every session.
IDENTITY.md - name, vibe, emoji
The agent's name, vibe, and emoji. Created/updated during the bootstrap ritual.
TOOLS.md - local tool conventions
Notes about your local tools and conventions. Does not control tool availability; it is only guidance.
HEARTBEAT.md - heartbeat checklist
Optional tiny checklist for heartbeat runs. Keep it short to avoid token burn.
BOOT.md - startup checklist
Optional startup checklist run automatically on gateway restart (when internal hooks are enabled). Keep it short; use the message tool for outbound sends.
BOOTSTRAP.md - first-run ritual
One-time first-run ritual. Only created for a brand-new workspace. Delete it after the ritual is complete.
memory/YYYY-MM-DD.md - daily memory log
Daily memory log (one file per day). Recommended to read today + yesterday on session start.
MEMORY.md - curated long-term memory (optional)
Curated long-term memory: durable facts, preferences, decisions, and short summaries. Keep detailed logs in memory/YYYY-MM-DD.md so memory tools can retrieve them on demand without injecting them into every prompt. Only load MEMORY.md in the main, private session (not shared/group contexts). See Memory for the workflow and automatic memory flush.
skills/ - workspace skills (optional)
Workspace-specific skills. Highest-precedence skill location for that workspace. Overrides project agent skills, personal agent skills, managed skills, bundled skills, and skills.load.extraDirs when names collide.
canvas/ - Canvas UI files (optional)
Canvas UI files for node displays (for example canvas/index.html ).
If any bootstrap file is missing, OpenClaw injects a "missing file" marker into the session and continues. Large bootstrap files are truncated when injected; adjust limits with agents.defaults.bootstrapMaxChars (default: 20000) and agents.defaults.bootstrapTotalMaxChars (default: 60000). openclaw setup can recreate missing defaults without overwriting existing files.
What is NOT in the workspace
These live under ~/.openclaw/ and should NOT be committed to the workspace repo:
~/.openclaw/openclaw.json (config)
~/.openclaw/agents/<agentId>/agent/auth-profiles.json (model auth profiles: OAuth + API keys)
~/.openclaw/agents/<agentId>/agent/codex-home/ (per-agent Codex runtime account, config, skills, plugins, and native thread state)
~/.openclaw/credentials/ (channel/provider state plus legacy OAuth import data)
~/.openclaw/agents/<agentId>/sessions/ (session transcripts + metadata)
~/.openclaw/skills/ (managed skills)
If you need to migrate sessions or config, copy them separately and keep them out of version control.
Git backup (recommended, private)
Treat the workspace as private memory. Put it in a private git repo so it is backed up and recoverable.
Run these steps on the machine where the Gateway runs (that is where the workspace lives).
Initialize the repo
If git is installed, brand-new workspaces are initialized automatically. If this workspace is not already a repo, run:
bash Copy code cd ~/.openclaw/workspace git init git add AGENTS.md SOUL.md TOOLS.md IDENTITY.md USER.md HEARTBEAT.md memory/ git commit -m "Add agent workspace"
Add a private remote
GitHub web UI
Create a new private repository on GitHub.
Do not initialize with a README (avoids merge conflicts).
Copy the HTTPS remote URL.
Add the remote and push:
bash Copy code git branch -M main git remote add origin <https-url> git push -u origin main
GitHub CLI (gh)
bash Copy code gh auth login gh repo create openclaw-workspace --private -- source . --remote origin --push
GitLab web UI
Create a new private repository on GitLab.
Ongoing updates
bash Copy code git status git add . git commit -m "Update memory" git push
Do not commit secrets
Even in a private repo, avoid storing secrets in the workspace:
API keys, OAuth tokens, passwords, or private credentials.
Anything under ~/.openclaw/ .
Raw dumps of chats or sensitive attachments.
If you must store sensitive references, use placeholders and keep the real secret elsewhere (password manager, environment variables, or ~/.openclaw/ ).
Suggested .gitignore starter:
gitignore Copy code .DS_Store .env **/*.key **/*.pem **/secrets*
Moving the workspace to a new machine
Clone the repo
Clone the repo to the desired path (default ~/.openclaw/workspace ).
Update config
Set agents.defaults.workspace to that path in ~/.openclaw/openclaw.json .
Seed missing files
Run openclaw setup --workspace <path> to seed any missing files.
Copy sessions (optional)
If you need sessions, copy ~/.openclaw/agents/<agentId>/sessions/ from the old machine separately.
Advanced notes
Multi-agent routing can use different workspaces per agent. See Channel routing for routing configuration.
If agents.defaults.sandbox is enabled, non-main sessions can use per-session sandbox workspaces under agents.defaults.sandbox.workspaceRoot .
Related
Heartbeat - HEARTBEAT.md workspace file
Sandboxing - workspace access in sandboxed environments
Session - session storage paths
Standing orders - persistent instructions in workspace files
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
