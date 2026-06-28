# Environment Canada - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/environment_canada
- Final URL: https://www.home-assistant.io/integrations/environment_canada
- Canonical URL: https://www.home-assistant.io/integrations/environment_canada/
- Fetched at: 2026-06-28T02:40:44Z
- Content type: text/html; charset=UTF-8

## Description

Weather data from Environment Canada.

## Extracted Text

On this page
Configuration
Location selection
Entities
Weather
Radar map (Camera)
Sensors
Solving problems
Service interruptions
Sensor unavailable or unknown
Template sensors
Feels Like
Additional Forecast Data
List of actions
The Environment Canada integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides meteorological data for Canadian locations from Environment and Climate Change Canada .
To add the Environment Canada service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Environment Canada .
Follow the instructions on screen to complete the setup.
Choose your weather location using either:
Station selector: Select a station location from a dropdown of all Environment Canada weather stations.
Coordinates: Provide latitude and longitude to automatically find the nearest station (defaults to your Home Assistant location).
The integration will create the entities listed below.
Current conditions, daily forecast, and hourly forecast
Loop of radar imagery from the last 3 hours.
This entity is disabled by default can be enabled in the entry’s settings dialog.
By default, this entity uses the radar rain layer from 1 April to 30 November and the snow layer from 1 December to 31 March. The rain/snow layer can be changed using the action described below.
Conditions and forecasts
Current condition
Forecast summary
Icon code of current condition
Barometric pressure
Pressure tendency
Humidity
Visibility
UV index
Air quality health index (AQHI)
Temperature
Forecast high temperature
Forecast low temperature
Dewpoint
Wind chill (only at temperatures below 0ºC)
Humidex (only at temperatures above 19ºC)
Wind
Wind speed
Wind gust
Wind direction
Wind bearing
Precipitation
Probability of precipitation
Alerts
Warnings
Watches
Advisories
Statements
Endings
The alert sensors use the number of current alerts as their state, with an attribute containing the title of each alert.
The Environment Canada service is very stable and provides high-quality data. Here are some steps that you can take before opening a problem report or posting on the forum.
Although infrequent, there have been some outages and instabilities of the Environment Canada service. If you see error messages in your logs similar to the one below, it is very unlikely to be a problem with this integration and is likely a problem with the Environment Canada service.
2022-10-05 12:25:08.619 ERROR (MainThread) [homeassistant.components.environment_canada] Timeout fetching environment_canada weather data
The first course of action should be to check if there are known problems with the service. Look for recent messages on the Environment Canada mailing list ( example message ). The next course of action is to post on the forum. The answers are usually already known by someone.
Not all weather stations provide a complete set of weather/sensor data. The data that is retrieved by this integration can be found here . Browsing the XML data for your station will help you to understand what data is (un)available.
The configuration snippets below add template sensors . See the weather integration for additional examples.
Replace NAME with the weather entity used in your configuration.
A sensor that takes into account the humidex or wind chill for what the temperature feels like.
template : - sensor : - name : " Feels Like" device_class : temperature unit_of_measurement : " °C" state : > {% if not is_state('sensor.NAME_humidex', 'unknown') %} {{ states('sensor.NAME_humidex') }} {% elif not is_state('sensor.NAME_wind_chill', 'unknown') %} {{ states('sensor.NAME_wind_chill') }} {% else %} {{ states('sensor.NAME_temperature') | round(0) }} {% endif %}
The configuration snippet below adds a template sensor containing the current forecast information as attributes and the text summary of the forecast for the current day.
- trigger : - platform : time_pattern hours : " /4" - platform : homeassistant event : start - platform : event event_type : event_template_reloaded actions : - action : environment_canada.get_forecasts target : entity_id : weather.NAME response_variable : forecasts sensor : - name : Weather Forecast Daily unique_id : weather_forecast_daily state : " {{ states('weather.NAME') }}" attributes : daily : " {{ forecasts['weather.NAME']['daily_forecast'] }}" hourly : " {{ forecasts['weather.NAME']['hourly_forecast'] }}" summary : " {{ forecasts['weather.NAME']['daily_forecast'][0]['text_summary'] }}" temperature_unit : " {{ state_attr('weather.NAME', 'temperature_unit') }}"
The Environment Canada integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get alerts ( environment_canada.get_alerts )
Retrieves the active weather alerts for an Environment Canada location.
Get forecasts ( environment_canada.get_forecasts )
Retrieves the raw daily and hourly forecast data from Environment Canada.
Set radar type ( environment_canada.set_radar_type )
Sets the type of radar imagery shown by an Environment Canada radar camera.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Environment Canada service was introduced in Home Assistant 0.95, and it's used by
3015 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gwww
@michaeldavie
Categories
Camera
Sensor
Back to top
