# WeatherflowCloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/weatherflow_cloud
- Final URL: https://www.home-assistant.io/integrations/weatherflow_cloud
- Canonical URL: https://www.home-assistant.io/integrations/weatherflow_cloud/
- Fetched at: 2026-06-28T03:28:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on the Cloud based WeatherFlow integration

## Extracted Text

On this page
Which integration(s) should I use
Configuration
Temperature sensors
Air sensors
Lightning sensors
Weather conditions
The WeatherFlow Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides access to cloud provided Weather Forecast of a user’s Tempest Weather Stations. To access the station, you will need to configure the integration with an Api Key .
There are two integrations for WeatherFlow devices, and you are not limited to selecting just one.
WeatherFlow is a local only UDP -based integration that will read data directly from the device. This integration does require the Home Assistant server and the WeatherFlow device to be on the same subnet.
WeatherFlow Cloud is a cloud -based integration that closely mirrors the data available via the Weatherflow Tempest mobile applications and is likely a good starting place for most users as it provides both Forecast and Sensor data.
To add the WeatherflowCloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WeatherflowCloud .
Follow the instructions on screen to complete the setup.
Sensor Description Dew point The temperature to which air must be cooled to become saturated with water vapor. Feels like An index that combines temperature and humidity to determine the apparent temperature. Heat index A measure of how hot it feels when relative humidity is factored in with the actual air temperature. Temperature The degree or intensity of heat present in the area. Wet bulb globe temperature A composite temperature used to estimate the effect of temperature, humidity, wind speed, and solar radiation on humans. Wet bulb temperature The lowest temperature that can be reached under current ambient conditions by the evaporation of water only. Wind chill The lowering of body temperature due to the passing-flow of lower-temperature air.
Sensor Description Air density The mass per unit volume of Earth’s atmosphere. Pressure barometric The pressure exerted by the atmosphere at the earth’s surface. Pressure sea level The atmospheric pressure at mean sea level. Pressure station The atmospheric pressure at the station level.
Sensor Description Lightning count The total number of lightning strikes. Lightning count last 1 hr The number of lightning strikes in the last hour. Lightning count last 3 hr The number of lightning strikes in the last three hours. Lightning last The most recent lightning strike. Lightning last distance The distance of the most recent lightning strike.
The Home Assistant weather entity reports its current state as one of a fixed set of condition values, listed under Condition mapping on the Weather integration page. The WeatherFlow API returns a larger set of condition identifiers, so this integration maps each WeatherFlow value to the closest Home Assistant condition. Because there is no one-to-one mapping between the two, the state shown in Home Assistant may differ slightly from the condition shown in the Tempest app.
The mapping from the WeatherFlow condition to the Home Assistant weather state is:
clear-day is reported as sunny
clear-night is reported as clear-night
cloudy is reported as cloudy
foggy is reported as fog
partly-cloudy-day is reported as partlycloudy
partly-cloudy-night is reported as partlycloudy
possibly-rainy-day is reported as rainy
possibly-rainy-night is reported as rainy
possibly-sleet-day is reported as snowy-rainy
possibly-sleet-night is reported as snowy-rainy
possibly-snow-day is reported as snowy
possibly-snow-night is reported as snowy
possibly-thunderstorm-day is reported as lightning-rainy
possibly-thunderstorm-night is reported as lightning-rainy
rainy is reported as rainy
sleet is reported as snowy-rainy
snow is reported as snowy
thunderstorm is reported as lightning
windy is reported as windy
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WeatherflowCloud hub was introduced in Home Assistant 2024.3, and it's used by
832 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jeeftor
Categories
Environment
Sensor
Weather
Back to top
