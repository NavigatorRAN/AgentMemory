---
source_url: "https://www.home-assistant.io/integrations/hr_energy_qube"
final_url: "https://www.home-assistant.io/integrations/hr_energy_qube"
canonical_url: "https://www.home-assistant.io/integrations/hr_energy_qube/"
source_handle: "web:www-home-assistant-io:c7ea3a485054"
source_section: "integrations-hr-energy-qube"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9d93a44ee522ecbd4fee8d70de7b111c56ab6b02dda9ce58c76e22be49f2d867"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Qube heat pump - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hr_energy_qube
- Final URL: https://www.home-assistant.io/integrations/hr_energy_qube
- Canonical URL: https://www.home-assistant.io/integrations/hr_energy_qube/
- Fetched at: 2026-06-28T02:50:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Qube heat pump with Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Configuration
Supported functionality
Binary sensors
Sensors
Switches
Water heater
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Qube heat pump integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control Qube heat pumps via the Modbus TCP protocol.
The following devices are known to be supported by the integration:
Qube heat pump
The following devices are not supported by the integration:
Qbooster heat pump (the predecessor of the Qube heat pump)
To add the Qube heat pump hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Qube heat pump .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your Qube heat pump.
Source pump
Description : Indicates whether the source pump is running.
User pump
Description : Indicates whether the user pump is running.
Buffer pump
Description : Indicates whether the buffer pump is running.
Four-way valve
Description : Indicates the state of the four-way valve.
Three-way valve
Description : Indicates the state of the three-way valve.
Cooling output
Description : Indicates whether the cooling output is active.
Heater step 1 / 2 / 3
Description : Indicates whether the electric heater step is active.
Keypad
Description : Indicates whether the keypad is enabled.
Day mode
Description : Indicates whether day mode is active.
Summer mode
Description : Indicates whether summer mode (cooling) is active.
Anti-legionella
Description : Indicates whether an anti-legionella cycle is running.
Dewpoint
Description : Indicates whether the dewpoint input is active.
Booster security
Description : Indicates whether the booster security input is active.
Source flow
Description : Indicates whether source flow is detected.
PV surplus
Description : Indicates whether photovoltaic surplus energy is available.
Thermostat demand
Description : Indicates whether the thermostat is requesting heating or cooling.
Plant demand
Description : Indicates whether the plant controller is requesting heating or cooling.
External demand
Description : Indicates whether an external demand signal is active.
Anti-legionella timeout alarm
Description : Indicates whether the anti-legionella cycle exceeded its maximum time.
DHW timeout alarm
Description : Indicates whether the domestic hot water cycle exceeded its maximum time.
Dewpoint alarm
Description : Indicates a dewpoint-related alarm condition.
Supply too hot alarm
Description : Indicates the supply temperature exceeded the safety limit.
Flow alarm
Description : Indicates a flow-related alarm condition.
Central heating alarm
Description : Indicates a central heating alarm condition.
Cooling alarm
Description : Indicates a cooling-related alarm condition.
Heating alarm
Description : Indicates a heating-related alarm condition.
Working hours alarm
Description : Indicates a working hours alarm condition.
Source alarm
Description : Indicates a source-related alarm condition.
Global alarm
Description : Indicates any active alarm on the heat pump.
Compressor alarm
Description : Indicates a compressor-related alarm condition.
Room sensor enabled
Description : Indicates whether the room temperature sensor is enabled. Disabled by default.
Plant sensor enabled
Description : Indicates whether the plant temperature sensor is enabled. Disabled by default.
Buffer sensor enabled
Description : Indicates whether the buffer temperature sensor is enabled. Disabled by default.
DHW controller enabled
Description : Indicates whether the domestic hot water controller is enabled. Disabled by default.
Supply temperature CH
Description : Current supply temperature for central heating.
Return temperature
Description : Current return temperature.
Source temperature in
Description : Temperature of the source fluid entering the heat pump.
Source temperature out
Description : Temperature of the source fluid leaving the heat pump.
Room temperature
Description : Current room temperature as measured by the heat pump.
DHW temperature
Description : Current domestic hot water temperature.
Outside temperature
Description : Current outside temperature.
Thermal power
Description : Current thermal power output.
Electric power
Description : Current electric power consumption.
Total electric consumption
Description : Cumulative electric energy consumed.
Total thermal yield
Description : Cumulative thermal energy produced.
COP
Description : Current coefficient of performance.
Compressor speed
Description : Current compressor speed in revolutions per minute.
Measured PVT flow
Description : Current photovoltaic-thermal flow rate.
Room setpoint heating (day)
Description : Target room temperature for heating during daytime.
Room setpoint heating (night)
Description : Target room temperature for heating during nighttime.
Room setpoint cooling (day)
Description : Target room temperature for cooling during daytime.
Room setpoint cooling (night)
Description : Target room temperature for cooling during nighttime.
Heat pump status
Description : Current operational status of the heat pump.
Description : Toggle between heating and cooling mode.
Anti-legionella cycle
Description : Manually start an anti-legionella prevention cycle.
Heating curve
Description : Enable or disable dynamic heating curve compensation.
Heating demand
Description : Activate or deactivate heating demand via Modbus.
Domestic hot water
Description : Controls domestic hot water temperature and operation mode.
Current temperature : The measured DHW temperature.
Target temperature : The user-defined DHW setpoint (adjustable).
Operation modes : Heat pump (normal operation) and performance (DHW boost, forces an immediate heating cycle).
The integration polls the heat pump every 15 seconds via Modbus TCP.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Qube heat pump hub was introduced in Home Assistant 2026.4, and it's used by
3 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MattieGit
Categories
Binary sensor
Sensor
Switch
Back to top
