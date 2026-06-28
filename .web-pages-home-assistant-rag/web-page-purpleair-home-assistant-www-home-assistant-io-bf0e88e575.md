---
source_url: "https://www.home-assistant.io/integrations/purpleair"
final_url: "https://www.home-assistant.io/integrations/purpleair"
canonical_url: "https://www.home-assistant.io/integrations/purpleair/"
source_handle: "web:www-home-assistant-io:bf0e88e57503"
source_section: "integrations-purpleair"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1fab62c74accde325b9f791d332aedcafa39f45c4968440c68606ce140285465"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PurpleAir - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/purpleair
- Final URL: https://www.home-assistant.io/integrations/purpleair
- Canonical URL: https://www.home-assistant.io/integrations/purpleair/
- Fetched at: 2026-06-28T03:09:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate PurpleAir sensors with Home Assistant.

## Extracted Text

On this page
Configuration
Options
Creating an API key
Creating an AQI Rating from Raw Particulate Data
Understanding EPA Guidelines
Creating Statistics Sensors
Creating the AQI Rating Sensor
PurpleAir makes sensors that measure hyper-local air
quality data and share it with the public.
To add the PurpleAir service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PurpleAir .
Follow the instructions on screen to complete the setup.
To define options for PurpleAir, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of PurpleAir are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Add Sensor
Track an additional sensor.
Remove Sensor
Untrack a sensor.
Settings
Configure additional settings (e.g., show/hide sensor icons on the map).
To add this integration, you need a (free) Purple Air API Key. A new account currently comes with 1 million free points. After that, you need to buy additional points to continue to use the API. The current plugin uses ~30K points/day. The 1 million points last about a month. A lack of points will trigger API errors until you buy more points.
Detailed instructions can be found here but in summary you:
Create an account at https://develop.purpleair.com/ (which uses Single Sign-On through a Google account).
On the ‘keys’ page press the “plus” button to create an API key. Leave the defaults of Read and Enabled .
Go to the ‘projects’ page and select the edit (pencil) button on the listed Project. Add points (for example 1,000,000), then select Update .
Go back to the ‘keys’ page and copy the API key. It will be a value like XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXXX.
Paste that API key into the API Key field when creating the integration in Home Assistant.
Note that if you are using your own sensor, it will need to be set to Public to be visible.
The PurpleAir API does not provide AQI data; therefore, the integration does not create
an AQI sensor automatically. However, sensors providing raw particulate data can be used
to create a human-friendly AQI rating sensor.
Warning
The guidelines within this documentation constitute estimates and are intended to help
informed decision making. They should not replace analysis, advice or diagnosis from a
trained medical professional.
The United States Environmental Protection Agency (EPA) provides
guidelines on
correlating the concentration of pollution over a time period to overall “healthiness.”
For example, a PM2.5 concentration between 0.0 and 12.0 µg/m³ over a 24-hour period
equates to a “Good” AQI rating.
Therefore, a common strategy would be to use the guidelines for the particulate types
provided by the PurpleAir integration and “merge” them into a single AQI rating.
With the EPA guidelines in hand, the next step is to create
statistics sensors for each particulate sensor you are
interested. This example uses PM2.5 and PM10.0 over a 24-hour period:
Note
The entity IDs provided below are simulated; make sure that you use entity IDs that
actually exist in your Home Assistant instance.
sensor : - platform : statistics name : " Average Outdoor PM2.5 (24h)" entity_id : sensor.sensor_pm2_5_mass_concentration state_characteristic : mean max_age : hours : 24 - platform : statistics name : " Average Outdoor PM10.0 (24h)" entity_id : sensor.sensor_pm10_0_mass_concentration state_characteristic : mean max_age : hours : 24
The statistics sensors can then be combined into a template
sensor. Note that this example takes a conservative approach: the “worse” of the two
values (PM2.5 or PM10.0) is used to determine the overall rating.
Tip
Reminder that the breakpoints used below can be determined from the aforementioned EPA
guidelines.
template : - sensor : - name : " Local Outdoor Air Quality" state : > {% set pm2_5_avg = states("sensor.average_outdoor_pm2_5_24h") | int %} {% if 0 <= pm2_5_avg <= 12.0 %} {% set pm2_5_rating = 0 %} {% elif 12.0 < pm2_5_avg <= 35.4 %} {% set pm2_5_rating = 1 %} {% elif 35.4 < pm2_5_avg <= 55.4 %} {% set pm2_5_rating = 2 %} {% elif 55.4 < pm2_5_avg <= 150.4 %} {% set pm2_5_rating = 3 %} {% elif 150.4 < pm2_5_avg <= 250.4 %} {% set pm2_5_rating = 4 %} {% else %} {% set pm2_5_rating = 5 %} {% endif %} {% set pm10_0_avg = states("sensor.average_outdoor_pm10_0_24h") | int %} {% if 0 <= pm10_0_avg <= 54.0 %} {% set pm10_0_rating = 0 %} {% elif 54.0 < pm10_0_avg <= 154.0 %} {% set pm10_0_rating = 1 %} {% elif 154.0 < pm10_0_avg <= 254.0 %} {% set pm10_0_rating = 2 %} {% elif 254.0 < pm10_0_avg <= 354.0 %} {% set pm10_0_rating = 3 %} {% elif 354.0 < pm10_0_avg <= 424.0 %} {% set pm10_0_rating = 4 %} {% else %} {% set pm10_0_rating = 5 %} {% endif %} {% set rating = [pm2_5_rating, pm10_0_rating] | max %} {% if rating == 0 %} Good {% elif rating == 1 %} Moderate {% elif rating == 2 %} Unhealthy for sensitive groups {% elif rating == 3 %} Unhealthy {% elif rating == 4 %} Very unhealthy {% else %} Hazardous {% endif %} unique_id : local_outdoor_air_quality
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PurpleAir service was introduced in Home Assistant 2023.1, and it's used by
204 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Sensor
Back to top
