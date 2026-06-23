# Configuration overview · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Configuration-overview
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Configuration-overview
- Fetched at: 2026-06-23T13:49:35Z
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
Configuration overview
Jump to bottom Edit New page
wcjxixi edited this page Mar 27, 2025
·
17 revisions
How to configure Vaultwarden
There are basically three different ways to configure Vaultwarden:
setting up environment variables,
using an ENV_FILE and
via a config.json , not recommended (which can be generated and managed via the admin page ).
You can find a documented list of most configuration options in the .env.template file. Typically the commented values will indicate the default values but that is not a guarantee. In case it's not, the source of truth will be src/config.rs .
If you enable the admin page , you can also see the configuration options with the configured values (and if you are using config.json an indication whether the value has been changed from the initial value).
Note
Be aware that the config.json file is NOT the recommended way to configure your settings!
Either use environment variables which you can configure in several ways for your container environment (Docker, Docker-Compose, K8s etc..)
Or, when using a standalone binary (not distributed by Vaultwarden itself) use a .env file located in your current working directory.
If you rely on a third-party package you will have to check the provided documentation (e.g. installation notice of Arch Linux' vaultwarden package), as the downstream maintainers usually make some assumptions for their package.
Using environment variables
The recommended way to configure Vaultwarden is via environment variables. Depending on how you run Vaultwarden (e.g. directly, in a containerized environment, via systemd, etc.), there are different ways to set the environment variables, so familiarize yourself with your platform and method of installation.
Most environment variables that can be set are found in the .env.template file. You can also use that file as a basis for an environment file for your container environment (e.g. via an env_file attribute) or with a systemd service (c.f. EnvironmentFile= ) – just don't confuse this file with the ENV_FILE method below!
Tip
Be aware that there might be some subtle differences between the different platforms for how an environment file is interpreted (in regards to variable expansion or whether you can or should use quotation marks around the values, etc).
You also need to make sure that you set the variable in the correct environment . If you use a containerized environment the vaultwarden process will be running isolated from the host platform. This is especially relevant if you use a container management platform that you can set environment variables for (e.g. when using docker-compose ). Because typically those environment variables can then be used in the creation of a container but they will not be passed down into the running container.
A container configured like this with environment variables needs to be recreated if you change a value because the values are bound to the container. So unless the value is read from a (changed) file a restart will not do anything.
Using an ENV_FILE
Vaultwarden can also directly read the configuration options from an environment file itself, which is especially useful when developing Vaultwarden.
By default Vaultwarden will try to read a file called .env from the current working directory (e.g. if you run cargo run from the root of the checked-out repository it should be in the same root directory).
There is a difference between using an environment file to setup the runtime environment of the process (whether with something like docker or systemd) and using an env file in Vaultwarden. E.g. instead of passing an environment file via --env-file (which is read when the container is created) you could also mount the environment file to /.env when using a container image . (C.f. the explanation above.)
The values that are set directly in the environment will take precedence over this method. That means the values can be overridden without changing the values in the ENV_FILE (which might be useful for debugging purposes, e.g. when you temporarily set LOG_LEVEL=debug ).
Loading individual values from files
Vaultwarden supports loading the values of the configuration options (both by environment variables or if set in the ENV_FILE ) from the disk. You can achieve this by adding _FILE to the configuration option in question and setting the value to the path to a file containing the value.
This is useful if you want to use a feature like docker secrets , e.g. by setting SMTP_PASSWORD_FILE=/run/secrets/smtp_password it would load SMTP password from the file without making it available to the process or the container as an environment variable).
Using the /admin page
To an extend, Vaultwarden can also be configured using a config.json file, which can be generated and edited over the /admin panel and is saved in the data folder.
Important
🙏 While it's technically possible to create and edit the config.json file manually, we strongly advise against it . JSON has a rather strict syntax and if you don't know what you are doing, this might become a nightmare to debug.
The settings in config.json will override any other configuration method and you will be warned on startup which settings have been overwritten by config.json .
Since this generated config.json will include all editable options when saved, be aware that once you generate the configuration file via the /admin page, you cannot modify those options via any of the other methods (at least not without modifying or removing the config.json file).
The options in the section Read-Only Config cannot be modified via the /admin page because they require a server restart and they will be removed if you have added them manually to the config.json and click on save. Use the other methods described above to modify them. In most cases this means that you also need to recreate the container!
Some environment variables are not part of Vaultwardens configuration system and therefore cannot be set via config.json (e.g. ROCKET_ADDRESS or ROCKET_PORT ).
Configuration precedence
On compilation the defaults are hard coded via src/config.rs .
Those defaults can be changed without recompiling the binary by providing an ENV_FILE and also
by setting the environment variables (which will overrule settings in the ENV_FILE ).
The end user (with access to /admin panel) optionally can create a config.json which will take the highest precedence.
Setting the domain URL
Make sure to set the DOMAIN environment variable (or domain in the config file) to the base URL of your Vaultwarden instance. If you don't, it is likely that some functionality might break mysteriously. Some examples:
https://bitwarden.example.com
https://bitwarden.example.com:8443 (non-default port)
https://host.example.com/bitwarden/ ( subdir hosting -- avoid URL-rewriting tricks whenever possible)
Further information about different configuration options
Invitation and Signup settings
Disable invitations
Disable registration of new users
Administration backend
Enabling admin page
Disable the admin token
Translating admin page
SMTP configuration
Notification
Enabling WebSocket notifications
Enabling Mobile Client push notification
2FA Settings
Enabling U2F and FIDO2 WebAuthn authentication
Enabling YubiKey OTP authentication
Logging
Other configuration
Changing persistent data location
Changing the API request size limit
Changing the number of workers
Translating the email templates
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
Enabling SSO support using OpenId Connect
Allow icon fetching from internal services
Database
Using the MariaDB (MySQL) Backend
Using the PostgreSQL Backend
Running without WAL enabled
Migrating from MariaDB (MySQL) to SQLite
Security
Hardening Guide
Password hint display
Fail2Ban Setup
Fail2Ban + ModSecurity + Traefik + Docker
Performance
Customization
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
Other Information
Importing data from Keepass or KeepassX
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
