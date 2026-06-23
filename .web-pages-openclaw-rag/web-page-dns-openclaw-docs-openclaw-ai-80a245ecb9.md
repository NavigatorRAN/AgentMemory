# DNS - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/dns
- Final URL: https://docs.openclaw.ai/cli/dns
- Canonical URL: https://docs.openclaw.ai/cli/dns
- Fetched at: 2026-06-23T14:37:35Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw dns` (wide-area discovery helpers)

## Extracted Text

Close
Reference CLI commands
openclaw dns
DNS helpers for wide-area discovery (Tailscale + CoreDNS). Currently focused on macOS + Homebrew CoreDNS.
Related:
Gateway discovery: Discovery
Wide-area discovery config: Configuration
Setup
bash Copy code openclaw dns setup openclaw dns setup --domain openclaw.internal openclaw dns setup --apply
dns setup
Plan or apply CoreDNS setup for unicast DNS-SD discovery.
Options:
--domain <domain> : wide-area discovery domain (for example openclaw.internal )
--apply : install or update CoreDNS config and restart the service (requires sudo; macOS only)
What it shows:
resolved discovery domain
zone file path
current tailnet IPs
recommended openclaw.json discovery config
the Tailscale Split DNS nameserver/domain values to set
Notes:
Without --apply , the command is a planning helper only and prints the recommended setup.
If --domain is omitted, OpenClaw uses discovery.wideArea.domain from config.
--apply currently supports macOS only and expects Homebrew CoreDNS.
--apply bootstraps the zone file if needed, ensures the CoreDNS import stanza exists, and restarts the coredns brew service.
Related
CLI reference
Discovery
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
