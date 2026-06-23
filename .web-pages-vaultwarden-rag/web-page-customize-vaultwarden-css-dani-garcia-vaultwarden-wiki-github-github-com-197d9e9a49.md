# Customize Vaultwarden CSS · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Customize-Vaultwarden-CSS
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Customize-Vaultwarden-CSS
- Fetched at: 2026-06-23T13:49:37Z
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
Customize Vaultwarden CSS
Jump to bottom Edit New page
GeorgelT edited this page Apr 14, 2026
·
19 revisions
Important
This functionality is only available in v1.33.0 and later releases.
Since version v1.33.0 you can modify the CSS which Vaultwarden previously embedded in the web-vault.
This way it makes it more easier for users to tweak the style and layout or even hide items.
To modify the CSS you need to add a templates directory in your data directory, or provide the correct path via the TEMPLATES_FOLDER environment variable.
Within this directory you need to create another directory called scss which will hold the file(s) for modifying the stylesheet Vaultwarden will serve.
There are two files you can place here:
user.vaultwarden.scss.hbs
This file is the file you want to edit and add your custom styles to.
vaultwarden.scss.hbs
This file should not exist, since it will overwrite the built-in defaults.
Only override this if you really know what you are doing!
.
├── templates
│ └── scss
│ ├── user.vaultwarden.scss.hbs
│ └── vaultwarden.scss.hbs
Some examples which you can place inside user.vaultwarden.scss.hbs :
/* File location: /data/templates/scss/user.vaultwarden.scss.hbs */ /* --- Variables --- */ /* You can set different logos for the Vault (User) and the Admin Console (Org) */
$logo - default : url( '/vw_static/logo-gray.png' );
$logo - admin : url( '/vw_static/logo-gray.png' );
/* Sidebar Customization */
$sidebar - width : 15rem; /* Set this to match your logo width if needed */ /* --- Mixins --- */ @mixin hide-element { display : none !important ; }
/* --- Hiding 2FA Providers --- */ /* 0: Authenticator App, 1: Email, 2: Duo, 3: YubiKey OTP, 7: FIDO2 WebAuthn */ /* .providers-2fa-0, .providers-2fa-1, .providers-2fa-2, .providers-2fa-3, .providers-2fa-7 { @include hide-element; } */ /* --- Loading Screen --- */ app-root img . new-logo-themed { content : $logo - default !important ; }
/* --- Login Screen --- */ auth-anon-layout bit-landing-header {
bit-svg {
/* Hide original SVG */ > svg { @include hide-element; }
/* Inject Custom Logo */ & :: before {
display : block !important ;
content : "" !important ;
width : 100 % !important ;
height : 42 px !important ;
background : $logo - default no - repeat center left !important ;
background-size : contain !important ;
}
/* --- Dashboard Sidebar --- */ bit-nav-logo {
/* Apply if you want logo to be less cropped when minimized if you have a logo like the one Vaultwarden and Bitwarden have */ /* > div { padding-right: 2px !important; } */ bit-svg { > svg { @include hide-element; }
& :: before {
background-repeat : no-repeat !important ;
background-size : auto 42 px !important ;
background-position : center left !important ;
/* --- Dashboard Sidebar --- */ app-user-layout bit-nav-logo bit-svg :: before { background-image : $logo - default !important ; }
app-organization-layout bit-nav-logo bit-svg :: before { background-image : $logo - admin !important ; }
/* --- Sidebar Layout & Logic --- */ # bit-side-nav {
/* Only override width if it matches the default '18rem' inline style. This ensures we don't break the 'Collapsed' state (4.5rem) or manual resizes. */ & [ style *= "18rem" ] { max-width : $sidebar - width !important ; }
/* When sidebar is collapsed (width is usually 4.5rem), hide the custom logo so it doesn't look broken or clipped. */ & [ style *= "4.5rem" ] {
bit-nav-logo bit-svg :: before { display : none !important ; }
/* Optional: Show original icon again when minimized? Remove the comment below to enable: */ /* bit-nav-logo bit-svg > svg { display: block !important; } */
Non scrolling search filter: (tested with 'Stylus' browser extension)
/* Make the "Filter" box fixed, so only the list of entries is scrolling. Allow to always see what you filtered for and quickly access the search filter without scrolling back to the top. */ # main-content {
/*Edit 2025.09.12*/ contain : none;
# main-content > app-vault > . tw-flex . tw-basis-1\/ 4
{
position : fixed;
width : calc ( 25 % - 55 px );
# main-content > app-vault > . tw-flex . tw-basis-3\/ 4
position : relative;
left : calc ( 25 % + 10 px );
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
