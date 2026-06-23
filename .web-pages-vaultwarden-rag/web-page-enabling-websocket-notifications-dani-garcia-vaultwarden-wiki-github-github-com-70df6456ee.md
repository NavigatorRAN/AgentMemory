# Enabling WebSocket notifications · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-WebSocket-notifications
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-WebSocket-notifications
- Fetched at: 2026-06-23T13:49:57Z
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
Enabling WebSocket notifications
Jump to bottom Edit New page
thelittlefox edited this page Apr 3, 2025
·
18 revisions
WebSocket notifications are used to inform the browser, desktop and Browser Extension Bitwarden clients that some event of interest has occurred, such as when an entry in the password database has been modified or deleted. Upon receiving the notification, the client can take an appropriate action, such as refresh the modified entry, or removing the deleted entry from its local cache. In this notification scheme, the Bitwarden client establishes a persistent WebSocket connection with the Bitwarden server (Vaultwarden in this case). Whenever the server has an event to report, it sends it to the client via this persistent connection.
Note that WebSocket notifications are not applicable to the mobile (Android/iOS) Bitwarden clients. These clients use the native push notification service instead ( FCM for Android, APNs for iOS). These have to be configured separately using push credentials from Bitwarden's cloud service, also available since v1.29.0.
WebSocket's are enabled by default since v1.29.0 of Vaultwarden. Previous versions needed a reverse proxy because WebSockets were running on a different port than default HTTPS port.
The old implementation is still available in v1.29.0 to not break during updates for now. But this will be removed in the future.
If you do use a reverse proxy like nginx or Apache HTTPd, then you need to make sure you configure it correctly to pass through the WebSocket Upgrade and Connection headers. Some reverse proxies do this by default like Traefik for example.
The old WEBSOCKET_ENABLED and WEBSOCKET_PORT have been deprecated since v1.29.0 of Vaultwarden and will be ignored.
After v1.29.0, you can disable Websocket notifications by setting ENABLE_WEBSOCKET to the false value, which will reduce resources used by Vaultwarden (though not that much).
Since v1.31.0, support for WebSocket traffic on port 3012 has been removed, as it's been integrated on the main HTTP port.
Example configurations are included in Proxy examples .
Note that some examples are not yet updated for the v1.29.0 version.
Test the WebSockets connection
Testing if a connection is working correctly can be done in two ways:
Open the developer tools of your browser, go to the network tab and filter for WS / WebSockets . Logout or refresh the page and login again and you you should see a 101 response for the upgraded WebSocket connection. If you click on that line you should be able to see the messages. If you do not get the status code 101 on /notifications/hub then something is configured incorrectly.
Messages will be shown in the console window of your browser: [2023-12-01T00:00:00.000Z] Information: WebSocket connected to wss://HOST_NAME/notifications/hub?access_token=eyJ0eX......
Open two different browsers or an incognito/private window. Login into your account on both. Either create a new entry, or rename the cipher in one, and that should instantly change also in the other.
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
