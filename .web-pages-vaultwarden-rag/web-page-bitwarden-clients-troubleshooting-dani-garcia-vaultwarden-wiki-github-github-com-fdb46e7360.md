# Bitwarden clients troubleshooting · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Bitwarden-clients-troubleshooting
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Bitwarden-clients-troubleshooting
- Fetched at: 2026-06-23T13:49:26Z
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
Bitwarden clients troubleshooting
Jump to bottom Edit New page
Mathijs van Veluw edited this page Nov 30, 2025
·
4 revisions
General
If you encounter any issue with any official Bitwarden client, trying to report an issue at any of the Bitwarden repo's will probably result in a closed issue stating they do not support alternative server's, and they are right to do so.
However, sometimes the issue really is a client side issue and isn't something which can be fixed on the server side, and thus not by Vaultwarden it self. To prevent tossing around users between Vaultwarden and Bitwarden it's best to follow a few steps to determine where the issue is located and help solve this for both projects. These steps might seem cumbersome, but keep in mind that someone has to take to steps to see where the issue is, and the best person to test those out, is the person who found it in the first place.
Also, be sure to test out the :testing tagged images of Vaultwarden before you report an issue regarding any client, this includes the web-vault. As the :testing tagged images might already contain fixes for newer client, but we have not yet deemed to release a stable yet.
I do suggest to create a backup of your database before running the :testing tagged images, as it might update or migrate some data, which isn't backwards compatible with an older server version!
How to troubleshoot an issue
The best thing to do is, create a free Bitwarden Cloud account and try to reproduce the same steps using their online cloud service.
If you can reproduce it via the Bitwarden Cloud environment, report this issue at Bitwarden and state you were using their online cloud service.
Now, if this for some reason isn't reproducible on the Bitwarden Cloud, it might still be a client issue, but then linked to a Self-Hosted system, which Bitwarden also offers, but that is a bit harder to test for most users, and probably not recommended for most people to try this out.
When unable to reproduce, what to do next?
If you are not able to reproduce this with Bitwarden Cloud, and the Vaultwarden :testing tagged image also didn't worked out, then you might be in a limbo here on where to report this.
To not create a flood of issues, it is better to start a Discussion first, and once determined it might be a Vaultwarden issue, we can either convert the discussion to an issue, or might ask to create a new issue with all the needed steps and details to reproduce this. This helps both users and developers.
Tips and Tricks to test clients
Might be useful to add some tips and tricks here on how to troubleshoot some clients.
We already have an Android Client page, other clients might follow.
Also, recent Bitwarden Mobile clients have a feature called Flight Recording, which is to help troubleshoot issues. This is also beneficial for Vaultwarden, as it might help show what the client was expecting, but didn't received.
To read more about this feature, look at the Bitwarden documentation here: https://bitwarden.com/help/flight-recorder/
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
