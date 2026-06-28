---
source_url: "https://www.home-assistant.io/docs/configuration/securing"
final_url: "https://www.home-assistant.io/docs/configuration/securing"
canonical_url: "https://www.home-assistant.io/docs/configuration/securing/"
source_handle: "web:www-home-assistant-io:7ee3bb9da854"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3f8208b7f6ce72af48328af3ddb29cd9967534ea9b4650d7623bcf3a274e3e7d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Securing your Home Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/securing
- Final URL: https://www.home-assistant.io/docs/configuration/securing
- Canonical URL: https://www.home-assistant.io/docs/configuration/securing/
- Fetched at: 2026-06-28T02:21:37Z
- Content type: text/html; charset=UTF-8

## Description

Recommended settings and best practices for keeping your Home Assistant secure, from strong passwords to safe remote access.

## Extracted Text

On this page
Checklist
About account security basics
Methods to enable remote access to Home Assistant
Extras for manual installations
Related topics
Related links
Home Assistant runs on your own hardware and does not depend on any cloud service to work, which already removes a large category of risks that come with internet-connected smart home platforms. Even so, there are a few simple steps you should take to keep your Home Assistant secure, especially if you plan to access it from outside your home network.
The most important things to do to keep your Home Assistant secure:
Use a strong, unique password for every account, and turn on multi-factor authentication .
Centralize sensitive data in secrets (and remember to back them up).
Note : Storing secrets in secrets.yaml does not encrypt them.
Keep your system up to date with each monthly release.
Your accounts are the first line of defense, especially if you access Home Assistant from outside your home network.
Choose a strong, unique password for every account. A password manager makes this easier.
Turn on multi-factor authentication for an extra layer of protection.
Only give administrator access to accounts that need it.
For more information, refer to Authentication .
If you want to reach Home Assistant from outside your home network, set up a secure method for remote access rather than exposing it directly to the internet.
The easiest and safest option is Home Assistant Cloud . It needs no port forwarding or certificate setup, and your subscription supports the Open Home Foundation , the nonprofit behind Home Assistant, ESPHome, and more open source projects.
Another option is to use TLS/SSL via the app Duck DNS integrating Let’s Encrypt.
To access your instance remotely, use a VPN or an SSH tunnel . Make sure you forward the required port on your router.
For more instructions on each option, refer to Remote access .
Besides the above, we advise that you consider the following to improve security:
For systems that use SSH, set PermitRootLogin no in your sshd configuration (usually /etc/ssh/sshd_config ) and use SSH keys for authentication instead of passwords. This is particularly important if you enable remote access to your SSH services.
Lock down the host following good practice guidance, for example:
Securing Debian Manual (this also applies to Raspberry Pi OS)
Red Hat Enterprise Linux 7 Security Guide , CIS Red Hat Enterprise Linux 7 Benchmark
The configuration.yaml file
Remote access
Authentication
Multi factor authentication
Secrets.yaml file
Home assistant cloud
Nabu Casa
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
