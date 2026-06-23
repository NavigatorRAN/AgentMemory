# Skills (macOS) - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/platforms/mac/skills
- Final URL: https://docs.openclaw.ai/platforms/mac/skills
- Canonical URL: https://docs.openclaw.ai/platforms/mac/skills
- Fetched at: 2026-06-23T14:49:43Z
- Content type: text/html; charset=utf-8

## Description

macOS Skills settings UI and gateway-backed status

## Extracted Text

Close
Platforms macOS companion app
The macOS app surfaces OpenClaw skills via the gateway; it does not parse skills locally.
Data source
skills.status (gateway) returns all skills plus eligibility and missing requirements
(including allowlist blocks for bundled skills).
Requirements are derived from metadata.openclaw.requires in each SKILL.md .
Install actions
metadata.openclaw.install defines install options (brew/node/go/uv).
The app calls skills.install to run installers on the gateway host.
Operator-owned security.installPolicy can block gateway-backed skill
installs before installer metadata runs. Install-time built-in dangerous-code
blocking is not part of the skill install flow.
If every install option is download , the gateway surfaces all download
choices.
Otherwise, the gateway picks one preferred installer using the current
install preferences and host binaries: Homebrew first when
skills.install.preferBrew is enabled and brew exists, then uv , then the
configured node manager from skills.install.nodeManager , then later
fallbacks like go or download .
Node install labels reflect the configured node manager, including yarn .
Env/API keys
The app stores keys in ~/.openclaw/openclaw.json under skills.entries.<skillKey> .
skills.update patches enabled , apiKey , and env .
Remote mode
Install + config updates happen on the gateway host (not the local Mac).
Related
Skills
macOS app
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
