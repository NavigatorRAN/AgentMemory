# Honeywell Total Connect Comfort (US) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/honeywell
- Final URL: https://www.home-assistant.io/integrations/honeywell
- Canonical URL: https://www.home-assistant.io/integrations/honeywell/
- Fetched at: 2026-06-28T02:49:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Honeywell thermostats within Home Assistant.

## Extracted Text

On this page
Configuration
Supported hardware
Climate
Sensor
Switch
Humidifier
Available Actions
Configuration Example
The Honeywell Total Connect Comfort integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Home Assistant with US-based Honeywell Total Connect Comfort (TCC) climate systems.
If your system is compatible with this integration, then you will be able access it via https://mytotalconnectcomfort.com/portal/ (note the /portal/ ).
To add the Honeywell Total Connect Comfort (US) hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Honeywell Total Connect Comfort (US) .
Follow the instructions on screen to complete the setup.
Home Assistant is integrated with the following devices through https://mytotalconnectcomfort.com/portal/ :
Thermostats
Every thermostat is exposed as a climate entity
Known working devices: TH6320R1004 , RTH9585WF1004 , RTH6580WF
Sensors
A Temperature sensor entity
A Humidity sensor entity
Known working devices: C7089R1013 , RTH6580WF
Other devices like Security systems are not currently supported by this integration.
The climate platform integrates Honeywell US-based thermostats into Home Assistant, allowing control of the thermostat through the user interface. The current inside temperature, operating mode, and fan state are also displayed on the thermostat card.
All climate actions are supported except set_swing_mode .
Due to the instability of the Honeywell total connect system, actions within automations should repeat until success similar to the following example:
alias : " No one home" description : " Everyone has left home" triggers : - trigger : numeric_state entity_id : zone.home for : minutes : 10 below : 1 actions : - repeat : sequence : - action : climate.set_temperature target : entity_id : climate.stat data : temperature : 64 - delay : minutes : 1 until : - condition : state entity_id : climate.stat attribute : temperature state : 64
The sensor platform integrates inside and outside temperature and humidity into Home Assistant as sensors for each device. Not every supported thermostat will support all sensors.
This integration will add Home Assistant sensors for the following:
Sensor Value Outdoor temperature Average temperature of all Honeywell Wireless Outdoor Sensors Outdoor humidity Average humidity of all Honeywell Wireless Outdoor Sensors Indoor temperature Current temperature as measured at the specific thermostat Indoor humidity Current humidity as measured at the specific thermostat
The switch entity integrates the emergency heat option for each device. If the thermostat supports emergency heat, the switch entity will be created.
This integration will add a switch for the following:
Switch Value Emergency Heat Activates second stage heat source as primary heat
If the discovered device supports humidity control, the integration will add a humidifier and/or dehumidifier for each device.
Action Description humidifier.set_humidity Set target humidity level humidifier.turn_on Enable humidity control humidifier.turn_off Disable humidity control humidifier.toggle Toggle humidity control
For more details, see the humidifier integration documentation.
# Example configuration.yaml entry automation : - alias : " Maintain Comfortable Humidity" trigger : - platform : numeric_state entity_id : sensor.indoor_humidity below : 30 # Trigger when humidity drops below 30% actions : - action : humidifier.turn_on target : entity_id : humidifier.living_room - action : humidifier.set_humidity target : entity_id : humidifier.living_room data : humidity : 35 # Set target humidity to 35% (recommended for comfort)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Honeywell Total Connect Comfort (US) hub was introduced in Home Assistant pre 0.7, and it's used by
3377 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rdfurman
@mkmer
Categories
Back to top
