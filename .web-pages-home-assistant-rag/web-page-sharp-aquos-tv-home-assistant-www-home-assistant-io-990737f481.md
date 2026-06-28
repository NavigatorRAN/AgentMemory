# Sharp Aquos TV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aquostv
- Final URL: https://www.home-assistant.io/integrations/aquostv
- Canonical URL: https://www.home-assistant.io/integrations/aquostv/
- Fetched at: 2026-06-28T02:29:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Sharp Aquos TV into Home Assistant.

## Extracted Text

On this page
Configuration
Currently known supported models
Related topics
The Sharp Aquos TV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Sharp Aquos TV .
When the TV is first connected, you will need to accept Home Assistant on the TV to allow communication.
To add a TV to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : aquostv host : 192.168.0.10
Configuration Variables
Looking for your configuration file?
host string Required
The IP/Hostname of the Sharp Aquos TV, e.g., 192.168.0.10 .
port integer ( Optional , default: 10002 )
The port of the Sharp Aquos TV.
username string ( Optional , default: admin )
The username of the Sharp Aquos TV.
password string ( Optional , default: password )
The password of the Sharp Aquos TV.
name string ( Optional )
The name you would like to give to the Sharp Aquos TV.
power_on_enabled boolean ( Optional , default: false )
If you want to be able to turn on your TV.
Important
When you set power_on_enabled as True, you have to turn on your TV on the first time with the remote.
Then you will be able to turn on with Home Assistant.
Also, with power_on_enabled as True, the Aquos logo on your TV will stay on when you turn off the TV and your TV could consume more power.
LC-40LE830U
LC-40CFE6242E (no volume control, not fully tested but able to poll state)
LC-46LE830U
LC-52LE830U
LC-60LE830U
LC-60LE635 (no volume control)
LC-52LE925UN
LC-60LE925UN
LC-60LE857U
LC-60EQ10U
LC-60SQ15U
LC-50US40 (no volume control, not fully tested)
LC-70LE650U
LC-70LE747E (no volume control)
LC-60LE650U
LC-80LE632U
If your model is not on the list, give it a test. If everything works correctly, then add it to the list on GitHub .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sharp Aquos TV integration was introduced in Home Assistant 0.35, and it's used by
135 active installations.
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
