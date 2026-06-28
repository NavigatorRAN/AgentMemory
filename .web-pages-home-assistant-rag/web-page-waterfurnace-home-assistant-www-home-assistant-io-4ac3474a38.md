# WaterFurnace - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/waterfurnace
- Final URL: https://www.home-assistant.io/integrations/waterfurnace
- Canonical URL: https://www.home-assistant.io/integrations/waterfurnace/
- Fetched at: 2026-06-28T03:27:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WaterFurnace Geothermal System into Home Assistant.

## Extracted Text

On this page
Climate
Sensors
Energy
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Limitations
The WaterFurnace integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] communicates with the WaterFurnace Symphony website’s WebSocket to show you many of the sensors in your system. While not an official API, this is the same backend the Symphony website is based on, and should be reasonably stable.
The integration creates a climate The Climate entity allows you to control and monitor HVAC (heating, ventilating, and air conditioning) devices and thermostats. [Learn more] entity for each geothermal system found in your account. You can use this entity to set the target temperature, humidity setpoint, and HVAC mode directly from Home Assistant.
Setting the unit to E-Heat mode is not currently supported. If you need to use E-Heat, you can set it through the thermostat, Symphony website, or Symphony app.
The integration exposes the following sensors (if available):
Thermostat Setpoint
Thermostat Current Temp
Leaving Air Temp
Entering / Leaving Water Loop Temp
Water Flow Rate
Current Humidity
Current Humidity Setpoint
Total system power (in Watts)
Furnace Mode
Compressor Power
Fan Power
Aux Power
Loop Pump Power
Compressor Speed
Fan Speed
The integration is also able to track historic energy use. You can track the total energy consumption in the energy dashboard. This data is refreshed every 2 hours, so your energy use may lag behind.
On first setup, the integration tries to fetch the last 13 months of available data. This can take up to 40 minutes to complete.
To use Waterfurnace in your installation, you need to configure the integration with your Symphony Waterfurnace account.
To add the WaterFurnace device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WaterFurnace .
Follow the instructions on screen to complete the setup.
username
The email address for your Symphony WaterFurnace account
password
The password for your Symphony WaterFurnace account
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If your account has more than one location, only devices in the first location will be available.
The WebSocket interface used by this module requires active polling to prevent the server side shuts down the connection. By default, this polling is happening every 10 seconds. All sensors are updated during every polling cycle.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WaterFurnace device was introduced in Home Assistant 0.62, and it's used by
53 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sdague
@masterkoppa
Categories
Sensor
Back to top
