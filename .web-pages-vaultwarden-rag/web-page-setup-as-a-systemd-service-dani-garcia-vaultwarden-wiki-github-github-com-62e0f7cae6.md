# Setup as a systemd service · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Setup-as-a-systemd-service
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Setup-as-a-systemd-service
- Fetched at: 2026-06-23T13:50:33Z
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
Setup as a systemd service
Jump to bottom Edit New page
Rahil Bhimjiani edited this page Feb 22, 2024
·
14 revisions
These instructions require you to have compiled the vaultwarden binary . If you generated a docker image, you may want to look at Running with systemd-docker
Setup
Making vaultwarden start on system startup and use the other facilities of systemd (e.g. isolation, logging,...) requires a .service file. The following is a usable starting point:
[Unit] Description =Bitwarden Server (Rust Edition)
Documentation =https://github.com/dani-garcia/vaultwarden
# If you use a database like mariadb,mysql or postgresql, # you have to add them like the following and uncomment them # by removing the `# ` before it. This makes sure that your # database server is started before vaultwarden ("After") and has # started successfully before starting vaultwarden ("Requires"). # Only sqlite After =network.target
# MariaDB # After=network.target mariadb.service # Requires=mariadb.service # Mysql # After=network.target mysqld.service # Requires=mysqld.service # PostgreSQL # After=network.target postgresql.service # Requires=postgresql.service [Service] # The user/group vaultwarden is run under. the working directory (see below) should allow write and read access to this user/group User =vaultwarden
Group =vaultwarden
# Use an environment file for configuration. EnvironmentFile =/etc/vaultwarden.env
# The location of the compiled binary ExecStart =/usr/bin/vaultwarden
# Set reasonable connection and process limits LimitNOFILE =1048576
LimitNPROC =64
# Isolate vaultwarden from the rest of the system PrivateTmp =true
PrivateDevices =true
ProtectHome =true
ProtectSystem =strict
# Only allow writes to the following directory and set it to the working directory (user and password data are stored here) WorkingDirectory =/var/lib/vaultwarden
ReadWritePaths =/var/lib/vaultwarden
[Install] WantedBy =multi-user.target
Change all paths to match your installation ( WorkingDirectory and ReadWritePaths should be the same),
name this file vaultwarden.service and put it into /etc/systemd/system .
If you have to change an existing systemd file (which was provided to you by the package you installed), you can add your changes by using
$ sudo systemctl edit vaultwarden.service
To make systemd aware of your new file or any changes you made, run
$ sudo systemctl daemon-reload
Usage
To start this "service", run
$ sudo systemctl start vaultwarden.service
To enable autostart, run
$ sudo systemctl enable vaultwarden.service
In the same way you can stop , restart and disable the service.
Updating vaultwarden
After compiling the new version of vaultwarden, you can copy the compiled (new) binary and replace the existing (old) binary and then restart the service:
$ sudo systemctl restart vaultwarden.service
Uninstalling vaultwarden
Before doing anything else, you should stop and disable the service:
$ sudo systemctl disable --now vaultwarden.service
Then you can delete the binary, the environment file, the web-vault folder (if installed) and the user data (if necessary). Remember to also remove specially created users,groups and firewall rules (if needed) and the systemd file.
After removing the systemd file you should make systemd aware of it via:
Logging and status view
If you want to see the logging output, run
$ journalctl -u vaultwarden.service
or to see a more concise state of the service, run
$ systemctl status vaultwarden.service
Troubleshooting
Sandboxing options with older systemd versions
In RHEL 7 (and debian 8), the used systemd does not support some of the used isolation options. ( #445 , #363 )
This can result in one of the following errors:
Failed at step NAMESPACE spawning /home/vaultwarden/vaultwarden: Permission denied
or
Failed to parse protect system value
To work around this you can comment out some or all of these settings by putting a # in front of the lines containing
PrivateTmp , PrivateDevices , ProtectHome , ProtectSystem and ReadWritePaths . While commenting out all of them will probably work, it's not recommended as these are security measures which are good to have. To see which options your systemd supports, look at the output of
$ systemctl --version
to determine your systemd version and compare with systemd/NEWS.md .
After editing your .service file, don't forget to
before (re-)starting your service.
Service fails to start
The following error shows in the systemd journal ( journalctl -eu vaultwarden.service ):
Feb 18 05:29:10 staging-bitwarden systemd[1]: Started Bitwarden Server (Rust Edition).
Feb 18 05:29:10 staging-bitwarden systemd[49506]: vaultwarden.service: Failed to execute command: Resource temporarily unavailable
Feb 18 05:29:10 staging-bitwarden systemd[49506]: vaultwarden.service: Failed at step EXEC spawning /usr/bin/vaultwarden: Resource temporarily unavailable
Feb 18 05:29:10 staging-bitwarden systemd[1]: vaultwarden.service: Main process exited, code=exited, status=203/EXEC
Feb 18 05:29:10 staging-bitwarden systemd[1]: vaultwarden.service: Failed with result 'exit-code'.
This is known to occur when vaultwarden is running inside a container (LXC, et al) or natively. The parameter LimitNPROC=64 in the service file prevents the service from starting. Commenting out that particular parameter results in the service starting correctly.
Note : A systemd override file will not work, the line must be commented out/removed. The easiest way to do this is via
# systemctl edit --full vaultwarden.service
then reloading the daemon & restarting.
Environment variables are not loaded
Please note that systemd does not support comments in the same line as a variable in the EnvironmentFile=/etc/vaultwarden.env file (see #1607 ). In this environment file example the variable WEBSOCKET_ENABLED will not be loaded.
ROCKET_PORT=8080
WEBSOCKET_ENABLED=true # enable websocket
If you want same-line comments consider using /var/lib/vaultwarden/.env instead (which will also get rid of the .env file missing INFO on startup).
More information
For more information on .service files, see the manpages of systemd.service and (for the security configuration) systemd.exec
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
