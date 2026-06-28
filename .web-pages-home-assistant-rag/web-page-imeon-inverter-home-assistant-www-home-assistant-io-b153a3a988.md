# Imeon Inverter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/imeon_inverter
- Final URL: https://www.home-assistant.io/integrations/imeon_inverter
- Canonical URL: https://www.home-assistant.io/integrations/imeon_inverter/
- Fetched at: 2026-06-28T02:51:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on Imeon Inverter Integration for Imeon inverters with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Battery sensors
Grid sensors
AC input sensors
Inverter settings sensors
Inverter setting select
Meter sensors
AC output sensors
Solar panel sensors
Temperature sensors
Monitoring sensors (last 24 hours)
Monitoring sensors (instant minute data)
Timeline sensor
Daily energy counters (made for the Home Assistant energy panel)
Forecast
Troubleshooting
What is my domain name?
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Imeon Inverter integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will poll an Imeon solar inverter in Home Assistant.
The Imeon inverter must be connected to the local network.
OS One version must be 1.8.1.4 or higher.
ModuleAPI application must be activated on the OS One panel of your Imeon inverter.
To do so, connect to OS One > Applications and by hovering over ModuleAPI , select Activate .
To add the Imeon Inverter device to your Home Assistant instance, use this My button:
Imeon Inverter can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Imeon Inverter .
Follow the instructions on screen to complete the setup.
This document provides an overview of the sensors available in the Imeon Inverter integration and details their functionality, units, and purpose.
Sensor key Description Unit battery_power Power currently used or supplied by the battery. W battery_soc State of charge of the battery. % battery_status Current status of the battery. — battery_stored Power stored in the battery. W battery_consumed Power consumed from the battery. W
Sensor key Description Unit grid_current_l1 Current on grid line 1. A grid_current_l2 Current on grid line 2. A grid_current_l3 Current on grid line 3. A grid_frequency Frequency of the grid supply. Hz grid_voltage_l1 Voltage on grid line 1. V grid_voltage_l2 Voltage on grid line 2. V grid_voltage_l3 Voltage on grid line 3. V
Sensor key Description Unit input_power_l1 Power input on line 1. W input_power_l2 Power input on line 2. W input_power_l3 Power input on line 3. W input_power_total Total power input. W
Sensor key Description Unit inverter_charging_current_limit Charging current limit of inverter. A inverter_injection_power_limit Power injection limit of inverter. W manager_inverter_state Current state of the inverter (enum). —
Select key Description Unit manager_inverter_mode View or change the inverter operating mode. —
Sensor key Description Unit meter_power Current measured power by meter. W
Sensor key Description Unit output_current_l1 Output current on line 1. A output_current_l2 Output current on line 2. A output_current_l3 Output current on line 3. A output_frequency Frequency of the output. Hz output_power_l1 Output power on line 1. W output_power_l2 Output power on line 2. W output_power_l3 Output power on line 3. W output_power_total Total output power. W output_voltage_l1 Output voltage on line 1. V output_voltage_l2 Output voltage on line 2. V output_voltage_l3 Output voltage on line 3. V
Sensor key Description Unit pv_consumed Power from PV consumed locally. W pv_injected Power from PV injected to grid. W pv_power_1 Power from PV string 1. W pv_power_2 Power from PV string 2. W pv_power_total Total PV power production. W
Sensor key Description Unit temp_air_temperature Ambient air temperature. °C temp_component_temperature Temperature of inverter component. °C
Sensor key Description Unit monitoring_self_produced Power self-produced. W monitoring_self_consumption Self-consumption percentage. % monitoring_self_sufficiency Self-sufficiency percentage. %
Sensor key Description Unit monitoring_minute_building_consumption Building power consumption. W monitoring_minute_grid_consumption Grid power consumption. W monitoring_minute_grid_injection Power injected to grid. W monitoring_minute_grid_power_flow Net power flow to/from grid. W monitoring_minute_solar_production Solar production power. W
Sensor key Description Unit timeline_type_msg Current timeline status. —
Sensor key Description Unit energy_pv Energy produced by PV today. Wh energy_grid_injected Energy injected to grid today. Wh energy_grid_consumed Energy consumed from grid today. Wh energy_building_consumption Energy building consumption today. Wh energy_battery_stored Energy stored in battery today. Wh energy_battery_consumed Energy consumed from battery today. Wh
Sensor key Description Unit forecast_cons_remaining_today Forecast of the remaining energy consumption for today. Wh forecast_prod_remaining_today Forecast of the remaining energy production for today. Wh
The domain name is the internal name given to your inverter by Home Assistant. It’s based on the initial name you gave to your device, albeit formatted to avoid internal issues.
A name such as Imeon Inverter number 57 would give you a domain name of imeon_inverter_number_57 .
If you’re still struggling to find the domain name, check the internal name of the entities under the device. The name of each variable is DOMAIN_variable-name , for example neo_110_inverter_software_version tells us the domain name is neo_110 .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
https://imeon-energy.com/
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Imeon Inverter device was introduced in Home Assistant 2025.5, and it's used by
9 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Imeon-Energy
Categories
Energy
Sensor
Back to top
