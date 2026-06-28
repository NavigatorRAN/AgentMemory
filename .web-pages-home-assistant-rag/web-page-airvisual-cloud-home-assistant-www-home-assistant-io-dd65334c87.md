# AirVisual Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airvisual
- Final URL: https://www.home-assistant.io/integrations/airvisual
- Canonical URL: https://www.home-assistant.io/integrations/airvisual/
- Fetched at: 2026-06-28T02:26:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use AirVisual data within Home Assistant

## Extracted Text

On this page
Using the AirVisual Cloud API
Configuration
Determining the City/State/Country
Sensor types
Air quality index
Air pollution level
Main pollutant
The AirVisual Cloud integration queries the AirVisual cloud API for air quality data. Data can be collected via latitude/longitude or city/state/country.
AirVisual API keys can be obtained here . Note that the platform was designed using the “Community” package; the “Startup” and “Enterprise” package keys should continue to function, but actual results may vary (or not work at all).
The Community API key is valid for 12 months after which it will expire. You must then go back to the AirVisual website, delete your old key, create a new one following the same steps and update your configuration with the new key.
Note
The “Community” API key is limited to 10,000 calls per month. To accommodate using the same API key for multiple geographies, the airvisual integration will automatically “re-level” the time between API calls so as to not overrun the call limit.
For example:
One instance of the integration: API calls every 5 minutes
Two instances of the integration: API calls every 10 minutes
And so on.
To add the AirVisual Cloud service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AirVisual Cloud .
Follow the instructions on screen to complete the setup.
In addition to using latitude and longitude, the AirVisual integration may be configured to use a city/state/country combination. To easily determine the proper values for a particular location, use the AirVisual region directory . Once you browse to the particular city you want, take note of the breadcrumb title, which is of the form country > state/region > city .
For example, Sao Paulo, Brazil shows a breadcrumb title of Brazil > Sao Paulo > Sao Paulo . Thus, the values to use in the UI would be:
City: Sao Paulo
State: Sao Paulo
Country: Brazil
When configured, the platform will create three sensors for each air quality standard:
Description: This sensor displays a numeric air quality index (AQI), a metric for the overall “health” of the air.
Example Sensor Name: sensor.chinese_air_quality_index
Example Sensor Value: 32
Explanation:
AQI Status Description 0 - 50 Good Air quality is considered satisfactory, and air pollution poses little or no risk 51 - 100 Moderate Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution 101 - 150 Unhealthy for Sensitive Groups Members of sensitive groups may experience health effects. The general public is not likely to be affected 151 - 200 Unhealthy Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects 201 - 300 Very unhealthy Health warnings of emergency conditions. The entire population is more likely to be affected 301+ Hazardous Health alert: everyone may experience more serious health effects
Description: This sensor displays the associated Status (from the above table) for the current AQI.
Sample Sensor Name: sensor.us_air_pollution_level
Example Sensor Value: Moderate
Description: This sensor displays the pollutant whose value is currently highest.
Sample Sensor Name: sensor.us_main_pollutant
Example Sensor Value: PM2.5
Pollutant Symbol More Info Particulate (<= 2.5 μm) PM2.5 EPA: Particulate Matter (PM) Pollution Particulate (<= 10 μm) PM10 EPA: Particulate Matter (PM) Pollution Ozone O EPA: Ozone Pollution Sulpher Dioxide SO2 EPA: Sulfur Dioxide (SO2) Pollution Carbon Monoxide CO EPA: Carbon Monoxide (CO) Pollution in Outdoor Air
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AirVisual Cloud service was introduced in Home Assistant 0.53, and it's used by
1555 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Health
Back to top
