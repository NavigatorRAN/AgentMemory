---
source_url: "https://www.home-assistant.io/integrations/comfoconnect"
final_url: "https://www.home-assistant.io/integrations/comfoconnect"
canonical_url: "https://www.home-assistant.io/integrations/comfoconnect/"
source_handle: "web:www-home-assistant-io:ca976fafa7ed"
source_section: "integrations-comfoconnect"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "95b4615b1f445792cb585de0eb21c12d9e8ce7fd3bb21fe3d158a6b9c09b24cf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Zehnder ComfoAir Q - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/comfoconnect
- Final URL: https://www.home-assistant.io/integrations/comfoconnect
- Canonical URL: https://www.home-assistant.io/integrations/comfoconnect/
- Fetched at: 2026-06-28T02:34:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Zehnder ComfoAir Q350/450/600 ventilation systems into Home Assistant.

## Extracted Text

On this page
The Zehnder ComfoAir Q integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Zehnder ComfoAir Q350 / Q450 / Q600
ventilation units from Home Assistant. You need a ComfoConnect LAN C
bridge to connect the unit to your local network.
There is an official iPhone and Android app to configure and control your unit. This platform connects with the help of
the unofficial pycomfoconnect library.
The integration has a fan platform to view and control the ventilation speed, and a sensors platform to read out the outdoor temperature and humidity, the indoor temperature and humidity, and the extract and supply air flow (in m³ per hour).
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
comfoconnect : host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
The IP or hostname of the ComfoConnect LAN C bridge.
name string ( Optional , default: ComfoAirQ )
The name of this device as you want to see it in Home Assistant.
token string ( Optional )
The token you want to use when registering with the device. This is a random 32 char hexadecimal string.
Default:
00000000000000000000000000000001
user_agent string ( Optional )
The name you want to supply when registering with the device.
Home Assistant
pin integer ( Optional , default: 0000 )
The pin code to use when registering. You only need to change this if you have changed the factory default pin.
To register the sensors, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : comfoconnect resources : - air_flow_exhaust - air_flow_supply - bypass_state - current_humidity - current_rmot - current_temperature - days_to_replace_filter - exhaust_fan_duty - exhaust_fan_speed - exhaust_humidity - exhaust_temperature - outside_humidity - outside_temperature - power_total - power_usage - preheater_power_total - preheater_power_usage - supply_fan_duty - supply_fan_speed - supply_humidity - supply_temperature
The list above indicates all supported sensors. It is recommended to only include the ones you need.
Note
Note that multiple connections to the bridge only work version >= U1.2.6 of the ComfoConnect LAN C bridge.
In older versions it’s not possible to have multiple connections to the bridge at the same time. This integration will then keep the connection open, and if you open the app, it will ask you to disconnect Home Assistant. If you close the app again, Home Assistant will reconnect automatically.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Zehnder ComfoAir Q integration was introduced in Home Assistant 0.48, and it's used by
256 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@michaelarnauts
Categories
Fan
Sensor
Back to top
