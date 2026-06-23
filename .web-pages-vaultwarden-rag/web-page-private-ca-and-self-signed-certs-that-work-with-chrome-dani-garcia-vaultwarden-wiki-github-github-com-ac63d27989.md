# Private CA and self signed certs that work with Chrome · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Private-CA-and-self-signed-certs-that-work-with-Chrome
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Private-CA-and-self-signed-certs-that-work-with-Chrome
- Fetched at: 2026-06-23T13:50:24Z
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
Private CA and self signed certs that work with Chrome
Jump to bottom Edit New page
docgalaxyblock edited this page Mar 10, 2024
·
14 revisions
Warning
⚠️ 💩 ⚠️
This method is for testing and development only.
The vast majority of users should not use this method, as it requires loading a cert on each of your devices, which is both error-prone and requires future maintenance.
Instead, focus your energy on obtaining real certs via Let's Encrypt .
This can even work if your vaultwarden instance is not on the public Internet ( example ).
☠️ ☠️ ☠️
This method is not supported.
Please do not open GitHub issues or post on the discussion forums asking about how to get this to work.
To get bitwarden working properly with self-signed certificates, Chrome needs the certificate to include the domain name in the alternative name field of the certificate.
Create a CA key (your own little on-premise Certificate Authority):
openssl genpkey -algorithm RSA -aes128 -out private-ca.key -outform PEM -pkeyopt rsa_keygen_bits:2048
Instead of -aes128 you could also use the older -des3 .
Create a CA certificate:
openssl req -x509 -new -nodes -sha256 -days 3650 -key private-ca.key -out self-signed-ca-cert.crt
The -nodes argument prevents setting a pass-phrase for the private key (key pair) in a test/safe environment, otherwise you'll have to input the pass-phrase every time you start/restart the server.
Create a bitwarden key:
openssl genpkey -algorithm RSA -out bitwarden.key -outform PEM -pkeyopt rsa_keygen_bits:2048
Create the bitwarden certificate request file:
openssl req -new -key bitwarden.key -out bitwarden.csr
Create a text file bitwarden.ext with the following content, change the domain names to your setup.
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:TRUE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = bitwarden.local
DNS.2 = www.bitwarden.local
# Optionally add IP if you're not using DNS names:
IP.1 = 192.168.1.3
Create the bitwarden certificate, signed from the root CA:
openssl x509 -req -in bitwarden.csr -CA self-signed-ca-cert.crt -CAkey private-ca.key -CAcreateserial -out bitwarden.crt -days 365 -sha256 -extfile bitwarden.ext
Note: As of April 2019 iOS 13+ and macOS 15+, the server certificate can not have an expiry > 825 and must include ExtendedKeyUsage extension https://support.apple.com/en-us/HT210176
Note: As of Android 11, the basicConstraints value must be set to CA:TRUE in order to be importable via the Settings app.
Add the root certificate and the bitwarden certificate to client computers.
For reference, see here: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/
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
