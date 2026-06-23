# Changing persistent data location · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Changing-persistent-data-location
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Changing-persistent-data-location
- Fetched at: 2026-06-23T13:49:31Z
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
Changing persistent data location
Jump to bottom Edit New page
Proxymiity ☆ edited this page Apr 29, 2021
·
5 revisions
/data prefix:
By default all persistent data is saved under /data , you can override this path by setting the DATA_FOLDER env variable:
docker run -d --name vaultwarden \
-e DATA_FOLDER=/persistent \
-v /vw-data/:/persistent/ \
-p 80:80 \
vaultwarden/server:latest
Notice, that you need to adapt your volume mount accordingly.
database name and location
Default is $DATA_FOLDER/db.sqlite3 , you can change the path specifically for database using DATABASE_URL variable:
-e DATABASE_URL=/database/vaultwarden.sqlite3 \
-v /vw-data/:/data/ \
-v /vw-database/:/database/ \
Note, that you need to remember to mount the volume for both database and other persistent data if they are different.
attachments location
Default is $DATA_FOLDER/attachments , you can change the path using ATTACHMENTS_FOLDER variable:
-e ATTACHMENTS_FOLDER=/attachments \
-v /vw-attachments/:/attachments/ \
Note, that you need to remember to mount the volume for both attachments and other persistent data if they are different.
icons cache
Default is $DATA_FOLDER/icon_cache , you can change the path using ICON_CACHE_FOLDER variable:
-e ICON_CACHE_FOLDER=/icon_cache \
-v /icon_cache/ \
Note, that in the above example we don't mount the volume locally, which means it won't be persisted during the upgrade unless you use intermediate data container using --volumes-from . This will impact performance as vaultwarden will have to re-download the icons on restart, but might save you from having stale icons in cache as they are not automatically cleaned.
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
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
