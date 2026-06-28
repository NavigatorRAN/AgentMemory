# WGL Designs W800RF32 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/w800rf32
- Final URL: https://www.home-assistant.io/integrations/w800rf32
- Canonical URL: https://www.home-assistant.io/integrations/w800rf32/
- Fetched at: 2026-06-28T03:27:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a W800rf32(a) into Home Assistant.

## Extracted Text

On this page
Binary sensor
Setting up your devices
Related topics
The WGL Designs W800RF32 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] supports W800RF32 devices by WGL Designs which
communicate in the frequency range of 310MHz or if you are outside Canada or the U.S., 433.92 MHz.
The W800 family of RF receivers are designed to receive X10 RF signals generated from X10 products: Palm Pad
remotes, key chain remotes, Hawkeye motion detectors, and many, many other X10 RF devices.
To enable W800rf32 in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry w800rf32 : device : PATH_TO_DEVICE
Configuration Variables
Looking for your configuration file?
device string Required
The path to USB/serial device, example: /dev/ttyUSB0.
The w800rf32 platform supports X10 RF binary sensors such as Palm Pad remotes, key chain remotes, Hawkeye motion detectors, and many, many other X10 RF devices. Some that have specifically been used with this are the KR19A keychain, MS16A motion detector and the RSS18 four button wall mount keypad.
Once you have set up your w800rf32 hub , add the binary sensors to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry binary_sensor : - platform : w800rf32 devices : a1 : name : motion_hall a2 : name : motion_kitchen
devices map Required
A list of devices.
name string ( Optional )
Override the name to use in the frontend.
device_class device_class ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
off_delay integer ( Optional )
For sensors that only sends ‘On’ state updates, this variable sets a delay after which the sensor state will be updated back to ‘Off’.
Binary sensors have only two states, “on” and “off”. Many door or window opening sensors will send a signal each time the door/window is open or closed. However, depending on their hardware or on their purpose, some sensors are only able to signal their “on” state:
Most motion sensors send a signal each time they detect motion. They stay “on” for a few seconds and go back to sleep, ready to signal other motion events. Usually, they do not send a signal when they go back to sleep.
For those devices, use the off_delay parameter. It defines a delay after which a device will go back to an “Off” state. That “Off” state will be fired internally by Home Assistant, just as if the device fired it by itself. If a motion sensor can only send signals once every 5 seconds, sets the off_delay parameter to seconds: 5 .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WGL Designs W800RF32 integration was introduced in Home Assistant 0.83, and it's used by
5 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
