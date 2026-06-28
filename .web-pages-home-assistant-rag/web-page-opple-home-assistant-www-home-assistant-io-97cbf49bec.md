---
source_url: "https://www.home-assistant.io/integrations/opple"
final_url: "https://www.home-assistant.io/integrations/opple"
canonical_url: "https://www.home-assistant.io/integrations/opple/"
source_handle: "web:www-home-assistant-io:97cbf49bec60"
source_section: "integrations-opple"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7884bc74dc24d77cdcc84cc2b8650a30d3688227f8c62e970eb5a6652a09cab9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Opple - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opple
- Final URL: https://www.home-assistant.io/integrations/opple
- Canonical URL: https://www.home-assistant.io/integrations/opple/
- Fetched at: 2026-06-28T03:06:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Opple lights into Home Assistant.

## Extracted Text

On this page
Related topics
The Opple integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the state of your Opple smart light.
The platform supports all Opple lights with Wi-Fi support or lights that can be controlled by the App.
To use your Opple light in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : opple name : LIGHT_NAME host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: opple light )
The name to use when displaying this light.
host string Required
The IP address of your Opple light, e.g., 192.168.0.21 .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Opple integration was introduced in Home Assistant 0.80, and it's used by
29 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
