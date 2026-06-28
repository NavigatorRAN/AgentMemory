# Channels - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/channels
- Final URL: https://www.home-assistant.io/integrations/channels
- Canonical URL: https://www.home-assistant.io/integrations/channels/
- Fetched at: 2026-06-28T02:33:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Channels into Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Related topics
The Channels integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Channels from Home Assistant. Play, pause, seek, or skip commercials on an instance of Channels that is running on your network.
Your favorite channels will appear as sources in the Source List in Home Assistant.
To add Channels to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : channels name : Family Room Channels host : 192.168.1.50
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the device running Channels, for example, 192.168.1.50 .
port integer ( Optional , default: 57000 )
The port where Channels is accessible.
name string ( Optional , default: Channels )
The name of the Channels instance in Home Assistant, for example, Family Room Channels .
The Channels integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Seek backward ( channels.seek_backward )
Seeks backward by the number of seconds set in the Channels app.
Seek by ( channels.seek_by )
Seeks forward or backward by a number of seconds.
Seek forward ( channels.seek_forward )
Seeks forward by the number of seconds set in the Channels app.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Channels integration was introduced in Home Assistant 0.65, and it's used by
90 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
