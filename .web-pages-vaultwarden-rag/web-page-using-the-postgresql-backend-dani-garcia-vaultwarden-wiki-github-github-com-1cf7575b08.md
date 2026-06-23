# Using the PostgreSQL Backend · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-the-PostgreSQL-Backend
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-the-PostgreSQL-Backend
- Fetched at: 2026-06-23T13:50:53Z
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
Using the PostgreSQL Backend
Jump to bottom Edit New page
Esemudeo edited this page Nov 10, 2025
·
20 revisions
To use the PostgreSQL backend, you can either use the official Docker image or build your own binary with PostgreSQL enabled .
To run the binary or container ensure the DATABASE_URL environment variable is set (i.e. DATABASE_URL='postgresql://<user>:<password>@postgresql/vaultwarden' )
Connection String Syntax:
DATABASE_URL =postgresql://[[user]:[password]@]host[:port][/database]
An example docker run environment variable would be: -e 'DATABASE_URL=postgresql://user_name:user_password@db_host:5432/vaultwarden' .
If you need to set additional connection parameters, note that the DATABASE_URL value ends up getting parsed by libpq , so you can use any of the parameters listed in the libpq docs . You can either add the connection parameter to DATABASE_URL or specify it via its corresponding PG* environment variable. If running under Docker, keep in mind that any paths provided need to be from the perspective of the Docker container, not the Docker host.
If you want to use a custom schema/search-path you need to use the following connection string:
Note the URL-encoded characters such as %20 for the space and %3D for = sign
DATABASE_URL =postgresql://user_name:user_password@db_host:5432/vaultwarden? application_name =vaultwarden& options =-c%20search_path%3Ddb_schema
If your password contains special characters, you will need to use percentage encoding.
! # $ % & ' ( ) * + , / : ; = ? @ [ ] %21 %23 %24 %25 %26 %27 %28 %29 %2A %2B %2C %2F %3A %3B %3D %3F %40 %5B %5D
A complete list of codes can be found on Wikipedia page for percent encoding
Migrating from SQLite to PostgreSQL
Tested with SQLite3 3.37.2, PostgreSQL 16.10 and Vaultwarden 1.34.3
An easy way of migrating from SQLite to PostgreSQL or to MySQL exists, but please, note that you are using this at your own risk and you are strongly advised to backup your installation and data! . This is unsupported and has not been robustly tested.
Create a new database user:
CREATE USER vaultwarden WITH ENCRYPTED PASSWORD ' yourpassword ' ;
Create a new (empty) database for vaultwarden, setting the user as the database owner:
CREATE DATABASE vaultwarden OWNER vaultwarden;
Configure a (new) vaultwarden instance to use the new database and start it, so diesel can run migrations and set up the schema properly. Do not do anything else.
Stop your new vaultwarden instance.
install pgloader
disable WAL of the SQLite database.
create the file bitwarden.load with the following content:
load database
from sqlite:///where/you/keep/your/vaultwarden/db.sqlite3
into postgresql://yourpgsqluser:yourpgsqlpassword@yourpgsqlserver:yourpgsqlport/yourpgsqldatabase
WITH data only, include no drop, reset sequences
EXCLUDING TABLE NAMES LIKE '__diesel_schema_migrations'
ALTER SCHEMA 'bitwarden' RENAME TO 'public'
;
run the command pgloader bitwarden.load and you might see some warnings, but the migration should complete successfully
Start vaultwarden again.
Migrating from MySQL to PostgreSQL
Tested with MariaDB 10.11.9, PostgreSQL 15.8-1 and Vaultwarden 1.32.0
Please, note that you are using this at your own risk and you are strongly advised to backup your installation and data! . This is unsupported and has not been robustly tested.
Configure vaultwarden and start it, so diesel can run migrations and set up the schema properly. Do not do anything else.
Stop vaultwarden.
Install pgloader . Make sure that you have the latest version of pgloader, the official Ubuntu repository has an outdated version which does not work well with newer versions of PostgreSQL. The newest version can be obtained from the PostgreSQL Apt Repository
Create the file vaultwarden.load with the following content:
from mysql://yourmysqluser:yourmysqlpassword@yourmysqlserver:yourmysqlport/yourmysqldatabase
WITH data only
EXCLUDING TABLE NAMES MATCHING '__diesel_schema_migrations'
ALTER SCHEMA 'vaultwarden' RENAME TO 'public'
Optionally add ?sslmode=require to the PostgreSQL connection string if your connection requires SSL
Run the command pgloader vaultwarden.load and you might see some warnings, but the migration should complete successfully. If there are errors, it is likely that you have an outdated version of pgloader!
Start vaultwarden again
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
