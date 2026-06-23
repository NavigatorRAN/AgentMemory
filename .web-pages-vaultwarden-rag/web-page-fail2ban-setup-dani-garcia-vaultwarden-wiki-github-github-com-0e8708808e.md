# Fail2Ban Setup · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Fail2Ban-Setup
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Fail2Ban-Setup
- Fetched at: 2026-06-23T13:50:03Z
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
Fail2Ban Setup
Jump to bottom Edit New page
tsanga13 edited this page Aug 4, 2025
·
57 revisions
Setting up Fail2ban will prevent attackers to brute force your vault logins. This is particularly important if your instance is publicly available.
Table of Contents
Pre-requisite
Installation
Debian / Ubuntu / Raspberry Pi OS
Fedora / Centos
Synology DSM
Setup for web vault
Filter
Jail
Setup for admin page
Setup for TOTP codes
Testing Fail2Ban
SELinux Problems
Filenames are at the top of each code block.
From Release 1.5.0, Vaultwarden supports logging to file. Please set this up : Logging
Try to log to web vault with a false account and check the log files for following format
[YYYY-MM-DD hh:mm:ss][vaultwarden::api::identity][ERROR] Username or password is incorrect. Try again. IP: XXX.XXX.XXX.XXX. Username: email@domain.com.
sudo apt-get install fail2ban -y
EPEL repository is necessary (CentOS 7)
sudo yum install epel-release
sudo yum install fail2ban -y
With Synology, a bit more work is needed for various reasons. The full solution is pushed with Docker Compose there . The main issues are:
The embedded IP ban system does not work for Docker's containers
The iptables embedded do no support the REJECT blocktype
The Docker GUI does not allow some advanced settings
Modifying system configuration is not upgrade-proof
Therefore, we will use Fail2ban in a Docker container. Crazy-max/docker-fail2ban provides a good solution and the Synology's Docker GUI will be ignored. From command line through SSH, here the steps. As a convention volumeX is to be adapted to your Synology's config.
Get root
sudo -i
Creating persistent folders
mkdir -p /volumeX/docker/fail2ban/action.d/
mkdir -p /volumeX/docker/fail2ban/jail.d/
mkdir -p /volumeX/docker/fail2ban/filter.d/
Replace REJECT by DROP blocktype
# /volumeX/docker/fail2ban/action.d/iptables.local [Init] blocktype = DROP
[Init?family=inet6] blocktype = DROP
Create docker-compose file
# /volumeX/docker/fail2ban/docker-compose.yml version : ' 3 ' services :
fail2ban :
container_name : fail2ban restart : always image : crazymax/fail2ban:latest environment :
- TZ=Europe/Paris
- F2B_DB_PURGE_AGE=30d
- F2B_LOG_TARGET=/data/fail2ban.log
- F2B_LOG_LEVEL=INFO
- F2B_IPTABLES_CHAIN=INPUT volumes :
- /volumeX/docker/fail2ban:/data
- /volumeX/docker/vw-data:/vaultwarden:ro network_mode : " host " privileged : true cap_add :
- NET_ADMIN
- NET_RAW
Start the container using command line
cd /volumeX/docker/fail2ban
docker-compose up -d
You should see the container running in Synology's Docker GUI. You will have to reload after configuring the filters and jails
As a convention, path_f2b means the path needed for Fail2ban to work. This depends on your system. E.g. on Synology, we are talking about /volumeX/docker/fail2ban/ where on some other systems we are talking about /etc/fail2ban/
Create and fill the following file
# path_f2b/filter.d/vaultwarden.local [INCLUDES] before = common.conf
[Definition] failregex = ^.*?Username or password is incorrect\. Try again\. IP: <ADDR>\. Username:.*$
ignoreregex =
Tip: If you get the following error message in fail2ban.log (CentOS 7, Fail2Ban v0.9.7)
fail2ban.filter [5291]: ERROR No 'host' group in '^.*Username or password is incorrect\. Try again\. IP: <ADDR>\. Username:.*$'
Please Use <HOST> instead of <ADDR> in vaultwarden.local
Tip: Cloudflare users, make sure you set your Client IP header to CF-Connecting-IP in admin panel -> advanced settings -> Client IP header, else the clients real IP will not be logged/banned. Not necessary if you're using a proxy that's set up to configure which headers to use to determine the client's IP address; otherwise logging the Docker network address when CF-Connecting-IP doesn't exist.
Tip: If you see 127.0.0.1 as the IP address of failed logins in vaultwarden.log, then you're probably using a reverse proxy and fail2ban won't work correctly:
[YYYY-MM-DD hh:mm:ss][vaultwarden::api::identity][ERROR] Username or password is incorrect. Try again. IP: 127.0.0.1. Username: email@example.com.
To remedy this, forward the true remote address to vaultwarden via the X-Real-IP header. How to do this varies depending on the proxy you use. For example, in Caddy 2.x, when you define the reverse-proxy, define header_up X-Real-IP {remote_host} . See Proxy examples for more info.
# path_f2b/jail.d/vaultwarden.local [vaultwarden] enabled = true
port = 80,443,8081
filter = vaultwarden
banaction = %(banaction_allports)s
logpath = /path/to/vaultwarden.log
maxretry = 3
bantime = 14400
findtime = 14400
Note for Docker Users
Docker uses the FORWARD chain instead of the default INPUT chain. If the machine receiving requests is mapping them straight to a Docker container, then chain will need to be set appropriately regardless of what is in the container (reverse proxy, Vaultwarden, etc). The default action is set to action_ (which uses banaction , which we alias to banaction_allports ). action_ already takes the chain into account. Thus, simply set the chain . See this similar issue .
chain = FORWARD
Note for Synology DSM Docker Users
Please set the chain to DOCKER-USER
chain = DOCKER-USER
Note for Docker Users with Fail2Ban v1.1.1.dev1 (and possibly newer)
With Fail2Ban v1.1.1.dev1 the default banactions for Debian changed from iptables to nftables (see here ). Docker (at least version 25.0.3) on the other hand still uses iptables. Hence, the requests to the Docker containers are not blocked with banaction = %(banaction_allports)s . In this scenario, use
banaction = iptables
Tip : If you are using systemd to manage vaultwarden, you can use systemd-journal for fail2ban:
backend = systemd
filter = vaultwarden[ journalmatch = ' _SYSTEMD_UNIT=your_vaultwarden.service ' ]
Use these instead of logpath = and filter = variables.
NOTE FOR BACKEND
If you installed fail2ban using such as sudo apt install , the /etc/fail2ban/jail.conf may using systemd as default backend. This default configuration item will result in the inability to monitor the log of logpath.
Add backend = pyinotify or backend = inotify to the vaultwarden.local config
backend = pyinotify
Restart fail2ban for changes to take effect:
sudo systemctl restart fail2ban
NOTE FOR CLOUDFLARE USERS
If you use cloudflare proxy, you'll need to add Cloudflare in your actions list, like in this guide
Reload fail2ban for changes to take effect:
sudo systemctl reload fail2ban
Feel free to change the options as you see fit.
If you've enabled the admin console by setting the ADMIN_TOKEN environment variable, you can prevent an attacker from brute-forcing the admin token using Fail2Ban. The process is the same as for the web vault.
# path_f2b/filter.d/vaultwarden-admin.local [INCLUDES] before = common.conf
[Definition] failregex = ^.*Invalid admin token\. IP: <ADDR>.*$
Tip: If you get the following error message in fail2ban.log ERROR NOK: ("No 'host' group in '^.*Invalid admin token\\. IP: <ADDR>.*$'")
Please Use <HOST> instead of <ADDR> in vaultwarden-admin.local
# path_f2b/jail.d/vaultwarden-admin.local [vaultwarden-admin] enabled = true
port = 80,443
filter = vaultwarden-admin
Note: Docker uses the FORWARD chain instead of the default INPUT chain. Therefore replace the banaction line with the following action when using Docker:
action = iptables-allports[ name =vaultwarden-admin, chain =FORWARD]
Tip : If you are using systemd to manage vaultwarden, you can use systemd-journal for fail2ban here as well:
filter = vaultwarden-admin[journalmatch='_SYSTEMD_UNIT=your_vaultwarden.service']
If you installed fail2ban using such as sudo apt install , the /etc/fai2ban/jail.conf may using systemd as default backend. This default configuration item will result in the inability to monitor the log of logpath.
Setup for TOTP
# path_f2b/filter.d/vaultwarden-totp.local # Fail2Ban filter for Vaultwarden TOTP [INCLUDES] before = common.conf
[Definition] failregex = ^.*\[ERROR\] Invalid TOTP code! Server time: (.*) UTC IP: <ADDR>$
Example log:
[YYYY-MM-DD hh:mm:ss][vaultwarden::api::core::two_factor::authenticator][ERROR] Invalid TOTP code! Server time: YYYY-MM-DD hh:mm:ss UTC IP: 1.2.3.4
# path_f2b/jail.d/vaultwarden-totp.local [vaultwarden-totp] enabled = true
filter = vaultwarden-totp
banaction = iptables-multiport[ name =vaultwarden-totp, port = " 80,443 " , protocol =tcp]
Now just try to login to vaultwarden using any email (it doesn't have to be a valid email, just an email format)
If it works correctly and your IP is banned, you can unban the IP by running:
# With Docker
sudo docker exec -t fail2ban fail2ban-client set vaultwarden unbanip XX.XX.XX.XX
# Without Docker
sudo fail2ban-client set vaultwarden unbanip XX.XX.XX.XX
If Fail2Ban does not appear to be functioning, verify that the path to the Vaultwarden log file is correct. For Docker: If the specified log file is not being generated and/or updated, make sure the EXTENDED_LOGGING env variable is set to true (which is default) and that the path to the log file is the path inside the Docker (when you use /bw-data/:/data/ the log file should be in /data/... to be outside the container).
Also verify that the timezone of the Docker container matches the timezone of the host. Check this by comparing the time shown in the logfile with the host OS time. If they differ, there are various ways to fix this. One option is to start Docker with the option -e "TZ=<timezone>" . A list of valid timezones is here (eg. -e "TZ=Australia/Melbourne" )
If you are using podman instead of Docker it seems that setting the timezone via -e "TZ=<timezone>" does not work. This can be solved (when using the alpine image) by following this guide: https://wiki.alpinelinux.org/wiki/Setting_the_timezone .
When you are using SELinux it is possible that SELinux hinders fail2ban to read the logs. If so, follow these steps:
sudo tail /var/log/audit/audit.log . There you should see something along the lines of this (of course the actual audit ID will vary in your case):
type=AVC msg=audit(1571777936.719:2193): avc: denied { search } for pid=5853 comm="fail2ban-server" name="containers" dev="dm-0" ino=1144588 scontext=system_u:system_r:fail2ban_t:s0 tcontext=unconfined_u:object_r:container_var_lib_t:s0 tclass=dir permissive=0
To actually find out the reason you can use grep 'type=AVC msg=audit(1571777936.719:2193)' /var/log/audit/audit.log | audit2why . audit2allow -a will give you specific instructions on how to create a module and allow fail2ban to access these logs. Follow these steps and you're done! fail2ban should now work correctly.
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
