---
source_url: "https://www.home-assistant.io/integrations/ampio"
final_url: "https://www.home-assistant.io/integrations/ampio"
canonical_url: "https://www.home-assistant.io/integrations/ampio/"
source_handle: "web:www-home-assistant-io:5bbc58a8f924"
source_section: "integrations-ampio"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ee1f49a7b831498cf8d559e52f5f8c9cbedb29b00a3d1a0c2dd3e8b0355c4a06"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ampio Smart Smog System - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ampio
- Final URL: https://www.home-assistant.io/integrations/ampio
- Canonical URL: https://www.home-assistant.io/integrations/ampio/
- Fetched at: 2026-06-28T02:27:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Ampio Smog sensors in Home Assistant.

## Extracted Text

On this page
Setup
Manual configuration
Related topics
The Ampio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will query the open data API of ampio.pl to monitor air quality sensor station.
To get the ID of a station you need to contact Ampio directly.
To enable this platform, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry air_quality : - platform : ampio station_id : STATION_ID
Configuration Variables
Looking for your configuration file?
station_id string Required
The ID of the station to monitor.
name string ( Optional , default: Station name )
Name of the sensor to use in the frontend.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ampio Smart Smog System integration was introduced in Home Assistant 0.92, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Health
Sensor
Back to top
