---
source_url: "https://www.home-assistant.io/integrations/xs1"
final_url: "https://www.home-assistant.io/integrations/xs1"
canonical_url: "https://www.home-assistant.io/integrations/xs1/"
source_handle: "web:www-home-assistant-io:b1e69c9c881a"
source_section: "integrations-xs1"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cb2c706c29536619520ae7842fa94365a380947b2a521fe8319e53076b5c3298"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# EZcontrol XS1 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xs1
- Final URL: https://www.home-assistant.io/integrations/xs1
- Canonical URL: https://www.home-assistant.io/integrations/xs1/
- Fetched at: 2026-06-28T03:29:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an XS1 Gateway within Home Assistant.

## Extracted Text

On this page
Configuration
Supported device types
Sensors
Actuators
Climate actuator/sensor
Examples
Full configuration
Related topics
The EZcontrol XS1 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to observe and control devices configured on the XS1 Gateway. Please have a look at the official documentation for using this gateway Bedienungsanleitung v3.0.0.0 .
Add the following entry to the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry xs1 : host : " 192.168.2.100"
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will automatically detect the configuration of the XS1 Gateway only on initialization which currently means when Home Assistant boots. When you change the configuration of the XS1 you (currently) have to restart Home Assistant to see the effects.
Configuration Variables
Looking for your configuration file?
host string Required
Host of the XS1 Gateway.
port integer ( Optional , default: 80 )
Custom port if you are running your gateway behind some kind of proxy.
ssl boolean ( Optional , default: false )
Defines if https should be used for API requests (only possible via your own proxy).
username string ( Optional )
User to access XS1 web API.
password string ( Optional )
Password to access XS1 web API.
Note
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] currently only covers part of the device types supported by the XS1 gateway, unsupported types are simply ignored.
Any type of sensor is supported.
If you are using climate devices the “current temp” sensor will be automatically used by the actuator (if named correctly). To make this work have a look at the actuator description below.
Type Supported Notes switch Yes dimmer Partly Dimmers are currently handled like switches so actual dimming is not supported :( temperature Yes
Home Assistant can combine temperature sensors and climate actuators into a single device. The XS1 gateway does not allow this, but a sensor and actuator can be configured separately. To make Home Assistant register them in the same climate device just prefix the sensor name with the actuator name on the XS1 gateway configuration, f.ex:
Actuator device name: “Bedroom_Temp”
Sensor device name: “Bedroom_Temp_Sensor”
In this section, you find some real-life examples of how to use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
This example shows how you can use the optional configuration options.
# Example configuration.yaml entry xs1 : host : " 192.168.2.100" port : 80 ssl : false username : myuser password : 123totallySecure
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EZcontrol XS1 integration was introduced in Home Assistant 0.88, and it's used by
12 active installations.
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
Hub
Sensor
Switch
Back to top
