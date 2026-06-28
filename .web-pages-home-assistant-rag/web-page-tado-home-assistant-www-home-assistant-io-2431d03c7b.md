# Tado - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tado
- Final URL: https://www.home-assistant.io/integrations/tado
- Canonical URL: https://www.home-assistant.io/integrations/tado/
- Fetched at: 2026-06-28T03:20:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tado devices with Home Assistant.

## Extracted Text

On this page
Configuration
Connect with Tado
Migrate to new authentication method
Unsupported device types
Presence detection
Data updates
Defining a custom polling interval
Actions
Action: Set climate timer
Action: Set water heater timer
Action: Set climate temperature offset
Action: Add meter reading
The Tado integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] platform is used as an interface to the my.tado.com website.
There is currently support for the following device types within Home Assistant:
Binary sensor - for some additional information of the zones.
Climate - for every Tado zone.
Water heater - for water heater zones.
Sensor - for some additional information of the zones.
Weather - for information about the current weather at the location of your Tado home.
Switch - for controlling child lock on supported devices.
The Tado thermostats are internet connected thermostats. There exists an unofficial API at my.tado.com , which is used by their website and now by this component.
It currently supports presenting the current temperature, the setting temperature, and the current operation mode. The operation mode can be set to manual, auto, and off. If no user is at home anymore, all Tado zones show the away-state (Only with Tado assist mode). Manually switching between home-mode and away-mode is also supported. Manually switching to auto-mode is only supported with Tado assist mode. Any Tado climate card can be switched between these presence modes. This changes the setting for the entire home.
To add the Tado hub to your Home Assistant instance, use this My button:
Tado can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tado .
Follow the instructions on screen to complete the setup.
As of March 21st 2025 , Tado has changed the authentication method. This means a few extra steps need to be followed to log in:
When you set up this integration, the integration will set up a “Device Code” and provide a URL to Tado’s authentication server.
Follow the URL and confirm the “Device Code” (normally it should be copied automatically).
Follow the steps to log in and authenticate your account.
Once the authentication is completed, go back to Home Assistant. Wait a few seconds for the loading screen to finish. You are now connected with Tado!
Important
As of January 1st 2026 , Tado is heavily rate limiting the API. The rate limit is based on a daily quota and is different per subscription type. If affected, the Tado integration will fail to authenticate and/or receive new data. This will result in the integration not working. The reset time is 12:00 CET.
Consider using a custom polling interval suiting your needs.
By default, the integration detects when re-authentication is needed for the new login method and prompts with a re-authenticate action. Follow the steps described under Connect with Tado .
New Tado X devices are not supported by this integration, they have to be used through the Matter integration .
The Tado device tracker is using the Tado Smart Thermostat and its support for person presence detection based on smartphone location by geofencing.
This tracker uses the Tado API to determine if a mobile device is at home.
By default the Tado device tracker will track all devices known to Tado associated with your home. The Tado app needs to have the Geolocation permission enabled for the device to be tracked.
Your device has to be at home at least once before showing up as home or away .
Polling Tado API for presence information will happen at most once every 30 seconds.
Beware that the Tado (v2) API does not provide GPS location of devices, only a bearing, therefore Home Assistant only uses home / not-home status.
The integration normally updates every five minutes. For more detailed steps on how to define a custom polling interval, follow the procedure below.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
The tado.set_climate_timer action sets your Tado climate device, for example a radiator valve, to switch on for a set time period.
Data attribute Optional Description entity_id yes String, Name of entity e.g., climate.heating temperature no String, The required target temperature e.g., 20.5 time_period yes Time Period, Period of time the boost should last for e.g., 01:30:00 overlay yes Override your defaults setting. NB dont set this and the time period
The tado.set_water_heater_timer action sets your water heater to switch on for a set time period.
Data attribute Optional Description entity_id yes String, Name of entity e.g., water_heater.hot_water time_period no Time Period, Period of time the boost should last for e.g., 01:30:00 temperature yes String, The required target temperature e.g., 20.5
The tado.set_climate_temperature_offset action sets the temperature offset for Tado climate devices.
Data attribute Optional Description entity_id yes String, Name of entity e.g., climate.heating offset no Float, Offset you would like to set
Examples:
# Example script to set a timer for the water heater with no temperature specified script : boost_heating : sequence : - action : tado.set_climate_timer target : entity_id : climate.heating data : time_period : " 01:30:00" temperature : 25 - action : tado.set_water_heater_timer target : entity_id : water_heater.hot_water data : time_period : " 01:30:00"
# Example automation to set temperature offset based on another thermostat value automation : # Trigger if the state of either thermostat changes triggers : - trigger : state entity_id : - sensor.temp_sensor_room - sensor.tado_temperature # Check if the room temp is more than 0.5 away from the tado thermostat reading condition. The sensors default to room temperature (20) when the reading is in error: conditions : - condition : template value_template : > {% set tado_temp = states('sensor.tado_temperature')|float(20) %} {% set room_temp = states('sensor.temp_sensor_room')|float(20) %} {{ (tado_temp - room_temp) | abs > 0.5 }} # Work out what the new offset should be (tado temp less the room temp but add the current offset value) and turn that to a negative value for setting as the new offset actions : - action : tado.set_climate_temperature_offset target : entity_id : climate.tado data : offset : > {% set tado_temp = states('sensor.tado_temperature')|float(20) %} {% set room_temp = states('sensor.temp_sensor_room')|float(20) %} {% set current_offset = state_attr('climate.tado', 'offset_celsius') %} {{ (-(tado_temp - room_temp) + current_offset)|round(1) }}
The tado.add_meter_reading action adds your meter readings to Tado Energy IQ. With Energy IQ, you can track your energy consumption and take control of your heating expenses.
Data attribute Optional Description config_entry no String, Config entry to add meter readings to. reading no Integer, Reading in m³ or kWh without decimals.
# Example automation add meter readings on a daily basis. automation : # Trigger on specified time. triggers : - trigger : time at : " 00:00:00" # Add meter readings from `sensor.gas_consumption` to Tado. # Retrieve your `config_entry` id by setting this automation up in UI mode. # Notice that you may have to convert the reading to integer. actions : - action : tado.add_meter_reading data : config_entry : ef2e84b3dfc0aee85ed44ac8e8038ccf reading : " {{ states('sensor.gas_consumption')|int }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tado hub was introduced in Home Assistant 0.41, and it's used by
2.2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@erwindouna
Categories
Binary sensor
Climate
Hub
Sensor
Switch
Water heater
Weather
Back to top
