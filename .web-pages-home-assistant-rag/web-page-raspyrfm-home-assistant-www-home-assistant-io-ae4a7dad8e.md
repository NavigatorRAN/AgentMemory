# RaspyRFM - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/raspyrfm
- Final URL: https://www.home-assistant.io/integrations/raspyrfm
- Canonical URL: https://www.home-assistant.io/integrations/raspyrfm/
- Fetched at: 2026-06-28T03:11:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate RaspyRFM switches into Home Assistant.

## Extracted Text

On this page
Configuration
Device support
Channel configuration
Switch state
Full example
Related topics
The RaspyRFM integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for cheap RC 433 MHz outlets via one of the supported gateways.
Initially, this integration was created to support the Simple Solutions ConnAir gateway which has been discontinued. There are custom alternatives that reimplemented the protocol used by the ConnAir gateway like this ConnAir emulator which can be used in conjunction with the RaspyRFM-II RC module for a Raspberry Pi.
Other vendors of 433 MHz RC outlets have also created gateways that use a very similar protocol and can also be used with this integration like the Intertechno ITGW-433 LAN Gateway .
To use the RaspyRFM integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : platform : raspyrfm switches : - controlunit_manufacturer : Intertechno controlunit_model : CMR 1000 channel_config : # Note that keys used here vary between control units master : A slave : 1
Configuration Variables
Looking for your configuration file?
gateway_manufacturer string ( Optional , default: Seegel Systeme )
Manufacturer of the gateway.
gateway_model string ( Optional , default: RaspyRFM )
Model of the gateway.
host string ( Optional , default: 127.0.0.1 )
Host of the gateway.
port integer ( Optional )
Port of the gateway.
Default:
Depends on the gateway model.
switches list Required
List of switches that can be controlled with this gateway.
name string ( Optional , default: Unnamed Device )
Name for the device.
controlunit_manufacturer string Required
Manufacturer of the control unit.
controlunit_model string Required
Model of the control unit.
channel_config map Required
Channel configuration of the control unit. The exact keys needed depend on the control unit manufacturer and model.
Have a look at the underlying library raspyrfm-client to check what gateways and control units (outlets) are supported.
Depending on the control unit the channel configuration can have varying formats. Have a look at the underlying library raspyrfm-client to find out about a specific model.
Initially, the state of a switch is unknown. When the switch is turned on or off (via frontend) the state is known and will be shown in the frontend.
Note
Note that due to the way those cheap RC units work it is not possible to query their current state . Therefore the only way to preserve a consistent state within Home Assistant is to only use Home Assistant as the controller.
switch : platform : raspyrfm gateway_manufacturer : Seegel Systeme gateway_model : RaspyRFM host : 127.0.0.1 # Optional port : 49880 # Optional switches : - name : My Switch controlunit_manufacturer : Intertechno controlunit_model : CMR 1000 channel_config : master : A slave : 1 - name : My other Switch controlunit_manufacturer : Brennenstuhl controlunit_model : RCS 1000 N Comfort channel_config : 1 : 1 2 : 1 3 : 1 4 : 1 5 : 1 CH : A
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RaspyRFM integration was introduced in Home Assistant 0.85, and it's used by
3 active installations.
Its IoT class is Assumed State.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
