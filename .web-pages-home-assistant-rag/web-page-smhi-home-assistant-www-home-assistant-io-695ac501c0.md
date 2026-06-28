# SMHI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smhi
- Final URL: https://www.home-assistant.io/integrations/smhi
- Canonical URL: https://www.home-assistant.io/integrations/smhi/
- Fetched at: 2026-06-28T03:17:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SMHI forecasts within Home Assistant.

## Extracted Text

On this page
Configuration
Weather
Sensors
Remove the integration
To remove an integration instance from Home Assistant
The SMHI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds support for the SMHI.se web service as a source for meteorological data for your location.
Important
Only locations close to Sweden can be added. See SMHI.se area for more details which locations are supported.
To add the SMHI service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SMHI .
Follow the instructions on screen to complete the setup.
The weather entity provides the current state of the weather as well as detailed forecasts for daily, hourly, and twice-daily weather.
The integration creates entities showing the current state of some additional weather and fire metrics.
The following weather sensors are provided (cloud sensors are disabled by default):
Thunder probability (%): Probability of thunder
Total cloud coverage (%): Mean value of total cloud cover
Low cloud coverage (%): Mean value of low-level cloud cover
Medium cloud coverage (%): Mean value of medium-level cloud cover
High cloud coverage (%): Mean value of high-level cloud cover
Precipitation category : Precipitation category can be any of the following: No precipitation, Rain, Thunderstorm, Freezing rain, Mixed/ice, Snow, Wet snow, Mixture of rain and snow, Ice pellets, Graupel, Hail, Drizzle and Freezing drizzle
Frozen precipitation (%): Percent of precipitation in frozen form
The following fire sensors are provided (fire sensors are disabled by default):
FWI-index : Fire weather index classified from low risk to very high risk
FWI-value : Fire weather index as its native value
Initial spread index (ISI) : Describes the expected rate of fire spread
Build up index (BUI) : Indicates the total amount of fuel available for the fire
Fine fuel moisture code (FFMC) : Describes the moisture content in the dead fine fuels
Duff moisture code (DMC) : Describes moisture content of loosely compacted organic layers of moderate depth
Drought code (DC) : Describes moisture content of deep compact organic layers
Highest grass fire risk : Highest grass fire risk (danger) according to the grass fire model ranging from snow cover to very high
Potential rate of spread : Potential rate of spread (m/min) of uncut and ungrazed natural grass
Fuel drying : Measure of the available water amount in the forest fuel ranging from extremely dry to very wet
The SMHI weather service is free under the Creative Commons Attribution 4.0, international license. Weather data will be pulled once every 30 minutes.
Details about the API are available in the SMHI API documentation .
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SMHI service was introduced in Home Assistant 0.81, and it's used by
2862 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Hub
Sensor
Back to top
