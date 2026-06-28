# Met Office - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/metoffice
- Final URL: https://www.home-assistant.io/integrations/metoffice
- Canonical URL: https://www.home-assistant.io/integrations/metoffice/
- Fetched at: 2026-06-28T02:59:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Met Office weather conditions into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Entities
The Met Office weather integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Met Office’s DataHub API for weather data.
Register for a Met Office DataHub account.
After registration, subscribe to Site Specific Global Spot dataset to obtain your API key. Free tier subscription gives 360 calls per day, which is enough for using this integration
To add the Met Office service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Met Office .
Follow the instructions on screen to complete the setup.
This integration creates several weather entities for each entry created in the configuration by location: one weather entity with a summary and a forecast (daily, hourly, and twice-daily), and sensor entities for individual reporting on each of the individual measurements. Note that only some of the sensor entities flagged below are enabled by default, so your system isn’t overrun on initial configuration.
The available sensor entities:
“feels like” temperature
humidity
probability of precipitation
station name
temperature
pressure
UV index
visibility
weather
wind direction
wind gust
wind speed
Only probability of precipitation, temperature, weather and wind speed are enabled by default.
Details about the API are available in the DataHub API documentation . The datapoint-python library is used to retrieve data.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Met Office service was introduced in Home Assistant 0.42, and it's used by
2545 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MrHarcombe
@avee87
Categories
Weather
Back to top
