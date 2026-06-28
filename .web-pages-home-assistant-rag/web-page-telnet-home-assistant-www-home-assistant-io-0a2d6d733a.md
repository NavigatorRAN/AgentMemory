# Telnet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/telnet
- Final URL: https://www.home-assistant.io/integrations/telnet
- Canonical URL: https://www.home-assistant.io/integrations/telnet/
- Fetched at: 2026-06-28T03:21:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate telnet switches into Home Assistant.

## Extracted Text

On this page
Related topics
The Telnet integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control devices with telnet commands.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : telnet switches : projector : resource : THE_IP_ADDRESS port : 4002 command_on : " PWR ON" command_off : " PWR OFF" command_state : " PWR?" value_template : ' {{ value == "PWR=01" }}' timeout : 0.9
Configuration Variables
Looking for your configuration file?
switches list Required
The array that contains all switches.
identifier list Required
Name of the switch as slug. Multiple entries are possible.
resource string Required
Host name or IP address of the device.
port integer ( Optional , default: 23 )
Port to connect to.
command_on string Required
Command to turn device on.
command_off string Required
Command to turn device off.
command_state string ( Optional )
Command to determine the state of the switch. If not defined the switch will assume successful state changes.
value_template template ( Optional )
The template evaluating to true will indicate that the switch is on.
name string ( Optional )
The name used to display the switch in the frontend.
timeout float ( Optional , default: 0.2 )
How long to wait for a reply after a telnet command is sent.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Telnet integration was introduced in Home Assistant 0.54, and it's used by
207 active installations.
Its IoT class is Local Polling.
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
