# Google Wifi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_wifi
- Final URL: https://www.home-assistant.io/integrations/google_wifi
- Canonical URL: https://www.home-assistant.io/integrations/google_wifi/
- Fetched at: 2026-06-28T02:47:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Google Wifi/OnHub routers into Home Assistant.

## Extracted Text

On this page
Related topics
The Google Wifi integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is displaying the exposed status of a Google Wifi (or OnHub) router.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can report network status, up-time, current IP address and firmware versions.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : google_wifi
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: testwifi.here )
The address to retrieve status from the router. Valid options are testwifi.here , in some cases onhub.here or the router’s IP address such as 192.168.86.1.
name string ( Optional , default: google_wifi )
Name to give the Google Wifi sensor.
monitored_conditions list ( Optional )
Defines the data to monitor as sensors. Defaults to all of the listed options below.
current_version
Current firmware version of the router.
new_version
Latest available firmware version. If router is up-to-date, this value shows to Latest .
uptime
Days since router has been turned on.
last_restart
Date of last restart. Format is YYYY-MM-DD HH:mm:SS .
local_ip
Local public IP address.
status
Reports whether the router is or is not connected to the internet.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Wifi integration was introduced in Home Assistant 0.50, and it's used by
651 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
