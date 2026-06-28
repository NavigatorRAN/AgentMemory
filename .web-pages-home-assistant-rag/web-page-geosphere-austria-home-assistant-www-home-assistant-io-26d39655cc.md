# GeoSphere Austria - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zamg
- Final URL: https://www.home-assistant.io/integrations/zamg
- Canonical URL: https://www.home-assistant.io/integrations/zamg/
- Fetched at: 2026-06-28T03:30:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate GeoSphere Austria (formerly known as ZAMG) within Home Assistant.

## Extracted Text

On this page
Configuration
Sensor
The GeoSphere Austria integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses meteorological details published by the Austrian weather service GeoSphere Austria .
With this integration, it is possible to get weather station data from up to 228 different GeoSphere stations across Austria. The integration uses the datahub-api .
To add the GeoSphere Austria service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GeoSphere Austria .
Follow the instructions on screen to complete the setup.
There is currently support for the following device types within Home Assistant:
Weather - It displays the current temperature, humidity, pressure and wind speed, but it doesn’t have support for conditions which is a key feature of the weather platforms.
This integration provides the following sensors:
Name Description Temperature Temperature in °C Temperature Average Average Temperature in °C Humidity Humidity in % Dew Point Dew point in °C Dew Point Average Average Dew point in °C Pressure Station pressure in hPa Pressure at Sea Level Sea level pressure in hPa Wind Speed Wind speed in km/h Top Wind Speed Max wind speed in km/h Wind Bearing Wind bearing in ° Top Wind Bearing Wind bearing at max speed in ° Sun Last 10 Minutes Sunshine in the last 10 minutes in sec Precipitation Precipitation in mm Snow Snow in cm Global Radiation Global Radiation in the last 10 minutes in W/m²
Note
Not every station supports every sensor.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GeoSphere Austria service was introduced in Home Assistant 0.35, and it's used by
1205 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@killer0071234
Categories
Weather
Back to top
