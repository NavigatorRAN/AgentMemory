# Hikvision - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hikvisioncam
- Final URL: https://www.home-assistant.io/integrations/hikvisioncam
- Canonical URL: https://www.home-assistant.io/integrations/hikvisioncam/
- Fetched at: 2026-06-28T02:48:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Hikvision camera switches into Home Assistant.

## Extracted Text

On this page
Related topics
This Hikvision integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your motion detection setting on your Hikvision camera.
Important
Currently works using default HTTPS port only.
To use your Hikvision cam in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : hikvisioncam host : 192.168.1.32
In the Hikvision camera settings you also need to make a few changes:
In the camera menu navigate to Network >> Advanced Settings >> Integration Protocol. Check the ‘Enable Hikvision-CGI’ box and set the ‘Hikvision-CGI Authentication’ to ‘digest/basic’.
Make sure the camera user has the rights to change parameter settings. In the menu navigate to System Settings >> User Management >> User Management. Select the correct user, click ‘Modify’ en check the ‘Remote: Parameters Settings’ box.
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your Hikvision camera, e.g., 192.168.1.32 .
port integer ( Optional , default: 80 )
The port to connect to your Hikvision camera.
name string ( Optional )
This parameter allows you to override the name of your camera.
Default:
Hikvision Camera Motion Detection
username string ( Optional , default: admin )
The username for accessing your Hikvision camera.
password string ( Optional , default: 12345 )
The password to access your Hikvision camera.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hikvision integration was introduced in Home Assistant pre 0.7, and it's used by
216 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fbradyirl
Categories
Switch
Back to top
