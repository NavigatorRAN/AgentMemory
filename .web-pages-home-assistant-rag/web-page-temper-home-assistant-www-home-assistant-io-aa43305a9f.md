# TEMPer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/temper
- Final URL: https://www.home-assistant.io/integrations/temper
- Canonical URL: https://www.home-assistant.io/integrations/temper/
- Fetched at: 2026-06-28T03:21:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate TEMPer sensors into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
This TEMPer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to get the current temperature from a TEMPer device.
To use your TEMPer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : temper
Configuration Variables
Looking for your configuration file?
offset integer ( Optional , default: o )
The offset to fix reported vales.
scale integer ( Optional , default: 1 )
The scale for the sensor.
name string ( Optional , default: Unnamed Device )
The name to use when displaying this sensor.
Since some of these sensors consistently show higher temperatures the scale and offset values can be used to fine-tune your sensor.
The calculation follows the formula scale * sensor value + offset .
The TEMPer sensors can only be accessed as root by default. To fix the USB permissions on your system create the file /etc/udev/rules.d/99-tempsensor.rules and add the following line to it:
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="7401", MODE="666"
After that re-plug the device and restart Home Assistant.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TEMPer integration was introduced in Home Assistant pre 0.7, and it's used by
25 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
DIY
Back to top
