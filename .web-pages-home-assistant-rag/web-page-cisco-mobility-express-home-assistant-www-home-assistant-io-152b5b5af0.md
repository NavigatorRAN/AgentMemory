# Cisco Mobility Express - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cisco_mobility_express
- Final URL: https://www.home-assistant.io/integrations/cisco_mobility_express
- Canonical URL: https://www.home-assistant.io/integrations/cisco_mobility_express/
- Fetched at: 2026-06-28T02:33:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Cisco Mobility Express wireless controllers into Home Assistant.

## Extracted Text

On this page
Related topics
This is a presence detection scanner for Cisco Mobility Express wireless controllers.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : cisco_mobility_express host : CONTROLLER_IP_ADDRESS username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your controller, for example, 192.168.10.150 .
username string Required
The username of a user with administrative privileges.
password string Required
The password for your given admin account.
ssl boolean ( Optional , default: false )
Use HTTPS instead of HTTP to connect.
verify_ssl boolean ( Optional , default: true )
Enable or disable SSL certificate verification. Set to false if you have a self-signed SSL certificate and haven’t installed the CA certificate to enable verification.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cisco Mobility Express integration was introduced in Home Assistant 0.90, and it's used by
8 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fbradyirl
Categories
Presence detection
Back to top
