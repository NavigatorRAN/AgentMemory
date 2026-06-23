# Translating the email templates · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Translating-the-email-templates
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Translating-the-email-templates
- Fetched at: 2026-06-23T13:50:40Z
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
Translating the email templates
Jump to bottom Edit New page
Roeland De Meester edited this page Mar 28, 2026
·
16 revisions
If you set up mail Vaultwarden will send its mails in English. Since the server does not know about a user's preferred language settings (which is done completely client-side) it is currently not possible to provide multiple languages for different users on the same server.
If your users don't understand English you could translate the provided handlebar templates into your preferred language.
How to translate / customize the templates?
You can use customized templates by
copying the respective files from the repository (from src/static/templates/email ) to the corresponding TEMPLATES_FOLDER with the same folder structure (e.g. to data/templates/email )
changing them (e.g. translate them - but be sure to keep the {{variables}} in the link intact so everything still works) and
restarting vaultwarden to load the new (overwritten) templates.
Note: For ensuring compatibility you should initially download the templates for your version and you will also have to keep them up to date yourself if they ever change (or should new templates get added).
Translations
German by @kennymc-c: https://github.com/kennymc-c/vaultwarden-lang-de
French by @YoanSimco: https://github.com/YoanSimco/vaultwarden-lang-fr
Polish by @kamilrogo: https://github.com/kamilrogo/vaultwarden-lang-pl
Simplified Chinese by @vlian5: https://github.com/vlian5/vaultwarden_zh_cn
Simplified Chinese by @wcjxixi: https://github.com/wcjxixi/vaultwarden-lang-zhcn
Simplified Chinese by @zituoguan: https://github.com/zituoguan/vaultwarden-lang-zh_CN
Simplified Chinese by @JinkaiNiu: https://github.com/JinkaiNiu/vaultwarden-zh-cn
Italian by @rizlas: https://github.com/rizlas/vaultwarden-lang-it
Spanish by @javier-varez: https://github.com/javier-varez/vaultwarden-lang-es
Russian by @marat2509: https://github.com/marat2509/vaultwarden-lang-ru
Brazilian Portuguese by @marivaldojr: https://github.com/marivaldojr/vaultwarden-lang-pt_br
Dutch (AI-generated) Translation by @demeesterroel: https://github.com/demeesterroel/vaultwarden-lang-nl
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
