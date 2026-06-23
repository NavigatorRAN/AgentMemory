# ClawHub - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/clawhub
- Final URL: https://docs.openclaw.ai/clawhub
- Canonical URL: https://docs.openclaw.ai/clawhub
- Fetched at: 2026-06-23T14:36:51Z
- Content type: text/html; charset=utf-8

## Description

Public ClawHub overview for discovery, install, publish, security, and the clawhub CLI.

## Extracted Text

Close
ClawHub Overview
ClawHub
ClawHub is the public registry for OpenClaw skills and plugins.
Use native openclaw commands to search, install, and update skills and to install plugins from ClawHub.
Use the separate clawhub CLI for registry auth, publishing, and delete/undelete workflows.
Site: clawhub.ai
Quick start
Search and install skills with OpenClaw:
bash Copy code openclaw skills search "calendar" openclaw skills install @openclaw/demo openclaw skills update --all
Search and install plugins with OpenClaw:
bash Copy code openclaw plugins search "calendar" openclaw plugins install clawhub:<package> openclaw plugins update --all
Install the ClawHub CLI when you want registry-authenticated workflows such as
publish or delete/undelete:
bash Copy code npm i -g clawhub # or pnpm add -g clawhub
What ClawHub hosts
Surface What it stores Typical command Skills Versioned text bundles with SKILL.md plus supporting files openclaw skills install @openclaw/demo Code plugins OpenClaw plugin packages with compatibility metadata openclaw plugins install clawhub:<package> Bundle plugins Packaged plugin bundles for OpenClaw distribution clawhub package publish <source>
ClawHub tracks semver versions, tags such as latest , changelogs, files,
downloads, stars, and security scan summaries. Public pages show current registry
state so users can inspect a skill or plugin before installing it.
Native OpenClaw flows
Native OpenClaw commands install into the active OpenClaw workspace and persist
source metadata so later update commands can stay on ClawHub.
Use clawhub:<package> when a plugin install should resolve through ClawHub.
Bare npm-safe plugin specs may resolve through npm during launch cutovers, and
npm:<package> stays npm-only when a source must be explicit.
Plugin installs validate advertised pluginApi and minGatewayVersion
compatibility before archive install runs. When a package version publishes a
ClawPack artifact, OpenClaw prefers the exact uploaded npm-pack .tgz , verifies
the ClawHub digest header and downloaded bytes, and records artifact metadata for
later updates.
ClawHub CLI
The ClawHub CLI is for registry-authenticated work:
bash Copy code clawhub login clawhub whoami clawhub search "postgres backups" clawhub skill publish ./my-skill --slug my-skill --name "My Skill" --version 1.0.0 clawhub package explore --family code-plugin clawhub package inspect episodic-claw clawhub package publish your-org/your-plugin --dry-run clawhub package publish your-org/your-plugin
The CLI also has skill install/update commands for direct registry workflows:
bash Copy code clawhub install @openclaw/demo clawhub update @openclaw/demo clawhub update --all clawhub list
Those commands install skills into ./skills under the current working directory
and record installed versions in .clawhub/lock.json .
Publishing
Publish skills from a local folder containing SKILL.md :
bash Copy code clawhub skill publish <path>
Common publish options:
--slug <slug> : published skill URL name.
--name <name> : display name.
--version <version> : semver version.
--changelog <text> : changelog text.
--tags <tags> : comma-separated tags, defaulting to latest .
Publish plugins from a local folder, owner/repo , owner/repo@ref , or a GitHub
URL:
bash Copy code clawhub package publish < source >
Use --dry-run to build the exact publish plan without uploading, and --json
for CI-friendly output.
Code plugins must include the required OpenClaw compatibility metadata in
package.json , including openclaw.compat.pluginApi and
openclaw.build.openclawVersion . See CLI for the full command
reference and Skill format for skill metadata.
Security and moderation
ClawHub is open by default: anyone can upload, but publishing requires a GitHub
account old enough to pass the upload gate. Public detail pages summarize the
latest scan state before install or download.
ClawHub runs automated checks on published skills and plugin releases. Scan-held
or blocked releases may disappear from public catalog and install surfaces while
remaining visible to their owner in /dashboard .
Signed-in users can report skills and packages. Moderators can review reports,
hide or restore content, and ban abusive accounts. See
Security ,
Security Audits ,
Moderation and Account Safety , and
Acceptable usage for policy and enforcement details.
Telemetry and environment
When you run clawhub install while logged in, the CLI may send a best-effort
install event so ClawHub can compute aggregate install counts. Disable this with:
bash Copy code export CLAWHUB_DISABLE_TELEMETRY=1
Useful environment overrides:
Variable Effect CLAWHUB_SITE Override the site URL used for browser login. CLAWHUB_REGISTRY Override the registry API URL. CLAWHUB_CONFIG_PATH Override where the CLI stores token/config state. CLAWHUB_WORKDIR Override the default working directory. CLAWHUB_DISABLE_TELEMETRY=1 Disable install telemetry.
See Telemetry , HTTP API , and
Troubleshooting for deeper reference material.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
