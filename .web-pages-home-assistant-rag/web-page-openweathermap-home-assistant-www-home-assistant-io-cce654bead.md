# OpenWeatherMap - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openweathermap
- Final URL: https://www.home-assistant.io/integrations/openweathermap
- Canonical URL: https://www.home-assistant.io/integrations/openweathermap/
- Fetched at: 2026-06-28T03:06:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenWeatherMap within Home Assistant.

## Extracted Text

On this page
Supported modes
One Call API 3.0
Free
⚠️ Important Deprecation Notice
OpenWeatherMap API V2.5 Deprecation
Configuration
Supported Weather Conditions
Current Weather Conditions
List of actions
Supported Air Quality Sensors
Current Air Quality Sensors
Related topics
The OpenWeatherMap integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses OpenWeatherMap as a source for meteorological and air quality data for your location.
There is currently support for the following device types within Home Assistant:
Sensor
Weather
You need to register for an API key: Sign up here .
There are currently two types of OpenWeatherMap services supported by this integration, with several corresponding modes.
v3.0 : current weather, hourly forecast for 48 hours, daily forecast for 8 days
The One Call API 3.0 services requires a subscription . The subscription has a free tier with 1000 calls/day. Consider setting the limit on the OpenWeatherMap website to stay under the threshold where API usage incurs a cost. This is done in the Billing plans page, under “Calls per day”.
current : current weather
forecast : weather forecast, in 3-hour steps for 5 days
air_pollution : current air pollution
The Free services require a registration but no subscription. Once signed up, the API key can be found from your profiles’ My API keys page.
OpenWeatherMap API V2.5 has been deprecated and is no longer supported by this integration. You need to use API V3.0.
To continue using the service if you were previously using API V2.5:
Visit the OpenWeatherMap website and activate the One Call subscription.
During activation, you will be prompted for a credit card, but you will not be charged unless you exceed the free tier limits.
Configure your OWM integration to select mode v3.0 .
Note: Subscription activation may take up to 2 hours.
For more details, set limits on your usage to avoid charges at OpenWeatherMap Subscriptions .
Important
If you register a new API key with OpenWeatherMap, it will be activated automatically. This typically takes between 10 minutes and 2 hours.
Keep in mind when configuring this integration that your new API key might not be active yet.
Invalid API-key errors can also occur if you use a key which doesn’t match the corresponding service (One Call API 3.0 versus Free).
To add the OpenWeatherMap service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenWeatherMap .
Follow the instructions on screen to complete the setup.
Parameter Value API Key API Key from the website Name Name of the integration Latitude Latitude for weather forecast and sensor Longitude Longitude for weather forecast and sensor Mode
v3.0 (new API version) current weather plus daily forecast for 8 days, and 1-hour steps for 48 hours
current current weather data only, no forecast
forecast weather forecast only, in 3-hour steps for 5 days, no current weather data
air_pollution current air quality data
Language Language for receiving data (only for sensor )
A sensor entity will be created for each supported condition. Their IDs will follow the format:
sensor.<integration name>_<monitored condition>
Sensors provide data in the language that was selected when configuring the integration.
Note
The Weather entity provides data only in English. Home Assistant automatically translates it to the language configured for the frontend.
If you want to change the weather location, you will need to delete and re-add the integration.
Condition Description cloud_coverage Cloudiness, %. condition Weather condition . dew_point Atmospheric temperature below which water droplets begin to condense and dew can form, ºC. feels_like_temperature Temperature accounting for the human perception of weather, ºC. humidity Humidity, %. precipitation_kind The kind of precipitation (Rain, Snow, Snow and Rain, None) for the last hour. pressure Atmospheric pressure at sea level, hPa. rain Rain precipitation, mm/h. snow Snow precipitation, mm/h. temperature Temperature, ºC. uv_index UV Index. visibility Average visibility, m. weather A human-readable description of the weather condition . weather_code ID of the weather condition . wind_bearing Wind direction, degrees (meteorological). wind_speed Wind speed, meter/sec.
Details about the API are available in the OpenWeatherMap documentation .
The OpenWeatherMap integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get minute forecast ( openweathermap.get_minute_forecast )
Retrieves a minute-by-minute precipitation forecast for the next hour from OpenWeatherMap.
For an overview of every action across all integrations, see the actions reference .
Sensor Description air_quality_index Air Quality Index, where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, and 5 = Very Poor. carbon_monoxide Concentration of CO (Carbon monoxide), µg/m³. nitrogen_monoxide Concentration of NO (Nitrogen monoxide), µg/m³. nitrogen_dioxide Concentration of NO2 (Nitrogen dioxide), µg/m³. ozone Concentration of O3 (Ozone), µg/m³. sulphur_dioxide Concentration of SO2 (Sulphur dioxide), µg/m³. pm2_5 Concentration of PM2.5 (Fine particulate matter), µg/m³. pm10 Concentration of PM10 (Coarse particulate matter), µg/m³.
More details can be found at the OpenWeatherMap Air Pollution API documentation .
Defining a custom polling interval
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenWeatherMap service was introduced in Home Assistant 0.32, and it's used by
4.7% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@freekode
@nzapponi
@wittypluck
Categories
Back to top
