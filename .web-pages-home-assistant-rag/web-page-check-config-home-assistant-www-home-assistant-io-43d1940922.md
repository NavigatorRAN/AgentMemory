# check_config - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/tools/check_config
- Final URL: https://www.home-assistant.io/docs/tools/check_config
- Canonical URL: https://www.home-assistant.io/docs/tools/check_config/
- Fetched at: 2026-06-28T02:23:27Z
- Content type: text/html; charset=UTF-8

## Description

Script to perform a check of the current configuration

## Extracted Text

On this page
Related topics
Test any changes to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file before launching Home Assistant. This script allows you to test changes without the need to restart Home Assistant.
hass --script check_config
The script has further options like checking configuration files which are not located in the default directory or showing your secrets for debugging.
$ hass --script check_config -h
usage: hass [ -h ] [ --script { check_config }] [ -c CONFIG] [ -i [ INFO]] [ -f ] [ -s ] [ --json ] [ --fail-on-warnings ]
Check Home Assistant configuration.
optional arguments:
-h , --help show this help message and exit --script { check_config } -c CONFIG, --config CONFIG
Directory that contains the Home Assistant
configuration
-i [ INFO], --info [ INFO]
Show a portion of the config
-f , --files Show used configuration files
-s , --secrets Show secret information
--json Output JSON format
--fail-on-warnings Exit non-zero if warnings are present
Validating the configuration
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
Authentication
Tools and helpers
Developer tools
Quick search
check_config
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
