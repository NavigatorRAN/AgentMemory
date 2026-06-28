# Météo-France - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meteo_france
- Final URL: https://www.home-assistant.io/integrations/meteo_france
- Canonical URL: https://www.home-assistant.io/integrations/meteo_france/
- Fetched at: 2026-06-28T02:59:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Météo-France within Home Assistant.

## Extracted Text

On this page
Configuration
Weather platform
Sensor platforms
About next_rain condition sensor
About weather_alert sensor
The Météo-France integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the meteorological data from Météo-France to provide weather forecast for any location in the world with a focus on France. One or more locations can be set via the front end or via the configuration file.
The integration support the following platforms within Home Assistant:
Weather
Sensor
It displays the current weather along with a 5 days forecast and create sensors, including weather alerts and 1 hour rain forecast.
To add the Météo-France service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Météo-France .
Follow the instructions on screen to complete the setup.
To be used with the weather dashboard card to access current condition, today and next four days (default) or hours forecast.
All the following sensors will be created :
Entity Description Enabled by default cloud The current cloud cover in % Yes daily_original_condition The daily original weather condition No freeze_chance Probability of temperature below 0°C in the following hours Yes next_rain Datetime of the next rain if expected within the next hour Yes original_condition The current original weather condition No precipitation Precipitation cumulation for next 24 hours in mm Yes pressure The current pressure in hPa No rain_chance Probability of rain in the following hours Yes snow_chance Probability of snow for the following hours Yes temperature The current temperature in °C No uv The current UV index Yes weather_alert Weather alert status ( see note below ) Yes wind_gust The current wind gust speed in km/h No wind_speed The current wind speed in km/h No
Warning: The probability entities data are not always provided by the API. They are added only if available.
To enable an entity disabled by default, go in Settings > Devices & services , click on the city name in Météo-France and then the X entities link. You will have the list of the enabled entities. Here click the filter button and select Show disable entities . The disabled entities will be visible in the list, select the one you want to enable and click the Enable Selected button.
The attributes allow you to have a forecast of the rain type by 5 to 10 minutes intervals:
forecast_time_ref give a timestamp in ISO format UTC, corresponding to the start of the
forecast.
1_hour_forecast is a dictionary to access the type of rain for the next hour for each periods.
“Type of rain” values are given by Météo-France API. Values already noted are:
Temps sec
Pluie faible
Pluie modérée
Pluie forte
Example:
forecast_time_ref : ' 2020-08-20T19:25:00+00:00' 1_hour_forecast : 0 min : Temps sec 5 min : Temps sec 10 min : Temps sec 15 min : Temps sec 20 min : Temps sec 25 min : Pluie faible 35 min : Pluie faible 45 min : Pluie modérée 55 min : Pluie modérée
Note
The weather alert is available for the metropolitan France and Andorre.
The weather_alert sensor state give the current weather alert status for the department linked to the city. Only one entity by department is created.
The sensor attributes give access to each type of alerts raised by Météo-France.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Météo-France service was introduced in Home Assistant 0.89, and it's used by
1.9% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hacf-fr/reviewers
@oncleben31
@Quentame
Categories
Back to top
