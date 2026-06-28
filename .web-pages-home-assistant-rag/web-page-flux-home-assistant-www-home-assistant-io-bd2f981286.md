---
source_url: "https://www.home-assistant.io/integrations/flux"
final_url: "https://www.home-assistant.io/integrations/flux"
canonical_url: "https://www.home-assistant.io/integrations/flux/"
source_handle: "web:www-home-assistant-io:bd2f981286c7"
source_section: "integrations-flux"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4a60ced13fc4f1646fbe2b810a2d1a6fedf6a2b7c31ebdbca3c460dcf8503eae"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Flux - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flux
- Final URL: https://www.home-assistant.io/integrations/flux
- Canonical URL: https://www.home-assistant.io/integrations/flux/
- Fetched at: 2026-06-28T02:43:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to automate the color temperature of your lights based on the time of day with Home Assistant

## Extracted Text

On this page
Related topics
The Flux integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will change the temperature of your lights similar to the way flux works on your computer, using circadian rhythm. They will be bright during the day, and gradually fade to a red/orange at night. The flux switch restores its last state after startup.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will update your lights based on the time of day. It will only affect lights that are turned on and listed in the flux configuration.
During the day (in between start_time and sunset_time ), it will fade the lights from the start_colortemp to the sunset_colortemp . After sunset (between sunset_time and stop_time ), the lights will fade from the sunset_colortemp to the stop_colortemp . If the lights are still on after the stop_time it will continue to change the light to the stop_colortemp until the light is turned off. The fade effect is created by updating the lights periodically.
The value of sunset_time is automatically calculated based on the location specified in your Home Assistant configuration .
The color temperature is specified in kelvin, and accepted values are between 1000 and 4000 kelvin. Lower values will seem more red, while higher will look more white.
If you want to update at variable intervals, you can leave the switch turned off and use automation rules that use the switch.<name>_update action whenever you want the lights updated, where <name> equals the name: property in the switch configuration.
To use the Flux switch in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry switch : - platform : flux lights : - light.desk - light.lamp
Configuration Variables
Looking for your configuration file?
lights list Required
array list of light entities.
name string ( Optional , default: Flux )
The name to use when displaying this switch.
start_time time ( Optional , default: sunrise )
The start time.
stop_time time ( Optional , default: dusk )
The stop time.
start_colortemp integer ( Optional , default: 4000 )
The color temperature at the start.
sunset_colortemp integer ( Optional , default: 3000 )
The sun set color temperature.
stop_colortemp integer ( Optional , default: 1900 )
The color temperature at the end.
brightness integer ( Optional )
Constant brightness of the lights. Besides color temperature, brightness is also adjusted unless a value is specified here.
disable_brightness_adjust boolean ( Optional , default: false )
If true, brightness will not be adjusted, only color temperature.
mode string ( Optional , default: xy )
Select how color temperature is passed to lights. Valid values are xy , mired (alias to kelvin) and rgb .
transition integer ( Optional , default: 30 )
Transition time in seconds for the light changes (high values may not be supported by all light models).
interval integer ( Optional , default: 30 )
Frequency in seconds at which the lights should be updated.
unique_id string ( Optional )
An ID that uniquely identifies this switch. Set this to a unique value to allow customization through the UI.
Full example of an entry in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : flux lights : - light.desk - light.lamp name : Fluxer start_time : " 7:00" stop_time : " 23:00" start_colortemp : 4000 sunset_colortemp : 3000 stop_colortemp : 1900 brightness : 200 disable_brightness_adjust : true mode : xy transition : 30 interval : 60
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flux integration was introduced in Home Assistant 0.21, and it's used by
552 active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Automation
Back to top
