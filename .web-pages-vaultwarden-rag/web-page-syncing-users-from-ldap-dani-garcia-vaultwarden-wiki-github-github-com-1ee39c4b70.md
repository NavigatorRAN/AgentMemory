# Syncing users from LDAP · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Syncing-users-from-LDAP
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Syncing-users-from-LDAP
- Fetched at: 2026-06-23T13:50:38Z
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
Syncing users from LDAP
Jump to bottom Edit New page
9SMTM6 edited this page Nov 20, 2022
·
7 revisions
LDAP integration is performed using a small service that queries LDAP and invites users to your Vaultwarden instance. This service is uncreatively named vaultwarden_ldap .
Because of Vaultwardens zero-trust architecture this service does not provide synchronization of passwords but only invitations for new LDAP members.
It is not yet distributed as a binary, but there is an available Docker image vividboarder/vaultwarden_ldap .
Before deploying, you must enable your vaultwarden admin page . This enables the API that the LDAP sync service will use to invite users. The ADMIN_TOKEN that you set will be used when configuring the LDAP sync service. You must also be sure to not disable the invitation capability. To verify this, double check that the environment variable INVITATIONS_ALLOWED is not set to false .
It is also recommended to enable email sending from your Vaultwarden instance so that your users will be notified they can make an account. If you do not, they will still be able to register if they use their LDAP email address, but you will have to inform them on your own.
With these steps done, you can configure and deploy the LDAP sync service. The most up-to-date instructions are to be found on the service Readme itself, but it will involve creating the config.toml file with the connection info for your Vaultwarden instance, your LDAP instance, as well as the LDAP query you'd like to use to find users.
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
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
