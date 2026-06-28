# MQTT room presence - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mqtt_room
- Final URL: https://www.home-assistant.io/integrations/mqtt_room
- Canonical URL: https://www.home-assistant.io/integrations/mqtt_room/
- Fetched at: 2026-06-28T03:01:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to track room presence within Home Assistant.

## Extracted Text

On this page
Configuration
Usage
Setting up clients
Related topics
The MQTT room presence integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect the indoor location of devices using MQTT clients.
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : mqtt_room device_id : 123testid state_topic : " espresense/devices/123testid"
Configuration Variables
Looking for your configuration file?
away_timeout integer ( Optional , default: 0 )
The time in seconds after which the state should be set to not_home if there were no updates. 0 disables the check.
device_id string Required
The device id to track for this sensor.
name string ( Optional , default: Room Sensor )
The name of the sensor.
state_topic string Required
The topic that contains all subtopics for the rooms.
timeout integer ( Optional , default: 5 )
The time in seconds after which a room presence state is considered old. An example: device1 is reported at scanner1 with a distance of 1. No further updates are sent from scanner1. After 5 seconds scanner2 reports device1 with a distance of 2. The old location info is discarded in favor of the new scanner2 information as the timeout has passed.
unique_id string ( Optional )
An ID that uniquely identifies this room sensor. If two sensors have the same unique ID, Home Assistant will raise an exception.
Example JSON that should be published to the room topics:
{ "id" : "123testid" , "name" : "Test Device" , "distance" : 5.678 }
This integration works with any software that is sending data in the given format. Each client should post the discovered devices in its own subtopic of the configured topic.
Instead of developing your own application, you can also use any of these already existing clients:
ESPresense : Fork of ESP32-MQTT-room w/ fingerprinting, tile support, Kalman filter, based on C++/Platformio
ESP-32-BLE-Scanner for Home Assistant : ESP32 based BLE presence detection for Home Assistant with web GUI
room-assistant : looks for Bluetooth LE beacons, based on Node.js
Happy Bubbles Presence Server : presence detection server for Happy Bubbles BLE-scanning devices, based on Go
ESP32-MQTT-room : runs on an ESP32, and looks for Bluetooth LE devices, based on C++/Arduino
OpenMQTTGateway : uses ESP32 Bluetooth Low Energy to scan BLE Broadcaster like smart watches/bands and much more to get sensor values
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT room presence integration was introduced in Home Assistant 0.27, and it's used by
3903 active installations.
Its IoT class is Local Push.
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
