---
source_url: "https://www.home-assistant.io/integrations/bt_smarthub"
final_url: "https://www.home-assistant.io/integrations/bt_smarthub"
canonical_url: "https://www.home-assistant.io/integrations/bt_smarthub/"
source_handle: "web:www-home-assistant-io:4aa2ce89345d"
source_section: "integrations-bt-smarthub"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2b2a4746a07889370b16825211f15e7ad22caf2ec7e813488e7a07040029756b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# BT Smart Hub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bt_smarthub
- Final URL: https://www.home-assistant.io/integrations/bt_smarthub
- Canonical URL: https://www.home-assistant.io/integrations/bt_smarthub/
- Fetched at: 2026-06-28T02:32:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate BT Smart Hub router into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a BT Smart Hub based router.
This router is sometimes referred to as the BT Home Hub 6.
It has been reported that the Plusnet Hub Two also works with this integration.
To use a BT Smart Hub router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : bt_smarthub
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 192.168.1.254 )
The IP address of your router
smarthub_model integer ( Optional )
The model of your BT Smarthub 1 or 2. If this option is omitted, it will attempt to detect the hub model.
See the device tracker integration page for instructions on how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The BT Smart Hub integration was introduced in Home Assistant 0.82, and it's used by
90 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@typhoon2099
Categories
Presence detection
Back to top
