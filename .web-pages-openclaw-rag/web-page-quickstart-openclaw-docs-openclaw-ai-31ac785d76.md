# Quickstart - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/clawhub/quickstart
- Final URL: https://docs.openclaw.ai/clawhub/quickstart
- Canonical URL: https://docs.openclaw.ai/clawhub/quickstart
- Fetched at: 2026-06-23T14:37:07Z
- Content type: text/html; charset=utf-8

## Description

Start using ClawHub: find, install, update, and publish skills or plugins.

## Extracted Text

Close
ClawHub Overview
Quickstart
ClawHub is a registry for OpenClaw skills and plugins.
Use OpenClaw when you are installing things into OpenClaw. Use the clawhub CLI
when you are signing in, publishing, managing your own listings, or using
registry-specific workflows.
Find and install a skill
Search from OpenClaw:
bash Copy code openclaw skills search "calendar"
Install a skill:
bash Copy code openclaw skills install @openclaw/demo
Update installed skills:
bash Copy code openclaw skills update --all
OpenClaw records where the skill came from so later updates can continue to
resolve through ClawHub.
Find and install a plugin
bash Copy code openclaw plugins search "calendar"
Install a ClawHub-hosted plugin with an explicit ClawHub source:
bash Copy code openclaw plugins install clawhub:<package>
Update installed plugins:
bash Copy code openclaw plugins update --all
Use the clawhub: prefix when you want OpenClaw to resolve the package through
ClawHub rather than npm or another source.
Sign in for publishing
Install the ClawHub CLI:
bash Copy code npm i -g clawhub # or pnpm add -g clawhub
Sign in with GitHub:
bash Copy code clawhub login clawhub whoami
Headless environments can use an API token from the ClawHub web UI:
bash Copy code clawhub login --token clh_...
Publish a skill
A skill is a folder with a required SKILL.md file and optional supporting
files.
bash Copy code clawhub skill publish ./my-skill \ --slug my-skill \ --name "My Skill" \ --changelog "Initial release"
The command skips unchanged content. New skills start at 1.0.0 ; later changes
automatically publish the next patch version. Use --dry-run to preview or
--version to choose an explicit version.
Before publishing, check the metadata in SKILL.md . Declare required
environment variables, tools, and permissions so users can understand what the
skill needs before they install it. See Skill format .
For repositories containing multiple skills, the reusable GitHub workflow calls
skill publish for each immediate skill folder under skills/ :
yaml Copy code jobs: preview: uses: openclaw/clawhub/.github/workflows/skill-publish.yml@main with: dry_run: true
Publish a plugin
Publish a plugin from a local folder, a GitHub repo, a GitHub ref, or an
existing archive:
bash Copy code clawhub package publish < source > --family code-plugin --dry-run clawhub package publish < source > --family code-plugin
Use --dry-run first to preview the resolved package metadata, compatibility
fields, source attribution, and upload plan without publishing.
Code plugins must include OpenClaw compatibility metadata in package.json ,
including openclaw.compat.pluginApi and openclaw.build.openclawVersion .
Inspect before installing
Before installing, use the ClawHub web page or CLI detail commands to inspect
metadata, source links, versions, changelogs, and scan status:
bash Copy code clawhub inspect @openclaw/demo clawhub package inspect <package>
Public listings show the latest scan state. Releases that are held or blocked by
moderation may be hidden from search and install surfaces until resolved.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
