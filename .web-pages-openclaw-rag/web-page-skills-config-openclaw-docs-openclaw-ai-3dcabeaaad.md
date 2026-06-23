# Skills config - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/skills-config
- Final URL: https://docs.openclaw.ai/tools/skills-config
- Canonical URL: https://docs.openclaw.ai/tools/skills-config
- Fetched at: 2026-06-23T14:58:16Z
- Content type: text/html; charset=utf-8

## Description

Full reference for the skills.* config schema, agent allowlists, workshop settings, and sandbox env var handling.

## Extracted Text

Close
Capabilities Skills
Most skills configuration lives under skills in
~/.openclaw/openclaw.json . Agent-specific visibility lives under
agents.defaults.skills and agents.list[].skills .
json5 Copy code { skills : { allowBundled : [ "gemini" , "peekaboo" ], load : { extraDirs : [ "~/Projects/agent-scripts/skills" ], allowSymlinkTargets : [ "~/Projects/manager/skills" ], watch : true , watchDebounceMs : 250 , }, install : { preferBrew : true , nodeManager : "npm" , allowUploadedArchives : false , }, workshop : { autonomous : { enabled : false }, allowSymlinkTargetWrites : false , approvalPolicy : "pending" , maxPending : 50 , maxSkillBytes : 40000 , }, entries : { "image-lab" : { enabled : true , apiKey : { source : "env" , provider : "default" , id : "GEMINI_API_KEY" }, env : { GEMINI_API_KEY : "GEMINI_KEY_HERE" }, }, peekaboo : { enabled : true }, sag : { enabled : false }, }, }, } Note
For built-in image generation, use agents.defaults.imageGenerationModel
plus the core image_generate tool instead of skills.entries . Skill
entries are for custom or third-party skill workflows only.
Loading ( skills.load )
Additional skill directories to scan, at the lowest precedence (after bundled
and plugin skills). Paths are expanded with ~ support.
Trusted real target directories that symlinked skill folders may resolve into,
even when the symlink lives outside the configured root. Use this for
intentional sibling-repo layouts such as
<workspace>/skills/manager -> ~/Projects/manager/skills . Keep this list
narrow — do not point at broad roots like ~ or ~/Projects .
Watch skill folders and refresh the skills snapshot when SKILL.md files
change. Covers nested files under grouped skill roots.
Debounce window for skill watcher events in milliseconds.
Install ( skills.install )
Prefer Homebrew installers when brew is available.
Node package manager preference for skill installs. This only affects skill
installs — the Gateway runtime should still use Node (Bun is not recommended
for WhatsApp/Telegram). Use openclaw setup --node-manager for npm, pnpm,
or bun; set "yarn" manually for Yarn-backed skill installs.
Allow trusted operator.admin Gateway clients to install private zip
archives staged through skills.upload.* . Normal ClawHub installs do not
need this setting.
Operator Install Policy ( security.installPolicy )
Use security.installPolicy when operators need a trusted local command to
approve or block skill and plugin installs with host-specific policy. The policy
runs after OpenClaw has staged source material and before the install or update
continues. It applies to ClawHub skills, uploaded skills, Git/local skills,
skill dependency installers, and plugin install/update sources.
json5 Copy code { security : { installPolicy : { enabled : true , // Omit targets to cover every supported target. targets : [ "skill" , "plugin" ], exec : { source : "exec" , command : "/usr/local/bin/openclaw-install-policy" , args : [ "--json" ], timeoutMs : 10000 , noOutputTimeoutMs : 10000 , maxOutputBytes : 1048576 , passEnv : [ "OPENCLAW_STATE_DIR" , "PATH" ], env : { POLICY_MODE : "strict" }, trustedDirs : [ "/usr/local/bin" ], }, }, }, }
Enables operator-owned install policy. When enabled without a valid exec
command, installs fail closed.
Optional target filter. When omitted, policy applies to every supported target
so new installs do not unexpectedly fail open.
Absolute path to the trusted policy executable. OpenClaw runs it without a
shell and validates the path before use.
Static arguments passed after command .
Maximum wall-clock runtime for one policy decision.
Maximum time without stdout or stderr output before the policy fails closed.
Maximum combined stdout and stderr bytes accepted from the policy process.
Environment variable names copied from the OpenClaw process into the policy
process. Only named variables are passed.
Optional allowlist of directories that may contain the policy executable.
Bypasses command path ownership and permission checks. Use only when the path
is protected by another mechanism.
Allows the configured command path to be a symlink. The resolved target must
still satisfy the other path checks. Interpreter script arguments must be
direct regular files, not symlinks.
The policy receives one JSON object on stdin with protocolVersion: 1 ,
openclawVersion , targetType , targetName , sourcePath , sourcePathKind ,
optional structured source , structured origin , and request . It must write
one JSON object on stdout: { "protocolVersion": 1, "decision": "allow" } or
{ "protocolVersion": 1, "decision": "block", "reason": "..." } . Non-zero
exit, timeout, malformed JSON, missing fields, or unsupported protocol versions
fail closed.
OpenClaw does not execute install policy during normal Gateway startup. Installs
and updates fail closed when policy is enabled but unavailable. openclaw doctor
performs static validation, and openclaw doctor --deep executes a synthetic
install probe against the configured command.
Bulk updates apply policy per target: a blocked skill or plugin update fails
that target without disabling the policy or skipping later targets in the batch.
Example stdin:
json Copy code { "protocolVersion" : 1 , "openclawVersion" : "2026.6.1" , "targetType" : "skill" , "targetName" : "weather" , "sourcePath" : "/var/folders/.../openclaw-skill-clawhub/root" , "sourcePathKind" : "directory" , "source" : { "kind" : "clawhub" , "authority" : "openclaw" , "mutable" : false , "network" : true } , "origin" : { "type" : "clawhub" , "registry" : "https://clawhub.openclaw.ai" , "slug" : "weather" , "version" : "1.0.0" } , "request" : { "kind" : "skill-install" , "mode" : "install" , "requestedSpecifier" : "clawhub:weather@1.0.0" } , "skill" : { "installId" : "clawhub" } }
Minimal policy command:
js Copy code #!/usr/bin/env node let input = "" ; process. stdin . setEncoding ( "utf8" ); process. stdin . on ( "data" , ( chunk ) => { input += chunk; }); process. stdin . on ( "end" , () => { const request = JSON . parse (input); if (request. targetType === "plugin" && request. source ?. kind === "local-path" ) { process. stdout . write ( JSON . stringify ({ protocolVersion : 1 , decision : "block" , reason : "local plugin paths are not approved on this host" , }), ); return ; } process. stdout . write ( JSON . stringify ({ protocolVersion : 1 , decision : "allow" })); });
Bundled skill allowlist
Optional allowlist for bundled skills only. When set, only bundled skills
in the list are eligible. Managed, agent-level, and workspace skills are
unaffected.
Per-skill entries ( skills.entries )
Keys under entries match the skill name by default. If a skill defines
metadata.openclaw.skillKey , use that key instead. Quote hyphenated names
(JSON5 allows quoted keys).
OPENCLAW_DOCS_MARKER:paramOpen:IHBhdGg9InNraWxscy5lbnRyaWVzLjxrZXk
.enabled" type="boolean">
false disables the skill even when bundled or installed. The coding-agent
bundled skill is opt-in — set it to true and ensure one of claude ,
codex , opencode , or another supported CLI is installed and authenticated.
.apiKey" type='string | { source, provider, id }'>
Convenience field for skills that declare metadata.openclaw.primaryEnv .
Supports a plaintext string or a SecretRef: { source: "env", provider: "default", id: "VAR_NAME" } .
Agent allowlists ( agents )
Use agent config when you want the same machine/workspace skill roots but a
different visible skill set per agent.
json5 Copy code { agents : { defaults : { skills : [ "github" , "weather" ], // shared baseline }, list : [ { id : "writer" }, // inherits github, weather { id : "docs" , skills : [ "docs-search" ] }, // replaces defaults entirely { id : "locked-down" , skills : [] }, // no skills ], }, }
Shared baseline allowlist inherited by agents that omit agents.list[].skills .
Omit entirely to leave skills unrestricted by default.
Explicit final skill set for that agent. Explicit lists replace inherited
defaults — they do not merge. Set to [] to expose no skills for that agent.
Workshop ( skills.workshop )
When true , agents can create pending proposals from durable conversation
signals after successful turns. User-prompted skill creation always goes
through Skill Workshop regardless of this setting.
pending requires operator approval before agent-initiated apply, reject, or
quarantine. auto allows those actions without approval.
Allow Skill Workshop apply to write through workspace skill symlinks whose
real target is already trusted by skills.load.allowSymlinkTargets . Keep this
disabled unless generated proposal applies should mutate that shared skill
root.
Maximum pending and quarantined proposals retained per workspace.
Maximum proposal body size in bytes. Proposal descriptions are hard-capped at
160 bytes because they appear in discovery and listing output.
Symlinked skill roots
By default, workspace, project-agent, extra-dir, and bundled skill roots are
containment boundaries. A symlinked skill folder under <workspace>/skills
that resolves outside the root is skipped with a log message.
To allow an intentional symlink layout, declare the trusted target:
json5 Copy code { skills : { load : { extraDirs : [ "~/Projects/manager/skills" ], allowSymlinkTargets : [ "~/Projects/manager/skills" ], }, }, }
With this config, <workspace>/skills/manager -> ~/Projects/manager/skills is
accepted after realpath resolution. extraDirs scans the sibling repo directly;
allowSymlinkTargets preserves the symlinked path for existing layouts.
Skill Workshop apply does not write through those symlinks by default. To let
Workshop apply mutate skills under already-trusted symlink targets, opt in
separately:
json5 Copy code { skills : { load : { allowSymlinkTargets : [ "~/Projects/manager/skills" ], }, workshop : { allowSymlinkTargetWrites : true , }, }, }
Managed ~/.openclaw/skills and personal ~/.agents/skills directories
already accept skill-directory symlinks (per-skill SKILL.md containment still
applies).
Sandboxed skills and env vars
Warning
skills.entries.<skill>.env and apiKey apply to host runs only. Inside
a sandbox they have no effect — a skill that depends on GEMINI_API_KEY will
fail with apiKey not configured unless the sandbox is given the variable
separately.
Pass secrets into a Docker sandbox with:
json5 Copy code { agents : { defaults : { sandbox : { docker : { env : { GEMINI_API_KEY : "your-key-here" }, }, }, }, }, } Note
Users with Docker daemon access can inspect sandbox.docker.env values
through Docker metadata. Use a mounted secret file, a custom image, or
another delivery path when that exposure is not acceptable.
Loading order reminder
text Copy code workspace/skills (highest) workspace/.agents/skills ~/.agents/skills ~/.openclaw/skills bundled skills skills.load.extraDirs (lowest)
Changes to skills and config take effect on the next new session when the
watcher is enabled, or on the next agent turn when the watcher detects a change.
Related
Skills reference
What skills are, loading order, gating, and SKILL.md format.
Creating skills
Authoring custom workspace skills.
Skill Workshop
Proposal queue for agent-drafted skills.
Slash commands
Native slash-command catalog and chat directives.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
