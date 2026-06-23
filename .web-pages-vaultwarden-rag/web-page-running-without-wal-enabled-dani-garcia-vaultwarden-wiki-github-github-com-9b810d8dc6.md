# Running without WAL enabled · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-without-WAL-enabled
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-without-WAL-enabled
- Fetched at: 2026-06-23T13:50:29Z
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
Running without WAL enabled
Jump to bottom Edit New page
docgalaxyblock edited this page Mar 10, 2024
·
11 revisions
Important
WAL is an SQLite-specific setting. It is not applicable to MySQL or PostgreSQL; if you are using one of these backends, the ENABLE_DB_WAL config option has no effect.
By default during the startup vaultwarden will try to enable WAL for the DB. Adding this improves performance and in the past helped preventing failed requests under some circumstances.
Reasons to turn WAL off
Generally speaking, unless you're absolutely sure that you need to turn WAL off, you should leave it enabled. However, there might be some valid cases to turn it off. For example:
Some filesystems don't support WAL - this is especially true for network filesystems. If you're using such filesystem, the service will fail to start with Failed to turn on WAL error message.
The database requires sqlite version 3.7.0 or newer, so if you for any reason (for example backups) require to access the DB directly with some other tool that cannot be updated, you might need to disable WAL.
One of the disadvantages described here affects you
How to turn WAL off
0. Make backup
These changes are generally safe and can be done without data loss, however backing up your data prior to any changes is strongly advised.
1. Disable WAL on old DB
If you have old DB, that was used with WAL enabled, you need to disable it using sqlite:
Stop vaultwarden
Locate your data folder . Normally there will be db.sqlite3 file there unless you specified some other name to use.
Open the file using sqlite:
sqlite3 db.sqlite3
Disable WAL by typing PRAGMA journal_mode=delete; and pressing enter:
sqlite> PRAGMA journal_mode=delete;
delete
Quit sqlite utility by typing .quit and pressing enter. (notice the dot at the beginning)
2. Disable WAL in vaultwarden
To turn WAL off, you need to start vaultwarden with ENABLE_DB_WAL variable set to false :
docker run -d --name vaultwarden \
-e ENABLE_DB_WAL=false \
-v /vw-data/:/data/ \
-p 80:80 \
vaultwarden/server:latest
Make sure to always start with this variable present as starting even once without it will enable WAL again. (if that happens start at the first step to disable it again)
How to turn WAL on
Generally speaking you just start vaultwarden without ENABLE_DB_WAL set to false and server will automatically enable WAL for you. You can verify this by running:
sqlite3 db.sqlite3 ' PRAGMA journal_mode '
Where db.sqlite3 is the DB file used by vaultwarden . It should return back the mode that is currently used, so in our case it's wal . Disabled WAL will typically report back delete as this is the default.
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
