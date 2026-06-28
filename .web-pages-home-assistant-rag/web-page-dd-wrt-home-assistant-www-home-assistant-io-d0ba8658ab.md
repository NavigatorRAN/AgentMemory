# DD-WRT - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ddwrt
- Final URL: https://www.home-assistant.io/integrations/ddwrt
- Canonical URL: https://www.home-assistant.io/integrations/ddwrt/
- Fetched at: 2026-06-28T02:36:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate DD-WRT based routers into Home Assistant.

## Extracted Text

On this page
Related topics
The DD-WRT integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a DD-WRT based router.
To use a DD-WRT router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : ddwrt host : ROUTER_IP_ADDRESS username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your router, for example, 192.168.1.1 .
username string Required
The username of a user with administrative privileges, usually admin .
password string Required
The password for your given admin account.
ssl boolean ( Optional , default: false )
Whether to connect via HTTPS.
verify_ssl boolean ( Optional , default: true )
Disables SSL/TLS verification for HTTPS resources, for example, for self-signed certificates.
wireless_only boolean ( Optional , default: true )
Whether to only list devices that are connected directly to the router via Wi-Fi or include those connected via Ethernet or other networked access points as well.
By default Home Assistant pulls information about connected devices from DD-WRT every 5 seconds.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DD-WRT integration was introduced in Home Assistant pre 0.7, and it's used by
76 active installations.
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
