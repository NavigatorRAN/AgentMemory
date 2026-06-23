# Using an alternate base dir · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-an-alternate-base-dir
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-an-alternate-base-dir
- Fetched at: 2026-06-23T13:50:46Z
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
Using an alternate base dir
Jump to bottom Edit New page
techsolo12 edited this page Nov 18, 2021
·
9 revisions
Traditionally, Vaultwarden is limited to residing at the root of a subdomain, e.g. https://vaultwarden.example.com .
This limitation originates in the backend and web vault, which haven't been designed to accommodate alternate base dirs (see bitwarden/server#277 ). The mobile/desktop apps and browser extensions actually have no issues using a base URL with a path.
In vaultwarden, with the changes in PR#868 (backend) and PR#11 (web vault), you can configure a fully functional instance at an alternate base dir.
Configuration
Simply configure your domain URL to include the base dir. For example, suppose you want to access your instance at https://vaultwarden.example.com/base-dir . (Note that you can also use multiple levels of directories, like https://vaultwarden.example.com/multi/level/base/dir if you want.)
Stop vaultwarden.
If you normally configure vaultwarden using the admin page, edit your config.json to look as follows:
{ "domain" : "https://vaultwarden.example.com/base-dir" , // ... other values ... }
If you normally configure vaultwarden via environment variables, update your config files/scripts to set the DOMAIN environment variable to the base URL. For example:
docker run -e DOMAIN= " https://vaultwarden.example.com/base-dir " ...
Restart vaultwarden.
You should now be able to access the web vault at https://vaultwarden.example.com/base-dir/ (note the trailing slash). For reasons not entirely clear, you'll probably run into issues if you use https://vaultwarden.example.com/base-dir (without the trailing slash).
Configure your apps or browser extensions to use https://vaultwarden.example.com/base-dir . If you add a trailing slash, the apps and extensions will automatically remove it before saving.
Note over 5 . The trailing slash / issue could be solved by appending / after the route location string. For example, in nginx.
location /my-base-path {
# This config would cause `/` issue
}
location /my-base-path-2/ {
# This config works perfectly
Reverse proxying
If you are putting vaultwarden behind a reverse proxy, make sure your proxy is configured to pass the request path through to vaultwarden, since the vaultwarden API routes are set up to expect the base dir. So if a request for https://vaultwarden.example.com/base-dir/api/sync hits your reverse proxy, which then proxies to your vaultwarden listening on localhost:8080 , the request must go to http://localhost:8080/base-dir/api/sync , not http://localhost:8080/api/sync .
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
