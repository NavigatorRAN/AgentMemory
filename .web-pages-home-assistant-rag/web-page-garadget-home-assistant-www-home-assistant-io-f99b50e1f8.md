# Garadget - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/garadget
- Final URL: https://www.home-assistant.io/integrations/garadget
- Canonical URL: https://www.home-assistant.io/integrations/garadget/
- Fetched at: 2026-06-28T02:45:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Garadget covers within Home Assistant.

## Extracted Text

On this page
Configuration
Example
Related topics
The Garadget integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Garadget garage door futurizers through Home Assistant.
To enable Garadget Covers in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry cover : - platform : garadget covers : first_garage : device : 190028001947343412342341 username : YOUR_USERNAME password : YOUR_PASSWORD name : first_garage second_garage : device : 4c003f001151353432134214 access_token : df4cc785ff818f2b01396c44142342fccdef name : second_garage
Configuration Variables
Looking for your configuration file?
covers list Required
List of your doors.
device string Required
This is the device id from your Garadget portal. It can be found in the Settings section of the Garadget website or mobile application.
username string ( Optional )
Your Garadget account username. Use with password to obtain the access_token automatically.
password string ( Optional )
Your Garadget account password. Use with username to obtain the access_token automatically.
access_token string ( Optional )
A generated access_token from your Garadget account. To obtain an access_token , use the network tab of the developer tools for your web browser while logged into the Garadget website. When supplied, the username and password values are not required.
name string ( Optional , default: Garadget )
Name to use in the frontend, will use name configured in Garadget otherwise.
# Related configuration.yaml entry cover : - platform : garadget covers : garadget : device : 190028001947343412342341 access_token : !secret garadget_access_token name : Garage door template : - sensor : - name : Garage door state state : " {{ states('cover.garage_door') }}" - name : Garage door state since state : " {{ state_attr('cover.garage_door', 'time_in_state') }}" - name : Garage door WiFi signal strength state : " {{ state_attr('cover.garage_door', 'wifi_signal_strength') }}" unit_of_measurement : " dB" group : garage_door : name : Garage door entities : - cover.garage_door - sensor.garage_door_status - sensor.garage_door_time_in_state - sensor.garage_door_wifi_signal_strength customize : sensor.garage_door_time_in_state : icon : mdi:timer-sand sensor.garage_door_wifi_signal_strength : icon : mdi:wifi
Some of the Garadget sensors can create a lot of clutter in the Activity section. Use this section of code in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] to exclude those entries.
logbook : exclude : entities : - sensor.garage_door_time_in_state - sensor.garage_door_wifi_signal_strength
As of firmware release 1.17 the garadget device has native support for MQTT. The options allow the end-user to configure the device in the following ways ‘cloud only’, ‘cloud and MQTT’ or ‘MQTT only’.
For configuration of the garadget as an MQTT cover:
mqtt : cover : - name : " Garage Door" command_topic : " garadget/device_name/command" state_topic : " garadget/device_name/status" payload_open : " open" payload_close : " close" payload_stop : " stop" value_template : " {{ value_json.status }}" sensor : - name : " Garage Door Since" state_topic : " garadget/device_name/status" value_template : ' {{ value_json.time }}' - name : " Large Garage Door Brightness" state_topic : " garadget/device_name/status" unit_of_measurement : ' %' value_template : ' {{ value_json.bright }}'
Replace device_name with the name of the device provided when configuring garadget.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Garadget integration was introduced in Home Assistant 0.32, and it's used by
37 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Cover
Back to top
