# Starting a Container · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Starting-a-Container
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Starting-a-Container
- Fetched at: 2026-06-23T13:50:35Z
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
Starting a Container
Jump to bottom Edit New page
vscpython edited this page Mar 23, 2025
·
18 revisions
Note that the docker run command has a slightly misleading name, as it rather creates a container, rather than just starting it, leading to conflicts when using docker run after just stopping the container without removing it. For a plain start, see below.
Creating the Container
The persistent data is stored under /data inside the container, so the only requirement for persistent deployment using Docker is to mount a persistent volume. Create a local directory where to map the container's persistent storage:
mkdir /vw-data
If you happen to use SELinux (RHEL & Clones / Fedora), you'll have to set the context of the persistent storage so the container may write to it
semanage fcontext -a -t svirt_sandbox_file_t ' /vw-data(/.*)? '
restorecon -Rv /vw-data
# using Docker:
docker run -d --name vaultwarden -v /vw-data/:/data/ -p 80:80 vaultwarden/server:latest
# using Podman as non-root:
podman run -d --name vaultwarden -v /vw-data/:/data/:Z -e ROCKET_PORT=8080 -p 8080:8080 vaultwarden/server:latest
# using Podman as root:
sudo podman run -d --name vaultwarden -v vw-data:/data/:Z -p 80:80 vaultwarden/server:latest
This will preserve any persistent data under /vw-data/ , you can adapt the path to whatever suits you.
The service will be exposed on host-port 80 or 8080. By default, non-root containers are not allowed to use privileged ports (<1024), hence the need to change the port vaultwarden listens on by passing the ROCKET_PORT environmental variable along with the port mappings.
For non-x86 hardware or to run specific version, you can choose some other image .
If your docker/vaultwarden runs on a device with a fixed IP, you can bind the host-port to that specific IP and hence prevent exposing the host-port to the whole world or network. Add the IP address (e.g. 192.168.0.2) in front of the host-port and container-port as follows:
docker run -d --name vaultwarden -v /vw-data/:/data/ -p 192.168.0.2:80:80 vaultwarden/server:latest
Starting the container
If the container has been stopped by docker stop vaultwarden , a reboot or any other reason you can just start it up again by using
docker start vaultwarden
Customizing container startup
If you have custom startup script(s) you want to run when the container starts, you can mount a single script into the container as /etc/vaultwarden.sh and/or a directory of scripts as /etc/vaultwarden.d . In the latter case, only files with an .sh extension are run, so files with other extensions (e.g., data/config files) can reside in the same dir. (See start.sh for details on exactly how it works.)
A custom startup script can be useful for patching web vault files or installing additional packages, CA certificates, etc. without having to build and maintain your own Docker image.
Example
Suppose your script is named init.sh and contains the following:
echo "starting up"
You can run the script on startup like this:
docker run -d --name vaultwarden -v $(pwd)/init.sh:/etc/vaultwarden.sh <other docker args...> vaultwarden/server:latest
If you run docker logs vaultwarden , you should now see starting up as the first line of the output.
Note that the init scripts are run each time the container starts (not just the first time), so these scripts should generally be idempotent (i.e., you can run the scripts more than once without undesirable/erroneous behavior). If your scripts don't naturally have this property, you can do something like this:
if [ ! -e /.init ]; then
touch /.init
# run your init steps...
fi
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
