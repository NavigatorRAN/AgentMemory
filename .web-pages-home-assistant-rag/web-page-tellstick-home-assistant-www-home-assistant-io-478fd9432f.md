---
source_url: "https://www.home-assistant.io/integrations/tellstick"
final_url: "https://www.home-assistant.io/integrations/tellstick"
canonical_url: "https://www.home-assistant.io/integrations/tellstick/"
source_handle: "web:www-home-assistant-io:478fd9432f0d"
source_section: "integrations-tellstick"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a4782ab268de1ff879a9de6af9ada0863603d326db82ce4ec51786a111950d0d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# TellStick - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tellstick
- Final URL: https://www.home-assistant.io/integrations/tellstick
- Canonical URL: https://www.home-assistant.io/integrations/tellstick/
- Fetched at: 2026-06-28T03:21:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your TellStick into Home Assistant.

## Extracted Text

On this page
Configuration
Cover
Light
Sensor
Examples
Full configuration
Switch
Related topics
The TellStick integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates TellStick devices into Home Assistant. This integration allows users to add switches, lights, and sensors which are communicating with 433 MHz. There are several vendors (Capidi Elro, Intertechno, Nexa, Proove, Sartano, and Viking) who are selling products that work with TellStick. For more details, please check the TellStick protocol list .
There is currently support for the following device types within Home Assistant:
To get started, add the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tellstick :
There is a TellStick app for Home Assistant (formerly known as TellStick add-on) available in the Home Assistant app store.
# Example configuration.yaml entry with the TellStick app tellstick : host : core-tellstick port : [ 50800 , 50801 ]
Configuration Variables
Looking for your configuration file?
signal_repetitions integer ( Optional , default: 1 )
Because the TellStick sends its actions via radio and from most receivers it’s impossible to know if the signal was received or not. Therefore you can configure the switch and light to try to send each signal repeatedly.
host string ( Inclusive )
If you run TellStick on another server or with the TellStick app for Home Assistant.
port list ( Inclusive )
Needed with the host configuration variable. Must be port pair, for example [50800, 50801] .
This tellstick cover platform allows you to control your TellStick covers.
To use your TellStick device, you first have to set up your Tellstick hub and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry cover : - platform : tellstick
This tellstick light platform allows you to control your TellStick dimmers.
# Example configuration.yaml entry light : platform : tellstick
The tellstick sensor platform allows you to get current meteorological data from a TellStick device.
# Example configuration.yaml entry sensor : - platform : tellstick
sensor string ( Optional )
Entry for a sensor with the ID and its name, e.g., ID: Name.
only_named list ( Optional , default: false )
Only add and include specified sensors. If this is not specified all sensors will be imported and the names will be based on each sensor’s ID number.
id integer Required
The ID-number of the sensor to include.
name string Required
Specify the name of the selected sensor.
protocol string ( Optional )
The protocol that the sensor uses. Can be used if id isn’t unique enough.
model string ( Optional )
The model that the sensor uses. Can be used if id and protocol isn’t unique enough.
temperature_scale string ( Optional , default: °C )
The scale of the temperature value.
datatype_mask integer ( Optional , default: 127 )
Mask to determine which sensor values to show based on. Please check the TellCore tellcore.constants documentation for details.
In this section you find some real-life examples of how to use this sensor.
# Example configuration.yaml entry sensor : - platform : tellstick temperature_scale : " °C" datatype_mask : 1 only_named : - id : 135 name : Outside - id : 21 name : Inside protocol : mandolyn - id : 44 name : In between protocol : fineoffset model : temperaturehumidity
This tellstick switch platform allows you to control TellStick devices.
# Example configuration.yaml entry switch : - platform : tellstick
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TellStick integration was introduced in Home Assistant pre 0.7, and it's used by
103 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
