# QVR Pro - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qvr_pro
- Final URL: https://www.home-assistant.io/integrations/qvr_pro
- Canonical URL: https://www.home-assistant.io/integrations/qvr_pro/
- Fetched at: 2026-06-28T03:10:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate QVR Pro within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
QVR Pro allows you to create
an independent and expandable surveillance environment on your QNAP NAS. The
qvr_pro integration allows you to view your QVR Pro channels in Home Assistant.
Currently, only cameras are supported by this integration.
To enable QVR Pro integration, add the following to your
configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry qvr_pro : host : YOUR_HOST username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address where QVR Pro is accessible.
username string Required
The username for accessing your QVR account.
password string Required
The password for accessing your QVR account.
port integer ( Optional , default: 8080 )
The port where QVR accepts connections.
exclude_channels list ( Optional )
Comma separated list of channel numbers to be excluded.
Enabling the QVR Pro camera platform will add all QVR Pro channels by
default. Please see exclude_channels if you would like to exclude
specific channels from showing up in Home Assistant.
Important
The QVR Pro user must have Surveillance Management permission.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The QVR Pro integration was introduced in Home Assistant 0.107, and it's used by
40 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@oblogic7
Categories
Camera
Back to top
