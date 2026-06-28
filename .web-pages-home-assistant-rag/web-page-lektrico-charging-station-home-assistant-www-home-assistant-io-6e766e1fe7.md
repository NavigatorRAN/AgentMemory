# Lektrico Charging Station - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lektrico
- Final URL: https://www.home-assistant.io/integrations/lektrico
- Canonical URL: https://www.home-assistant.io/integrations/lektrico/
- Fetched at: 2026-06-28T02:55:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Lektrico Chargering Station with Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensors
Chargers
Sensors
Single-phase charger
Three-phase charger
Single-phase energy meter
Three-phase energy meter
Buttons
Energy meters
Numbers
Selects
Switches
The Lektrico Charging Station integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates your Lektrico Charging Station into your Home Assistant and allows you to monitor it.
The Lektrico Charging Station device will be added as a sensor in Home Assistant.
To add the Lektrico Charging Station device to your Home Assistant instance, use this My button:
Lektrico Charging Station can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lektrico Charging Station .
Follow the instructions on screen to complete the setup.
Binary sensors available in the library:
Condition Description state_e_activated Electric vehicle error overtemp Overtemperature critical_temp Critical temperature overcurrent Overcurrent meter_fault Meter fault undervoltage Undervoltage overvoltage Overvoltage rcd_error RCD error cp_diode_failure Electric vehicle communication error contactor_failure Contactor failure
Sensors available in the library:
Condition Unit Description state State of the charger. charging_time s Indicates the current session charging time. power kW Current instant power. energy kWh Total charged energy for the current charging session. temperature °C Board temperature. lifetime_energy kWh Total charged energy since installation. installation_current A Current value [A] to be limited by software. limit_reason Current limit reason. voltage V Measured voltage. current A Measured current.
Condition Unit Description state State of the charger. charging_time s Indicates the current session charging time. power kW Current instant power. energy kWh Total charged energy for the current charging session. temperature °C Board temperature. lifetime_energy kWh Total charged energy since installation. installation_current A Current value [A] to be limited by software. limit_reason Current limit reason. voltage_l1 V Measured voltage on L1. voltage_l2 V Measured voltage on L2. voltage_l3 V Measured voltage on L3. current_l1 A Measured current on L1. current_l2 A Measured current on L2. current_l3 A Measured current on L3.
Condition Unit Description breaker_current A Main breaker current. power kW Measured active power. pf Power factor.
Condition Unit Description breaker_current A Main breaker current. power_l1 kW Measured active power on L1. power_l2 kW Measured active power on L2. power_l3 kW Measured active power on L3. pf_l1 Power factor on L1. pf_l2 Power factor on L2. pf_l3 Power factor on L3.
Buttons available in the library:
Button Description charge_start Command charger to start charging. charge_stop Command charger to stop charging. charging_schedule_override Command charger to override the charging schedule for the next charging session. reboot Reboot charger.
Button Description reboot Reboot energy meter.
Numbers available in the library:
Number Unit Range Description led_max_brightness % 0 - 100 Set the LED brightness of the charger. dynamic_limit A 0 - 32 Set the maximum allowed charging current.
Selects available in the library:
Select Description lb_mode Select the load balancing mode of the energy meter. The options are Disabled , Power , Hybrid , and Green .
Switches available in the library:
Switch Description authentication Allows you to select if the charger will automatically start to charge or if it needs authentication. lock Allows you to select if the charger is locked or not. When the charger is locked, no charging is possible.
Switch Description authentication Allows you to select if the charger will automatically start to charge or if it needs authentication. lock Allows you to select if the charger is locked or not. When the charger is locked, no charging is possible. force_single_phase Allows you to put the three-phase charger in single-phase mode or three-phase mode.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lektrico Charging Station device was introduced in Home Assistant 2024.10, and it's used by
150 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lektrico
Categories
Sensor
Back to top
