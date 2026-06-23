# Git hooks · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Git-hooks
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Git-hooks
- Fetched at: 2026-06-23T13:50:07Z
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
Git hooks
Jump to bottom Edit New page
Helmut K. C. Tessarek edited this page Mar 15, 2025
·
1 revision
The following commit hooks can be useful... Use at your own discretion.
pre-commit
#! /bin/bash
HAS_ISSUES=0
FIRST_FILE=1
colerr= " $( tput setaf 9 ) "
colok= " $( tput setaf 10 ) "
colreset= " $( tput sgr0 ) " for file in $( git diff --name-only --staged ) ; do
FMT_RESULT= " $( rustfmt --edition 2021 --check --quiet $file 2> /dev/null || true ) " if [ " $FMT_RESULT " != " " ] ; then if [ $FIRST_FILE -eq 0 ] ; then echo -n " , " fi echo -n " ${colerr}${file}${colreset} "
HAS_ISSUES=1
FIRST_FILE=0
fi done if [ $HAS_ISSUES -eq 0 ] ; then exit 0
fi echo " . " echo " Your code has formatting issues in the files listed above. " echo " Format your code with: ${colok} cargo fmt --all -- ${colreset} " exit 1
commit-msg
MSG_FILE= " $1 "
colreset= " $( tput sgr0 ) "
MSG= ` cat " $MSG_FILE " | grep -v -E " ^$ " | grep -v -E " ^# " | head -1 ` if [ " ` cat " $MSG_FILE " | grep -v -E " ^$ " | grep -v -E " ^# " | wc -l ` " -gt 1 ] ; then
LINE2= ` cat " $MSG_FILE " | grep -v -E " ^# " | head -2 | tail -1 ` if [ " $LINE2 " != " " ] ; then
fi fi echo $MSG | grep -qE ' ^(feat|fix|docs|style|refactor|perf|test|build|chore|revert|ci)(\(.+\))?!?: .*[^ ]$ ' if [ " $? " != " 0 " ] ; then
fi if [ $HAS_ISSUES -eq 0 ] ; then exit 0
fi echo " The commit message must follow the Conventional Commits specification: " echo " " echo " ---------------------------------------------------------------------- " echo " ${colok} type ${colreset} [(optional scope)]: description " echo " " echo " [optional body] " echo " " echo " [optional footer(s)] " echo " ---------------------------------------------------------------------- " echo " " echo " Where ${colok} type ${colreset} must be one of: " echo " " echo " ${colok} feat ${colreset} | Features | A new feature " echo " ${colok} fix ${colreset} | Bug Fixes | A bug fix " echo " ${colok} docs ${colreset} | Documentation | Documentation only changes " echo " ${colok} style ${colreset} | Styles | Changes that do not affect the meaning of the code (white-space, formatting) " echo " ${colok} refactor ${colreset} | Code Refactoring | A code change that neither fixes a bug nor adds a feature " echo " ${colok} perf ${colreset} | Performance Improvements | A code change that improves performance " echo " ${colok} test ${colreset} | Tests | Adding missing tests or correcting existing tests " echo " ${colok} build ${colreset} | Builds | Changes that affect the build system or external dependencies " echo " ${colok} ci ${colreset} | Continuous Integrations | Changes to our CI configuration files and scripts " echo " ${colok} chore ${colreset} | Chores | Other changes that don't modify src or test files " echo " ${colok} revert ${colreset} | Reverts | Reverts a previous commit " echo " " echo " Read the full specification here: https://www.conventionalcommits.org/en/v1.0.0/ " exit 1
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
