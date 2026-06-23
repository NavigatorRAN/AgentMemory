# Hardening Guide · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Hardening-Guide
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Hardening-Guide
- Fetched at: 2026-06-23T13:50:09Z
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
Hardening Guide
Jump to bottom Edit New page
Brandon Richardson edited this page Nov 9, 2025
·
22 revisions
Application configuration
The subsections below cover hardening related to vaultwarden itself.
Disable registration and (optionally) invitations
By default, vaultwarden allows any anonymous user to register new accounts on the server without first being invited. While this is not necessary if you have access to the admin page, this is useful if you're the first user on the server and it's recommended that you disable it in the admin panel (if the admin panel is enabled) or with the environment variable to prevent attackers from creating accounts on your vaultwarden server.
vaultwarden also allows registered users to invite other new users to create accounts on the server and join their organizations. This does not pose an immediate risk (as long as you trust your users), but it can be disabled in the admin panel or with the environment variable .
Disable password hint display
vaultwarden displays password hints on the login page to accommodate small/local deployments that do not have SMTP configured, which could be abused by an attacker to facilitate password-guessing attacks against users on the server. This can be disabled in the admin panel by unchecking the Show password hints option or with the environment variable .
HTTPS / TLS configuration
The subsections below cover hardening related to HTTPS / TLS.
Strict SNI
SNI is how a web browser requests that an HTTPS server provide the SSL/TLS certificate for a particular site (e.g., bitwarden.example.com ). Suppose bitwarden.example.com has the IP address 1.2.3.4 . Ideally, you want your instance to only be accessible via https://bitwarden.example.com , and not https://1.2.3.4 . This is because IP addresses are continually scanned for various reasons, and your vaultwarden instance becomes a more obvious target if it can be detected this way. For example, a simple Shodan search reveals a number of Bitwarden instances that are accessible by IP address.
Reverse proxying
In general, you should avoid enabling HTTPS via vaultwarden's built-in Rocket TLS support , especially if your instance is publicly accessible. Rocket itself lists the following warning :
Rocket's built-in TLS is not considered ready for production use. It is intended for development use only.
For example, Rocket TLS doesn't support strict SNI or ECC certs (only RSA).
See Proxy example for some sample reverse proxy configurations.
Access logs contain access_token parameter
A WSS connection is established for notifications by invoking a GET request with a JWT key.
Example GET request:
/notifications/hub?access_token=[this part is always the same].eyJuYmYi[redacted]sImV4cCI6MTcxNzc1NzQ1OCwiaXN[redacted]M6Ly92YXVsdC5zZWMuYXJwYXxsb2dpbiIsInN1YiI6ImY5YmVhN[redacted]tNGJjNS05MDY2LTQ3NjFlZmY4ND[redacted]sInByZW1pdW0iOnRydWU[redacted]JjaXBoZXIiLCJlbWFpbCI6ImNpc[redacted]ljdSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJzc3RhbXAiOiJlZjM3[redacted]MjctODE2OS1hZTQ3NmFjNDc4MGQiLCJkZX[redacted]02ZTk3LTQ2N2M[redacted]jM3NmEiLCJzY29wZSI6WyJhcG[redacted]5lX2FjY2VzcyJdLCJhbXIiOlsiQXBwbGljY[redacted]hGDeCNdjTs1cOL2fV_OR96Sey-gA5eRa8OCGNgCrDeyYAPyk[redacted]BkQGwjEhD7fcWILxRYqQ7W6rkC2o[redacted]LB_nztpAgeRUbsPgsd3RNTWJDKdlH8aMf1[redacted]vB_doENJPeyaeMuEG85KqpAN2A[redacted]GeeCztxmQIe21PMtBG-SAgGeI[redacted]X_9mmyv0nISHBuHjhQ_km[redacted]VCLoFneb-MEzN[redacted]T8VcXSKhGXpwJUx8j1[redacted]k_nH27vrD2Dg
If your reverse proxy is configured to save access logs, or the access logs are shipped to an external service such as Prometheus + Promtail, it is recommended to redact the value of the access_token parameter on the external log store, or directly on your reverse proxy of choice, if supported.
No other data is ever send via GET request, encrypted or unencrypted.
Be advised that internal vaultwarden logging strips query to 30 chars, hence access_token is truncated, meaning if not using reverse proxy, you shall be safe from this by default.
Docker configuration
The subsections below cover hardening related to Docker.
Run as a non-root user
The Vaultwarden Docker image is configured to run the container process as the root user by default. This allows Vaultwarden to read/write any data bind-mounted into the container without permission issues, even if that data is owned by another user (e.g., your user account on the Docker host).
The default configuration provides a good balance of security and usability -- running as root within an unprivileged Docker container provides a reasonable level of isolation on its own, while also making setup easier for users who aren't necessarily well-versed in how to manage ownership/permissions on Linux. However, as a general policy, it's better security-wise to run processes with the minimum privileges required; this is somewhat less of a concern with programs written in a memory-safe language like Rust, but note that Vaultwarden does also use some library code written in C (SQLite, OpenSSL, MySQL, PostgreSQL, etc.).
To run the container process (vaultwarden) as a non-root user (uid/gid 1000) in Docker:
docker run -u 1000:1000 [...other args...] vaultwarden/server:latest
To do similarly in docker-compose :
services:
vaultwarden:
image: vaultwarden/server:latest
container_name: bitwarden
user: 1000:1000
... other configuration ...
If you're running vaultwarden with podman as a rootless user, the uid/gid of your user on the host (e.g. 1000:1000) will be mapped to root in the container (0:0) by default. You may restrict privileges further with the --userns keep-id option, which will instead map the container user to the same uid/gid as the host (e.g. 1000:1000).
podman run --userns keep-id [other args] vaultwarden/server:latest
The default user in many Linux distros has uid/gid 1000 (run the id command to verify), so this is a good value to use if you prefer to be able to easily access your Vaultwarden data without changing to another user, but you can adjust the uid/gid as needed. Note that you'll most likely need to specify a numeric uid/gid, because the Vaultwarden container doesn't share the same mapping of user/group names to uid/gid (e.g., compare the /etc/passwd and /etc/group files in the container to the ones on the Docker host).
The Vaultwarden Docker images are set up such that the vaultwarden executable binds to port 80, which works fine since it runs as root by default. However, a non-root process is normally unable to bind to a privileged port (i.e., a port below 1024). As of version 20.10.0 (see moby/moby#41030 ), Docker specially configures its containers so that non-root processes are allowed to bind to privileged ports by default. For earlier versions of Docker, or other container runtimes without this special behavior, the Vaultwarden Docker images also sets the cap_net_bind_service capability on the vaultwarden executable, which is another way to allow an executable to bind to privileged ports when running as a non-root user.
Mounting data into the container
Generally, only data that vaultwarden needs to operate properly should be mounted into the vaultwarden container (typically, this is just your data directory, and maybe a directory containing SSL/TLS certs and private keys). For example, don't mount your entire home directory, /var/run/docker.sock , etc. unless you have a specific reason and know what you're doing.
Also, if you don't expect vaultwarden to modify the data you're mounting in (e.g., certs), then mount it read-only by adding :ro to the volume specification (for example, docker run -v /home/username/bitwarden-ssl:/ssl:ro ).
Miscellaneous
Brute-force mitigation
When two-factor-authentication is not in use, it is (in theory) possible to brute-force user passwords and thus gain access to their account. One, relatively easy, way to mitigate this, is setting up fail2ban which blocks ipadresses after too many failed login attempts. However: Care should be taken when using this behind multiple reverse-proxies (such as cloudflare).
See: Fail2Ban Setup
Hiding under a subdir
Traditionally, a Bitwarden instance resides at the root of a subdomain (i.e., bitwarden.example.com , and not bitwarden.example.com/some/path ). The upstream Bitwarden server currently only supports subdomain roots, while vaultwarden adds support for alternate base directories . For some users, this is useful simply because they only have access to one subdomain and want to run multiple services under different directories. In such cases, they typically choose something obvious like mysubdomain.example.com/bitwarden . However, you can also use this to provide an extra layer of protection by putting vaultwarden under something like mysubdomain.example.com/bitwarden/<mysecretstring> , where <mysecretstring> effectively acts as a password. Some may argue that this is security through obscurity , but it's actually defense in depth -- the secrecy of the subdir is just an extra layer of security, and not intended to be the primary means of security (which is still the strength of a user's master password).
For general discussion about subpath hosting for security refer to: https://github.com/debops/debops/issues/1233
If you'd like to make Caddy drop all connections besides for vaultwarden
mysubdomain.example.com {
route {
reverse_proxy /my-custom-path/* 10.0.0.150:8083 {
header_up X-Real-IP {remote_host}
}
handle /* {
abort
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
