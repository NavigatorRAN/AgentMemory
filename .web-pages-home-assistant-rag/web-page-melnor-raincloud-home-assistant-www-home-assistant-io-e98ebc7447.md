# Melnor RainCloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/raincloud
- Final URL: https://www.home-assistant.io/integrations/raincloud
- Canonical URL: https://www.home-assistant.io/integrations/raincloud/
- Fetched at: 2026-06-28T03:11:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Melnor Raincloud sprinkler system within Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensor
Sensor
Switch
Related topics
The Melnor RainCloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Melnor RainCloud sprinkler system in Home Assistant.
There is currently support for the following device types within Home Assistant:
To enable it, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry raincloud : username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
The username for accessing your Melnor RainCloud account.
password string Required
The password for accessing your Melnor RainCloud account.
Once you have enabled the Raincloud integration , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : raincloud
monitored_conditions list ( Optional )
Conditions to display in the frontend. The following conditions can be monitored.
Default:
If not specified, all conditions below will be enabled.
is_watering
Return if is currently watering per zone.
status
Return status from the Melnor RainCloud Controller and Melnor RainCloud Faucet.
# Example configuration.yaml entry sensor : - platform : raincloud
battery
Return the battery level the Melnor RainCloud faucet.
next_cycle
Return the next schedulle watering cycle per zone.
rain_delay
Return the number of days the automatic watering will be delayed due to raining per zone.
watering_time
Return the watering remaining minutes per zone.
# Example configuration.yaml entry switch : - platform : raincloud
watering_minutes integer ( Optional , default: 15 )
Value in minutes to watering your garden via frontend. The values allowed are: 5, 10, 15, 30, 45, 60.
Conditions to display in the frontend. If not specified, all conditions below will be enabled by default.
auto_watering
Toggle the watering scheduled per zone.
manual_watering
Toggle manually the watering per zone. It will inherent the value in minutes specified on the RainCloud hub integration.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Melnor RainCloud integration was introduced in Home Assistant 0.55, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vanstinator
Categories
Irrigation
Back to top
