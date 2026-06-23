# Dashboard - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/dashboard
- Final URL: https://docs.openclaw.ai/cli/dashboard
- Canonical URL: https://docs.openclaw.ai/cli/dashboard
- Fetched at: 2026-06-23T14:37:31Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw dashboard` (open the Control UI)

## Extracted Text

Close
Reference CLI commands
openclaw dashboard
Open the Control UI using your current auth.
bash Copy code openclaw dashboard openclaw dashboard --no-open
Notes:
dashboard resolves configured gateway.auth.token SecretRefs when possible.
dashboard follows gateway.tls.enabled : TLS-enabled gateways print/open
https:// Control UI URLs and connect over wss:// .
If clipboard/browser delivery fails for a token-authenticated dashboard URL,
dashboard logs a safe manual-auth hint naming OPENCLAW_GATEWAY_TOKEN ,
gateway.auth.token , and fragment key token without printing the token
value.
For SecretRef-managed tokens (resolved or unresolved), dashboard prints/copies/opens a non-tokenized URL to avoid exposing external secrets in terminal output, clipboard history, or browser-launch arguments.
If gateway.auth.token is SecretRef-managed but unresolved in this command path, the command prints a non-tokenized URL and explicit remediation guidance instead of embedding an invalid token placeholder.
Related
CLI reference
Dashboard
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
