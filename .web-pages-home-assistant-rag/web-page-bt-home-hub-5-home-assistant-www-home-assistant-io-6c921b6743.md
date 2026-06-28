---
source_url: "https://www.home-assistant.io/integrations/bt_home_hub_5"
final_url: "https://www.home-assistant.io/integrations/bt_home_hub_5"
canonical_url: "https://www.home-assistant.io/integrations/bt_home_hub_5/"
source_handle: "web:www-home-assistant-io:6c921b67430a"
source_section: "integrations-bt-home-hub-5"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2a52a34d191f3cd19c593d34d15a0ad9584ff000c091346c692922e291b92dce"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# BT Home Hub 5 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bt_home_hub_5
- Final URL: https://www.home-assistant.io/integrations/bt_home_hub_5
- Canonical URL: https://www.home-assistant.io/integrations/bt_home_hub_5/
- Fetched at: 2026-06-28T02:32:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate BT Home Hub 5 router into Home Assistant.

## Extracted Text

On this page
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a BT Home Hub 5 based router.
To use a BT Home Hub 5 router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : bt_home_hub_5 host : 192.168.1.254
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 192.168.1.254 )
The IP address of your router.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The BT Home Hub 5 integration was introduced in Home Assistant 0.22, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
