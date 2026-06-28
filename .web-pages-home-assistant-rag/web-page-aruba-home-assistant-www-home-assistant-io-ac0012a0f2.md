# Aruba - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aruba
- Final URL: https://www.home-assistant.io/integrations/aruba
- Canonical URL: https://www.home-assistant.io/integrations/aruba/
- Fetched at: 2026-06-28T02:29:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Aruba routers into Home Assistant.

## Extracted Text

On this page
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at connected devices to an Aruba Instant device.
Supported devices (tested):
Aruba AP-105
Aruba AP-205
Aruba AP-505
Aruba AP-515
Aruba IAP-315
Aruba IAP-335
Aruba Instant IAP-275
Important
This device tracker needs telnet to be enabled on the router.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : aruba host : YOUR_ROUTER_IP username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your router, e.g., 192.168.1.1 .
username string Required
The username of a user with administrative privileges, usually admin .
password string Required
The password for your given admin account.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Aruba integration was introduced in Home Assistant 0.7, and it's used by
25 active installations.
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
