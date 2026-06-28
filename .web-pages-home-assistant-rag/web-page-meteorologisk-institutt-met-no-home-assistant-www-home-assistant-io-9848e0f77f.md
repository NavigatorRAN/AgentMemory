# Meteorologisk institutt (Met.no) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/met
- Final URL: https://www.home-assistant.io/integrations/met
- Canonical URL: https://www.home-assistant.io/integrations/met/
- Fetched at: 2026-06-28T02:59:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Met.no with Home Assistant.

## Extracted Text

On this page
Configuration
Configuration options
Supported functionality
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Meteorologisk institutt (Met.no) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Met.no web service to retrieve meteorological data for your location. The Norwegian Meteorological Institute and NRK provide the weather forecast. The service is free and does not require an API key.
To add the Meteorologisk institutt (Met.no) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Meteorologisk institutt (Met.no) .
Follow the instructions on screen to complete the setup.
By default, the integration uses your Home Assistant home location . To retrieve weather data for additional locations, add the integration multiple times and specify different coordinates for each instance.
Name
A name for this weather location. It is shown in the UI and used to form the entity ID.
Latitude
The latitude of the location for which to retrieve weather data.
Longitude
The longitude of the location for which to retrieve weather data.
Elevation
The elevation (in meters) of the location. This affects the accuracy of the temperature forecast, especially in mountainous areas.
The integration creates one weather entity per configured location. Each entity provides the current weather, a daily forecast, and an hourly forecast.
The entity exposes the following current-weather attributes:
Temperature and dew point
Humidity and pressure
Visibility
Wind speed, wind gust, and wind bearing
Cloud coverage
UV index
Forecasts additionally include precipitation and precipitation probability.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] weather data every 55 to 65 minutes. The polling interval is randomized to spread load across the Met.no API.
When you update your Home Assistant home location, the integration automatically refreshes the weather data for instances tracking the home location.
The integration uses the free Met.no public API. Usage is subject to the Met.no terms of service , which include fair-use policies and attribution requirements.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Weather entity
Met.no terms of service
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Meteorologisk institutt (Met.no) service was introduced in Home Assistant 0.79, and it's used by
83.3% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
Categories
Weather
Back to top
