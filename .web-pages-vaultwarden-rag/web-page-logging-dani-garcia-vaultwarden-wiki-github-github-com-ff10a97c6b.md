# Logging · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Logging
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Logging
- Fetched at: 2026-06-23T13:50:14Z
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
Logging
Jump to bottom Edit New page
Jonghee Son edited this page Jun 11, 2022
·
9 revisions
vaultwarden logs only to standard output (stdout) by default. You can also configure it to log to a file or Syslog.
Logging to a file
Logging to a file is supported as of version 1.5.0. You can specify the path to the log file with the LOG_FILE environment variable:
docker run -d --name vaultwarden \
...
-e LOG_FILE=/data/vaultwarden.log \
When this environment variable is set, log messages will be logged to both stdout and the log file. If you're running in Docker, you'll most likely want to use a file path that is mounted from the Docker host (such as the data folder); otherwise, your log file will be lost (or at least hard to find) if the container is restarted or removed.
Logging to Syslog
You can use Syslog with the USE_SYSLOG environment variable while alse setting EXTENDED_LOGGING=true :
-e USE_SYSLOG=true -e EXTENDED_LOGGING=true \
When this environment variable is set, log messages will be logged to both stdout and Syslog.
Changing the log level
To reduce the amount of log messages, you can set the log level to 'warn' (default is 'info'). The Log level can be adjusted with the environment variable LOG_LEVEL while also setting EXTENDED_LOGGING=true . NOTE: Using the log level "warn" or "error" still allows Fail2Ban to work properly.
LOG_LEVEL options are: "trace", "debug", "info", "warn", "error" or "off".
-e LOG_LEVEL=warn -e EXTENDED_LOGGING=true \
Viewing logs
If running in Docker: docker logs <container-name>
If running via systemd : journalctl -u vaultwarden.service (or whatever your service is named)
Otherwise, check where standard output is being redirected, or set the LOG_FILE environment variable and view that file.
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
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
