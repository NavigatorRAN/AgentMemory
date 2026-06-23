# Disable registration of new users · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Disable-registration-of-new-users
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Disable-registration-of-new-users
- Fetched at: 2026-06-23T13:49:44Z
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
Disable registration of new users
Jump to bottom Edit New page
Stefan Melmuk edited this page Aug 11, 2025
·
15 revisions
By default, anyone who can access your instance can register for a new account. To disable this, set the SIGNUPS_ALLOWED env variable to false :
docker run -d --name bitwarden \
-e SIGNUPS_ALLOWED=false \
-v /vw-data/:/data/ \
-p 80:80 \
vaultwarden/server:latest
Disabling organization invitations
Even when SIGNUPS_ALLOWED=false , an existing user who is an organization owner or admin can still invite new users. If you want to disable this as well, see Disable invitations .
Restricting registrations to certain email domains
You can restrict registration to email addresses from certain domains by setting SIGNUPS_DOMAINS_WHITELIST accordingly. For example:
SIGNUPS_DOMAINS_WHITELIST=example.com (single domain)
SIGNUPS_DOMAINS_WHITELIST=example.com,example.net,example.org (multiple domains)
Warning
If SIGNUPS_DOMAINS_WHITELIST is set, then the value of SIGNUPS_ALLOWED is ignored.
You may also want to set SIGNUPS_VERIFY=true , which would require email verification before a newly-registered user can successfully log in. This would prevent someone from registering with a fake email address that has the proper domain.
Visibility of the Create account link
When SIGNUPS_ALLOWED=false (and the SIGNUPS_DOMAINS_WHITELIST is empty) the Create account link will be hidden in the web vault UI unless you have not configured email and allow invitations (cf. #6109 ). If you don't want to have the link visible even in the latter case you can hide the link by using Custom CSS .
Invitations via the admin page
The vaultwarden admin can invite anyone via the admin page , regardless of any of the restrictions above. If mail has been disabled and the link is not visible, invited users can still visit https://vaultwarden.example.tld/#/signup and use the email address that was invited to register their account.
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
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
