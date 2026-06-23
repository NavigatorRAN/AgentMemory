# Third party packages · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Third-party-packages
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Third-party-packages
- Fetched at: 2026-06-23T13:49:18Z
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
Third party packages
Jump to bottom Edit New page
Simon Ziehnert edited this page Feb 17, 2026
·
59 revisions
Warning
This page is an index of third-party vaultwarden packages.
As these packages are not maintained or controlled by vaultwarden, they can lag behind official releases, sometimes significantly. If you rely on these packages, you might want to enable watching for new vaultwarden releases and let the maintainer know if the package isn't being kept up to date.
Unofficial Packaging Status
Server Web-Vault
Be aware that the latest vaultwarden release is not always forward-compatible with the latest web-vault version, so you might want to use an older version of vaultwarden-web to ensure compatibility.
Arch Linux
Available in the official repositories , along with the web vault .
Debian
A docker based toolchain can be used to build debian packages: https://github.com/greizgh/vaultwarden-debian
It bundles the server and the web vault.
Debian source with pure compilation toolchain (no docker): https://github.com/dionysius/vaultwarden-deb . Prebuilt packages and apt repository for several distributions and architectures available.
DietPi (Highly optimised minimal Debian OS)
DietPi is a lightweight Debian-based distribution (image) for all kinds of devices like Raspberry Pi, Odroid, NanoPi and others. It offers a software script for installing various programs including Vaultwarden. That spares the user tinkering with installation commands.
For installing Vaultwarden on DietPi just type dietpi-software install 183 on the command line. More information about the installation process and first access to Vaultwarden on DietPi can be found at https://dietpi.com/docs/software/cloud/#vaultwarden
CentOS 8 / RHEL 8 (deprecated)
A hacky package that uses SQLite. It doesn't have the vault (yet), and still has the old name in visible places.
https://github.com/alexpdp7/vaultwarden-rpm
I am no longer maintaining this package, I use the EPEL 9 package now.
Fedora (current release, x86_64)
The vaultwarden package is built as a universal binary for SQLite, MySQL, and PostgreSQL. It also creates a vaultwarden user/group and a systemd service.
dnf config-manager --add-repo https://evermeet.cx/pub/repo/fedora/evermeet.repo
dnf install vaultwarden vaultwarden-webvault
Gentoo
User can customize (whether to use mysql/sqlite/postgresql or web/cli) how vaultwarden is built with USE flags.
To view available USE flags for vaultwarden, equery uses vaultwarden .
echo "app-admin/vaultwarden <your USE flags here>" >> /etc/portage/package.use/vaultwarden
emerge app-admin/vaultwarden
Nix (OS)
Vaultwarden is both packaged for mysql, sqlite, postgresql and for vault. There is also a NixOS module for declarative configuration (see services.vaultwarden )
Cloudron
Cloudron is a platform that helps you run web apps on your server.
Using Cloudron, you can easily install Vaultwarden on a custom domain from the App Library
The app package comes bundled with the upstream web vault and does not need any further configuration after installation to get started. The Cloudron team keeps track of releases and provides automatic updates.
The package code and the issue tracker can be found at https://git.cloudron.io/cloudron/vaultwarden-app
Home Assistant
Home Assistant is an open-source home automation platform.
A Vaultwarden community add-on is available at https://github.com/hassio-addons/addon-bitwarden .
Build script for Ubuntu 20.04
Dinger1986 has created a script to install Vaultwarden from source on Ubuntu 20.04, see
https://github.com/dinger1986/bitwardenrs_install_script
FreeBSD
Available in the FreeBSD ports tree and as a binary package in the FreeBSD pkg repository: pkg install vaultwarden
A sample configuration file is provided at /usr/local/etc/rc.conf.d/vaultwarden.sample . Copy this file to /usr/local/etc/rc.conf.d/vaultwarden and edit its content to configure vaultwarden . The vaultwarden service can then be launched as usual ( service(8) , etc.).
Syncloud
Syncloud is a self-hosting platform to help people with even no device administration experience to get popular services running on their devices.
Bitwarden is available for installation in app store on the device and requires no configuration.
RPM and DEB packages for most common distributions
openSUSE build service project with support for:
RPM SUSE 15.4
15.5
15.6
Tumbleweed RHEL 8 CentOS 7
8
8_Stream
9_Stream Fedora 36
37
38
39 DEB Debian 10
11
12
Testing Ubuntu 18.04
20.04
22.04
23.04
You can either download the packages directly or use the available repositories.
vaultwarden vaultwarden-webvault vaultwarden-webvault-dark
RHEL 9 / CentOS 9
Packages built for EL9 from the Masgalor packages:
https://rpm.awx.wiki/vaultwarden/
New versions are automatically built every night
Void Linux
Available in void-packages as vaultwarden : xbps-install vaultwarden
The web vault ( vaultwarden-web ) can be optionally installed as well: xbps-install vaultwarden-web
Snap
Vaultwarden is available as a snap through the Snap Store , and can be installed from the command line using the following command:
sudo snap install vaultwarden
The configuration file can be found at: /var/snap/vaultwarden/current/vaultwarden.conf
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
