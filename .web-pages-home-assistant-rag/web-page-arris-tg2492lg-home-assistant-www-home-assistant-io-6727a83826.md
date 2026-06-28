# Arris TG2492LG - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/arris_tg2492lg
- Final URL: https://www.home-assistant.io/integrations/arris_tg2492lg
- Canonical URL: https://www.home-assistant.io/integrations/arris_tg2492lg/
- Fetched at: 2026-06-28T02:29:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Arris TG2492LG routers into Home Assistant.

## Extracted Text

On this page
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at connected devices to an Arris TG2492LG router.
This is one of the routers provided by:
Ziggo , a cable operator in the Netherlands, to their customers as the Ziggo Connectbox.
Virgin Media , a cable operator in the United Kingdom and Ireland, to their customers as the Hub 3.
Warning
The router prevents the admin user from logging in twice. This can cause problems with accessing the router’s configuration pages while this platform is active.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : arris_tg2492lg password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string ( Optional )
The IP address of your router. The default value is 192.168.178.1 .
password string Required
The password for your admin account.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Arris TG2492LG hub was introduced in Home Assistant 0.109, and it's used by
3 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vanbalken
Categories
Presence detection
Back to top
