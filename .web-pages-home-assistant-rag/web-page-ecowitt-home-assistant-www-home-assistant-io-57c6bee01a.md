# Ecowitt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ecowitt
- Final URL: https://www.home-assistant.io/integrations/ecowitt
- Canonical URL: https://www.home-assistant.io/integrations/ecowitt/
- Fetched at: 2026-06-28T02:39:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ecowitt Weather Station within Home Assistant.

## Extracted Text

On this page
Supported devices
Gateway/Hub
Sensors
Prerequisites
Configuration
Ecowitt Weather Station configuration
Supported functionality
Binary sensors
TLS/SSL limitations
Removing the integration
To remove an integration instance from Home Assistant
The Ecowitt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate Ecowitt devices into Home Assistant.
The following devices have been reported to work with the Ecowitt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] :
GW1200 Wi-Fi Gateway
GW2000 Ethernet and Wi-Fi Gateway
GW3000 Ethernet and Wi-Fi Gateway with Data Storage
WH51 Wireless Soil Moisture Sensor
WH40 Wireless Self-emptying Rain Gauge Sensor
WH57 Outdoor Wireless Lightning Detection Sensor
WS90 Wireless 7-in-1 Weather Sensor
Your weather station is set up with sensors connected and functioning.
Your gateway is connected to your local network via Wi-Fi or Ethernet. You can configure the network connection using one of the following methods:
Ecowitt mobile app (requires creating an Ecowitt account)
Embedded web interface by connecting to the device’s Wi-Fi hotspot and opening 192.168.4.1 in a browser (no account required)
Your Home Assistant instance is accessible via HTTP. Ecowitt devices do not support HTTPS connections. If your instance only accepts HTTPS, refer to TLS/SSL limitations .
To add the Ecowitt device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ecowitt .
Follow the instructions on screen to complete the setup.
The Ecowitt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] works by first creating a callback endpoint on your Home Assistant instance and then adding this configuration to the Ecowitt console so that it starts sending data.
The integration will display a Server IP / Host Name, Path, and Port. You can input it into the Ecowitt configuration in one of two ways:
Option 1 : Use the Ecowitt app (on your phone):
In the top-left corner, select the menu icon ( ) and select Devices .
Under My Devices , select your Ecowitt station.
In the top-right corner, select the ellipsis icon ( ).
From the list, select Others .
Select the DIY Upload Servers button, and from the Supported Servers List , select Customized .
From the Protocol Type Same As list, select Ecowitt .
Enter the Server IP / Host Name, Path, and Port from the integration.
The path has to match! Remove the first forward slash from the path, as the app will prepend one.
Save your settings.
Option 2 : Navigate to the Ecowitt web UI in a browser at the station IP address:
Select Weather Services then scroll down to the Customized section.
Under Customized , select 🔘 Enable and Protocol Type Same As 🔘 Ecowitt.
The Ecowitt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . Available entities depend on which sensors are connected to your weather station.
Battery status : Indicates low battery conditions for wireless sensors.
Leak sensor : Detects water leaks when using compatible water leak detection sensors.
Rain state : Indicates whether it is currently raining.
Air quality
CO2 : Carbon dioxide concentration (ppm).
PM1 : Ultra-fine particulate matter 1.0 concentration (µg/m³).
PM2.5 : Fine particulate matter 2.5 concentration (µg/m³).
PM4 : Particulate matter 4.0 concentration (µg/m³).
PM10 : Coarse particulate matter 10 concentration (µg/m³).
Lightning detection
Lightning count : Total number of lightning strikes detected.
Lightning distance : Distance to the last detected lightning strike (km or mi).
Power and diagnostics
Battery level : Battery percentage for wireless sensors.
Battery voltage : Battery voltage for connected sensors in volts (V).
Signal strength : Signal quality indicator for wireless sensors in percentage.
Precipitation
Rain rate : Current rainfall intensity (mm/h or in/h).
Rainfall : Total rainfall accumulation (mm or in).
Daily rainfall : Rainfall amount for the current day (mm or in).
Weekly rainfall : Rainfall amount for the current week (mm or in).
Monthly rainfall : Rainfall amount for the current month (mm or in).
Yearly rainfall : Rainfall amount for the current year (mm or in).
Soil
Soil moisture : Soil moisture percentage for connected soil moisture sensors.
Soil temperature : Temperature readings from soil temperature sensors (°C or °F).
Solar and UV
Light intensity : Illuminance measurement (lx). Lux measures the amount of light falling on a surface.
Solar radiation : Solar irradiance (W/m²).
UV index : Current UV index value. The UV index is a standardized measurement of ultraviolet radiation strength from the sun.
Values range from 0-2 (low risk), 3-5 (moderate), 6-7 (high), 8-10 (very high), to 11+ (extreme).
Weather
Barometric pressure : Atmospheric pressure (hPa or inHg).
Dew point : Calculated dew point temperature (°C or °F).
Humidity : Indoor and outdoor humidity percentage.
Temperature : Indoor and outdoor temperature measurements (°C or °F).
Wind
Wind direction : Wind direction (degrees).
Wind gust : Maximum wind gust speed (km/h or mph).
Wind speed : Current wind speed (km/h or mph).
Ecowitt devices do not support TLS/SSL connections (HTTPS). If your Home Assistant instance is configured to use HTTPS only, the Ecowitt integration will not work properly. You must ensure your Home Assistant instance is accessible via HTTP (non-secure) for the Ecowitt devices to successfully send data.
If you’re using SSL/TLS for your Home Assistant instance, you’ll need to configure your setup to accept both secure (HTTPS) and non-secure (HTTP) connections. This can typically be done by adjusting your reverse proxy configuration or by using the NGINX app for Home Assistant which can handle both HTTP and HTTPS traffic simultaneously.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ecowitt device was introduced in Home Assistant 2022.9, and it's used by
2.6% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pvizeli
Categories
Binary sensor
Sensor
Back to top
