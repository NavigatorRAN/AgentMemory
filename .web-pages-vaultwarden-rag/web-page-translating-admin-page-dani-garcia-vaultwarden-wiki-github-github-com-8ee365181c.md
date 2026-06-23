# Translating admin page · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Translating-admin-page
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Translating-admin-page
- Fetched at: 2026-06-23T13:50:39Z
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
Translating admin page
Jump to bottom Edit New page
rizlas edited this page Feb 21, 2026
·
3 revisions
Since the Vaultwarden admin page is separate from the official Bitwarden self-hosted System Administrator Portal , it is currently only available in English and not possible to provide multiple languages for different users on the same server.
If you or your admin don't understand English, or you prefer to have it display your preferred language, you can translate the admin page into your preferred language.
How to translate / customize the admin page?
You can use customized templates by
copying the respective files from the repository (from src/static/templates/admin ) to the corresponding TEMPLATES_FOLDER with the same folder structure (e.g. to data/templates/admin )
changing them (e.g. translate them - but be sure to keep the {{variables}} in the link intact so everything still works) and
restarting vaultwarden to load the new (overwritten) templates.
Note: For ensuring compatibility you should initially download the templates for your version and you will also have to keep them up to date yourself if they ever change (or should new templates get added).
Translations
Simplified Chinese by @wcjxixi: https://github.com/wcjxixi/vaultwarden-lang-zhcn
Simplified Chinese by @zituoguan: https://github.com/zituoguan/vaultwarden-lang-zh_CN
Simplified Chinese by @JinkaiNiu: https://github.com/JinkaiNiu/vaultwarden-zh-cn
Russian by @marat2509: https://github.com/marat2509/vaultwarden-lang-ru
Italian by @rizlas: https://github.com/rizlas/vaultwarden-lang-it
Warning
Translations are provided as is by community members and we have not tested them. So use them at your own risk. If there has been a breaking change (e.g. caused by a new release of Vaultwarden) inform the maintainer and/or make a note here.
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
