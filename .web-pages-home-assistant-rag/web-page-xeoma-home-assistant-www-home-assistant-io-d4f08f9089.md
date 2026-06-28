# Xeoma - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xeoma
- Final URL: https://www.home-assistant.io/integrations/xeoma
- Canonical URL: https://www.home-assistant.io/integrations/xeoma/
- Fetched at: 2026-06-28T03:29:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate camera video feeds from a Xeoma server in Home Assistant

## Extracted Text

On this page
Configuration
Full example
Related topics
The Xeoma integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view the video feeds from a Xeoma video surveillance server.
To enable Xeoma camera feeds, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry camera : - platform : xeoma host : http://localhost:10090
Configuration Variables
Looking for your configuration file?
host string Required
The URL of the Xeoma server’s web interface.
username string ( Optional )
The username used to access the Xeoma server’s web interface.
password string ( Optional )
The password used to access the Xeoma server’s web interface.
new_version boolean ( Optional , default: true )
Set to false if the Xeoma server version is 17.5 or earlier.
cameras list ( Optional )
List of customizations for individual Xeoma cameras.
image_name string Required
The name of the JPEG image for this camera as configured in Xeoma (without .jpg extension).
name string ( Optional )
The name to display in the frontend for this camera.
Default:
The image_name for this camera.
hide boolean ( Optional , default: false )
Don’t show this camera in Home Assistant.
# Example configuration.yaml entry camera : - platform : xeoma host : http://localhost:10090 username : user password : secretpassword new_version : false cameras : - image_name : front_porch name : Front Porch - image_name : back_patio hide : true
To use this platform, you must have the Xeoma Web Server module enabled in at least one of your camera chains.
This platform will parse the Xeoma web interface to find all enabled cameras and add them all to Home Assistant. You can hide individual cameras using the platform configuration.
The image_name configuration value for each camera should match the name supplied to the Xeoma Web Server configuration (under Path to access images ) with the .jpg extension removed.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Xeoma integration was introduced in Home Assistant 0.62, and it's used by
3 active installations.
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
