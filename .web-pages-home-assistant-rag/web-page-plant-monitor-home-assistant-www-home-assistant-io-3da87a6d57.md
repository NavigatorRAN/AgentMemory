---
source_url: "https://www.home-assistant.io/integrations/plant"
final_url: "https://www.home-assistant.io/integrations/plant"
canonical_url: "https://www.home-assistant.io/integrations/plant/"
source_handle: "web:www-home-assistant-io:3da87a6d57dd"
source_section: "integrations-plant"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "62d1296f6d5f58f0cf5d0bc2a19830f07a5a6162d3728be935211bc397791d37"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Plant Monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/plant
- Final URL: https://www.home-assistant.io/integrations/plant
- Canonical URL: https://www.home-assistant.io/integrations/plant/
- Fetched at: 2026-06-28T03:08:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up plant monitoring with Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Using plain MQTT sensor to get the data
Data source
Related topics
This Plant Monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you merge moisture, conductivity, light intensity, temperature and battery level for a plant into a single UI element. It also supports setting minimum and maximum values for each measurement and will change its state to “problem” if it is not within those limits.
To use your plant sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry plant : name_of_your_plant : sensors : moisture : sensor.my_sensor_moisture battery : sensor.my_sensor_battery temperature : sensor.my_sensor_temperature conductivity : sensor.my_sensor_conductivity brightness : sensor.my_sensor_brightness min_moisture : 20
Configuration Variables
Looking for your configuration file?
entity_id list Required
Set by you and is used by the integration as the entity_id .
sensors list Required
List of sensor measure entities.
moisture string ( Optional )
Moisture of the plant. Measured in %. Can have a min and max value set optionally.
battery string ( Optional )
Battery level of the plant sensor. Measured in %. Can only have a min level set optionally.
temperature string ( Optional )
Temperature of the plant. Measured in degrees Celsius. Can have a min and max value set optionally.
conductivity string ( Optional )
Conductivity of the plant. Measured in µS/cm. Can have a min and max value set optionally.
brightness string ( Optional )
Light exposure of the plant. Measured in Lux. Can have a min and max value set optionally.
min_moisture integer ( Optional , default: 20 )
Minimum moisture level before triggering a problem.
max_moisture integer ( Optional , default: 60 )
Maximum moisture level before triggering a problem.
min_battery integer ( Optional , default: 20 )
Minimum battery level before triggering a problem.
min_conductivity integer ( Optional , default: 500 )
Minimum conductivity level before triggering a problem.
max_conductivity integer ( Optional , default: 3000 )
Maximum conductivity level before triggering a problem.
min_temperature float ( Optional )
Minimum temperature before triggering a problem.
max_temperature float ( Optional )
Maximum temperature before triggering a problem.
min_brightness integer ( Optional )
Minimum brightness before triggering a problem. In contrast to the other values, this check is not looking at the current situation, but rather at the last days. A problem is only reported if the maximum brightness over the last days was lower than min_brightness . You can use this to check if the plant gets enough light during the course of the day.
max_brightness integer ( Optional )
Maximum brightness before triggering a problem.
check_days integer ( Optional , default: 3 )
time interval (in days) used when checking min_brightness .
This is a practical example that uses a multiple of MQTT sensors to supply the readings used by the plant sensor.
Another good source of this data would be the Mi Flora integration.
If the sensor data is within the min/max values the status will be ok , if not the status will be problem . You can use this to trigger a notification, if there is a problem with your plant. Of course you can only monitor attributes of your plant, where the sensor is configured and is providing the data.
The main sources of the data will usually be a MiFlora sensor or a MQTT sensor receiving the data from a PlantGateway .
If you want to get the data via a PlantGateway, this is a typical configuration for the MQTT sensors:
# Example configuration.yaml entry plant : simulated_plant : sensors : moisture : sensor.mqtt_plant_moisture battery : sensor.mqtt_plant_battery temperature : sensor.mqtt_plant_temperature conductivity : sensor.mqtt_plant_conductivity brightness : sensor.mqtt_plant_brightness min_moisture : 20 max_moisture : 60 min_battery : 17 min_conductivity : 500 min_temperature : 15 sensor : - platform : mqtt name : my_plant_moisture state_topic : my_plant_topic value_template : " {{ value_json.moisture | int }}" unit_of_measurement : " %" - platform : mqtt name : my_plant_battery state_topic : my_plant_topic value_template : " {{ value_json.battery | int }}" unit_of_measurement : " %" - platform : mqtt name : my_plant_temperature state_topic : my_plant_topic value_template : " {{ value_json.temperature | float }}" unit_of_measurement : " °C" - platform : mqtt name : my_plant_conductivity state_topic : my_plant_topic value_template : " {{ value_json.conductivity | int }}" unit_of_measurement : " µS/cm" - platform : mqtt name : my_plant_brightness state_topic : my_plant_topic value_template : " {{ value_json.brightness | int }}" unit_of_measurement : " Lux"
You have to replace the state_topic with the value that you configured in the PlantGateway. It also depends on the global configuration of your MQTT server.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Plant Monitor integration was introduced in Home Assistant 0.44, and it's used by
2008 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Environment
Back to top
