# WeatherFlow - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/weatherflow
- Final URL: https://www.home-assistant.io/integrations/weatherflow
- Canonical URL: https://www.home-assistant.io/integrations/weatherflow/
- Fetched at: 2026-06-28T03:28:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your WeatherFlow tempest into Home Assistant.

## Extracted Text

On this page
Which integration(s) should I use
Configuration
Sensors
Event entity
Diagnostic sensors
Networking notes
The WeatherFlow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is a local-only integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] that reads weather data from all WeatherFlow Tempest compatible weather station on the local network.
Note
You may see slight deviations between the values reported in Home Assistant and the values in the WeatherFlow App. This is because the WeatherFlow app considers both forecasts and neighboring weather stations in addition to the local data used in this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
There are two integrations for WeatherFlow devices, and you are not limited to selecting just one.
WeatherFlow is a local only UDP -based integration that will read data directly from the device. This integration does require the Home Assistant server and the WeatherFlow device to be on the same subnet.
WeatherFlow Cloud is a cloud -based integration that closely mirrors the data available via the Weatherflow Tempest mobile applications and is likely a good starting place for most users as it provides both Forecast and Sensor data.
To add the WeatherFlow hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WeatherFlow .
Follow the instructions on screen to complete the setup.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will expose the following sensors:
Air density
Air pressure
Dew point
Feels like
Humidity
Illuminance
Irradiance
Lightning average distance
Lightning count
Precipitation (accumulated over the previous minute)
Precipitation intensity ( extrapolated from the accumulation over the previous minute)
Precipitation type
Temperature
UV index
Vapor pressure
Wet bulb temperature
Wind direction
Wind direction average
Wind gust
Wind lull
Wind speed
The WeatherFlow Tempest station also sends out event triggers when it starts raining and when there is a lightning strike near by.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will expose these event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] and can be used for automations. The following entities will be exposed:
Lightning strike
Precipitation start
Additionally the following diagnostic sensors are available:
Battery (percentage)
Battery voltage
Signal strength
Uptime
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] relies on the ability of Home Assistant to receive UDP traffic on port 50222 . You may run into trouble if you have a more complex network setup utilizing either VLANs or multiple subnets.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WeatherFlow hub was introduced in Home Assistant 2023.10, and it's used by
2129 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@natekspencer
@jeeftor
Categories
Environment
Sensor
Back to top
