---
source_url: "https://www.home-assistant.io/integrations/kaiterra"
final_url: "https://www.home-assistant.io/integrations/kaiterra"
canonical_url: "https://www.home-assistant.io/integrations/kaiterra/"
source_handle: "web:www-home-assistant-io:09613edf4887"
source_section: "integrations-kaiterra"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "78f8f36440e3a8feb07189085b2db5b5d443505886df4ceb97206b10c3a571bb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Kaiterra - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kaiterra
- Final URL: https://www.home-assistant.io/integrations/kaiterra
- Canonical URL: https://www.home-assistant.io/integrations/kaiterra/
- Fetched at: 2026-06-28T02:54:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Kaiterra device into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Kaiterra integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view the readings from your Laser Egg or Sensedge device using the Kaiterra REST API .
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need to get the API key by signing up at Kaiterra dashboard , registering the device and create the key under Settings -> Profile -> Developer .
To enable kaiterra in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry kaiterra : api_key : YOUR_API_KEY devices : - device_id : YOUR_DEVICE_ID type : YOUR_DEVICE_TYPE
Configuration Variables
Looking for your configuration file?
api_key string Required
Your personal API key from Kaiterra Dashboard.
aqi_standard string ( Optional , default: us )
The standard of Air Quality Index. Available values us , in , cn .
scan_interval integer ( Optional , default: 30 )
The interval to scan for sensor state changes in seconds.
preferred_units list ( Optional )
The list of preferred units. Available values in the list x , % , C , F , mg/m³ , µg/m³ , ppm , ppb .
devices list Required
The devices you want to get reading from.
device_id string Required
The UUID of the device you want to monitor. You can take it from Kaiterra Dashboard.
type string Required
The device type. Available values laseregg and sensedge .
name string ( Optional )
The custom name of your device.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Kaiterra integration was introduced in Home Assistant 0.100, and it's used by
60 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Michsior14
Categories
Health
Back to top
