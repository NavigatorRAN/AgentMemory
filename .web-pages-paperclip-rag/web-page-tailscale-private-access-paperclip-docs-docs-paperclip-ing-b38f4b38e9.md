# Tailscale Private Access | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/deploy/tailscale-private-access
- Final URL: https://docs.paperclip.ing/reference/deploy/tailscale-private-access/
- Canonical URL: https://docs.paperclip.ing/reference/deploy/tailscale-private-access
- Fetched at: 2026-06-23T13:40:08Z
- Content type: text/html; charset=utf-8

## Description

Use this page when you want a Paperclip instance that is reachable from a private network, not just from localhost.

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Tailscale Private Access
Use this page when you want a Paperclip instance that is reachable from a private network, not just from localhost .
It is the practical path for authenticated + private deployments.
Start In Private Mode
Start Paperclip with the private authenticated dev mode:
pnpm dev --tailscale-auth
Equivalent flag:
pnpm dev --authenticated-private
This configures:
PAPERCLIP_DEPLOYMENT_MODE=authenticated
PAPERCLIP_DEPLOYMENT_EXPOSURE=private
PAPERCLIP_AUTH_BASE_URL_MODE=auto
HOST=0.0.0.0
Note: The bind address matters. If you leave the host on localhost , other devices on the private network will not be able to reach the app.
Find The Reachable Address
From the machine that is running Paperclip:
tailscale ip -4
You can also use a MagicDNS hostname such as my-macbook.tailnet.ts.net .
Open The Instance
Use the private-network host or IP with the Paperclip port:
http://<tailscale-host-or-ip>:3100
Example:
http://my-macbook.tailnet.ts.net:3100
Allow Custom Hostnames
If you use a private hostname that Paperclip has not seen before, add it to the allowlist:
pnpm paperclipai allowed-hostname my-macbook.tailnet.ts.net
Use this when the app redirects incorrectly or refuses a host that is valid inside your private network.
Verify Connectivity
From another Tailscale-connected device:
curl http://<tailscale-host-or-ip>:3100/api/health
Expected response:
{"status":"ok"}
Troubleshooting
If login or redirect errors mention the hostname, add it with paperclipai allowed-hostname .
If the app only works on localhost , confirm you started with --tailscale-auth or --authenticated-private .
If local access works but remote access does not, verify both devices are on the same Tailscale network and that port 3100 is reachable.
Tip: When debugging private access, test curl /api/health from a second device before spending time on browser redirects. It answers the connectivity question directly.
