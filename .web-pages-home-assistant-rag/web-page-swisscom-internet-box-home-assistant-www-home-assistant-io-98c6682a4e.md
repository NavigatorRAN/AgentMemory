---
source_url: "https://www.home-assistant.io/integrations/swisscom"
final_url: "https://www.home-assistant.io/integrations/swisscom"
canonical_url: "https://www.home-assistant.io/integrations/swisscom/"
source_handle: "web:www-home-assistant-io:98c6682a4e56"
source_section: "integrations-swisscom"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a96f6982ea4cd9884a9479269ede70178808f14ec054ddd9f1d9d5954259a43e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Swisscom Internet-Box - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/swisscom
- Final URL: https://www.home-assistant.io/integrations/swisscom
- Canonical URL: https://www.home-assistant.io/integrations/swisscom/
- Fetched at: 2026-06-28T03:19:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Swisscom Internet-Box into Home Assistant.

## Extracted Text

On this page
Related topics
The Swisscom Internet-Box integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to an Internet-Box router from Swisscom which is an Internet provider in Switzerland.
Note
There are three models of Internet-Box (light, standard and plus). The platform has only been tested on the Internet-Box plus but the others should work as well because they have the same web interface.
To use an Internet-Box router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : swisscom
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: 192.168.1.1 )
The IP address of your router.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Swisscom Internet-Box integration was introduced in Home Assistant 0.32, and it's used by
50 active installations.
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
