---
source_url: "https://www.home-assistant.io/integrations/x10"
final_url: "https://www.home-assistant.io/integrations/x10"
canonical_url: "https://www.home-assistant.io/integrations/x10/"
source_handle: "web:www-home-assistant-io:5b7daa3c1b40"
source_section: "integrations-x10"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0f4cf99ffbedd16877ba95f07624a3b76e74e8d0f6e2fd9da542e4d86500ebec"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Heyu X10 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/x10
- Final URL: https://www.home-assistant.io/integrations/x10
- Canonical URL: https://www.home-assistant.io/integrations/x10/
- Fetched at: 2026-06-28T03:29:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up X10 devices within Home Assistant.

## Extracted Text

On this page
Related topics
The Heyu X10 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your X10 based lights with Home Assistant.
Requires Heyu x10 and a CM11A or a CM17A “FireCracker” interface.
To enable those lights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : x10 devices : - id : a2 name : Guest Room - id : a3 name : Bedroom Lamp
Configuration Variables
Looking for your configuration file?
devices list Required
A list of devices.
id string Required
Device identifier. Composed of house code and unit id.
name string Required
A friendly name for the device.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Heyu X10 integration was introduced in Home Assistant 0.25, and it's used by
2 active installations.
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
