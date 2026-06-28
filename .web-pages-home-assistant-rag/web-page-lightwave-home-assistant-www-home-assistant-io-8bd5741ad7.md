# Lightwave - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lightwave
- Final URL: https://www.home-assistant.io/integrations/lightwave
- Canonical URL: https://www.home-assistant.io/integrations/lightwave/
- Fetched at: 2026-06-28T02:56:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Lightwave devices with Home Assistant.

## Extracted Text

On this page
Related topics
The Lightwave integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] links Home Assistant with your Lightwave Connect Series WiFi link for controlling Lightwave lights, switches and TRVs.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is for Connect Series WiFi links and does not support Smart Series devices, for more information see Smart and Connect Series .
To add your Lightwave devices into your Home Assistant installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry lightwave : host : IP_ADDRESS lights : R1D3 : name : Wall lights R1D4 : name : Ceiling lights switches : R1D2 : name : Tree socket R2D1 : name : Radio socket R2D2 : name : Light socket R2D3 : name : Phone socket R2D4 : name : Torch socket
Configuration Variables
Looking for your configuration file?
host string Required
IP address of your Lightwave hub
lights map ( Optional )
List of lights you wish to configure
name string Required
Name of the Light
switches map ( Optional )
List of switches you wish to configure
Name of the Switch
trv map ( Optional )
TRV configuration
proxy_ip string ( Optional , default: 127.0.0.1 )
IP address of a proxy for TRV integration.
proxy_port integer ( Optional , default: 7878 )
IP port address of a proxy for TRV integration.
trvs map ( Optional )
List of TRVs you wish to configure
Name of the TRV
serial string Required
Serial Number of the TRV
Where IP_ADDRESS is the IP address of your Lightwave hub.
Each switch or light requires an id and a name . The id takes the form R#D# where R# is the room number and D# is the device number.
lights and switches are optional but one of these must be present.
The first use of a light or switch will try to register with your Lightwave WiFi Link hub. If the hub has not been registered a message on your hub will be displayed asking you to pair the device. You have 12 seconds to push the button on your hub to accept this. Once done, you should be able to control your lights and switches via Home Assistant. This only needs to be done if the hub has not been registered.
TRVs
Lightwave Thermostatic Radiator Values (TRV) are supported.
Earlier integrations required a proxy - See LWProxy .
This capability is still supported, but no longer required.
# Example TRV configuration.yaml for TRVs lightwave : host : IP_ADDRESS lights : R99D1 : name : Bedroom Light trv : trvs : R1Dh : # The ID of the TRV. name : Bedroom TRV serial : E84902 # Serial number of the TRV - found in the Lightwave App, or website
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lightwave integration was introduced in Home Assistant 0.84, and it's used by
104 active installations.
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
Light
Switch
Back to top
