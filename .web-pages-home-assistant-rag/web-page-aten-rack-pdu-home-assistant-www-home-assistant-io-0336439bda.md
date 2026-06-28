# ATEN Rack PDU - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aten_pe
- Final URL: https://www.home-assistant.io/integrations/aten_pe
- Canonical URL: https://www.home-assistant.io/integrations/aten_pe/
- Fetched at: 2026-06-28T02:29:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ATEN Rack PDUs into Home Assistant.

## Extracted Text

On this page
Related topics
The ATEN Rack PDU integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control ATEN Rack PDUs from Home Assistant.
To use it, SNMP must be enabled on your PDU. It is recommended to use SNMPv3 to protect your credentials from eavesdropping.
Tested devices:
PE8324G
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
file:
switch : - platform : aten_pe host : 192.168.0.60
Configuration Variables
Looking for your configuration file?
host string Required
The IP/host which to control.
port string ( Optional , default: 161 )
The port on which to communicate.
community string ( Optional , default: private )
community string to use for authentication (SNMP v1 and v2c).
username string ( Optional , default: administrator )
Username to use for authentication.
auth_key string ( Optional )
Authentication key to use for SNMP v3.
priv_key string ( Optional )
Privacy key to use for SNMP v3.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ATEN Rack PDU integration was introduced in Home Assistant 0.103, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mtdcr
Categories
Switch
Back to top
