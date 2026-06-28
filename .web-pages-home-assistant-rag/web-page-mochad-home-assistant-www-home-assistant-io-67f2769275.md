# Mochad - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mochad
- Final URL: https://www.home-assistant.io/integrations/mochad
- Canonical URL: https://www.home-assistant.io/integrations/mochad/
- Fetched at: 2026-06-28T03:00:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Mochad into Home Assistant.

## Extracted Text

On this page
Configuration
Example
Light
Switch
Related topics
The Mochad integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the main integration to integrate all X10 platforms being controlled by mochad . Besides this integration you will have to set up your X10 devices separately.
There is currently support for the following device types within Home Assistant:
To integrate your Mochad units with Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry mochad :
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The host that mochad is running on.
port integer ( Optional , default: 1099 )
The port that mochad is running on.
A full configuration sample could look like the one below:
# Example configuration.yaml entry mochad : host : localhost port : 1099
The mochad light platform lets you control an X10 enabled dimmer/light device.
To enable this sensor, you first have to set up the mochad integration and then add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry light : - platform : mochad devices : - address : a1 - address : a5
address string Required
The X10 address of the light.
name string ( Optional , default: x10_light_dev_address )
The name of the light.
comm_type string ( Optional , default: pl )
pl (powerline) or rf (radio frequency).
brightness_levels integer ( Optional , default: 32 )
The number of brightness levels the X10 light device supports. This can either be 32, 64, or 256 (note that the max value sent to the device will be n-1 because it starts at 0).
The mochad switch platform lets you control an X10 enabled switch device.
# Example configuration.yaml entry switch : - platform : mochad devices : - address : a1 - address : a5
The X10 address of the switch.
name string ( Optional )
The name of the switch.
Default:
x10_switch_dev_ address
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mochad integration was introduced in Home Assistant 0.32, and it's used by
33 active installations.
Its IoT class is Local Polling.
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
