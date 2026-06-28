---
source_url: "https://www.home-assistant.io/integrations/mold_indicator"
final_url: "https://www.home-assistant.io/integrations/mold_indicator"
canonical_url: "https://www.home-assistant.io/integrations/mold_indicator/"
source_handle: "web:www-home-assistant-io:0b18e2660cc4"
source_section: "integrations-mold-indicator"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0dd59cc6dfbb85bff89c9e13fa15474972fe39354fc29f814c9041b803c5bdc8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Mold Indicator - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mold_indicator
- Final URL: https://www.home-assistant.io/integrations/mold_indicator
- Canonical URL: https://www.home-assistant.io/integrations/mold_indicator/
- Fetched at: 2026-06-28T03:00:52Z
- Content type: text/html; charset=UTF-8

## Description

How to use the mold growth indication integration in Home Assistant

## Extracted Text

On this page
Configuration
YAML Configuration
Background
Calibration
Related topics
The Mold Indicator integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses data from two temperature sensors and a humidity sensor to predict the humidity near a cold surface. High humidity may lead to mold growth at more than ~70% and causes condensation at 100%.
The sensor data may be used, for example, to detect bad air quality (high humidity) or automate the operation of indoor air humidifiers to keep the indoor humidity at an optimum.
To add the Mold Indicator helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Mold Indicator .
Follow the instructions on screen to complete the setup.
Further information about these configuration options can be found under the YAML configuration
Name
The name of the sensor.
Indoor temperature sensor
The entity ID of the indoor temperature sensor.
Indoor humidity sensor
The entity ID of the indoor humidity sensor.
Outdoor temperature sensor
The entity ID of the outdoor temperature sensor.
Calibration factor
Needs to be calibrated to the critical point in the room.
To use the Mold Indicator sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry sensor : - platform : mold_indicator indoor_temp_sensor : sensor.temp indoor_humidity_sensor : sensor.humidity outdoor_temp_sensor : sensor.weather_temperature calibration_factor : 2.0 unique_id : very_unique_id_123
Configuration Variables
Looking for your configuration file?
name string ( Optional )
indoor_temp_sensor string Required
indoor_humidity_sensor string Required
outdoor_temp_sensor string Required
calibration_factor float Required
unique_id string ( Optional )
Provide a unique id for the sensor.
In this case, the weather forecast temperature sensor is used for the outside temperature.
First, this sensor predicts the temperature near the given surface by estimating it from the indoor and outdoor temperatures. The predicted temperature starts with the indoor temperature, then either brings it closer to the outdoor temperature (if the calibration factor is positive, indicating the surface is influenced by the outdoors) or away (if the calibration factor is negative, indicating the surface is inversely correlated with the outdoor temperature).
From there, the sensor calculates the relative humidity near the given surface based on the dew point.
The Mold Indicator sensor integration needs to be calibrated to estimate the temperature at the critical point from the outdoor and indoor temperature. First find the coldest surface in the room (critical point), which is typically near the window frames, but depends on the insulation of your home. For calibration you need to measure the temperature at this critical point and simultaneously write down the values for the indoor- and outdoor temperature sensors used for the Mold Indicator. Be sure that there is a significant indoor to outdoor temperature difference to get the best calibration results.
With the three measured temperatures (in Celsius or Fahrenheit), the calibration_factor for your configuration file is given by:
calibration_factor = (temp_indoor - temp_outdoor) / (temp_criticalpoint - temp_outdoor)
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mold Indicator helper was introduced in Home Assistant 0.20, and it's used by
1.1% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Environment
Helper
Back to top
