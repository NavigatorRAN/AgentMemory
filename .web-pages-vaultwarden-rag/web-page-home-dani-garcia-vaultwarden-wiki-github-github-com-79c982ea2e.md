# Home · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki
- Fetched at: 2026-06-23T13:49:12Z
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
Home
Jump to bottom Edit New page
Luciano Godoy edited this page May 20, 2026
·
61 revisions
Vaultwarden
Vaultwarden is an unofficial Bitwarden server implementation written in Rust. It is compatible with the official Bitwarden clients , and is ideal for self-hosted deployments where running the official resource-heavy service is undesirable.
Vaultwarden is targeted towards individuals, families, and smaller organizations. Development of features that are mainly useful to larger organizations (e.g., single sign-on, directory syncing, etc.) is not a priority, though high-quality PRs that implement such features would be welcome.
There have been several audits done on Vaultwarden of which some are publicly available, read more about it on our Vaultwarden Audits wiki page.
Supported features
Vaultwarden implements the Bitwarden APIs required for most functionality, including:
Web interface (equivalent to https://vault.bitwarden.com/ )
Personal vault support
Organization vault support
Groups , setting an environment variable is required in order to enable it)
Event Logs ( this must be enabled as well)
Password sharing and access control
Collections
File attachments
Folders
Favorites
Website icons (requires configuration for internal/private service's)
Bitwarden Authenticator (TOTP)
Bitwarden Send
Emergency Access
Trash (soft delete, you can configure the days for automatic deletion )
Master password re-prompt
Personal API key
Two-step login via email , Duo , YubiKey , and FIDO2 WebAuthn (including Nitrokeys and Solokeys)
Username generator integration with SimpleLogin, AnonAddy, or Firefox Relay
Directory Connector support
Account Recovery (this requires mail to be enabled )
Live sync (WebSocket only) for desktop/browser clients/extensions
Live sync ( push notifications ) for mobile clients (Android/iOS)
Single Sign-On (SSO) , see Documentation
Certain enterprise policies:
Require two-step login
Master password requirements
Account recovery administration (only available if mail is enabled)
Password generator
Single organization
Remove individual vault
Remove Send
Send options
Remove card item type
Default URI match detection
Missing features
Issue #246 contains the comprehensive list of feature requests, both features of the official server that are missing in Vaultwarden, as well as enhancements specific to Vaultwarden.
To simplify comparison with the official server, this section summarizes the features implemented in the official server that are not currently available in Vaultwarden.
Features that may be added as time permits (contributions are always welcome):
Bitwarden Public API / Organization API key
This feature is partially added, but only to support the Bitwarden Directory Connector.
Login with Passkeys , cf. #5929
New Device Login Protection
Features that probably won't be added unless contributed:
Custom roles
Certain enterprise policies ( UI not open source , would probably need to be configured via admin page):
Require single sign-on authentication
Vault timeout
Remove individual vault export
Get in touch
To ask a question, offer suggestions, request new features, or get help configuring or installing the software, please use the forum .
If you spot any bugs or crashes with Vaultwarden itself, please create an issue . Make sure there aren't any similar issues open, though!
If you prefer to chat, we're usually hanging around at #vaultwarden:matrix.org room on Matrix. Feel free to join us!
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
