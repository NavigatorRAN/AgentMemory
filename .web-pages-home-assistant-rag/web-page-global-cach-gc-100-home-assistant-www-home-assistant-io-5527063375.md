# Global Caché GC-100 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gc100
- Final URL: https://www.home-assistant.io/integrations/gc100
- Canonical URL: https://www.home-assistant.io/integrations/gc100/
- Fetched at: 2026-06-28T02:45:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate gc100 with Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
Switch
Related topics
The Global Caché GC-100 can be integrated into Home Assistant. GC-100 is a TCP-controllable
hardware device which has an array of relays, RS232 serial ports, and flexible ports which can be programmed to be either digital inputs or IR blaster outputs. There are a variety of submodels of the GC-100 which have different amounts of each I/O type.
There is currently support for the following device types within Home Assistant:
Currently, only relays and ports configured to be digital inputs are supported in Home Assistant. For IR support, please use the iTach remote platform , but note that it will likely not function concurrently on the same GC100 due to limitations in the TCP socket server implementation used by Global Caché.
To enable this device, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry gc100 : host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of your GC100 device.
port integer ( Optional , default: 4998 )
The port on which the GC100 is listening.
To enable this sensor, you first have to set up gc100 , and add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : gc100 ports : - ' 3:1' : Doorchime - ' 3:2' : Garage Obstruction
ports list Required
A list of module-address to name mappings in the format 'x:y': name , where x is module #, y is address.
This allows you to control and monitor the relay state on your GC100.
To enable this switch, you first have to set up gc100 , and add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry switch : - platform : gc100 ports : - ' 4:1' : Siren - ' 4:2' : Sprinkler
A list of module-address to name mappings in the format ‘x:y’: name, where x is module #, y is address.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Global Caché GC-100 integration was introduced in Home Assistant 0.57, and it's used by
4 active installations.
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
