# Vaultwarden

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden
- Final URL: https://github.com/dani-garcia/vaultwarden
- Fetched at: 2026-06-23T13:49:09Z
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
main
Branches Tags
Go to file
Code
Open more actions menu
Folders and files
Name Name
Last commit message
Last commit date
Latest commit
History
3,041 Commits
.github
docker
macros
migrations
playwright
resources
src
tools
.dockerignore
.editorconfig
.env.template
.gitattributes
.gitignore
.hadolint.yaml
.pre-commit-config.yaml
.typos.toml
Cargo.lock
Cargo.toml
Dockerfile
LICENSE.txt
README.md
SECURITY.md
build.rs
diesel.toml
rust-toolchain.toml
rustfmt.toml
View all files
Repository files navigation
An alternative server implementation of the Bitwarden Client API, written in Rust and compatible with official Bitwarden clients [ disclaimer ], perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.
Important
When using this server, please report any bugs or suggestions directly to us (see Get in touch ), regardless of whatever clients you are using (mobile, desktop, browser...). DO NOT use the official Bitwarden support channels.
Features
A nearly complete implementation of the Bitwarden Client API is provided, including:
Personal Vault
Send
Attachments
Website icons
Personal API Key
Organizations
Collections ,
Password Sharing ,
Member Roles ,
Groups ,
Event Logs ,
Admin Password Reset ,
Directory Connector ,
Policies
Multi/Two Factor Authentication
Authenticator ,
Email ,
FIDO2 WebAuthn ,
YubiKey ,
Duo
Emergency Access
Vaultwarden Admin Backend
Modified Web Vault client (Bundled within our containers)
Usage
The web-vault requires the use of HTTPS and a secure context for the Web Crypto API .
That means it will only work if you enable HTTPS .
We also suggest to use a reverse proxy .
The recommended way to install and use Vaultwarden is via our container images which are published to ghcr.io , docker.io and quay.io .
See which container image to use for an explanation of the provided tags.
There are also community driven packages which can be used, but those might be lagging behind the latest version or might deviate in the way Vaultwarden is configured, as described in our Wiki .
Alternatively, you can also build Vaultwarden yourself.
While Vaultwarden is based upon the Rocket web framework which has built-in support for TLS our recommendation would be that you setup a reverse proxy (see proxy examples ).
Tip
For more detailed examples on how to install, use and configure Vaultwarden you can check our Wiki .
Docker/Podman CLI
Pull the container image and mount a volume from the host for persistent storage.
You can replace docker with podman if you prefer to use podman.
docker pull vaultwarden/server:latest
docker run --detach --name vaultwarden \
--env DOMAIN= " https://vw.domain.tld " \
--volume /vw-data/:/data/ \
--restart unless-stopped \
--publish 127.0.0.1:8000:80 \
vaultwarden/server:latest
This will preserve any persistent data under /vw-data/ , you can adapt the path to whatever suits you.
Docker Compose
To use Docker compose you need to create a compose.yaml which will hold the configuration to run the Vaultwarden container.
services :
vaultwarden :
image : vaultwarden/server:latest container_name : vaultwarden restart : unless-stopped environment :
DOMAIN : " https://vw.domain.tld " volumes :
- ./vw-data/:/data/ ports :
- 127.0.0.1:8000:80
Get in touch
Have a question, suggestion or need help? Join our community on Matrix , GitHub Discussions or Discourse Forums .
Encountered a bug or crash? Please search our issue tracker and discussions to see if it's already been reported. If not, please start a new discussion or create a new issue . Ensure you're using the latest version of Vaultwarden and there aren't any similar issues open or closed!
Contributors
Thanks for your contribution to the project!
Disclaimer
This project is not associated with Bitwarden or Bitwarden, Inc.
However, one of the active maintainers for Vaultwarden is employed by Bitwarden and is allowed to contribute to the project on their own time. These contributions are independent of Bitwarden and are reviewed by other maintainers.
The maintainers work together to set the direction for the project, focusing on serving the self-hosting community, including individuals, families, and small organizations, while ensuring the project's sustainability.
Please note: We cannot be held liable for any data loss that may occur while using Vaultwarden. This includes passwords, attachments, and other information handled by the application. We highly recommend performing regular backups of your files and database. However, should you experience data loss, we encourage you to contact us immediately.
Bitwarden_RS
This project was known as Bitwarden_RS and has been renamed to separate itself from the official Bitwarden server in the hopes of avoiding confusion and trademark/branding issues.
Please see #1642 - v1.21.0 release and project rename to Vaultwarden for more explanation.
About
Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs
Topics
rust
rocket
bitwarden
bitwarden-rs
vaultwarden
Resources
Readme
License
AGPL-3.0 license
Security policy
Activity
Stars
stars
Watchers
291
watching
Forks
forks
Report repository
Releases
83
1.36.0
Latest
May 3, 2026
+ 82 releases
Sponsor this project
liberapay.com/ dani-garcia
https://paypal.me/DaniGG
Learn more about GitHub Sponsors
Packages
0
Used by 494
+ 486
Languages
Rust 83.9%
Handlebars 9.9%
TypeScript 4.0%
Shell 0.7%
Jinja 0.6%
HCL 0.5%
Other 0.4%
You can’t perform that action at this time.
