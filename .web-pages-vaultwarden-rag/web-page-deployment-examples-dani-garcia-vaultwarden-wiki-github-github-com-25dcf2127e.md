# Deployment examples · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Deployment-examples
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Deployment-examples
- Fetched at: 2026-06-23T13:49:38Z
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
Deployment examples
Jump to bottom Edit New page
Alphan Aksoyoglu edited this page Dec 28, 2025
·
44 revisions
This page is an index of standalone deployment examples. If adding a new example, please create a new category if appropriate, and keep things organized in general.
Self-hosted
This section documents different options to host Vaultwarden on your own hardware or any infrastructure that is primarily managed by yourself .
Highly Available Vaultwarden Deployment with Ansible
https://github.com/InfraArtists/vaultwarden-ansible
This Ansible deployment sets up a highly available Vaultwarden cluster using the following components:
Key Features:
Nginx : Handles SSL offloading and load balancing for optimal performance and security.
Certbot : Automatically generates and manages SSL certificates for secure communication.
Vaultwarden : Serves as the main backend for password management.
Keepalived : Provides virtual IP and redundancy for high availability.
PostgreSQL : Uses an external database for storing data.
Docker and Docker Compose : Deploy all services with docker compose.
Ansible
https://github.com/guerzon/ansible-role-vaultwarden
Ansible role that currently supports EL8 and EL9 distributions. Under active development and support and has a working MVP version.
Raspberry Pi
https://github.com/martient/vaultwarden-ansible
Ansible deployment for vaultwarden on raspberry pi, for migrate from the previous configuration, follow the guides linked on the page.
https://dietpi.com/
DietPi is a lightweight Debian-based distribution (image) for all kinds of devices like Raspberry Pi, Odroid, NanoPi and others. It offers a software script for installing various programs including Vaultwarden. That spares the user tinkering with installation commands.
For installing Vaultwarden on DietPi just type dietpi-software install 183 on the command line. More information about the installation process and first access to Vaultwarden on DietPi can be found at https://dietpi.com/docs/software/cloud/#vaultwarden
https://mijo.remotenode.io/posts/tailscale-caddy-docker/
A walkthrough guide for securing access to Vaultwarden with Tailscale and Caddy. All services are containerized and managed with Docker Compose, hosted on a Raspberry Pi.
https://github.com/Alphan-Aksoyoglu/vaultwarden-rpi/
A docker-compose based, modular, self-hosted Vaultwarden deployment.
Options:
LAN only, or LAN + Tailscale (Access from everywhere through VPN)
Your domain (Cloudflare) or DuckDNS domain
Optional Backup Service which does not rely on 3rd party containers
Optional UFW and IPTABLES Hardening
Comes with a convenient installer:
just run install.sh --init and install.sh --install
and an extensive README .
Shared hosting
https://github.com/jjlin/vaultwarden-shared-hosting
Sample config for running vaultwarden on DreamHost , but should be readily adaptable to many other shared hosting services.
https://lab.uberspace.de/guide_vaultwarden.html?highlight=bitwarden
Instructions on how to install from source and run on Uberspace shared hosting provider.
NixOS (by tklitschi)
There's a example bitwarden config for NixOS. It's not very complex, you have the backend option, for the type of Database you wanna use, the Backupdir for a dedicated Backup systemdserive, the option to enable it and the config Option. For the Config Option you simply pass the .env Variables from the .env template in nix syntax. Secrets ( SMTP_PASSWORD,... ) store inside another .env file outside /nix/store and include by services.vaultwarden.environmentFile
See Proxy Examples for a nixos-nginx example config.
Example Config
{ pkgs , ... } :
{ services . bitwarden_rs = { enable = true ; backupDir = "/mnt/bitwarden" ; config = { WEB_VAULT_FOLDER = " ${ pkgs . bitwarden_rs-vault } /share/bitwarden_rs/vault" ; WEB_VAULT_ENABLED = true ; LOG_FILE = "/var/log/bitwarden" ; WEBSOCKET_ENABLED = true ; WEBSOCKET_ADDRESS = "0.0.0.0" ; WEBSOCKET_PORT = 3012 ; SIGNUPS_VERIFY = true ; # ADMIN_TOKEN = (import /etc/nixos/secret/bitwarden.nix).ADMIN_TOKEN; DOMAIN = "https://exmaple.com" ; # YUBICO_CLIENT_ID = (import /etc/nixos/secret/bitwarden.nix).YUBICO_CLIENT_ID; # YUBICO_SECRET_KEY = (import /etc/nixos/secret/bitwarden.nix).YUBICO_SECRET_KEY; YUBICO_SERVER = "https://api.yubico.com/wsapi/2.0/verify" ; SMTP_HOST = "mx.example.com" ; SMTP_FROM = "bitwarden@example.com" ; SMTP_FROM_NAME = "Bitwarden_RS" ; SMTP_PORT = 587 ; SMTP_SECURITY = starttls ; # SMTP_USERNAME = (import /etc/nixos/secret/bitwarden.nix).SMTP_USERNAME; # SMTP_PASSWORD = (import /etc/nixos/secret/bitwarden.nix).SMTP_PASSWORD; SMTP_TIMEOUT = 15 ; ROCKET_PORT = 8812 ; } ; environmentFile = "/etc/nixos/secret/bitwarden.env" ; } ; }
If you have any Questions about this part, feel Free to contact me. I on @litschi:litschi.xyz on matrix an litschi on IRC (hackint and freenode) or simply ask in the vaultwarden matrix.org chanel.
QNAP NAS (ARM and x86)
https://github.com/umireon/vaultwarden-qnap
You can install Vaultwarden into your secure network-attached storage (NAS) with Let's Encrypt.
Due to the QNAP's built-in HTTP(S) server, you cannot publish Vaultwarden on the standard HTTP(S) port (80 / 443).
Kubernetes Manifests
https://github.com/icicimov/kubernetes-bitwarden_rs
Sets up a fully functional and secure vaultwarden application in Kubernetes behind nginx-ingress-controller and AWS ELBv1 . It provides a little bit more than just simple deployment but you can use all or just part of the manifests depending on your needs and setup.
Helm charts
https://github.com/Skeen/helm-bitwarden_rs
Sets up a fully functional and secure vaultwarden application in Kubernetes behind an nginx controller of your choice. It works well and is tested with the microk8s setup. There is support for generating SSL certificates via cert-manager too.
https://github.com/guerzon/vaultwarden
Deploy Vaultwarden to Kubernetes clusters using Helm . This chart supports important customizations such as providing image tags and custom registry values, using an external MySQL or PostgreSQL database, using ingress controllers such as nginx-ingress and AWS LB Ingress Controller , using service accounts, configuring SMTP, and configuring storage options.
This Helm chart is under active development and support.
PaaS Hosting
This section presents different options to host Vaultwarden in the cloud or using Platform as a Service providers.
AWS EKS
https://medium.com/@sreafterhours/deploy-vaultwarden-to-amazon-eks-using-terraform-terragrunt-and-helm-69a0a7396625
Deploy Vaultwarden in Amazon EKS using Terraform and Infrastructure-as-Code.
Sealos
Installs vaultwarden on Sealos using all free addons. Takes about 1 minutes to install. Gracefully handle high concurrency and offer dynamic scalability.
Google Cloud
https://github.com/dadatuputi/bitwarden_gcloud
Vaultwarden installation optimized for Google Cloud's 'always free' e2-micro compute instance
Heroku
https://github.com/davidjameshowell/vaultwarden_heroku
Installs vaultwarden on Heroku using all free addons. Takes about 15 minutes to install.
Fly.io
https://github.com/nosovk/vaultwarden-fly-io/blob/main/fly.toml
Installs vaultwarden with SQLite database. But you need to create volume for database
flyctl volumes create vaultwarden_data -a [your app name] -s 1
https://github.com/arthurgeek/vaultwarden-fly-template
Template to deploy Vaultwarden on Fly.io with websockets support (with caddy) and sqlite hourly backups using restic.
Dokku
This is a script that automatically sets up vaultwarden using the docker image uploaded to DockerHub
and creates a Dokku app. The script assumes you have a global domain set
up (i.e. the file /home/dokku/VHOST exists). Follow the prompts to set it up.
#! /usr/bin/env bash set -euo pipefail
APPNAME= " " read -rp " Enter the name of the app: " APPNAME
# check if app name is empty if [ -z " $APPNAME " ] ; then echo " App name empty. Using default name: vaultwarden "
APPNAME= " vaultwarden " fi # check if dokku plugin exists if ! dokku plugin:list | grep letsencrypt ; then
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
fi # check if global email for letsencrypt is set if ! dokku config:get --global DOKKU_LETSENCRYPT_EMAIL ; then read -rp " Enter email address for letsencrypt: " EMAIL
dokku config:set --global DOKKU_LETSENCRYPT_EMAIL= " $EMAIL " fi # pull the latest image
IMAGE_NAME= " vaultwarden/server "
docker pull $IMAGE_NAME
image_sha= " $( docker inspect --format= ' {{index .RepoDigests 0}} ' $IMAGE_NAME ) " echo " Calculated image sha: $image_sha "
dokku apps:create " $APPNAME "
dokku storage:ensure-directory " $APPNAME "
dokku storage:mount " $APPNAME " /var/lib/dokku/data/storage/ " $APPNAME " :/data
dokku domains:add $APPNAME $APPNAME . " $( cat /home/dokku/VHOST ) "
dokku letsencrypt:enable " $APPNAME "
dokku proxy:ports-add " $APPNAME " http:80:80
dokku proxy:ports-add " $APPNAME " https:443:80
dokku proxy:ports-remove " $APPNAME " http:80:5000
dokku proxy:ports-remove " $APPNAME " https:443:5000
dokku git:from-image " $APPNAME " " $image_sha "
Copy the above script to your dokku host and run it. Once the script succeeds, the web vault will be
available at https://$APPNAME.dokku.me .
To update your vaultwarden server, run the following (remembering to replace $APP_NAME with your app's name):
docker rmi -f vaultwarden/server
docker pull vaultwarden/server:latest
image_sha= " $( docker inspect --format= ' {{index .RepoDigests 0}} ' vaultwarden/server ) "
dokku git:from-image $APP_NAME $image_sha
Azure
https://github.com/adamhnat/vaultwarden-azure
Vaultwarden installation optimized for Azure Container App service with fileshare for data
Digital Ocean
https://github.com/HarrisonLeach1/vaultwarden_digitalocean
Vaultwarden installation for Digital Ocean's cheapest droplet. Resources setup via terraform
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
Disable the admin token
Other Information
Importing data from Keepass or KeepassX
Changing persistent data location
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
