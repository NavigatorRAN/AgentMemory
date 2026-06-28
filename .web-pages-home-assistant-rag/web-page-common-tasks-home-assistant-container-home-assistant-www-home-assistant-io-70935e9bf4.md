# Common tasks - Home Assistant Container - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/common-tasks/container
- Final URL: https://www.home-assistant.io/common-tasks/container
- Canonical URL: https://www.home-assistant.io/common-tasks/container/
- Fetched at: 2026-06-28T02:18:17Z
- Content type: text/html; charset=UTF-8

## Description

Tasks specific to Home Assistant Container installations, including updating the container image and managing the underlying Docker environment.

## Extracted Text

On this page
Backup
Update
Running a beta version
Running a development version
Running a specific version
Configuration check
To learn how to back up the system or how to restore a system from a backup, refer to the backup documentation under common tasks .
Prerequisites
Back up your installation and store the backup and the backup emergency kit somewhere safe.
This ensures that you can restore your installation from backup if needed.
Check the release notes for backward-incompatible changes on Home Assistant release notes . Be sure to check all release notes between the version you are running and the one you are upgrading to. Use the search function in your browser ( CTRL + f / CMD + f ) and search for Backward-incompatible changes .
To update Home Assistant Core
To update Home Assistant Core, choose one of the following options.
Docker CLI
Docker Compose
First start with pulling the new container.
docker pull ghcr.io/home-assistant/home-assistant:stable
You then need to recreate the container with the new image.
docker compose pull homeassistant
docker compose up -d
After the update, check if there are any repair issues and check the logs to see if there are any issues with your configuration that need to be addressed.
If you would like to test next release before anyone else, you can install the beta version.
docker pull ghcr.io/home-assistant/home-assistant:beta
If you want to stay on the bleeding-edge Home Assistant Core development branch, you can upgrade to dev .
Caution
The dev branch is likely to be unstable. Potential consequences include loss of data and instance corruption.
docker pull ghcr.io/home-assistant/home-assistant:dev
To see which version your system is running, go to Settings > About .
In the event that a Home Assistant Core version doesn’t play well with your hardware setup, you can downgrade to a previous release. In this example 2026.6.4 is used as the target version but you can choose the version you desire to run.
docker pull ghcr.io/home-assistant/home-assistant:2026.6.4
After changing configuration files, check if the configuration is valid before restarting Home Assistant Core.
If your container name is something other than homeassistant , change that part in the examples below.
Run the full check:
docker exec homeassistant python -m homeassistant --script check_config --config /config
Listing all loaded files:
docker exec homeassistant python -m homeassistant --script check_config --files
Viewing an integration’s configuration ( light in this example):
docker exec homeassistant python -m homeassistant --script check_config --info light
Or all integrations’ configuration
docker exec homeassistant python -m homeassistant --script check_config --info all
You can get help from the command line using:
docker exec homeassistant python -m homeassistant --script check_config --help
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
Installation independent
Home Assistant Operating System
Home Assistant Container
General troubleshooting
Configuration
Authentication
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
