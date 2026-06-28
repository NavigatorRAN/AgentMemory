# Linux Battery - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/linux_battery
- Final URL: https://www.home-assistant.io/integrations/linux_battery
- Canonical URL: https://www.home-assistant.io/integrations/linux_battery/
- Fetched at: 2026-06-28T02:56:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Linux Battery information into Home Assistant.

## Extracted Text

On this page
Related topics
The Linux Battery integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is using the information stored in /sys/class/power_supply/ on your local Linux system to display details about the current state of your battery.
To set up a battery sensor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : linux_battery
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: Battery )
Friendly name to use for the frontend.
battery integer ( Optional , default: 1 )
Number of the battery.
system string ( Optional , default: linux )
The local system type. Support linux and android .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Linux Battery integration was introduced in Home Assistant 0.28, and it's used by
163 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
System monitor
Back to top
