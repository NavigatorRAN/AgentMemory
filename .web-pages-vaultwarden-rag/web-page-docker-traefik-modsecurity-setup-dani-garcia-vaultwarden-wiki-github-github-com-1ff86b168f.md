# Docker Traefik ModSecurity Setup · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Docker---Traefik---ModSecurity-Setup
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Docker---Traefik---ModSecurity-Setup
- Fetched at: 2026-06-23T13:49:47Z
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
Docker Traefik ModSecurity Setup
Jump to bottom Edit New page
Daniil Digtyar Vasilieva edited this page Oct 2, 2025
·
9 revisions
Setting up ModSecurity will proxy all requests to Vaultwarden through a Web Application Firewall (WAF). This might help mitigate unknown vulnerabilities in Vaultwarden by filtering suspicious requests (like injection attempts).
Pre-Reqs
Setup with Docker + Traefik 2.0 as reverse proxy
Fail2Ban properly set up ( see this tutorial )
This is only tested on Debian (but should work on similar systems like Ubuntu or Raspbian)
Installation
bash
touch /opt/docker/waf-rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf && touch /opt/docker/waf-rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf
/opt/docker/docker-compose.yml
services :
traefik :
image : traefik:latest container_name : traefik command :
- --providers.docker=true
- --providers.docker.exposedByDefault=false
- --entrypoints.web.address=:80
- --entrypoints.websecure.address=:443
- --certificatesresolvers.myresolver.acme.tlschallenge=true
- --certificatesresolvers.myresolver.acme.email=you@domain.tld
- --certificatesresolvers.myresolver.acme.storage=acme.json
- --certificatesresolvers.myresolver.acme.storage=/letsencrypt/acme.json restart : unless-stopped ports :
- 80:80
- 443:443 volumes :
- /var/run/docker.sock:/var/run/docker.sock:ro
- /opt/docker/le:/letsencrypt waf :
image : owasp/modsecurity-crs:apache container_name : waf environment :
PARANOIA : 1 ANOMALY_INBOUND : 10 ANOMALY_OUTBOUND : 5 PROXY : 1 REMOTEIP_INT_PROXY : " 172.20.0.1/16 " BACKEND : " http://vaultwarden:80 " BACKEND_WS : " ws://vaultwarden:80/notifications/hub " ERRORLOG : " /var/log/waf/waf.log " PROXY_ERROR_OVERRIDE : " off " volumes :
- /opt/docker/waf:/var/log/waf
- /opt/docker/waf-rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf:/etc/modsecurity.d/owasp-crs/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
- /opt/docker/waf-rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf:/etc/modsecurity.d/owasp-crs/rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf labels :
- traefik.enable=true
- traefik.http.middlewares.redirect-https.redirectScheme.scheme=https
- traefik.http.middlewares.redirect-https.redirectScheme.permanent=true
- traefik.http.routers.vw-ui-https.rule=Host(`sub.domain.tld`)
- traefik.http.routers.vw-ui-https.entrypoints=websecure
- traefik.http.routers.vw-ui-https.tls=true
- traefik.http.routers.vw-ui-https.service=vw-ui
- traefik.http.routers.vw-ui-http.rule=Host(`sub.domain.tld`)
- traefik.http.routers.vw-ui-http.entrypoints=web
- traefik.http.routers.vw-ui-http.middlewares=redirect-https
- traefik.http.routers.vw-ui-http.service=vw-ui
- traefik.http.services.vw-ui.loadbalancer.server.port=80
- traefik.http.routers.vw-websocket-https.rule=Host(`sub.domain.tld`) && Path(`/notifications/hub`)
- traefik.http.routers.vw-websocket-https.entrypoints=websecure
- traefik.http.routers.vw-websocket-https.tls=true
- traefik.http.routers.vw-websocket-https.service=vw-websocket
- traefik.http.routers.vw-websocket-http.rule=Host(`sub.domain.tld`) && Path(`/notifications/hub`)
- traefik.http.routers.vw-websocket-http.entrypoints=web
- traefik.http.routers.vw-websocket-http.middlewares=redirect-https
- traefik.http.routers.vw-websocket-http.service=vw-websocket
- traefik.http.services.vw-websocket.loadbalancer.server.port=3012 vaultwarden :
image : vaultwarden/server:latest container_name : vaultwarden restart : unless-stopped environment :
ENABLE_WEBSOCKET : " true " SENDS_ALLOWED : " true " PASSWORD_ITERATIONS : 500000 SIGNUPS_ALLOWED : " true " SIGNUPS_VERIFY : " true " SIGNUPS_DOMAINS_WHITELIST : " yourdomain.tld " ADMIN_TOKEN : " some random string " # generate with openssl rand DOMAIN : " domain host name " SMTP_HOST : " smtp server " SMTP_FROM : " sender email e.g: you@domain.tld " SMTP_FROM_NAME : " sender name " SMTP_SECURITY : " starttls " SMTP_PORT : 587 SMTP_USERNAME : " smtp username " SMTP_PASSWORD : " smtp password " SMTP_TIMEOUT : 15 LOG_FILE : " /data/vaultwarden.log " LOG_LEVEL : " warn " EXTENDED_LOGGING : " true " TZ : " your time zone " volumes :
- /opt/docker/vaultwarden:/data networks :
default :
driver : bridge ipam :
driver : default config :
- subnet : 172.20.0.1/16
/etc/fail2ban/filter.d/waf.conf
[INCLUDES] before = common.conf [Definition] failregex = ^.*\[client <ADDR>\] ModSecurity : Access denied with code 403 .*$ ignoreregex =
/etc/fail2ban/jail.d/waf.conf
[waf] enabled = true port = 80,443 filter = waf action = iptables-allports[name=waf, chain=FORWARD] logpath = /opt/docker/waf/waf.log maxretry = 1 bantime = 14400 findtime = 14400
Note
Integrating Fail2Ban with ModSecurity will slow / deter further exploitation / exploration by adversaries. This is setup to ban on the first ModSecurity intervention.
In order to increase the aggressivity of ModSecurity increase PARANOIA ( read more here ) and or decrease ANOMALY_INBOUND ( read more ).
Prepare yourself to tune ModSecurity HEAVILY with PARANOIA >2 in order to get the UI barely working without disabling many rules.
The following files will enable you to tune ModSecurity ( tutorial )
/opt/docker/waf-rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
/opt/docker/waf-rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf
☁️ Food for thought ☁️
If your data is so sensitive that you are considering PARANOIA > 1, then consider hosting Vaultwarden not on a public endpoint and limit access to the host itself via a firewall and grant user access only via a VPN connection. Keep in mind that this does not mitigate insider threats which are often underestimated, so keep that in mind!
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
