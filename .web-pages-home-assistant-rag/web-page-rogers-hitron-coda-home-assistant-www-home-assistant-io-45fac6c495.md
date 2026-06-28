# Rogers Hitron CODA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hitron_coda
- Final URL: https://www.home-assistant.io/integrations/hitron_coda
- Canonical URL: https://www.home-assistant.io/integrations/hitron_coda/
- Fetched at: 2026-06-28T02:49:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Hitron CODA Routers into Home Assistant.

## Extracted Text

On this page
The Rogers Hitron CODA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by examining devices connected to a Rogers Hitron CODA
or Shaw Hitron CGNM Router.
To use a Hitron router in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : hitron_coda host : !secret router_ip username : !secret router_username password : !secret router_password type : rogers
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your router, e.g., 192.168.0.1 .
username string Required
The username to log in to the router (user should have read access to the web interface of the router). Usually “cusadmin”.
password string Required
The password for the specified username. Usually your Wi-Fi password.
type string ( Optional )
The internet provider for the modem; “rogers” or “shaw”. Defaults to “rogers”.
See the device tracker integration page for instructions how to configure the people to be tracked.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rogers Hitron CODA integration was introduced in Home Assistant 0.58, and it's used by
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
