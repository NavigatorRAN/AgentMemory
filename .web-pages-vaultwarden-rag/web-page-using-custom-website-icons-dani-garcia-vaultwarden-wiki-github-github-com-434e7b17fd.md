# Using custom website icons · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-custom-website-icons
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Using-custom-website-icons
- Fetched at: 2026-06-23T13:50:47Z
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
Using custom website icons
Jump to bottom Edit New page
Stefan Melmuk edited this page Nov 8, 2025
·
7 revisions
Note
This page is about the website icons displayed next your entries (when using the internal icon service). If you want to customize the look of the web-vault you should refer to Customize Vaultwarden CSS
Important
The clients will only request icons for entries where you have configured an Autofill URI.
Be aware that you can also turn off website icons in your client settings, in which case the client will not request icons from Vaultwarden.
If you want to add custom icons for your website entries you can place them in the location of the ICON_CACHE_FOLDER (which defaults to data/icon_cache ). The naming is based on the specified IP or fully qualified domain name (FQDN) of your entry, i.e. what Bitwarden calls Hostname in this graphic :
This means the scheme and port will be ignored when requesting icons, so you can't provide different icons based on the port number.
While the web-vault supports a couple of image types like ICO, BMP, GIF, JPG, WEBP and PNG, the cached icons themselves are always named <fqdn>.png or <IP>.png (eg. data/icon_cache/en.wikipedia.org.png ). So you should name your custom icons accordingly.
How the icon cache expiration works
If an icon file already exists it will check its last modification time if it is outdated (which is configurable via ICON_CACHE_TTL ). If it is expired, it will try to fetch a new icon instead of serving that icon. You can disable the expiration feature by setting ICON_CACHE_TTL=0 so that Vaultwarden will keep any existing icon locally cached forever.
If setting ICON_CACHE_TTL=0 is not an option for you (because you want to get new icons for most websites and only provide a few custom ones), you can also write a cron job that regularly calls touch on your custom placed icons so their modification time is kept fresh and they won't expire.
By default ICON_CACHE_TTL is set to 2592000 seconds so if you don't disable expiration or regularly update the modification time any manually placed icon will be ignored and possible overwritten after 30 days.
If fetching an icon fails (for whatever reason), Vaultwarden will create an (empty) .miss file for that domain (e.g. data/icon_cache/en.wikipedia.org.png.miss ) in the ICON_CACHE_FOLDER and not try fetching an icon again for ICON_CACHE_NEGTTL and instead serve an fallback icon instead. The miss file is removed automatically on a new request once the miss file has expired. (Expired in this case means its age is larger than ICON_CACHE_NEGTTL seconds which defaults to 3 days.)
As long as there is an .miss file (that has not yet expired) Vaultwarden will always serve the fallback icon even if there is a valid icon. So remove the corresponding miss file for any custom icon you have created or which modification time you have updated.
Website Icon Troubleshooting
If you have not disabled icon download ( DISABLE_ICON_DOWNLOAD ) Vaultwardens internal icon service will download the requested icon from a given resource. This is done using a network request to the given domain / ip (disregarding the port). If your Vaultwarden server cannot make outgoing requests (e.g. because of missing internet access) downloading new icons will not work.
By default, Vaultwarden will also block certain IP ranges which it considers non-global (i.e. your private network) due to security concerns. You can also further configure which hosts Vaultwarden should block additionally by specifying a HTTP_REQUEST_BLOCK_REGEX .
If you set ICON_CACHE_NEGTTL=0 you disable the expiration of the miss indicator file which means that if there exists a miss file Vaultwarden will always serve the default fallback icon for the given domain.
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
