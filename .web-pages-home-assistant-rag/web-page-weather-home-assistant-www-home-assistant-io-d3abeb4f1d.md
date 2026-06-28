---
source_url: "https://www.home-assistant.io/integrations/weather"
final_url: "https://www.home-assistant.io/integrations/weather"
canonical_url: "https://www.home-assistant.io/integrations/weather/"
source_handle: "web:www-home-assistant-io:d3abeb4f1d4a"
source_section: "integrations-weather"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "84639fbaf5c90300e525f6ff0fce06ae0094ae091cf36ebf79e47ae3008eea82"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Weather - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/weather
- Final URL: https://www.home-assistant.io/integrations/weather
- Canonical URL: https://www.home-assistant.io/integrations/weather/
- Fetched at: 2026-06-28T03:27:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your Weather platforms with Home Assistant.

## Extracted Text

On this page
State and state attributes
Condition mapping
State attributes
List of actions
Examples
The Weather integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gather meteorological information from web services and display the conditions and other details about the weather at the given location.
Note
Building block integration
This weather is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this weather building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the weather building block offers.
For a list of weather integrations, on the integrations page, select the weather category .
Read the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] documentation for your particular weather provider to learn how to set it up.
Home Assistant currently supports free web services some of which require registration.
A weather entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] ’s state is used to indicate the current overall conditions, such as ‘cloudy’ or ‘sunny’.
The weather entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] can provide the conditions listed below as its state:
Clear, night : The sky is clear during the night. clear-night .
Cloudy : There are many clouds in the sky. cloudy .
Fog : There is a thick mist or fog reducing visibility. fog .
Hail : Hailstones are falling. hail .
Lightning : Lightning/thunderstorms are occurring. lightning .
Lightning, rainy : Lightning/thunderstorm is occurring along with rain. lightning-rainy .
Partly cloudy : The sky is partially covered with clouds. partlycloudy .
Pouring : It is raining heavily. pouring .
Rainy : It is raining. rainy .
Snowy : It is snowing. snowy .
Snowy, rainy : It is snowing and raining at the same time. snowy-rainy .
Sunny : The sky is clear and the sun is shining. sunny .
Windy : It is windy. windy .
Windy, cloudy : It is windy and cloudy. windy-variant .
Exceptional : Exceptional weather conditions are occurring. exceptional .
Detailed weather conditions as well as the unit of measurements used for the conditions are indicated by state attributes. A weather entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] may not support all the state attributes.
apparent_temperature : 12.0 cloud_coverage : 0 dew_point : 5.0 humidity : 76 precipitation_unit : mm pressure : 1019 pressure_unit : hPa temperature : 14.2 temperature_unit : °C uv_index : 2 visibility : 10 visibility_unit : km wind_bearing : 260 wind_gust_speed : 51.56 wind_speed : 35.17 wind_speed_unit : km/h
The Weather integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get weather forecasts ( weather.get_forecasts )
Retrieves the forecasts from one or more weather entities.
For an overview of every action across all integrations, see the actions reference .
Example template sensor using get_forecasts
Example template sensor that contains the hourly forecast
template : - triggers : - trigger : time_pattern hours : /1 actions : - action : weather.get_forecasts data : type : hourly target : entity_id : weather.home response_variable : hourly sensor : - name : Temperature forecast next hour unique_id : temperature_forecast_next_hour state : > {{ hourly['weather.home'].forecast[0].temperature }} unit_of_measurement : " °C"
Example action response
weather.tomorrow_io_home_nowcast : forecast : - datetime : " 2023-12-07T13:00:00+00:00" condition : cloudy precipitation_probability : 0 wind_bearing : 241.19 temperature : 0.1 dew_point : -1.9 wind_speed : 16.88 precipitation : 0 humidity : 86 - datetime : " 2023-12-07T14:00:00+00:00" condition : cloudy precipitation_probability : 0 wind_bearing : 232.41 temperature : 0.8 dew_point : -2.8 wind_speed : 17.82 precipitation : 0 humidity : 77 - datetime : " 2023-12-07T15:00:00+00:00" condition : cloudy precipitation_probability : 0 wind_bearing : 236.09 temperature : 1.1 dew_point : -2.6 wind_speed : 17.89 precipitation : 0 humidity : 77 weather.toronto_forecast : forecast : - datetime : " 2023-12-07T14:00:00+00:00" condition : snowy precipitation_probability : 40 temperature : 0 - datetime : " 2023-12-07T15:00:00+00:00" condition : snowy precipitation_probability : 40 temperature : 0 - datetime : " 2023-12-07T16:00:00+00:00" condition : snowy precipitation_probability : 40 temperature : 0
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Weather entity was introduced in Home Assistant 0.32.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Weather
Back to top
