# UniFi AP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/unifi_direct
- Final URL: https://www.home-assistant.io/integrations/unifi_direct
- Canonical URL: https://www.home-assistant.io/integrations/unifi_direct/
- Fetched at: 2026-06-28T03:24:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use a Unifi WAP as a device tracker.

## Extracted Text

On this page
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at devices connected to a UniFi AP . This device tracker differs from Ubiquiti UniFi because it doesn’t require the UniFi Network application.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : unifi_direct host : YOUR_AP_IP_ADDRESS username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of your UniFi AP.
username string Required
The SSH device username used to connect to your UniFi AP.
password string Required
The SSH device password used to connect to your UniFi AP.
See the device tracker integration page for instructions how to configure the people to be tracked.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UniFi AP integration was introduced in Home Assistant 0.59, and it's used by
179 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tofuSCHNITZEL
Categories
Presence detection
Back to top
