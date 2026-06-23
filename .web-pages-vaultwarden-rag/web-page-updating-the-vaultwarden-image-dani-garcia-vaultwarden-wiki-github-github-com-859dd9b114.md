# Updating the vaultwarden image · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Updating-the-vaultwarden-image
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Updating-the-vaultwarden-image
- Fetched at: 2026-06-23T13:50:42Z
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
Updating the vaultwarden image
Jump to bottom Edit New page
Daniel edited this page May 10, 2024
·
9 revisions
Updating is straightforward, you just make sure to preserve the mounted volume. If you used the bind-mounted path as in the example here , you just need to pull the latest image, stop and rm the current container and then start a new one the same way as before:
# Pull the latest version
docker pull vaultwarden/server:latest
# Stop and remove the old container
docker stop vaultwarden
docker rm vaultwarden
# Start new container with the data mounted
docker run -d --name vaultwarden -v /vw-data/:/data/ -p 80:80 vaultwarden/server:latest
Then visit http://localhost:80
In case you didn't bind mount the volume for persistent data, you need an intermediate step where you preserve the data with an intermediate container:
# Create intermediate container to preserve data
docker run --volumes-from vaultwarden --name vaultwarden_data busybox true # Stop and remove the old container
docker run -d --volumes-from vaultwarden_data --name vaultwarden -p 80:80 vaultwarden/server:latest
# Optionally remove the intermediate container
docker rm vaultwarden_data
# Alternatively you can keep data container around for future updates in which case you can skip last step.
You can also use a tool like Watchtower to automate the update process. Watchtower can periodically check for an update to the Docker image, pull the updated image, and recreate the container using the updated image.
Updating when using Docker Compose
docker compose pull # or `docker-compose pull` if using standalone Docker Compose
docker compose up -d # or `docker-compose up -d` if using standalone Docker Compose
Updating when using systemd service (in this case Debian/Raspbian)
sudo systemctl restart vaultwarden.service
sudo docker system prune -f
# WARNING this could delete stopped or unused containers, etc. not associated with vaultwarden # be carefull and look which containers you need
docker ps -a
# shows stopped containers # WARNING! This will remove: # - all stopped #containers # - all networks not used by at least one container # - all dangling images # - all dangling build cache # you can list docker images with
docker images
# there you see all unused images #
The restart command will stop the container, pull the newest images, run the container again.
The prune command will remove the now old container (-f stands for: Do not ask for confirmation).
Put these into cronjob if you want (time can be changed):
$ sudo crontab -e
0 2 * * * sudo systemctl restart vaultwarden.service
0 3 * * * sudo /usr/bin/docker system prune -f
Use the command
which docker
if /usr/bin/docker is not the correct path to docker
Updating when using DietPi
DietPi is a lightweight Debian-based distribution (image) for all kinds of devices like Raspberry Pi, Odroid, NanoPi and others. It offers a software script for installing various programs including Vaultwarden. That spares the user tinkering with installation commands.
Vaultwarden updates must be manually initiated by the user on DietPi, there is no automatic installation nor will apt update && apt upgrade perform an update. To update a previously installed Vautwarden instance which was installed using DietPi's software installation script, enter the following command on the DietPi's command line:
dietpi-software reinstall 183
It is recommended to use DietPi version 8.7 or newer because the update process has been considerably sped up compared to previous versions.
In case you have customised Vaultwarden's configuration file, it will be kept by the update script.
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
