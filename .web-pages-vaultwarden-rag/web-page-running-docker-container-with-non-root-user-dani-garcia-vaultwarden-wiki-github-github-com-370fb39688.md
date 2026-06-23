# Running docker container with non root user · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-docker-container-with-non-root-user
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-docker-container-with-non-root-user
- Fetched at: 2026-06-23T13:50:28Z
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
Running docker container with non root user
Jump to bottom Edit New page
St. Veit edited this page Sep 23, 2023
·
5 revisions
By default vaultwarden/server is using root user to run service inside the container. There are few things you need to set to run the container as non-root user if you wish to do so:
Make sure that the directory, you're mounting inside the container will be writable by the user. For example if you decide to run as nobody , the directory needs to be writable by user with id 65534. For other ways to specify user inside the container, see the docker documentation , in our examples here we will use nobody .
# Make the directory on the host, change this to you preferred path
sudo mkdir /vw-data
# Set the owner using user id. # Note that the ownership must match user in /etc/passwd *inside* the container, not on your host
sudo chown 65534 /vw-data
# Give the owner full rights to the folder
sudo chmod u+rwx /vw-data
Start the container with proper parameters. Define the user and make sure to start with port set to 1024 or higher.
docker run -d \
--name vaultwarden \
--user nobody \
-e ROCKET_PORT=1024 \
-v /vw-data/:/data/ \
-p 80:1024 \
vaultwarden/server:latest
Notice that the port mapping ( -p 80:1024 ) reflects the ROCKET_PORT setting.
Another way may be CAP_NET_BIND_SERVICE, which allows to bind to ports below 1024 as non-root user.
cap_add:
- CAP_NET_BIND_SERVICE
user: nobody
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
Changing persistent data location
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
