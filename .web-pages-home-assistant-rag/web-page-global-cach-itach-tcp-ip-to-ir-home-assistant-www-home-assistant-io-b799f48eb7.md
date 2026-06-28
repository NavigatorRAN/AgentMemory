# Global Caché iTach TCP/IP to IR - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/itach
- Final URL: https://www.home-assistant.io/integrations/itach
- Canonical URL: https://www.home-assistant.io/integrations/itach/
- Fetched at: 2026-06-28T02:53:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Global Caché iTach IP2IR gateway into Home Assistant.

## Extracted Text

On this page
Related topics
The Global Caché iTach TCP/IP to IR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control IR devices with a Global Caché iTach Device and GC-100 devices. The Global Cache IR API are similar across their product line. See API documentation links at the end of this page.
To use the digital input (binary sensor) and relay (switch) features of your Global Cache device you will need to use the gc100 integration and associated platforms.
To use your iTach remote in your installation, you will need to know the IR commands for your devices in Pronto hex format and add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry remote : - platform : itach host : itach023fdc devices : - name : TV connaddr : 2 ir_count : 3 commands : - name : " ON" data : " 0000 006D 0000 0022 00AC 00AC 0015 0040 0015 0040 0015 0040 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0040 0015 0040 0015 0040 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0040 0015 0015 0015 0015 0015 0040 0015 0040 0015 0015 0015 0015 0015 0040 0015 0015 0015 0040 0015 0040 0015 0015 0015 0015 0015 0040 0015 0040 0015 0015 0015 0689" - name : " OFF" data : " 0000 006D 0000 0022 00AC 00AC 0015 0040 0015 0040 0015 0040 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0040 0015 0040 0015 0040 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0015 0040 0015 0040 0015 0015 0015 0015 0015 0040 0015 0040 0015 0040 0015 0040 0015 0015 0015 0015 0015 0040 0015 0040 0015 0015 0015 0689"
Configuration Variables
Looking for your configuration file?
host string Required
The iTach’s IP address.
port integer ( Optional , default: 4998 )
The iTach’s port.
devices list Required
Devices controlled by the iTach.
name string Required
Name of the device.
modaddr integer ( Optional , default: 1 )
iTach module address for the IR emitter.
connaddr integer Required
iTach connection location for the IR emitter. (Note connaddr is a misleading label. Do not put the connection address here. Technically the connection address is the combination of the module address plus the connection location).
ir_count integer ( Optional , default: 1 )
Number of times the command payload will be repeated for a single command send.
commands list Required
Commands available to send to the device.
Command name.
data string Required
Hex command data.
An example to call the integration from developer tools using the remote.send_command action: { "entity_id":"remote.tv", "command":"menu" }
Note: Global Cache devices expect data in their own format of “sendir…”. This integration converts hex code to Global Cache IR form.
API Documentation:
iTach
GC-100
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Global Caché iTach TCP/IP to IR integration was introduced in Home Assistant 0.39, and it's used by
142 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Remote
Back to top
