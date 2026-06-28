---
source_url: "https://www.home-assistant.io/integrations/oem"
final_url: "https://www.home-assistant.io/integrations/oem"
canonical_url: "https://www.home-assistant.io/integrations/oem/"
source_handle: "web:www-home-assistant-io:4487156e9e8c"
source_section: "integrations-oem"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b23d1bdf55ee9c75c0cb1015a42c9a4b24848ad3116f8c568e0b86aca9a46d68"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OpenEnergyMonitor WiFi Thermostat - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/oem
- Final URL: https://www.home-assistant.io/integrations/oem
- Canonical URL: https://www.home-assistant.io/integrations/oem/
- Fetched at: 2026-06-28T03:05:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an OpenEnergyMonitor thermostat with Home Assistant.

## Extracted Text

On this page
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the ESP8266 based “WiFi MQTT Relay / Thermostat” sold by OpenEnergyMonitor (archived page, no longer for sale). The underlying library only supports this single relay variant of the original device .
This platform controls the setpoint of the thermostat in its “manual” mode.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry climate oem : - platform : oem host : 192.168.0.100
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of the thermostat.
port integer ( Optional , default: 80 )
The port for the web interface.
name string ( Optional , default: Thermostat )
The name to use for the frontend.
username string ( Inclusive )
Username for the web interface if set.
password string ( Inclusive )
Password for the web interface if set.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenEnergyMonitor WiFi Thermostat integration was introduced in Home Assistant 0.39, and it's used by
4 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Climate
Back to top
