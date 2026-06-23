# Audits · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Audits
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Audits
- Fetched at: 2026-06-23T13:49:22Z
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
Audits
Jump to bottom Edit New page
Raphael Vigneault edited this page Nov 27, 2024
·
4 revisions
Vaultwarden Audits
Vaultwarden has been audited by security companies which helps us in keeping Vaultwarden secure.
Some audits were done without publishing any data publicly because the companies which requested the audits with those security companies didn't allow it, but those researchers did provide the results.
Some audits are publicly published and can be accessed by everyone.
Audit by BSI
Note
The site and report are both in German
BSI (Bundesamt für Sicherheit in der Informationstechnik) , a German institute performed an audit on Vaultwarden v1.30.3 under their CAOS (Codeanalyse von Open Source Software) project .
The press release, including the PDF with the results for Vaultwarden can be found here: https://www.bsi.bund.de/DE/Service-Navi/Presse/Alle-Meldungen-News/Meldungen/Codeanalyse-KeePass-Vaultwarden_241014.html
They even have a more detailed ZIP file with all raw information located here: https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Downloadserver/P486/CAOS_Vaultwarden.html
As a reference you can download the report here:
Original - German - Vaultwarden-Passwortmanager.pdf
Translated - English - Vaultwarden-Passwortmanager.en.pdf
Penetration Test by ERNW Enno Rey Netzwerke GmbH
ERNW Enno Rey Netzwerke GmbH assessed Vaultwarden during a penetration test for a customer in October 2024. In June 2024, the German Federal Office for Information Security (BSI) published results of a static and dynamic test of the Vaultwarden server component. Therefore, only a partial source code audit was performed during the assessment which also focussed on other software and infrastructure. ERNW identified 3 vulnerabilities, including an authentication bypass, that were responsibly disclosed to Vaultwarden. A writeup of the vulnerabilities is described in ERNW's blog Insinuator:
https://insinuator.net/2024/11/vulnerability-disclosure-authentication-bypass-in-vaultwarden-versions-1-32-5/
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
