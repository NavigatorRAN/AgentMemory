# VersaSense - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/versasense
- Final URL: https://www.home-assistant.io/integrations/versasense
- Canonical URL: https://www.home-assistant.io/integrations/versasense/
- Fetched at: 2026-06-28T03:26:29Z
- Content type: text/html; charset=UTF-8

## Description

Integrate your VersaSense MicroPnP devices.

## Extracted Text

On this page
Configuration
Supported hardware
Related topics
The VersaSense integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports the VersaSense Edge Gateway. The gateway can control hubs and their peripherals (sensors and actuators) in the mesh network.
To enable VersaSense in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry versasense : host : GATEWAY_URI
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of the VersaSense gateway. Including protocol and port , e.g., https://gateway.versasense.com:8889
All VersaSense gateways with software version >= 1.0.2.10
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is tested with following peripherals and devices:
S03 S04: Temperature and Humidity sensor
S06: Barometric Pressure sensor
S10: Light sensor
S17: Object detection sensor
S19: Buzzer actuator
Pxx: SmartMesh IP Hub
M01: SmartMesh Edge Gateway
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VersaSense integration was introduced in Home Assistant 0.103, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@imstevenxyz
Categories
Hub
Sensor
Switch
Back to top
