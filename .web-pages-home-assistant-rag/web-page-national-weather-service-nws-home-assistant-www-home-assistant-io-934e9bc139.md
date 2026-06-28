# National Weather Service (NWS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nws
- Final URL: https://www.home-assistant.io/integrations/nws
- Canonical URL: https://www.home-assistant.io/integrations/nws/
- Fetched at: 2026-06-28T03:04:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate National Weather Service data within Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Details
The NWS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the National Weather Service web API as a source for meteorological data for your location.
To add the National Weather Service (NWS) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select National Weather Service (NWS) .
Follow the instructions on screen to complete the setup.
According to the API documentation , a string is required for the API key, and an email address is suggested to be included within the string.
Providing a METAR station code is optional, and if not supplied, the closest station to the latitude and longitude will be chosen. A list of nearby stations is printed to the log with level DEBUG if no station is supplied. Stations can also be found on the NOAA website . Codes with only three characters, for example, ADW should be prefixed with the letter K, KADW .
One weather entity is created for each entry in the configuration. Hourly and day/night forecasts are provided through the weather.get_forecasts action . The time supplied for each forecast is the start time for the forecast. Sensors are also created as disabled entities after configuration and can be enabled by the user.
The National Weather Service (NWS) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get extra forecasts data ( nws.get_forecasts_extra )
Retrieves extra data for weather forecasts.
For an overview of every action across all integrations, see the actions reference .
Details about the API are available in the NWS API documentation . The pynws library is used to retrieve data.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The National Weather Service (NWS) service was introduced in Home Assistant 0.99, and it's used by
1.9% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MatthewFlamm
@kamiyo
Categories
Weather
Back to top
