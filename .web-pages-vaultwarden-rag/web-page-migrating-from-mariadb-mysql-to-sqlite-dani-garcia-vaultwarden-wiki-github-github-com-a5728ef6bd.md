# Migrating from MariaDB (MySQL) to SQLite · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Migrating-from-MariaDB-%28MySQL%29-to-SQLite
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Migrating-from-MariaDB-%28MySQL%29-to-SQLite
- Fetched at: 2026-06-23T13:50:17Z
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
Migrating from MariaDB (MySQL) to SQLite
Jump to bottom Edit New page
Martin Böh edited this page Nov 3, 2024
·
7 revisions
Warning
⚠️ ☠️ ⚠️
Use these commands at your own risk!
Always create a backup before you do anything which could destroy your whole vault!
General
Vaultwarden was designed at first using SQLite only, but at the time both MariaDB (MySQL) and PostgreSQL also were added into the mix.
For SQLite you do not have to run a separate server or container, while for the other two you do need to run something extra.
Now, what if you started out using MariaDB and want to go back to SQLite?
Well, that is possible, but there could be some quirks which we do not know of using the steps below. If you encounter anything strange with this and need help, or even solved it, please open a new discussion here: https://github.com/dani-garcia/vaultwarden/discussions to help you and others.
How to migrate from MariaDB to SQLite
Make sure you are using the same version of Vaultwarden (Docker or custom build) for both SQLite and MariaDB, don't update the Docker image in-between these steps.
To migrate to SQLite we first need to have a SQLite database file which we can use to transfer the data to.
For this file to be created you need to stop your current Vaultwarden instance, and configure it to use SQLite.
You can do this by changing your DATABASE_URL from DATABASE_URL=mysql://<vaultwarden_user>:<vaultwarden_pw>@mariadb/vaultwarden to DATABASE_URL=/data/db.sqlite3 for example. ( /data is the internal path within the Docker container of the -v volume you use).
After you have changed the config, start Vaultwarden and it should show you that it executed a few migrations by checking the logs for lines which start with Executing migration script .... .
Now stop Vaultwarden again so that you can start the migration.
You need the database host and credentials you used for MariaDB to continue.
Now run the following one-liner and adjust the <dbhost> , <dbuser> and <database> to what you used for your MariaDB connection.
mysqldump \
--host= < dbhost > \
--user= < dbuser > --password \
--skip-create-options \
--compatible=ansi \
--default-character-set=utf8 \
--skip-extended-insert \
--compact \
--single-transaction \
--no-create-db \
--no-create-info \
--hex-blob < database > \
| grep -a " ^INSERT INTO " | grep -a -v " __diesel_schema_migrations " \
| sed ' s#\\"#"#gm ' \
| sed -sE " s#,0x([^,]*)#,X'\L\1'#gm " \
> mysql-to-sqlite.sql
You should be prompted to enter a password, enter your password and press enter.
This should generate a file mysql-to-sqlite.sql which holds your database.
Now look for the db.sqlite3 file Vaultwarden created in the previous step when you started Vaultwarden for the first time using SQLite as it's database.
Copy or move mysql-to-sqlite.sql to the same directory as db.sqlite3 .
Now you can execute the following
sqlite3 db.sqlite3 < mysql-to-sqlite.sql
This should have filled the SQLite database with the dump, and you can now start Vaultwarden again using SQLite instead of MySQL.
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
