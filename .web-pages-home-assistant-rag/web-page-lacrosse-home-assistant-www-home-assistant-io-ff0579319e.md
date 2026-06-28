---
source_url: "https://www.home-assistant.io/integrations/lacrosse"
final_url: "https://www.home-assistant.io/integrations/lacrosse"
canonical_url: "https://www.home-assistant.io/integrations/lacrosse/"
source_handle: "web:www-home-assistant-io:ff0579319e4e"
source_section: "integrations-lacrosse"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "eabb6ac53fd4b007e1e21d09239063b647317ffb65f21e2e3793708197ddf858"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LaCrosse - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lacrosse
- Final URL: https://www.home-assistant.io/integrations/lacrosse
- Canonical URL: https://www.home-assistant.io/integrations/lacrosse/
- Fetched at: 2026-06-28T02:55:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate LaCrosse sensor data received from Jeelink into Home Assistant.

## Extracted Text

On this page
Tested devices
Setup
Configuration
Examples
Related topics
The LaCrosse integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is using the data provided by a Jeelink USB dongle or this Arduino sketch .
Technoline TX 29 IT (temperature only)
Technoline TX 29 DTH-IT (including humidity)
TFA Dostmann LaCrosse sensors (type 30.3147.IT)
Since the sensor change their ID after each powercycle/battery change you can check what sensor IDs are available by using the command-line tool pylacrosse from the pylacrosse package.
sudo pylacrosse -d /dev/ttyUSB0 scan
Or, when using Docker containers:
docker exec -it <containername> pylacrosse -d /dev/ttyUSB0 scan
If you are using the Home Assistant OS, these methods are not available for you. The use of an additional computer to figure
out the ID is advised.
For TX 29 DTH-IT sensors you can also read the ID from the display and calculate the ID as followed: hex2dec(ID_on_display) / 4 .
To use your lacrosse compatible sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : lacrosse sensors : sensor_identifier : type : SENSOR_TYPE id : SENSOR_ID
Configuration Variables
Looking for your configuration file?
device string Required , default: /dev/ttyUSB0
The serial device.
baud integer Required , default: 57600
The serial baudrate.
led boolean ( Optional , default: false )
Activate or deactivate the Jeelink LED.
frequency integer ( Optional )
Initial frequency in 5kHz steps.
datarate integer ( Optional )
Set the data rate in kbps. Special values for well-known settings are: 0 : 17.241 kbps, 1 : 9.579 kbps, 2 : 8.842 kbps.
toggle_mask integer ( Optional )
The following values can be combined bitwise: 1 = 17.241 kbps, 2 = 9.579 kbps, 4 = 8.842 kbps
toggle_interval integer ( Optional )
Enable the toggle mode and set the interval in seconds.
sensors map Required
A list of your sensors.
name string ( Optional )
The name of the sensor.
type string Required
The type of the sensor. Options: battery , humidity , temperature
id integer Required
The LaCrosse Id of the sensor.
To set up a LaCrosse sensor with multiple sensors, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : lacrosse device : /dev/ttyUSB0 baud : 57600 sensors : kitchen_humidity : name : Kitchen Humidity type : humidity id : 72 kitchen_temperature : name : Kitchen Temperature type : temperature id : 72 kitchen_lacrosse_battery : name : Kitchen Sensor Battery type : battery id : 72
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LaCrosse integration was introduced in Home Assistant 0.58, and it's used by
103 active installations.
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
