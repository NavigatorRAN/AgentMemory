# Secret Placeholder Conventions - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/reference/secret-placeholder-conventions
- Final URL: https://docs.openclaw.ai/reference/secret-placeholder-conventions
- Canonical URL: https://docs.openclaw.ai/reference/secret-placeholder-conventions
- Fetched at: 2026-06-23T14:56:36Z
- Content type: text/html; charset=utf-8

## Description

Secret-scanner-safe placeholder conventions for docs and examples

## Extracted Text

Close
Get started
Secret placeholder conventions
Use placeholders that are human-readable but do not resemble real secrets.
Recommended style
Prefer descriptive values like example-openai-key-not-real or example-discord-bot-token .
For shell snippets, prefer ${OPENAI_API_KEY} over inline token-like strings.
Keep examples obviously fake and scoped to purpose (provider, channel, auth type).
Avoid these patterns in docs
Literal PEM private-key header or footer text.
Prefixes that resemble live credentials, for example sk-... , xoxb-... , AKIA... .
Realistic-looking bearer tokens copied from runtime logs.
Example
bash Copy code # Good export OPENAI_API_KEY= "example-openai-key-not-real" # Better (when the doc is about env wiring) export OPENAI_API_KEY= " ${OPENAI_API_KEY} "
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
