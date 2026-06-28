# The Energy Detective TED5000 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ted5000
- Final URL: https://www.home-assistant.io/integrations/ted5000
- Canonical URL: https://www.home-assistant.io/integrations/ted5000/
- Fetched at: 2026-06-28T03:21:07Z
- Content type: text/html; charset=UTF-8

## Description

How to add a TED5000 to Home Assistant.

## Extracted Text

On this page
Related topics
The The Energy Detective TED5000 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors electricity consumption/production by connecting to the TED gateway, itself connected to one or several Measuring Transmitting Units (MTU). The platform creates up to two sensors per MTU, one for Wattage the other for Voltage.
If you want to enable the ted5000 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : ted5000 host : 192.168.1.100
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your ted gateway.
port integer ( Optional , default: 80 )
The port of your ted gateway.
name string ( Optional , default: ted )
Name of the ted gateway.
For each plugged MTU, using an index starting at 1, the platform creates 2 sensors:
sensor.<name>_mtu<MTU id>_power sensor.<name>_mtu<MTU id>_voltage
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The The Energy Detective TED5000 integration was introduced in Home Assistant 0.30, and it's used by
20 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Energy
Back to top
