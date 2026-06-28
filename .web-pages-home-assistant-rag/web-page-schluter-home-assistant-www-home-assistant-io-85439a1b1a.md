---
source_url: "https://www.home-assistant.io/integrations/schluter"
final_url: "https://www.home-assistant.io/integrations/schluter"
canonical_url: "https://www.home-assistant.io/integrations/schluter/"
source_handle: "web:www-home-assistant-io:85439a1b1a0c"
source_section: "integrations-schluter"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "00a298b20a4ef946d5129977d74707bca373650711515adfb0131007e48f793e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Schluter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/schluter
- Final URL: https://www.home-assistant.io/integrations/schluter
- Canonical URL: https://www.home-assistant.io/integrations/schluter/
- Fetched at: 2026-06-28T03:13:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Schluter DITRA-HEAT-E-WiFi thermostat into Home Assistant.

## Extracted Text

On this page
Configuration
Supported features
Related topics
The Schluter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Schluter-DITRA-HEAT-E-WiFi electric floor heating thermostat in Home Assistant.
Important
You will need to create a Schluter DITRA-HEAT account and register your thermostat with it. This can be done via the thermostat touchscreen, where an email will be sent to you to confirm your account.
You will need your Schluter login information (email and password) to use this module.
To set it up, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry schluter : username : YOUR_SCHLUTER_EMAIL password : YOUR_SCHLUTER_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
The email for accessing your Schluter account.
password string Required
The password for accessing your Schluter account.
Once Home Assistant is started, you will have access to any thermostats registered with your account.
Currently, this integration supports the following features:
Retrieving current temperature & target temperature
Setting target temperature
When adjusting the temperature via Home Assistant, it will place the thermostat in “permanent mode”, meaning schedules programmed within the thermostat will be ignored. You can return to scheduled mode by pressing the “Return to Schedule” button on the thermostat.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Schluter integration was introduced in Home Assistant 0.108, and it's used by
165 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@prairieapps
Categories
Climate
Back to top
