# SMTP Configuration · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/SMTP-Configuration
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/SMTP-Configuration
- Fetched at: 2026-06-23T13:50:31Z
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
SMTP Configuration
Jump to bottom Edit New page
Stefan Melmuk edited this page Nov 1, 2025
·
32 revisions
You can configure vaultwarden to send emails via a SMTP agent:
docker run -d --name vaultwarden \
-e SMTP_HOST=smtp.domain.tld \
-e SMTP_FROM=vaultwarden@domain.tld \
-e SMTP_PORT=587 \
-e SMTP_SECURITY=starttls \
-e SMTP_USERNAME=myusername \
-e SMTP_PASSWORD=MyPassw0rd \
-v /vw-data/:/data/ \
-p 80:80 \
vaultwarden/server:latest
From v1.25.0, environment variable for SMTP SSL/TLS configuration has been updated to SMTP_SECURITY (which was mislabelled, see bug #851).
When SMTP_SECURITY is set to starttls (this is the default), only TLSv1.1 and TLSv1.2 protocols will be accepted and SMTP_PORT will default to 587 . If set to off , SMTP_PORT will default to 25 and the opportunistic encryption will be tried (no encryption attempted with code prior to 3/12/2020). This can be very insecure, use this setting only if you know what you're doing. To run SMTP in implicit (forced TLS) mode, set SMTP_SECURITY to force_tls . If you can send emails without logging in, you can simply not set SMTP_USERNAME and SMTP_PASSWORD .
Note that if SMTP and invitations are enabled, invitations will be sent to new users via email. You must set the DOMAIN configuration option with the base URL of your vaultwarden instance for the invite link to be generated correctly:
...
-e DOMAIN=https://vault.example.com \
User invitation links are valid for 5 days, after which a new invitation will need to be sent.
SMTP servers
Properly configuring an SMTP server/relay isn't trivial. The mailer library that vaultwarden uses also isn't the easiest to troubleshoot. So unless you're particularly interested in setting this up yourself, it's probably easier to use an external service.
Here are a few services with a free tier that supports most use cases:
MailJet (200 emails per day)
SendinBlue (300 emails per day)
SMTP2GO (1000 emails per month)
Here some sane defaults for well known services
General
Mail servers listen on port 25 mostly only to accept mail from other mail servers, and only for mail which they are the final location.
Also a lot of internet providers block outgoing port 25 to prevent spamming.
Most mail servers where you need to login to use either port 587, or port 465.
Port 587 is called the submission port, and can most of the time only be when using a username and password. Port 587 starts off unencrypted and upgrades to a TLS encrypted connection during the communication between client and server.
Port 465 is SSL encrypted from the start and no plain text communication is done at all via this port.
Some general settings per port.
for mail servers that use port 465
SMTP_PORT =465
SMTP_SECURITY =force_tls
for mail servers that use port 587 (or sometimes 25)
SMTP_PORT =587
SMTP_SECURITY =starttls
for mail servers that do not support encryption at all.
SMTP_PORT =25
SMTP_SECURITY =off
HELO Hostname
By default the machine's hostname is used as the hostname in the HELO command. To overwrite this, you can set HELO_NAME in the configuration.
Google/Gmail
You need to generate a App Password for Vaultwarden to work with Gmail.
Follow the steps here: https://support.google.com/accounts/answer/185833?hl=en&ref_topic=7189145
In the end you well be shown a password (with spaces in between which are not there, it is just for easy type-over), use this password.
Note
If that is not possible (because of your security settings), you can see the section below about OAuth2 support for more information.
FullSSL:
# Domains: gmail.com, googlemail.com SMTP_HOST =smtp.gmail.com
SMTP_FROM =user@gmail.tld
SMTP_USERNAME =user@gmail.tld
SMTP_PASSWORD =Less-Secure-App-Passw0rd
StartTLS:
Also see: https://web.archive.org/web/20210925161633/https://webewizard.com/2019/09/17/Using-Lettre-With-Gmail/
Hotmail/Outlook/Office365
Warning
Due to Microsoft requiring OAuth2 support this will not work anymore. See the troubleshooting below for more information.
# Domains: hotmail.com, outlook.com, office365.com SMTP_HOST =smtp-mail.outlook.com
SMTP_FROM =user@hotmail.tld
SMTP_USERNAME =user@hotmail.tld
SMTP_PASSWORD =MyPassw0rd
SMTP_AUTH_MECHANISM = " Login "
Sendgrid
Replace <full-api-key> with the generated API-Key from SendGrid which starts with SG.
Also make sure the API-Key has full Mail Send rights, else you can't login with this key.
SMTP_HOST =smtp.sendgrid.net
SMTP_USERNAME =apikey
SMTP_PASSWORD =<full-api-key>
SMTP_AUTH_MECHANISM = " Login " SMTP_FROM =user@domain.tld
Full SSL:
Passwords with special characters
If you want to use some special characters within your password, it could be that you need to escape some of these characters to not confuse the environment variable parsers.
For example a \ or ' or " can be used, but sometimes they need to be escaped so that they are actually used.
It is probably best, if you use special characters, to always use single quotes around the password.
Lets take the following password as an example: ~^",a.%\,'}b&@|/c!1(#}
Here are a few characters which could break the environment variable parses like, \ , ' and " .
A single \ is normally used to escape other characters, so if you want to use a single \ , you need to type \\ .
Also, the quotes ' and " could cause some issues, so lets enclose this password within single quotes and escape the special characters.
To have the password above to work we need to type '~^",a.%\\,\'}b&@|/c!1(#}' , here you see that we escaped both the \ and the ' characters and used single quotes to surround the whole password.
So: ~^",a.%\,'}b&@|/c!1(#} becomes '~^",a.%\\,\'}b&@|/c!1(#}'
Troubleshooting
It often happens that people are having issues with connecting to their SMTP server from Vaultwarden.
Most of the time it's a wrong configuration or the ISP/Hosting blocking the ports or IP's.
Some basic steps to check if you can access the SMTP server can be done by running the following commands on the host where you are running Vaultwarden, either using Docker or as a standalone binary.
Replace smtp.google.com and 587 , 465 or 25 with the host and port matching your SMTP server.
The output of these commands should be 0 , if it returns anything else but 0 , it means there is an issue connecting to the server.
# First check if you can us this check at all by checking HTTPS access to google.com
timeout 5 bash -c ' cat < /dev/null > /dev/tcp/www.google.com/443 ' ; echo $? # Check for 587 SMTP Submission Port
timeout 5 bash -c ' cat < /dev/null > /dev/tcp/smtp.gmail.com/587 ' ; echo $? # Check for 465 SMTP SSL Port
timeout 5 bash -c ' cat < /dev/null > /dev/tcp/smtp.gmail.com/465 ' ; echo $? # Check for 25 Default SMTP Port
timeout 5 bash -c ' cat < /dev/null > /dev/tcp/smtp.gmail.com/25 ' ; echo $? # Or use a tool called nc (This tool is not always available on the host or within the container)
nc -vz smtp.gmail.com 587
To check this from within the docker container, run the following on the docker host first to login into the container.
In the example bellow i assume the container name is vaultwarden , change this to the container name you used.
After running the command bellow, run one of the commands above to check access from within the container also.
docker exec -it vaultwarden sh
OAuth2 support
If you get the following error message
No compatible authentication mechanism was found
That's most likely because Microsoft (and also Google Mail for certain use cases) have switched to OAuth2 (cf. RFC 6749 ) as the only supported authentication method, which we don't support (yet), even if the lettre crate already has a non-standard support for it (cf. #4518 ).
The recommended way to deal with it (if you don't want to or can use a different SMTP server) is to setup email-oauth2-proxy .
Using sendmail (without docker)
If you already have a working SMTP server (Postfix for ex.) running on your system and you install Vaultwarden without docker, a few extra steps are needed to allow the server to use your SMTP server through sendmail:
in Vaultwarden config file (usually /etc/vaultwarden.env ), set USE_SENDMAIL=true
in the same file, set SMTP_FROM=user@example.com (replace with your own!) variable since it's also used by sendmail
as root user (or using sudo ), add vaultwarden user to postdrop group with gpasswd -a vaultwarden postdrop
edit vaultwarden systemd service with systemctl edit vaultwarden and add this two lines in [Service] section:
RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6 AF_LOCAL AF_NETLINK
ReadWritePaths=/var/lib/vaultwarden /var/log/vaultwarden.log /var/spool/postfix/maildrop
Finally don't forget to restart the service with systemctl restart vaultwarden .
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
