---
source_url: "https://www.home-assistant.io/integrations/remote_rpi_gpio"
final_url: "https://www.home-assistant.io/integrations/remote_rpi_gpio"
canonical_url: "https://www.home-assistant.io/integrations/remote_rpi_gpio/"
source_handle: "web:www-home-assistant-io:53670be826a7"
source_section: "integrations-remote-rpi-gpio"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6e5373c90112fdbb19d3bb73a6d86136575c2c893c5c5c31c8236f3c6e4ab1f3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Raspberry Pi Remote GPIO - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/remote_rpi_gpio
- Final URL: https://www.home-assistant.io/integrations/remote_rpi_gpio
- Canonical URL: https://www.home-assistant.io/integrations/remote_rpi_gpio/
- Fetched at: 2026-06-28T03:11:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the GPIO capability of a remote Raspberry Pi into Home Assistant.

## Extracted Text

On this page
Binary sensor
Switch
Troubleshooting
Related topics
The Raspberry Pi Remote GPIO integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is the base for all related GPIO platforms in Home Assistant. For the platform configurations, please check their corresponding sections.
The remote Raspberry Pi, and the control computer where Home Assistant is running must be configured to be able to run remote_rpi_gpio , see Configuring Remote GPIO for more details. Unfortunately, this setup is not currently possible with remote, Raspberry Pi 5 hosts, due to a lack of support in pigiod .
Note that for virtual environments, you may need to set an environment variable when starting the environment to set the pin factory, for example:
Environment = GPIOZERO_PIN_FACTORY=pigpio PIGPIO_ADDR=YOUR_RPi_IP_ADDRESS
The remote_rpi_gpio binary sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to read sensor values of the GPIOs of a remote Raspberry Pi .
To use your remote Raspberry Pi’s GPIO in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : remote_rpi_gpio host : IP_ADDRESS_OF_REMOTE_PI ports : 11 : PIR Office 12 : PIR Bedroom
Configuration Variables
Looking for your configuration file?
host string Required
IP Address of remote Raspberry Pi.
ports map Required
List of used ports.
port: name string Required
The port numbers (BCM mode pin numbers) and corresponding names.
invert_logic boolean ( Optional )
If true , inverts the output logic
Default:
false (ACTIVE HIGH)
pull_mode string ( Optional , default: UP )
Type of internal pull resistor to use. Options are UP - pull-up resistor and DOWN - pull-down resistor. Pull-Up defaults to active LOW and Pull-down defaults to active HIGH. This can be adjusted with invert_logic
For more details about the GPIO layout, visit the Wikipedia article about the Raspberry Pi.
The remote_rpi_gpio switch platform allows you to control the GPIOs of a Remote Raspberry Pi .
To use your remote Raspberry Pi’s GPIO in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : remote_rpi_gpio host : IP_ADDRESS_OF_REMOTE_PI ports : 11 : Fan Office 12 : Light Desk
ports list Required
Array of used ports.
port integer | string Required
Port numbers and corresponding names (GPIO
invert_logic boolean ( Optional , default: false )
If true, inverts the output logic to ACTIVE LOW.
Note
Note that a pin managed by Home Assistant is expected to be exclusive to Home Assistant.
A common question is what does port refer to? This number is the actual GPIO #, not the pin #.
For example, if you have a relay connected to pin 11 its GPIO # is 17.
# Example configuration.yaml entry switch : - platform : remote_rpi_gpio host : 192.168.0.123 ports : 17 : Speaker Relay
If you receive an error such as gpiozero.exc.BadPinFactory: Unable to load any default pin factory! try changing the GPIOZERO_PIN_FACTORY environment variable from pigpio to mock , as this addresses a known issue .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Raspberry Pi Remote GPIO integration was introduced in Home Assistant 0.94, and it's used by
276 active installations.
Its IoT class is Local Push.
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
