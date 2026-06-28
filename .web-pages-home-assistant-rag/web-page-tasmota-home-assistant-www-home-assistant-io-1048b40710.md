# Tasmota - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tasmota
- Final URL: https://www.home-assistant.io/integrations/tasmota
- Canonical URL: https://www.home-assistant.io/integrations/tasmota/
- Fetched at: 2026-06-28T03:20:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tasmota with Home Assistant.

## Extracted Text

On this page
Requirements
Supported features
Configuration
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Tasmota devices over MQTT.
MQTT broker and the MQTT integration set up in Home Assistant.
Tasmota devices’ MQTT setting configured to communicate with the MQTT broker.
Tasmota devices flashed with version 9.2, or later ( tasmota-lite.bin does not support this integration).
Tasmota devices configured for native discovery ( SetOption19 0 ). Go to the web interface of your Tasmota device, select Tools and then Console . Where you can see the placeholder Enter command type or paste SetOption19 0 and hit Return .
Although the Tasmota integration supports custom fulltopic it is strongly suggested to leave fulltopic at its default, Tasmota does not prevent setting an invalid or non-unique fulltopic, for example a fulltopic without the %prefix% or %topic% tokens.
The Camera functionality of tasmota32-webcam based devices is supported only when the Tasmota device and the Home Assistant server are on the same local network.
Tasmota Buttons, Fans, Lights, Relays, Sensors, Shutters, Switches and Cameras are supported.
Tasmota Buttons will be added as Home Assistant automation triggers when SetOption73 is enabled. No binary_sensor entity will be created. You can find the available automation triggers on the device screen.
Tasmota Lights will be added as Home Assistant light entities. Single channel Dimmers, RGB lights, RGB lights with Color Temperature control and RGB lights with White control are supported.
Tasmota Relays will be added as Home Assistant switch entities, if SetOption30 0 . If SetOption30 1 , relays will be added as light entities.
Tasmota Sensors will be added as Home Assistant sensor entities.
Tasmota Shutters will be added as Home Assistant cover entities. Currently only Shutter modes 1 to 4 are supported. Shutter mode 5 and Tuya shutters are not supported.
Tasmota Switches will be added as either Home Assistant binary_sensor entities or automation triggers depending on the switchmode used when SetOption114 is enabled.
The fan functionality in Tasmota devices with module configured as iFan02 or iFan03 will be added as Home Assistant fan entities. Tuya fans are not supported.
The camera functionality in ESP32 Tasmota devices with tasmota32-webcam firmware will be added as Home Assistant Camera entities. Note that this functionality is supported only when the Tasmota device and the Home Assistant server are on the same network.
The integration will also create up to eight Status Sensors, each one with a different information. All the Status Sensors are disabled by default.
To add the Tasmota integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tasmota .
Follow the instructions on screen to complete the setup.
You must also configure each Tasmota device’s MQTT settings to communicate with whatever MQTT broker you are using. Enter the broker address under host, and enter a username/password combination that allows access to the broker.
If you are using the Home Assistant Mosquitto Broker app, first create a new Home Assistant user under Settings > People . Then, in Tasmota > Configure MQTT under “Host” enter the address of your Home Assistant instance and under “User” and “Password” enter the Home Assistant user you just created.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tasmota integration was introduced in Home Assistant 0.117, and it's used by
8.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@emontnemery
Categories
Binary sensor
Cover
Fan
Light
Sensor
Switch
Back to top
