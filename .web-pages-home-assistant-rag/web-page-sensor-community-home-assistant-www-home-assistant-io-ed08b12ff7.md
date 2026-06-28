# Sensor.Community - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/luftdaten
- Final URL: https://www.home-assistant.io/integrations/luftdaten
- Canonical URL: https://www.home-assistant.io/integrations/luftdaten/
- Fetched at: 2026-06-28T02:57:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Sensor.Community sensors to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Sensors
Data updates
Examples
Warn when PM2.5 levels are unhealthy
Turn on an air purifier based on outdoor air quality
Known limitations
Troubleshooting
Sensor not available or invalid
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Sensor.Community integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] brings readings from the Sensor.Community open data air quality network into Home Assistant. Sensor.Community (formerly known as luftdaten.info) is a global citizen science project that maps air quality and environmental data from thousands of do-it-yourself (DIY) sensor stations around the world.
Use cases for this integration include:
Tracking air quality in your neighborhood using a nearby public sensor.
Displaying readings from your own DIY Sensor.Community sensor without running its web interface.
Triggering automations, such as closing windows or turning on an air purifier, when particulate matter levels rise.
Comparing outdoor air quality against indoor sensors on a single dashboard.
You need the sensor ID of the Sensor.Community sensor you want to track. The ID is a numeric value, not the sensor type.
To find a sensor ID:
Open the Sensor.Community map .
Select the sensor you want to track on the map.
The sensor ID is shown in the sidebar with a # in front of it, for example, #12345 .
Each physical sensor station usually has multiple sensor IDs, one for each sensor type (particulate matter, temperature, humidity, pressure). Add the integration once per sensor ID you want to track.
To add the Sensor.Community device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sensor.Community .
Follow the instructions on screen to complete the setup.
Sensor ID
The numeric ID of the Sensor.Community sensor you want to track. You can find it on the Sensor.Community map .
Show on map
When enabled, the sensor’s latitude and longitude are added as attributes so the sensor can be placed on the map dashboard. Disabled by default.
The integration creates sensor entities based on the data that the selected Sensor.Community sensor reports. Not every sensor reports every measurement. Sensors that the selected sensor does not provide are not created.
PM10 particulate matter
Description : Concentration of particulate matter up to 10 micrometers in diameter, in µg/m³.
Device class : PM10
PM2.5 particulate matter
Description : Concentration of particulate matter up to 2.5 micrometers in diameter, in µg/m³.
Device class : PM2.5
Temperature
Description : Ambient temperature reported by the sensor, in °C.
Device class : Temperature
Humidity
Description : Relative humidity reported by the sensor, in %.
Device class : Humidity
Pressure
Description : Atmospheric pressure at the sensor location, in Pa.
Device class : Pressure
Pressure at sea level
Description : Atmospheric pressure adjusted to sea level, in Pa.
Each sensor includes the Sensor.Community sensor ID as an attribute. When the Show on map option is enabled, the sensor’s latitude and longitude are also added as attributes so the entity appears on the map dashboard.
The integration polls the Sensor.Community API every 10 minutes over the internet for new readings. This matches how often most Sensor.Community stations upload new data.
Send a notification when the PM2.5 concentration exceeds 35 µg/m³. You can adjust this example threshold to match the air quality guidance or standard you want to follow:
alias : " Unhealthy air quality alert" triggers : - trigger : numeric_state entity_id : sensor.sensor_12345_pm25 above : 35 for : minutes : 15 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Air quality" message : > PM2.5 is currently {{ states('sensor.sensor_12345_pm25') }} µg/m³. Consider closing windows.
Automatically turn on an indoor air purifier when outdoor particulate matter rises above a threshold:
alias : " Air purifier on high PM" triggers : - trigger : numeric_state entity_id : sensor.sensor_12345_pm10 above : 50 actions : - action : switch.turn_on target : entity_id : switch.living_room_air_purifier
The integration is read-only and relies on data that Sensor.Community stations upload to the public API. If a station stops uploading, the sensors become unavailable.
Each Sensor.Community station usually has separate sensor IDs per sensor type. To track particulate matter and temperature from the same station, set up the integration once per sensor ID.
The 10-minute polling interval is fixed and matches the upload frequency of most stations. Polling more often does not give you fresher data.
If you see a “Sensor not available or invalid” error during setup, verify that:
The Sensor ID you entered is correct. The ID is the number with # in front of it on the Sensor.Community map , not the sensor’s physical location or name.
The sensor is still online and uploading data to Sensor.Community. Check its recent values on the map.
Your Home Assistant instance can reach the internet.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sensor.Community device was introduced in Home Assistant 0.82, and it's used by
1001 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@frenck
Categories
Health
Sensor
Back to top
