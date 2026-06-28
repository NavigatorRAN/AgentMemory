# Clementine Music Player - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/clementine
- Final URL: https://www.home-assistant.io/integrations/clementine
- Canonical URL: https://www.home-assistant.io/integrations/clementine/
- Fetched at: 2026-06-28T02:33:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Clementine Music Player within Home Assistant.

## Extracted Text

On this page
Related topics
The Clementine Music Player integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Clementine Music Player .
To add a Clementine Player to your Home Assistant installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : clementine host : 192.168.0.20
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the Clementine Player, for example, 192.168.0.20 .
port integer ( Optional , default: 5500 )
The remote control port.
access_token integer ( Optional )
The authorization code needed to connect.
name string ( Optional , default: Clementine Remote )
The name you would like to give to the Clementine player.
Remember that Clementine must be configured to accept connections through its network remote control protocol.
You can configure this through Clementine Tools > Preferences > Network remote control configuration menu. Enable Use network remote control and configure the other options for your use case.
This integration does not implement the play_media action so you cannot add tracks to the playlist.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Clementine Music Player integration was introduced in Home Assistant 0.39, and it's used by
0 active installations.
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
