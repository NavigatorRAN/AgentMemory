# Ubiquiti UniFi Video - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/uvc
- Final URL: https://www.home-assistant.io/integrations/uvc
- Canonical URL: https://www.home-assistant.io/integrations/uvc/
- Fetched at: 2026-06-28T03:25:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate UVC cameras within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Ubiquiti UniFi Video integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate UniFi Video Camera (UVC) into Home Assistant.
The platform connects to the UniFi NVR software and automatically discovers/adds any camera connected to the NVR.
It is recommended that you create a new user for this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in the NVR software and only give the user the permissions it need to operate.
The API key is found in User -> My account -> API Access in the NVR software.
The camera password is found in Settings -> Camera Settings -> Camera Password in the NVR software.
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry camera : - platform : uvc nvr : IP_ADDRESS key : API_KEY
Configuration Variables
Looking for your configuration file?
nvr string Required
The IP or hostname of the NVR (Network Video Recorder) server.
port integer ( Optional , default: 7080 )
The port number to use for accessing the NVR.
key string Required
The API key available from the NVR web interface.
password string ( Optional , default: ubnt )
The camera password.
ssl boolean ( Optional , default: false )
Should use SSL/TLS to connect to the NVR.
Important
When using an API_KEY to access cameras controlled by Ubiquiti’s NVR Software, the associated user account MUST have at least Administrator privileges within the NVR Software in order for new cameras to be added into Home Assistant. Once the entities have been created in Home Assistant, privileges for the user account can be lowered.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ubiquiti UniFi Video integration was introduced in Home Assistant 0.13, and it's used by
28 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Camera
Back to top
