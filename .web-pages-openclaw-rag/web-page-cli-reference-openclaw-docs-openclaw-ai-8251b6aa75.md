# CLI reference - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli
- Final URL: https://docs.openclaw.ai/cli
- Canonical URL: https://docs.openclaw.ai/cli
- Fetched at: 2026-06-23T14:37:11Z
- Content type: text/html; charset=utf-8

## Description

OpenClaw CLI index: command list, global flags, and links to per-command pages

## Extracted Text

Close
Reference CLI commands
openclaw is the main CLI entry point. Each core command has either a
dedicated reference page or is documented with the command it aliases; this
index lists the commands, the global flags, and the output styling rules that
apply across the CLI.
Use the setup commands by intent:
openclaw setup creates the baseline config and workspace without walking the full guided onboarding flow.
openclaw onboard is the full guided first-run path for gateway, model auth, workspace, channels, skills, and health.
openclaw configure changes targeted parts of an existing setup, such as model auth, gateway, channels, plugins, or skills.
openclaw channels add configures channel accounts after the baseline exists; run it without flags for guided channel setup or with channel-specific flags for scripts.
Command pages
Area Commands Setup and onboarding crestodian · setup · onboard · configure · config · completion · doctor · dashboard Reset and uninstall backup · reset · uninstall · update Messaging and agents message · agent · agents · acp · mcp Health and sessions status · health · sessions Gateway and logs gateway · logs · system Models and inference models · infer · capability (alias for infer ) · memory · commitments · wiki Network and nodes directory · nodes · devices · node Runtime and sandbox approvals · exec-policy (see approvals ) · sandbox · tui · chat / terminal (aliases for tui --local ) · browser Automation cron · tasks · hooks · webhooks · transcripts Discovery and docs dns · docs Pairing and channels pairing · qr · channels Security and plugins security · secrets · skills · plugins · proxy Legacy aliases daemon (gateway service) · clawbot (namespace) Plugins (optional) path · policy · voicecall · workboard (if installed)
Global flags
Flag Purpose --dev Isolate state under ~/.openclaw-dev and shift default ports --profile <name> Isolate state under ~/.openclaw-<name> --container <name> Target a named container for execution --no-color Disable ANSI colors ( NO_COLOR=1 is also respected) --update Shorthand for openclaw update (source installs only) -V , --version , -v Print version and exit
Output modes
ANSI colors and progress indicators render only in TTY sessions.
OSC-8 hyperlinks render as clickable links where supported; otherwise the
CLI falls back to plain URLs.
--json (and --plain where supported) disables styling for clean output.
Long-running commands show a progress indicator (OSC 9;4 when supported).
Palette source of truth: src/terminal/palette.ts .
Command tree
Full command tree Code Copy code openclaw [--dev] [--profile <name>] <command> crestodian setup onboard configure config get set unset file schema validate completion doctor dashboard backup create verify security audit secrets reload audit configure apply reset uninstall update wizard status channels list status capabilities resolve logs add remove login logout directory self peers list groups list|members skills search install update list info check plugins list inspect install uninstall update enable disable doctor marketplace list workboard list create show dispatch memory status index search transcripts list show path path resolve find set validate emit commitments list dismiss wiki status doctor init ingest compile lint search get apply bridge import unsafe-local import obsidian status|search|open|command|daily message send broadcast poll react reactions read edit delete pin unpin pins permissions search thread create|list|reply emoji list|upload sticker send|upload role info|add|remove channel info|list member info voice status event list|create timeout kick ban agent agents list add delete bindings bind unbind set-identity acp mcp serve list show set unset status health sessions cleanup tasks list audit maintenance show notify cancel flow list|show|cancel gateway call usage-cost health status probe discover install uninstall start stop restart run daemon status install uninstall start stop restart logs system event heartbeat last|enable|disable presence models list status set set-image aliases list|add|remove fallbacks list|add|remove|clear image-fallbacks list|add|remove|clear scan infer (alias: capability) list inspect model run|list|inspect|providers|auth login|logout|status image generate|edit|describe|describe-many|providers audio transcribe|providers tts convert|voices|providers|status|enable|disable|set-provider video generate|describe|providers web search|fetch|providers embedding create|providers auth add|login|login-github-copilot|setup-token|paste-token auth order get|set|clear sandbox list recreate explain cron status list get add edit rm enable disable runs run nodes status describe list pending approve reject rename invoke notify push canvas snapshot|present|hide|navigate|eval canvas a2ui push|reset camera list|snap|clip screen record location get devices list remove clear approve reject rotate revoke node run status install uninstall stop restart approvals get set allowlist add|remove exec-policy show preset set browser status start stop reset-profile tabs open focus close profiles create-profile delete-profile screenshot snapshot navigate resize click type press hover drag select upload fill dialog wait evaluate console pdf hooks list info check enable disable install update webhooks gmail setup|run proxy start run coverage sessions query blob purge pairing list approve qr clawbot qr docs dns setup tui chat (alias: tui --local) terminal (alias: tui --local)
Plugins can add additional top-level commands, such as
openclaw workboard or openclaw voicecall .
Chat slash commands
Chat messages support /... commands. See slash commands .
Highlights:
/status — quick diagnostics.
/trace — session-scoped plugin trace/debug lines.
/config — persisted config changes.
/debug — runtime-only config overrides (memory, not disk; requires commands.debug: true ).
Usage tracking
openclaw status --usage and the Control UI surface provider usage/quota when
OAuth/API credentials are available. Data comes directly from provider usage
endpoints and is normalized to X% left . Providers with current usage
windows: Anthropic, GitHub Copilot, Gemini CLI, OpenAI Codex, MiniMax,
Xiaomi, and z.ai.
See Usage tracking for details.
Related
Slash commands
Configuration
Environment
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
