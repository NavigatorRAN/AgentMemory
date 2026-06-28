---
source_url: "https://www.home-assistant.io/docs/configuration/troubleshooting"
final_url: "https://www.home-assistant.io/docs/configuration/troubleshooting"
canonical_url: "https://www.home-assistant.io/docs/configuration/troubleshooting/"
source_handle: "web:www-home-assistant-io:7e8f185ab4fc"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8605b3f89314e055d09b941118287f60e70f72bb2491eaa7d8a9cc07cfa71a00"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Troubleshooting your configuration - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/troubleshooting
- Final URL: https://www.home-assistant.io/docs/configuration/troubleshooting
- Canonical URL: https://www.home-assistant.io/docs/configuration/troubleshooting/
- Fetched at: 2026-06-28T02:21:45Z
- Content type: text/html; charset=UTF-8

## Description

Common problems with your Home Assistant configuration and how to fix them, including how to read the logs and check your YAML before restarting.

## Extracted Text

On this page
My integration does not show up
Problems with the configuration
Entity names
Debug logs and diagnostics
Enabling debug logging
Disable debug logging and download logs
Download diagnostics
Handling unexpected restarts or crashes
Related topics
It can happen that you run into trouble while configuring Home Assistant. Perhaps an integration is not showing up or is acting strangely. This page will discuss a few of the most common problems.
Before we dive into common issues, make sure you know where your configuration directory is. Home Assistant will print out the configuration directory it is using when starting up.
Whenever an integration or configuration option results in a warning, it will be stored in the logs .
When an integration does not show up, many different things can be the case. Before you try any of these steps, make sure to look at the the logs and see if there are any errors related to your integration you are trying to set up.
If you have incorrect entries in your configuration files you can use the configuration check command (below) to assist in identifying them.
One of the most common problems with Home Assistant is an invalid configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] or other configuration file.
Home Assistant provides a CLI that allows you to see how it interprets them, each installation type has its own section in the common-tasks about this:
Operating System
Container
The configuration files, including configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] must be UTF-8 encoded. If you see error like 'utf-8' codec can't decode byte , edit the offending configuration and re-save it as UTF-8.
You can verify your configuration’s YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] structure using this online YAML parser or YAML Validator .
To learn more about the quirks of YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] , read YAML IDIOSYNCRASIES by SaltStack (the examples there are specific to SaltStack, but do explain YAML issues well).
configuration.yaml does not allow multiple sections to have the same name. If you want to load multiple platforms for one integration, you can append a number or string to the name or nest them:
sensor : - platform : forecast ... - platform : bitcoin ...
Another common problem is that a required configuration setting is missing. If this is the case, the integration will report this in the logs . You can have a look at the various integration pages for instructions on how to setup the integrations.
See the logger integration for instructions on how to define the level of logging you require for specific modules.
If you find any errors or want to expand the documentation, please let us know .
Problems with dependencies
Almost all integrations have external dependencies to communicate with your devices and services. Sometimes Home Assistant is unable to install the necessary dependencies. If this is the case, it should show up in the logs .
The first step is trying to restart Home Assistant and see if the problem persists. If it does, look at the log to see what the error is. If you can’t figure it out, please report it so we can investigate what is going on.
Problems with integrations
It can happen that some integrations either do not work right away or stop working after Home Assistant has been running for a while. If this happens to you, please report it so that we can have a look.
Multiple files
If you are using multiple files for your setup, make sure that the pointers are correct and the format of the files is valid. It’s important to understand the different types of !include and how the contents of each file should be structured - more information on the various methods of splitting your configuration into multiple files can be found here .
light : !include devices/lights.yaml sensor : !include devices/sensors.yaml
Contents of lights.yaml (notice it does not contain light: ):
- platform : hyperion host : 192.168.1.98 ...
Contents of sensors.yaml :
- platform : mqtt name : " Room Humidity" state_topic : " room/humidity" - platform : mqtt name : " Door Motion" state_topic : " door/motion" ...
Note
Whenever you report an issue, be aware that we are volunteers who do not have access to every single device in the world nor unlimited time to fix every problem out there.
The only characters valid in entity names are:
Lowercase letters
Numbers
Underscores
The entity name must not start or end with an underscore. If you create an entity with other characters from the UI, Home Assistant validates the name. If you change the name directly in the YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] file, then Home Assistant may not generate an error for that entity. However, attempts to use that entity will generate errors (or possibly fail silently).
For instructions on how to change an entity name, refer to the section on customizing entities .
The first thing you will need before reporting an issue online is debug logs and diagnostics (if available) for the integration giving you trouble. Getting those ahead of time will ensure someone can help resolve your issue in the fastest possible manner.
To enable debug logging for a specific integration, follow these steps:
Go to Settings > Devices & services .
Select the integration for which you want to enable debug logging.
In the top right of the page, open the three dots menu, and select Enable debug logging .
Screenshot showing the Enable debug logging menu item.
To see the error in the logs, you need to reproduce the error.
Run your automation, change up your device or whatever was giving you an error.
Continue with the steps on disabling debug logging and download logs .
Select the integration for which you want to disable debug logging.
In the top right of the page, open the three dots menu, and select Disable debug logging .
After you disable it, you will be prompted to download your log file.
Save this to a safe location to upload later.
After you download logs, you will also want to download the diagnostics for the integration giving you trouble. Not all integrations provide diagnostics, but if they do, you can download them by following these steps:
Select the integration.
In the top right of the integration card, open the three dots menu, and select Download diagnostics .
Example showing the Download diagnostics button on the Zigbee integration card.
Suppose you find that Home Assistant unexpectedly restarts or crashes; it’s likely that you have a misbehaving integration impacting system stability. Home Assistant has a built-in debug option that can help find implementation errors. It can also block many unsafe thread operations from crashing the system. Enabling debug has a slight performance impact on the system and is not recommended for long-term use. To enable debug, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
homeassistant : debug : true
Once debug is enabled, periodically check Home Assistant System Logs for new messages.
The configuration.yaml file
Changing entity name and id
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
