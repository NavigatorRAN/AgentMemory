# P5 FutureNow - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/futurenow
- Final URL: https://www.home-assistant.io/integrations/futurenow
- Canonical URL: https://www.home-assistant.io/integrations/futurenow/
- Fetched at: 2026-06-28T02:44:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up P5 FutureNow relay/dimmer units as lights within Home Assistant.

## Extracted Text

On this page
Configuration Sample
Extended Configuration Sample
Related topics
The P5 FutureNow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use P5 FutureNow relay/dimmer units as lights. Currently supported units:
FutureNow FNIP-6x2AD dimmer unit (outputs only)
FutureNow FNIP-8x10A relay unit (outputs only)
To use your FutureNow units, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : futurenow driver : FNIP6x10ad host : 192.168.1.101 port : 7078 devices : 5 : name : Dimmer Channel 5 dimmable : true
Configuration Variables
Looking for your configuration file?
driver string Required
Type of the device. Currently FNIP6x10ad or FNIP8x10a .
host string Required
The IP address or hostname of your unit, e.g., 192.168.1.101 .
port string Required
The TCP port, as set in the unit’s settings. Default is 7078 .
devices map Required
List of output channels to set up as lights.
channel_number map Required
Output’s (light) properties.
name string Required
The name of the light.
dimmable boolean ( Optional , default: false )
Set to true to enable dimming (FNIP6x10ad only).
The following example configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] has two different FutureNow units with multiple channels:
# Example configuration.yaml entry light : - platform : futurenow driver : FNIP6x10ad host : 192.168.1.101 port : 7078 devices : 5 : name : Dimmer Channel 5 6 : name : Dimmer Channel 6 dimmable : true - platform : futurenow driver : FNIP8x10a host : 192.168.1.102 port : 7078 devices : 1 : name : Relay Channel 1 2 : name : Relay Channel 2
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The P5 FutureNow integration was introduced in Home Assistant 0.75, and it's used by
3 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
