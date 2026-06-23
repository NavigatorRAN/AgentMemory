# Allow icon fetching from internal services · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Allow-icon-fetching-from-internal-services
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Allow-icon-fetching-from-internal-services
- Fetched at: 2026-06-23T13:49:20Z
- Content type: text/html; charset=utf-8

## Description

Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs - dani-garcia/vaultwarden

## Extracted Text

Skip to content
You signed in with another tab or window. Reload to refresh your session. You signed out in another tab or window. Reload to refresh your session. You switched accounts on another tab or window. Reload to refresh your session. Dismiss alert
{{ message }}
dani-garcia
/ vaultwarden Public
Uh oh!
There was an error while loading. Please reload this page .
Notifications
You must be signed in to change notification settings
Fork
2.9k
Star
62.8k
Allow icon fetching from internal services
Jump to bottom Edit New page
Stefan Melmuk edited this page May 23, 2026
·
3 revisions
This configuration applies to self-hosted environments where Vaultwarden needs to fetch icons from services hosted on internal/private networks, for example:
A NAS or server hosting multiple self-hosted applications
Services accessed through a local network
Services exposed only through VPNs such as Tailscale
Reverse proxy setups using internal IPs or split DNS
By default, Vaultwarden blocks requests to non-global/private IP addresses as a security measure. Because of this, icons may fail to load for services that resolve to:
LAN IPs ( 192.168.x.x , 10.x.x.x , etc.)
Tailscale/CGNAT ranges ( 100.x.x.x )
Other internal-only addresses
Configuration
Set the following environment variable:
HTTP_REQUEST_BLOCK_NON_GLOBAL_IPS = false
Then restart/redeploy Vaultwarden.
TrueNAS SCALE Important Note
When running Vaultwarden as a TrueNAS SCALE App, setting the environment variable alone may not be enough.
TrueNAS can override some Vaultwarden settings internally through the application configuration interface.
You must also:
Open the Vaultwarden Admin Panel
Go to Advanced Settings
Locate Block non global IPs
Set it to false / disabled
Save and restart the app
If this setting remains enabled, Vaultwarden will continue blocking icon downloads from internal IP ranges even if the environment variable is already present.
Security Considerations
Disabling HTTP_REQUEST_BLOCK_NON_GLOBAL_IPS reduces protection against SSRF (Server-Side Request Forgery) attacks.
With this setting disabled, Vaultwarden is allowed to make HTTP requests to internal/private IP ranges. This is required for environments where self-hosted services are intentionally exposed only through internal networking, VPNs, or private DNS.
Only disable this setting if:
You trust the users who can create/edit vault entries
Your Vaultwarden instance is private and properly secured
You understand that Vaultwarden will be able to access internal network resources
For most self-hosted homelab or internal infrastructure setups, this tradeoff is acceptable and required for proper icon fetching functionality.
Symptoms
Vaultwarden logs may contain warnings similar to:
IP 100.x.x.x for domain 'service.example.com' is not a global IP!
or:
IP 192.168.x.x for domain 'service.example.com' is not a global IP!
After disabling the restriction, icons for internal/self-hosted services should begin working normally.
🛡️ Vaultwarden — A Bitwarden server, reimagined in Rust
🏠 Wiki Home ·
📖 FAQs ·
⚙️ Configuration ·
🔒 Hardening Guide ·
🐳 Docker
💬 Get in touch
❤️ Love Vaultwarden? Consider supporting upstream Bitwarden — without their work, this project wouldn't exist.
Vaultwarden is an unofficial , community-driven Bitwarden-compatible server. It is not associated with, endorsed by, or affiliated with Bitwarden, Inc. — "Bitwarden" is a trademark of Bitwarden, Inc.
Maintained with care by @dani-garcia and contributors · Wiki content licensed under the project's terms
FAQs
Audits
Supporting upstream development
Troubleshooting
Logging
Bitwarden Android troubleshooting
Bitwarden clients troubleshooting
Container Image Usage
Which container image to use
Starting a container
Using Docker Compose
Using Podman
Updating the vaultwarden image
Reverse Proxy
Proxy examples
Using an alternate base dir (subdir/subpath)
HTTPS
Enabling HTTPS
Running a private vaultwarden instance with Let's Encrypt certs
Overview
Enabling admin page
SMTP configuration
Disable registration of new users
Disable invitations
Enabling WebSocket notifications
Enabling Mobile Client push notification
Enabling SSO support using OpenId Connect
Other configuration
Database
Using the MariaDB (MySQL) Backend
Using the PostgreSQL Backend
Running without WAL enabled
Migrating from MariaDB (MySQL) to SQLite
Security
Hardening Guide
Password hint display
Enabling U2F and FIDO2 WebAuthn authentication
Enabling YubiKey OTP authentication
Fail2Ban Setup
Fail2Ban + ModSecurity + Traefik + Docker
Performance
Changing the API request size limit
Changing the number of workers
Customization
Translating the email templates
Translating admin page
Customize Vaultwarden CSS
Using custom website icons
Disabling or overriding the Vault interface hosting
Backup
General (not docker)
Backing up your vault
Development
Building binary
Building your own docker image
Git hooks
Differences from the upstream API implementation
Alternative deployments
Pre-built binaries
Creating a systemd service
Third-party packages
Deployment examples
Disable the admin token
Other Information
Importing data from Keepass or KeepassX
Changing persistent data location
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
