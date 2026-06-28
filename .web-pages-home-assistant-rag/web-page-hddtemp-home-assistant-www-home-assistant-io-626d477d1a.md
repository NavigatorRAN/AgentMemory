# hddtemp - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hddtemp
- Final URL: https://www.home-assistant.io/integrations/hddtemp
- Canonical URL: https://www.home-assistant.io/integrations/hddtemp/
- Fetched at: 2026-06-28T02:48:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate hard drive temperature information into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The hddtemp integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is using the data provided by HDDTemp .
It required that hddtemp is started or running in daemon mode on a local or remote system.
hddtemp -dF
To set up a HDDTemp to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : hddtemp disks : - /dev/sda1
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: HD Temperature )
Friendly name to use for the frontend.
host string ( Optional , default: localhost )
Host where hddtemp is running.
port integer ( Optional , default: 7634 )
Port that is used by hddtemp .
disks list ( Optional )
Disk to be monitored. Example: /dev/sda1 .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The hddtemp integration was introduced in Home Assistant 0.32, and it's used by
26 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
