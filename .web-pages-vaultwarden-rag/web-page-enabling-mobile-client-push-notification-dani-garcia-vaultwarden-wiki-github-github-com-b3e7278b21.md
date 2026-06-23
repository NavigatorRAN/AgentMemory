# Enabling Mobile Client push notification · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-Mobile-Client-push-notification
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-Mobile-Client-push-notification
- Fetched at: 2026-06-23T13:49:50Z
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
Enabling Mobile Client push notification
Jump to bottom Edit New page
Nicolas Delahaie edited this page Sep 7, 2025
·
19 revisions
Since version 1.29.0 of Vaultwarden, you can activate Mobile Client push notifications to automatically sync your personal vault between the mobile app, the web extension and the web vault without the need to sync manually.
Enable Mobile Client push notification
Go to https://bitwarden.com/host/ insert your email address and you'll get an INSTALLATION ID and KEY.
Add the following settings to your docker-compose.yml (and make sure you insert the correct ID and the KEY from the previous step):
environment :
- PUSH_ENABLED=true
- PUSH_INSTALLATION_ID=
- PUSH_INSTALLATION_KEY=
Note
If you have requested an INSTALLATION ID and KEY for bitwarden.eu (European Union) in the previous step, you also have to set
- PUSH_RELAY_URI=https://api.bitwarden.eu
- PUSH_IDENTITY_URI=https://identity.bitwarden.eu
Recreate your container, e.g. with
docker compose up -d vaultwarden
Log out and log back in to your Bitwarden clients so they can retrieve the push configuration from the server.
Warning
If you have already connected your Bitwarden app before v1.30.2 push notifications will not work for your device (because the device token was never saved). You have to clear the app data of your mobile app (or reinstall the app ) and connect your Vaultwarden account again to register the push token with Bitwarden's Azure Notification Hub .
Important
Push notifications will also only work on Bitwarden apps obtained from the official mobile stores (App Store, Google Play Store) or when using alternative clients for the Google Play Store (such as Aurora Store). Push notifications will not work using Bitwarden clients installed from F-Droid , Neo Store, or other alternative stores. Those apps have been built without support for Firebase Messaging. To ensure push notifications function properly, make sure firebaseinstallations.googleapis.com is not blocked, as it is required for the feature to work.
Test if mobile push notifications work, for example by renaming a folder in the web vault and see if it changes after a few seconds in your mobile app.
Switching from US to EU servers (or vice versa)
Make sure you use the latest version before doing that change.
To switch from one data region to the other you'll have to:
deauthorize all sessions and also clear the app data on the mobile app
repeat steps 1. to 5. from the previous section with the different data region
Alternatively to 1., you could also clear the push_uuid field of the devices table in the database, e.g.
UPDATE devices SET push_uuid = NULL ;
This should trigger your push devices to be re-registered on your next login with the device.
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
