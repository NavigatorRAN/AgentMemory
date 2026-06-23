# Importing data from Keepass or KeepassX · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Importing-data-from-Keepass-or-KeepassX
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Importing-data-from-Keepass-or-KeepassX
- Fetched at: 2026-06-23T13:50:11Z
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
Importing data from Keepass or KeepassX
Jump to bottom Edit New page
manwithpowers edited this page Mar 29, 2026
·
5 revisions
Introduction
Bitwarden can import your data from a large number of applications .
The current importers let you only choose the format, not HOW the data is translated to Bitwarden.
Different import results for Keepass and KeepassX
Importing from Keepass or KeepassX gives complete different results, although they use the same Keepass 2.x kbdx database:
Keepass CSV files are imported at the Organization level (owner of each entry) and translates the Keepass Groups into Bitwarden Collections .
Keepass XML files are imported at the User level (owner of each entry) and translates the Keepass Groups into Bitwarden Folders with as main folder the name of the Keepass database.
It is a lot of work in Bitwarden itself to change Collections to Folders or to transfer ownership of all the entries.
So depending on what you want, choose the appropriate method!
An alternative approach is to do the import with KP2BW - Python based KeePass to Bitwarden converter which supports more Keepass Features like file attachments, passkeys, references and even more!
Example
Keepass database with name 'MyVault'
Groups:
Group1
Group1Sub1
Group2Sub2
Group2
Import via Keepass (CSV):
Owner = Organization
Collections:
Import via Keepass (XML):
Owner = Logged in User
Folders:
MyVault
Note: you might have to create the main folder manually, as the import shows MyVault/Group1 as a Folder. Creating the folder MyVault shows the subfolders in the MMI.
Note2: you can edit the folders to remove the main folder 'MyVault', or edit the exported CSV file and remove the 'MyVault/' string in each entry before importing into Bitwarden.
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
Changing persistent data location
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
