# Thomson - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thomson
- Final URL: https://www.home-assistant.io/integrations/thomson
- Canonical URL: https://www.home-assistant.io/integrations/thomson/
- Fetched at: 2026-06-28T03:22:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Thomson routers into Home Assistant.

## Extracted Text

On this page
Thomson produced networking equipment (under the brand name SpeedTouch) till 2010 and was then renamed to Technicolor.
This platform allows you to detect presence by looking at connected devices to a Thomson device.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry device_tracker : - platform : thomson host : YOUR_ROUTER_IP username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your router, e.g., 192.168.1.1.
username string Required
The username of a user with administrative privileges, usually admin .
password string Required
The password for your given admin account.
See the device tracker integration page for instructions how to configure the people to be tracked.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Thomson integration was introduced in Home Assistant 0.7, and it's used by
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
Presence detection
Back to top
