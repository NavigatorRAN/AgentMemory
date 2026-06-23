# Differences from the upstream API implementation · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Differences-from-the-upstream-API-implementation
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Differences-from-the-upstream-API-implementation
- Fetched at: 2026-06-23T13:49:40Z
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
Differences from the upstream API implementation
Jump to bottom Edit New page
Daniel García edited this page Apr 27, 2021
·
5 revisions
Inviting users into organization
With SMTP enabled
Invited users will receive an email containing a link that is valid for 5 days. Upon clicking the link, users can choose to create an account or log in. New users will need to create a new account; existing users who are being invited to a new organization will simply need to log in. After either step, they will show up as "Accepted" in the admin interface, and will be added to the organization when an orgnization admin confirms them.
Without SMTP enabled
The invited users won't get an invitation email; instead all already registered users will appear in the interface as if they already accepted the invitation. Organization admin then just needs to confirm them to be proper Organization members and to give them access to the shared secrets.
Invited users that aren't registered yet will show up in the Organization admin interface as "Invited". At the same time an invitation record is created that allows the users to register even if user registration is disabled . (unless you disable this functionality ) They will automatically become "Accepted" once they register. From there Organization admin can confirm them to give them access to Organization.
Running on unencrypted connection
It is strongly recommended to run vaultwarden service over HTTPS. However the server itself while supporting it does not strictly require such setup. This makes it a bit easier to spin up the service in cases where you can generally trust the connection (internal and secure network, access over VPN,..) or when you want to put the service behind HTTP proxy, that will do the encryption on the proxy end.
Running over HTTP is still reasonably secure provided you use really strong master password and that you avoid using web Vault over connection that is vulnerable to MITM attacks where attacker could inject javascript into your interface. However some forms of 2FA might not work in this setup and Vault doesn't work in this configuration in Chrome .
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
