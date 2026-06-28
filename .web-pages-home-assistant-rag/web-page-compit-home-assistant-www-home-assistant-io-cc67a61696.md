---
source_url: "https://www.home-assistant.io/integrations/compit"
final_url: "https://www.home-assistant.io/integrations/compit"
canonical_url: "https://www.home-assistant.io/integrations/compit/"
source_handle: "web:www-home-assistant-io:cc67a61696c4"
source_section: "integrations-compit"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7b3c73c6a1f55cf9029c95433db4d40441f941915f761d17ac171ecb04449e6b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Compit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/compit
- Final URL: https://www.home-assistant.io/integrations/compit
- Canonical URL: https://www.home-assistant.io/integrations/compit/
- Fetched at: 2026-06-28T02:34:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Compit devices within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Thermostats
Controllers
Sensors
Supported functionality
Binary sensors
Switches
Climate
Fans
Numbers
Selects
Water heaters
Removing the integration
To remove an integration instance from Home Assistant
The Compit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate air conditioning, ventilation, and heating controllers with Home Assistant. You need a Compit iNext account, which you can set up at inext.compit.pl .
Create an account on inext.compit.pl .
Configure your Compit devices in your account.
To add the Compit hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Compit .
Follow the instructions on screen to complete the setup.
Username
The username of your Compit iNext account.
Password
The password of your Compit iNext account.
This integration supports most of Compit device models across thermostats, controllers, and sensors.
Nano Color – Room thermostat
Nano Color 2 – Room thermostat
Nano One – Room thermostat
AF-1 – Anti-freeze system
BioMax742 – Pellet boiler controller
BioMax775 , BioMax772 – Pellet boiler controllers
BWC310 – Mixing valve controller
COMBO – Combo module
EL750 – Electric boiler controller
L2 – Floor heating controller
R350.CWU – Universal controller
R350 T3 – Universal controller
R350.M – Universal controller
R377B – Heat pump cascade controller
R470 , R480 – Heat pump controllers
R490 – Heat pump controller
R770RS , R771RS – Boiler controllers
R810 – Heating circuit controller
R900 – Heat pump controller
SolarComp951 – Solar system controller
SolarComp971 – Solar system controller
SolarComp971C – Solar system controller
SHC – CO₂, humidity, and temperature sensor
SPM – Air quality sensor
Note
When the SPM sensor is connected to a Nano Color thermostat, it is displayed as SPM - Nano Color in Home Assistant. When connected to a Nano Color 2 thermostat, it is displayed as SPM - Nano Color 2 .
The Compit integration provides the following entities.
The integration provides various sensors depending on your device model. Below is a complete list of available sensors and the devices that support them.
Temperature sensors
Outdoor temperature
Description : Current outdoor temperature.
Available for devices :
R810 (Heating circuit controller)
R350 T3 (Universal controller)
Nano Color (Room thermostat)
CO2 SHC (CO₂, humidity, and temperature sensor)
R470 (Heat pump controller)
BioMax742 (Pellet boiler controller)
R350.CWU (Universal controller)
BioMax772 (Pellet boiler controller)
R770RS / R771RS (Boiler controllers)
BioMax775 (Pellet boiler controller)
R350.M (Universal controller)
Nano Color 2 (Room thermostat)
R900 (Heat pump controller)
SPM (Air quality sensor)
AF-1 (Anti-freeze system)
Boiler temperature
Description : Current temperature of the boiler.
EL750 (Electric boiler controller)
Calculated heating temperature
Description : Calculated target heating temperature.
Available for devices : R810 (Heating circuit controller), BWC310 (Mixing valve controller)
Target heating temperature
Description : Target heating temperature setting.
Return circuit temperature
Description : Temperature of the return circuit.
Available for devices : R810 (Heating circuit controller), AF-1 (Anti-freeze system)
Calculated target temperature
Description : Calculated target temperature for the system.
Available for devices : R350 T3 (Universal controller), R350.CWU (Universal controller)
Circuit target temperature
Description : Target temperature for the heating circuit.
Available for devices : R350 T3 (Universal controller)
Mixer temperature
Description : Temperature at the mixer valve.
Available for devices : R350 T3 (Universal controller), R350.M (Universal controller)
Mixer temperature zone 1
Description : Mixer temperature for zone 1.
Available for devices : R770RS / R771RS (Boiler controllers)
Mixer temperature zone 2
Description : Mixer temperature for zone 2.
Collector temperature
Description : Temperature of the solar collector.
SolarComp 951 (Solar system controller)
SolarComp971 (Solar system controller)
SolarComp971C (Solar system controller)
Tank temperature T2 (bottom)
Description : Temperature at the bottom of the tank (sensor T2).
Tank temperature T3 (top)
Description : Temperature at the top of the tank (sensor T3).
Tank temperature T4
Description : Temperature at sensor T4 location.
Available for devices : SolarComp 951 (Solar system controller)
DHW temperature
Description : Domestic hot water temperature.
Available for devices : EL750 (Electric boiler controller)
DHW measured temperature
Description : Measured domestic hot water temperature.
Available for devices : R350.CWU (Universal controller), R480 (Heat pump controller)
Buffer return temperature
Description : Temperature of the buffer return.
Lower source temperature
Description : Temperature of the lower heat source.
Available for devices : R490 (Heat pump controller)
Upper source temperature
Description : Temperature of the upper heat source.
Actual buffer temperature
Description : Current buffer temperature.
Available for devices : R480 (Heat pump controller), R900 (Heat pump controller)
Actual DHW temperature
Description : Current domestic hot water temperature.
Protection temperature
Description : Protection temperature sensor reading.
Available for devices : R350.M (Universal controller)
Buffer set temperature
Description : Buffer temperature setpoint.
Available for devices : R377B (Controller)
Actual heating circuit temperature zone 1
Description : Current temperature in heating circuit zone 1.
Available for devices : R900 (Heat pump controller)
Actual heating circuit temperature zone 2
Description : Current temperature in heating circuit zone 2.
Actual heating circuit temperature zone 3
Description : Current temperature in heating circuit zone 3.
Actual heating circuit temperature zone 4
Description : Current temperature in heating circuit zone 4.
Actual upper source temperature
Description : Current upper source temperature.
Calculated buffer temperature
Description : Calculated buffer temperature.
Calculated DHW temperature
Description : Calculated domestic hot water temperature.
Calculated upper source temperature
Description : Calculated upper source temperature.
Heating target temperature zone 1
Description : Target heating temperature for zone 1.
Heating target temperature zone 2
Description : Target heating temperature for zone 2.
Heating target temperature zone 3
Description : Target heating temperature for zone 3.
Heating target temperature zone 4
Description : Target heating temperature for zone 4.
Air quality sensors
PM2.5 level
Description : PM2.5 particulate matter status level (normal, warning, exceeded).
Available for devices : Nano Color (Room thermostat), Nano Color 2 (Room thermostat)
PM10 level
Description : PM10 particulate matter status level (normal, warning, exceeded).
PM2.5 measured
Description : PM2.5 particulate matter concentration in µg/m³.
Available for devices : SPM (Air quality sensor)
PM10 measured
Description : PM10 particulate matter concentration in µg/m³.
PM1 level measured
Description : PM1 particulate matter concentration in µg/m³.
Available for devices : SPM - Nano Color 2 (Air quality sensor connected to Nano Color 2)
PM4 level measured
Description : PM4 particulate matter concentration in µg/m³.
CO₂ level
Description : Carbon dioxide concentration in ppm.
CO₂ percent
Description : Carbon dioxide level as percentage.
Humidity sensors
Humidity
Description : Relative humidity in percent.
Available for devices : SHC (CO₂, humidity, and temperature sensor), SPM (Air quality sensor)
Power and energy sensors
Collector power
Description : Current power output from solar collector in kW.
Energy today
Description : Energy collected today in kWh.
Available for devices : SolarComp971 (Solar system controller), SolarComp971C (Solar system controller)
Energy consumption
Description : Current energy consumption in MW.
Available for devices : SolarComp 971SD1 (Solar system controller)
Energy total
Description : Total energy consumed in kWh.
Available for devices : R350.CWU (Universal controller)
Energy yesterday
Description : Energy consumed yesterday in kWh.
Energy smart grid yesterday
Description : Energy consumed via smart grid yesterday in kWh.
Fuel and battery sensors
Fuel level
Description : Current fuel level in percent.
R770RS (Boiler controller)
R771RS (Boiler controller)
Battery level
Description : Battery charge level in percent.
Available for devices : AF-1 (Anti-freeze system)
Charging power
Description : Battery charging current in mA.
Diagnostic sensors
Ventilation alarm
Description : Ventilation system alarm status.
Ventilation gear
Description : Current ventilation gear setting.
Available for devices : Nano Color 2 (Room thermostat)
Alarm code
Description : System alarm code.
PK1 function
Description : PK1 function mode status.
Available for devices : Combo (Combo module)
The available sensors depend on your specific Compit device configuration. Not all sensors will be available for every device.
Airing
Description : Indicates whether a window is open for airing.
Battery charging
Description : Indicates whether the battery is currently charging.
CO₂ alert
Description : Indicates whether the CO₂ level has exceeded the threshold.
Description : Indicates whether the CO₂ level is problematic.
Available for devices : Nano Color (Room thermostat), Nano Color 2 (Room thermostat), SPM (Air quality sensor), SHC (CO₂, humidity, and temperature sensor)
Dust alert
Description : Indicates whether the dust level has exceeded the threshold.
Has battery
Description : Indicates whether the device has a battery installed.
Has external power
Description : Indicates whether the device is connected to external power.
Pump status
Description : Indicates whether the pump is currently running.
Temperature alert
Description : Indicates whether the temperature has exceeded the threshold.
Binary sensors provide status information about your Compit devices.
Switch entities let you turn device modes and features on or off.
Device on/off
Description : Turns the device on or off.
Force domestic hot water
Description : Forces domestic hot water production.
The climate entity reflects the current heating or cooling state and the active target temperature. Use the climate entity when you want to change the target temperature temporarily or for the current session (for example, turning up the heat for the evening). The climate entity is where you set what temperature the device is aiming for right now.
Ventilation
Description : Controls the ventilation fan. You can turn the fan on or off and set the speed.
Available for devices : Nano Color (Room thermostat), Nano Color 2 (Room thermostat).
Remarks : The fan has 5 speed levels, shown as a percentage in Home Assistant.
Number entities let you set default temperature setpoints and other configuration values. These are the preset target temperatures used for each operating mode (such as Comfort, Eco, or Holiday). They are not used for temporary or one-off changes; for those, use the climate entity instead.
Comfort target temperature
Description : Target room temperature for comfort mode.
Range : 0–40 °C
Available for devices : Nano One (Room thermostat), Nano Color (Room thermostat), Nano Color 2 (Room thermostat)
Eco target temperature
Description : Target room temperature for eco mode.
Available for devices : Nano One (Room thermostat)
Holiday target temperature
Description : Target room temperature while you are on holiday.
Eco winter target temperature
Description : Target room temperature for eco mode during the winter
season.
Eco cooling target temperature
Description : Target room temperature for eco mode during cooling.
Out-of-home target temperature
Description : Target room temperature when nobody is at home.
Constant target temperature
Description : Constant target temperature for the heating circuit.
Range : 0–95 °C
Available for devices : R810 (Heating circuit controller)
Heating constant target temperature
Description : Constant target temperature for the heat pump heating
circuit.
Available for devices : R470 (Heat pump controller)
Mixer target temperature
Description : Target temperature for the mixing valve circuit.
Range : 0–90 °C
Mixer target temperature zone 1
Description : Target temperature for mixing valve circuit in zone 1.
Available for devices : R770RS (Boiler controller), R771RS (Boiler controller)
Mixer target temperature zone 2
Description : Target temperature for mixing valve circuit in zone 2.
Boiler target temperature
Description : Target temperature for the boiler.
Available for devices : BioMax742 (Pellet boiler controller), EL750 (Electric boiler controller)
Boiler constant target temperature
Description : Constant target temperature for the boiler.
Available for devices : BioMax742 (Pellet boiler controller), BioMax772 (Pellet boiler controller), BioMax775 (Pellet boiler controller)
Language
Description : Language of the device interface.
Options : Polish, English
Available for devices : Nano Color (Room thermostat), Nano Color 2 (Room thermostat), Nano One (Room thermostat)
Aero by pass
Description : Bypass mode for ventilation systems.
Options : Off, Auto, On
Nano work mode
Description : Operating mode for the thermostat.
Options : Manual 3, Manual 2, Manual 1, Manual 0, Schedule, Christmas, Out of home
Operating mode
Description : Primary operating mode of the device.
Options : Disabled, Eco, Hybrid (for R900, R490, R480); Disabled, Auto, Eco (for R470)
Available for devices : R900 (Heat pump controller), R490 (Heat pump controller), R470 (Heat pump controller), R480 (Heat pump controller)
Work mode
Description : Seasonal operating mode.
Options : Winter, Summer, Cooling
Heating source of correction
Description : Source for heating temperature corrections.
Options : No corrections, Schedule, Thermostat, Nano nr 1, Nano nr 2, Nano nr 3, Nano nr 4, Nano nr 5
Available for devices : R470 (Heat pump controller), BioMax742 (Pellet boiler controller)
SolarComp operating mode
Description : Operating mode for solar controllers.
Options : Auto, De-icing, Holiday, Disabled
Available for devices : SolarComp951 (Solar system controller), SolarComp971 (Solar system controller) and SolarComp971C (Solar system controller)
Mixer mode zone 1
Description : Zone 1 mixing valve operating mode.
Options : Disabled, Without thermostat, Schedule, Thermostat, Nano nr 1, Nano nr 2, Nano nr 3, Nano nr 4, Nano nr 5
Available for devices : BioMax775 (Pellet boiler controller), BioMax772 (Pellet boiler controller)
Mixer mode zone 2
Description : Zone 2 mixing valve operating mode.
Mixer mode
Description : Mixing valve operating mode.
Available for devices : R350 T3 (Universal controller), BioMax742 (Pellet boiler controller)
DHW circulation
Description : Domestic hot water circulation mode.
Options : Disabled, Constant, Schedule
Available for devices : BioMax775 (Pellet boiler controller), BioMax742 (Pellet boiler controller), BioMax772 (Pellet boiler controller)
Buffer mode
Description : Buffer tank operating mode.
Options : Schedule, Manual, Disabled
Available for devices : R480 (Heat pump controller)
Water heater
Description : Controls the domestic hot water parameters.
Available for devices : BioMax742, BioMax772, BioMax775, EL750, R350.CWU, R377B, R470, R480, R490, R770RS, R771RS, R900, SolarComp951, SolarComp971, SolarComp971C
Remarks :
Solar controllers and R350.CWU only support setting the target temperature.
Other devices also support On/Off and operation modes.
State off maps to off in Compit
State performance maps to on in Compit
State eco maps to schedule in Compit
Solar controllers don’t support current temperature attribute.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Compit hub was introduced in Home Assistant 2025.10, and it's used by
11 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Przemko92
Categories
Water Heater
Back to top
