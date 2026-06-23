# Caddy 2.x with Cloudflare DNS · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Caddy-2.x-with-Cloudflare-DNS
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Caddy-2.x-with-Cloudflare-DNS
- Fetched at: 2026-06-23T13:49:29Z
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
Caddy 2.x with Cloudflare DNS
Jump to bottom Edit New page
Daniel edited this page May 28, 2024
·
12 revisions
Dockerfile (Caddy Builder)
FROM caddy:builder AS builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
build command
docker build -t [YOUR-NAME]/caddycfdns .
Caddyfile (as reverse proxy)
[YOUR-DOMAIN] {
tls {
dns cloudflare [API-KEY]
} # For the remaining config, see https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples }
docker-compose.yml
version: '3'
services:
vaultwarden:
image: vaultwarden/ server
restart: always
volumes:
- $PWD /vw-data:/data
environment:
SIGNUPS_ALLOWED: 'false' # set to false to disable signups
DOMAIN: 'https://[DOMAIN]'
SMTP_HOST: '[MAIL-SERVER]'
SMTP_FROM: '[E-MAIL]'
SMTP_PORT: '587'
SMTP_SECURITY: 'starttls'
SMTP_USERNAME: '[E-MAIL]'
SMTP_PASSWORD: '[SMTP-PASS]' # ADMIN_TOKEN: '[RAND. GENERATE]' # YUBICO_CLIENT_ID: '[OPTIONAL]' # YUBICO_SECRET_KEY: '[OPTIONAL]'
caddy:
image: [YOUR-NAME]/caddycfdns
- $PWD /Caddyfile:/etc/caddy/Caddyfile
- caddy_data:/data
- caddy_config:/config
- caddy_log:/logs
ports:
- [PRIVATE-IP]: 443 : 443
ACME_AGREE: 'true'
CLOUDFLARE_EMAIL: '[YOUR-EMAIL]'
CLOUDFLARE_API_TOKEN: '[YOUR-TOKEN]'
DOMAIN: '[DOMAIN]'
caddy_data:
caddy_config:
caddy_log:
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
Configuration
Overview
Enabling admin page
SMTP configuration
Disable registration of new users
Disable invitations
Enabling WebSocket notifications
Enabling Mobile Client push notification
Enabling SSO support using OpenId Connect
Allow icon fetching from internal services
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
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
