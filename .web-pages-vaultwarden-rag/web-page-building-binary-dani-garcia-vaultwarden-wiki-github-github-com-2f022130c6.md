# Building binary · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Building-binary
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Building-binary
- Fetched at: 2026-06-23T13:49:13Z
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
Building binary
Jump to bottom Edit New page
Stefan Melmuk edited this page Jul 7, 2025
·
37 revisions
Note
The ( MSRV ) Minimum Support Rust Version policy is N-2 , which means that if the current Rust version is v1.67 , we support building with v1.65 , and when v1.69 is stable, then the MSRV would be v1.67 .
That means that new Rust features which come to stable can not be used once a new stable has been released, but have to wait for two more releases.
To be sure you are using the stable version we strongly suggest to use rustup which makes installing and updating Rust very easy.
Any version below the MSRV will generate a warning, and you are on your own when forcing to build with an older version.
This page is primarily for those interested in vaultwarden development, or who have a specific reason for wanting to build their own binary.
Typical users should either deploy via Docker , extract the pre-built binaries from the Alpine-based Docker images, or look for a third-party package .
Dependencies
Rust stable (strongly recommended to use rustup )
⚠️ The (MSRV) minimum support Rust version is N-2 , which means that if the current Rust version is v1.67 , we support building with v1.65 .
On a Debian based distro some general packages to make sure building should go fine install the following: build-essential , git
OpenSSL (should be available in path, see openssl crate docs )
On a Debian based distro, you need to install pkg-config and libssl-dev
For the SQlite3 backend on a Debian based distro you need to install libsqlite3-dev
For the MySQL backend on a Debian based distro you need to install libmariadb-dev-compat and libmariadb-dev
For the PostgreSQL on a Debian based distro you need to install libpq-dev and pkg-config
NodeJS (only when compiling the web-vault, install through your system's package manager, use the prebuilt binaries ) or nodesource binary distribution Note: Building the web-vault currently requires NodeJS v16 and NPM v8.11
Run/Compile
All backends
# Compile with all backends and run
cargo run --features sqlite,mysql,postgresql --release
# or just compile with all backends (binary located in target/release/vaultwarden)
cargo build --features sqlite,mysql,postgresql --release
SQlite backend
# Compile with sqlite backend and run
cargo run --features sqlite --release
# or just compile with sqlite (binary located in target/release/vaultwarden)
cargo build --features sqlite --release
MySQL backend
# Compile with mysql backend and run
cargo run --features mysql --release
# or just compile with mysql (binary located in target/release/vaultwarden)
cargo build --features mysql --release
PostgreSQL backend
# Compile with postgresql backend and run
cargo run --features postgresql --release
# or just compile with postgresql (binary located in target/release/vaultwarden)
cargo build --features postgresql --release
When run, the server is accessible in http://localhost:8000 .
Install the web-vault
A compiled version of the web vault can be downloaded from dani-garcia/bw_web_builds .
Note: building the Vault needs ~1.5GB of RAM. On systems like a RaspberryPI with 1GB or less, please enable swapping or build it on a more powerful machine and copy the directory from there. This much memory is only needed for building it, running vaultwarden with vault needs only about 10MB of RAM.
If you prefer to compile it manually, follow these steps:
New (easy way):
Clone the git repository at dani-garcia/bw_web_builds :
# clone the repository
git clone https://github.com/dani-garcia/bw_web_builds.git bw_web_builds
cd bw_web_builds
# Use docker as the build environment (safest way and uses the correct build versions) # This will build the web-vault, and extract the files to a docker_build directory.
make docker-extract
# Using the host provided npm and node instead.
make full
Important
The script requires you to enter a tag or a branch of a web-vault to build. The main branch is an out-of-date mirror of the bitwarden/clients repository that has not been patched, so it won't be compatible with Vaultwarden.
Old (very manual way):
Clone the git repository at bitwarden/clients and checkout the latest release tag (e.g. v2022.6.0):
git clone https://github.com/bitwarden/clients.git web-vault
cd web-vault
# switch to the latest tag
git -c advice.detachedHead=false checkout web-v2022.6.0
# Or use the commit hash for that version
git -c advice.detachedHead=false checkout bb5f9311a776b94a33bcf0a7bff44cd87a2fcc92
Patch all the images from resources according to the instructions in the apply_patches script
Download the patch file from dani-garcia/bw_web_builds and copy it to the web-vault folder.
To choose the version to use, assuming the web vault is version vXXXX.Y.Z :
If there is a patch with version vXXXX.Y.Z , use that one
Otherwise, pick the one with the largest version that is still smaller than vXXXX.Y.Z
Apply the patch
# In the 'web-vault' directory
git apply vXXXX.Y.Z.patch
Then, build the Vault:
npm ci
# Read the note below (we do use this for our docker builds). # npm audit fix # Change to the web-vault directory cd apps/web
# Build the web-vault
npm run dist:oss:selfhost
Note: You might be asked to run npm audit fix to fix vulnerability. This will automatically try to upgrade packages to newer version, which might not be compatible and break web-vault functionality``` Use it at your own risk, if you know what you are doing. We do use this on our own releases btw!
Finally copy the contents of the build folder into the destination folder:
If you run with cargo run --release , it's vaultwarden/web-vault .
If you run the compiled binary directly, it's next to the binary, in vaultwarden/target/release/web-vault .
Configuration
The available configuration options are documented in the default .env.template file, and they can be modified by uncommenting the desired options in that file or by setting their respective environment variables. See the Configuration section of this wiki for the main configuration options available.
If you want to use this file you need to copy it, and name it .env and adjust the settings in that specific file.
Note: the environment variables override the values set in the .env file.
More information for deployment
Configuring your reverse proxy
Setting up Autostart via systemd
How to recreate database schemas for the sqlite backend (for developers)
Install diesel-cli with cargo:
cargo install diesel_cli --no-default-features --features sqlite-bundled
Make sure that the correct path to the database is in the .env file.
If you want to modify the schemas, create a new migration with:
diesel migration generate <name>
Modify the *.sql files, making sure that any changes are reverted in the down.sql file.
Apply the migrations and save the generated schemas as follows:
diesel migration redo
# This step should be done automatically when using diesel-cli > 1.3.0 # diesel print-schema > src/db/sqlite/schema.rs
How to migrate from SQLite backend to MySQL backend (for developers)
Refer to using the MariaDB (MySQL) Backend if you want to migrate from SQLite.
How to migrate from SQLite backend to PostgreSQL backend (for developers)
Refer to using the PostgreSQL backend if you want to migrate from SQLite.
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
