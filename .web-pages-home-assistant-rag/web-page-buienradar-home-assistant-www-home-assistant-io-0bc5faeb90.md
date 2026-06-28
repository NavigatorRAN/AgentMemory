# Buienradar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/buienradar
- Final URL: https://www.home-assistant.io/integrations/buienradar
- Canonical URL: https://www.home-assistant.io/integrations/buienradar/
- Fetched at: 2026-06-28T02:32:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate buienradar.nl weather within Home Assistant.

## Extracted Text

On this page
Configuration
Camera
Sensor
Options
The Buienradar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses buienradar.nl as a source for current meteorological data for your location. The weather forecast is delivered by Buienradar, who provides a web service that provides detailed weather information for users in The Netherlands.
The relevant weather station used will be automatically selected based on the location specified in the Home Assistant configuration (or in the Buienradar weather/sensor integration). A map of all available weather stations can be found here .
Besides the weather platform, there is currently support for the following additional device types:
Camera : Radar map
Sensor : Extended weather data
To add the Buienradar service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Buienradar .
Follow the instructions on screen to complete the setup.
The buienradar camera platform uses buienradar.nl as a source for the last rain radar map. The overview image of the whole of the Netherlands is loaded and shown as a camera in Home Assistant. The Netherlands is the default country and can be changed to Belgium (see Options ).
Internally, this integration uses the radar map image as documented on buienradar.nl.
The downloaded image is cached to prevent Home Assistant from making a new request to buienradar.nl multiple times a minute when Home Assistant checks for new stills from the camera.
The camera entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is disabled by default and should be enabled before it reads the camera images.
The Buienradar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will set up separate sensor entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] with more detailed weather data. The selected weather station will provide all-weather data, with the exception of the forecasted precipitation. The forecasted precipitation data will be retrieved from Buienradar using your actual GPS location (and not the location of the nearest weather station). The sensor entities are disabled by default and should be enabled before they will be updated with data.
The following entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will be created:
Station name : The name of the selected meteo-station
Barometer forecast : A numeric barometric forecast (1 to 7)
Barometer forecast name : A textual representation of the barometer forecast, such as Thunderstorms or Stable
Condition code : A symbol and a unique code identifying the current weather condition
a : sunny/clear
b : Mix of clear and medium or low clouds
j : Mix of clear and high clouds
o/r : Partly cloudy (increasing character increases the condition)
c : Heavily clouded
p : Cloudy
d : Alternating cloudy with local fog
n : Clear and local mist or fog
f : Alternatingly cloudy with some light rain
h/k/l : rainy (increasing character increases the condition)
q : Heavily clouded with rain
w : Heavily clouded with rain and winter precipitation
m : Heavily clouded with some light rain
u : Cloudy with light snow
i/v : Heavily clouded with light snowfall (increasing character increases the condition)
t : (Heavy snowfall)
g : (Clear with (possibly) some heavy lightning)
s : (Cloudy with (possibly) some heavy (thunderstorms) showers)
Condition : A symbol and the current weather condition ( clear , cloudy , fog , rainy , snowy or lightning )
Condition detailed : A symbol and detailed current weather condition ( clear , partlycloudy , cloudy , partlycloudy-fog , partlycloudy-light-rain , partlycloudy-rain , light-rain , rainy , snowy-rainy , partlycloudy-light-snow , partlycloudy-snow , light-snow , snowy , partlycloudy-lightning or lightning )
Condition exact : A symbol with the full current weather condition (in English)
Symbol : A symbol for the current weather with the full current condition (in Dutch)
Feel temperature : The current wind chill factor (in °C )
Humidity : The relative humidity (in %)
Temperature : The current temperature (in °C )
Ground temperature : The current ground temperature (in °C )
Wind speed : The wind speed (in km/h )
Wind force : The wind speed/force (in Bft )
Wind direction : Where the wind is coming from, such as N (North), Z (South), or NO (North-East)
Wind azimuth : Where the wind is coming from in degrees, with true north at 0° and progressing clockwise
Pressure : The sea-level air pressure (in hPa )
Visibility : Visibility (in m )
Wind gust : The wind speed of wind gusts ( km/h )
Precipitation : The amount of precipitation/rain (in mm/h)
Precipitation forecast average : The average expected precipitation/rain within the given time-frame (in mm/h)
Precipitation forecast total : The total expected precipitation/rain in mm within the given time-frame. The total expected rain in the configured time-frame will be equal to precipitation_forecast_total / timeframe mm/min. So, with time-frame configured to 30 minutes and a value of 5, the expected rain is 5 mm in 30 minutes, which is the same as 10 mm/h. If time-frame is set to 90 minutes and a value of 5, the expected rain is 5 mm in 90 minutes, which is equal to 3.3 mm/h.
Irradiance : Sun intensity in Watt per square meter ( W/m2 )
Rain last 24h : The rain over the last 24 hours (in mm )
Rain last hour : The rain over the last hour (in mm )
Temperature n days ahead : The forecasted temperature n days ahead (in °C )
Minimum temperature n days ahead : The forecasted minimum temperature n days ahead (in °C )
Rain chance n days ahead : The forecasted chance for rain n days ahead (in %)
Sun chance n days ahead : The forecasted chance for sun n days ahead (in %)
Rain n days ahead : The forecasted amount of rain (in mm ) n days ahead; the average of Minimum rain n days ahead and Maximum rain n days ahead
Minimum rain n days ahead : The minimum forecasted amount of rain (in mm ) n days ahead
Maximum rain n days ahead : The maximum forecasted amount of rain (in mm ) n days ahead
Wind azimuth n days ahead : Where the wind is coming from in degrees, with true north at 0° and progressing clockwise for n days ahead (derived from Wind direction n days ahead )
Wind direction n days ahead : Where the wind will be coming from n days ahead. For example, N (North), Z (South), or NO (North-East).
Wind force n days ahead : The expected wind force (in Bft ) n days ahead
Wind speed n days ahead : The expected wind speed (in m/s ) n days ahead (derived from Wind force n days ahead )
Condition code n days ahead : Symbol and condition code of the expected condition n days ahead
Condition n days ahead : Symbol and expected condition n days ahead
Detailed condition n days ahead : Symbol and detailed expected condition n days ahead
Full condition n days ahead : Symbol and full expected condition n days ahead
To define options for Buienradar, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Buienradar are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
country_code
You can specify the country code (NL or BE) of the country to display on the camera.
delta
Time interval in seconds between camera image updates
timeframe
Minutes to look ahead for precipitation forecast sensors (minimum 5, maximum 120).
Note
Usage statement
Buienradar makes free weather data available for use by individuals and businesses (website/intranet). The use of the weather data is allowed for non-commercial purposes . Please refer to the full usage statement to confirm your use or to request permission.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Buienradar service was introduced in Home Assistant 0.47, and it's used by
2.1% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mjj4791
@ties
@Robbie1221
Categories
Weather
Back to top
