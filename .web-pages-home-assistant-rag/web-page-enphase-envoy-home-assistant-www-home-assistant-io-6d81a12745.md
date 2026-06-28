# Enphase Envoy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/enphase_envoy
- Final URL: https://www.home-assistant.io/integrations/enphase_envoy
- Canonical URL: https://www.home-assistant.io/integrations/enphase_envoy/
- Fetched at: 2026-06-28T02:40:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Enphase Envoy with Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Required Manual input
Options
Reconfigure
Removing the integration
To remove an integration instance from Home Assistant
Capabilities
Solar production data
House consumption data
Current Transformers
Grid sensor entities
Battery Storage data
Enpower data
Enpower load shedding relays
IQ Meter Collar data
C6 Combiner Controller data
Data polling interval
Credentials or device IP address update
Firmware updates
Firmware update alert
Energy dashboard
Solar panels
Electricity grid
Home battery storage
Individual devices
Actions
Action switch.turn_on/switch.turn_off/switch.toggle
Action number.set_value
Action select.select
Envoy replacement
Background
Replacement process
Post replacement awareness
Known issues and limitations
Reported issues
Firmware changes
No battery controls
Late reset
Energy incorrect
Lifetime reset
Lifetime energy production decreases by 1.2 MWh
Missing inverter data
Missing inverter details
Summed Voltage
Grid Import/Export values incorrect
Balancing grid meter
Data outage around 11 PM
Troubleshooting
Enlighten authentication issues
Periodic network connection issues
CT Active flag count is non-zero
Log entry for state is not strictly increasing
Debug logs and diagnostics
References
Enphase API reference
IQ Combiner reference
The Enphase Envoy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with the Enphase IQ Gateway , a communication device for Enphase solar inverters and batteries. In this documentation, as well as in integration entity names, the Enphase IQ Gateway is commonly referred to as Envoy , a name from the conception times of this integration and retained for its compact format.
The actual model and installed components will determine the available capabilities and which data can be provided to the Energy dashboard . The Envoy firmware has known issues that may come and go as versions change.
This integration works with:
Older and newer Envoy models that only have production metrics (such as Envoy-R (LCD), Envoy-S (not metered))
Newer Envoy models that offer both production and consumption metrics (such as Envoy-S Metered equipped with CT ).
Various Enphase IQ Combiner products that have an embedded Envoy , it will show-up in the same way as the stand-alone one.
This integration does not work with:
Older Envoy models running firmware before 3.9 which lack a REST API.
The Envoy must be configured and commissioned.
The Envoy must be on your local network with IPV4 connectivity from Home Assistant. (Also See troubleshooting, periodic network connection issues )
Envoy firmware version 3.9 or newer.
With Envoy firmware 7 and greater:
an Enlighten cloud username and password.
Home Assistant 2023.9 or newer.
Note
Currently, Multi Factor Authentication for the Enlighten account is not supported by this integration. It should be disabled during Envoy configuration and token refresh.
To add the Enphase Envoy hub to your Home Assistant instance, use this My button:
Enphase Envoy can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Enphase Envoy .
Follow the instructions on screen to complete the setup.
The configuration of an individual Envoy requires you to enter the following information:
Host
The name or IP address of the Envoy to configure.
Will be pre-filled if the Envoy was auto-discovered
Username
For firmware version 7.0 and later, enter your Enlighten cloud username. The Enlighten cloud username (and password) will be used to obtain a 1-year-valid token from the enphase web-site when first configured or upon expiry.
For firmware before 7.0, enter username installer without a password.
Password
For firmware version 7.0 and later, enter your Enlighten cloud password
For firmware before 7.0, with username installer , leave blank.
To define options for Enphase Envoy, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Enphase Envoy are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Options to enable/disable are listed below. Neither of these are set by default nor need to be set for proper functioning of the integration. Setting these options is only required in described circumstances.
Collect test fixture data in diagnostics report
No/Yes
When new features are requested or firmware is upgraded, it can happen that existing test fixtures no longer cover all test cases and new ones are needed. You may be requested to provide data for such test fixtures. If so, and you are willing to provide the data, setting this option enables the collection of test data as part of the diagnostics report .
Always use a new connection when requesting data from the Envoy
Some older Envoy firmware may exhibit connection issues when using the default keep-alive connection and report failures. When set, this option disables the use of keep-alive and builds a new connection at each data request. This makes the communication more reliable for these firmware versions. Reported for the Envoy-R, but may apply to other older firmware versions as well.
This integration supports updating the Envoy configuration through a reconfigure menu option. The reconfiguration allows for changing the Envoy IP address, username, and/or password. Use this menu option if your Enlighten credentials or the device’s IP address has changed and needs to be manually updated. The latter is typically automatically detected and updated.
Use this menu option also when an Envoy firmware upgrade requires a switch from local Envoy username/password to token-based authentication with Enlighten username/password (refer to required manual input ).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
This integration offers various entities depending on the configuration of your Enphase system. The Envoy can communicate with Enphase IQ micro-inverters, Enphase ACB and IQ batteries, Enphase Ensemble Enpower switch and load shedding relays, Enphase compatible generators and the IQ Meter Collar.
You may know referred product names under other names from the past or future.
In this documentation, the term SN is used for a device serial-number placeholder. Entities will contain the actual serial-number of the device.
All Envoy models with solar inverters, with or without installed production CT , for all firmware versions, report solar current and historical production data.
Aggregated production data
The Envoy device reports aggregated data for all connected micro-inverters.
Production sensor entities
Envoy SN Current power production : Current aggregated inverter power production in W.
Envoy SN Energy production last seven days : Energy produced in previous 7 days, not including today’s, in Wh, display scaled to kWh. (See known limitations Energy Incorrect ). This entity is not logged in statistics.
Envoy SN Energy production today : Energy produced since midnight in Wh, default display scaled to kWh. (See known limitations Late reset , Energy Incorrect ).
Envoy SN Lifetime energy production : Lifetime energy production in Wh, default display scaled to MWh. (See known limitations Lifetime reset ).
Envoy device with solar production entities.
When used with multiphase CT phase data , disabled phase entities are available as well.
For Envoy non-metered, the production data is read from an endpoint described in the API . For Envoy-metered the data is read from an endpoint not listed in the API. The data quality of the used endpoint was fine in older firmware versions, but reportedly varies with recent firmware versions. As an alternative consider using the Production CT entities.
Individual micro-inverter production data
The Envoy reports individual micro-inverter device production data. SN is the micro-inverter serial-number.
Sensor entities
Inverter SN : Current power generated by the inverter in W.
Inverter SN last reported : Time when Envoy last received a data update from the inverter. Typical update rate for an inverter to the Envoy is every 5 to 15 minutes. This entity is disabled by default for all inverters.
Inverter SN Lifetime maximum power : Maximum power production measured by the inverter (W). This entity is disabled by default for all inverters.
Based on the Envoy firmware version, the Envoy may provide inverter device data as well. If that is the case, additional entities are available. These are disabled by default for all inverters. Enable these as desired.
Inverter SN DC voltage : DC voltage measured by the inverter (V).
Inverter SN DC current : DC current measured by the inverter (A).
Inverter SN AC voltage : AC voltage measured by the inverter (V).
Inverter SN AC current : AC current measured by the inverter (A).
Inverter SN Frequency : Frequency measured by the inverter (Hz).
Inverter SN Temperature : Temperature measured by the inverter (°C).
Inverter SN Energy produced : Energy produced by the inverter during last report cycle (mWh).
Inverter SN Energy today : Energy produced today by the inverter (Wh).
Inverter SN Lifetime energy : Total energy produced during inverter lifetime (Wh).
Inverter SN Report duration : Time in seconds covered by the last report data.
Due to a limitation in the Envoy firmware, the inverter device data is only available when 49 or fewer inverters are configured. When more than 49 inverters are configured, only the 3 power production entities are available for each inverter.
Micro-inverter device with solar production entities.
House consumption data requires an Envoy Metered equipped and configured with at least 1 consumption CT , net- or total-consumption. The Envoy calculates the house consumption values in one of its endpoint reports. The used endpoint is not in the official API documentation and data quality has varied / may vary with firmware evolutions. If a total-consumption CT is installed , consider using the total-consumption CT entities as an alternative.
Consumption Sensor Entities
Envoy SN Current power consumption : Current power consumption in W.
Envoy SN Lifetime energy consumption : Lifetime energy consumption in Wh, default display scaled to MWh.
Envoy SN Energy consumption last seven days : Energy consumption in previous 7 days, not including today’s, in Wh, display scaled to kWh. (See known limitations Energy Incorrect ) This entity is not logged in statistics.
Envoy SN Energy consumption today : Energy consumption since midnight in Wh, default display scaled to kWh. (See known limitations Energy Incorrect )
Envoy metered with CT reporting production and consumption entities.
When used with multiphase CT phase data , disabled phase entities are available but not shown. Enable as needed.
The Envoy Metered can be equipped with up-to 6 CT . These can be assigned to production, consumption and/or storage measurements in single or multiple phase setups.
The below diagram shows CT installation positions and how they are referred to. When used with an IQ Combiner more CT may be installed and visible. For more detail on combiner configuration see the IQ Combiner reference .
The production CT measures the energy exchange between Solar production and the switchboard.
If the consumption CT is installed as Load only a.k.a. total-consumption it measures energy exchange from the switchboard to the loads/house.
If the consumption CT is installed as Load with Solar a.k.a. net-consumption , it measures energy exchange between the switchboard and the grid.
The storage CT measures the energy exchange between the battery storage and the switchboard.
Envoy current transformers.
This in no way represents a configuration direction, as actual configuration is driven by local rules, installer designs and Enphase installation guidelines. Variations may exist, based on specific needs or rules. This merely describes a simplified view and naming conventions used in this documentation to clarify integration operation. Refer to Enphase documentation for more information.
When an Envoy Metered is equipped with a production CT, the CT data will be used to provide the aggregated solar production data . Likewise, the installed consumption CT will be the source for the house consumption data .
Either a net-consumption or a total-consumption CT is installed. The Envoy will calculate the data for the other one.
CT Aggregate and phase data
When using CT in multiphase enabled configurations, both aggregated and individual phase data is available. If only 1 phase is configured, phase data is the same as the aggregated data and no phase entities are created. If more than 1 phase is configured, disabled phase entities for each phase are created, enable them as needed.
Phase entity names are the names used for the aggregated entities, with the phase name in the post-fix. Phase names are L1 , L2 , L3 . For example, once enabled, lifetime energy production on phase 3 is available as Envoy SN Lifetime energy production L3 .
Current transformer entities
CT measure multiple properties of the energy exchange which are available as Envoy device entities. Some are enabled by default, others not, enable the latter as desired.
The CT entity names use format: Envoy SN CT Entity . SN is the envoy serial number as with all other entities. The CT Entity part contains the actual CT name in the description, shown as <type> in the table below.
CT Entity Enabled Description <type> CT energy delivered Y Accumulated energy delivered to the switchboard in Wh. <type> CT energy received Y Accumulated energy received from the switchboard in Wh. <type> CT power Y Power in W. Positive to the switchboard Frequency <type> CT N Frequency in Hz. Voltage <type> CT N Voltage in V. (see limitations Summed voltage ). <type> CT current N Current in A. Powerfactor <type> CT N Powerfactor, ratio of active to apparent power. Metering status <type> CT N Status of the metering process: normal , not-metering , check-wiring . Meter status flags active <type> CT N Count of CT status flags active. See troubleshooting CT Active flag count is non-zero when non-zero.
For example, the Production CT Voltage entity name for Envoy 1234 would be Envoy 1234 Voltage production CT .
From the past, some name exceptions exist and are maintained for backward compatibility. These are listed in below table showing supported CT. For example, energy delivered by the net-consumption ct is named Envoy 1234 lifetime net energy consumption rather then the standard Envoy 1234 net consumption CT energy delivered .
CT Type Description entity name exceptions Production solar to switchboard Net-consumption grid to switchboard energy delivered: lifetime net energy consumption
energy received: lifetime net energy production
power: current net power consumption Total-consumption House load to switchboard Storage Batteries to switchboard energy delivered: Lifetime battery energy discharged:
energy received: Lifetime battery energy charged
power: Current battery discharge Backfeed combiner to switchboard Load backup load to switchboard EVSE Combiner to EV PV3P 3th party PV to switchboard
When the Envoy Metered is equipped with a net-consumption CT , entities for Grid import and export are available. See Limitations, Grid Import/Export values incorrect when using these. These are the net-consumption CT entities, but use a non-standard CT naming scheme.
Envoy SN Current net power consumption : Current power exchange from (positive) / to (negative) the grid in W, default display in kW.
Envoy SN Lifetime net energy consumption : Lifetime energy consumed / imported from the grid in Wh, default display in MWh.
Envoy SN Lifetime net energy production : Lifetime energy produced / exported to the grid in Wh, default display in MWh.
When using an IQ Metered Collar, the net-consumption CT’s are integrated in the collar.
Grid Balanced import/export sensor entities
When the Envoy Metered is equipped with a total-consumption CT instead of a net-consumption CT , no grid import and export measurements are available. The Envoy calculates a balance of grid import and export in one of its endpoint reports. These balanced power and energy entities are available, disabled by default.
The used endpoint is not in the official API documentation and data quality has varied / may vary with firmware evolutions.
Envoy SN balanced net power consumption : Current power exchange from (positive) / to (negative) the grid in W, default display in kW.
Envoy SN Lifetime balanced net energy consumption : Lifetime energy balance (difference) of imported and exported grid energy in Wh, default display in kWh.
Enphase battery systems of multiple generations and configurations can provide integration entity data.
AC-Batteries : first generation battery setup, no longer in production.
IQ Batteries : current Enphase battery models.
The batteries can be implemented in stand-alone configuration or as part of Enphase Ensemble systems with the Enpower/IQ System Controller.
IQ battery data Aggregated IQ battery sensor entities
Aggregated IQ battery data includes all installed IQ Batteries.
Envoy SN Battery : Current aggregated state of charge in %
Envoy SN Available battery energy : Current aggregated IQ battery energy content in Wh
Envoy SN Battery capacity : Aggregated maximum IQ battery energy content in Wh
Envoy SN Reserve battery level : Configured aggregated IQ Battery backup state of charge in %
Envoy SN Reserve battery energy : Configured aggregated IQ battery backup energy content in Wh
If a storage CT is installed below entities are available. These are the storage CT entities, but use a non-standard CT naming scheme.
Envoy SN Current battery discharge : Current power in/out of the battery in W.
Envoy SN Lifetime battery energy discharged : Lifetime energy discharged from the battery in Wh, default display format MWh.
Envoy SN Lifetime battery energy charged : Lifetime energy charged in the battery in Wh, default display format MWh.
Envoy Aggregated IQ battery Sensor entities with no storage CT nor Enpower installed.
If an Enpower device is installed, then Charge from grid , Reserve battery level , and Storage mode are available as Enpower device entities instead of Envoy device entities.
Individual IQ battery data
For each IQ Battery, an Encharge device is created, linked to the Envoy parent device. Each encharge devices offers individual battery sensors.
Individual IQ battery sensor entities
Encharge SN Battery : Current state of charge of the battery in %
Encharge SN Power : Current power in W
Encharge SN Apparent Power : Current apparent power in VA
Encharge SN Temperature : Current temperature in degrees C or F, based on your localization.
Encharge SN Last reported : Time when Envoy received last update from the battery.
Individual IQ battery binary sensor entities
Encharge SN Communicating : Communication status of encharge battery, Connected / Disconnected. This is a diagnostics entity.
Encharge SN DC Switch : DC Switched off status of encharge battery, On / Off. This is a diagnostics entity.
Envoy Encharge IQ battery sensor entities. AC-battery data
No individual AC-battery data is available, only aggregated AC-battery data for all AC-batteries.
AC-battery sensor entities
ACB SN Battery : Current AC-battery state of charge in %
ACB SN Battery state : AC-battery state: charging, idle, discharging
ACB SN Power : Current AC-battery power in W
Envoy SN Available ACB battery energy : Current AC-battery energy content in Wh
Envoy AC-battery sensor entities. Aggregated IQ and AC battery sensor entities
If both IQ and AC batteries are used, aggregated battery data for all installed IQ batteries and AC batteries is available.
Envoy SN Aggregated Battery SOC : Overall aggregated battery state of charge in %
Envoy SN Aggregated Available battery energy : Overall aggregated battery energy content in Wh
Envoy SN Aggregated Battery capacity : Overall aggregated maximum battery energy content in Wh
The below figure shows the 3 aggregated entities along with the AC-battery energy and 3 of the IQ Battery aggregate values.
Envoy aggregated ACB and IQ battery sensor entities.
Data for an installed Enphase Enpower off-grid enabling switch is available in various entities for an Enpower device.
Enpower binary sensor entities
Enpower SN Grid status : status of the grid.
Enpower number entities
Enpower SN Reserve battery level : reserve battery level to maintain for outages in %. Changing the value, on the UI or in an action , will update the setting in the Envoy. Also see limitations, No battery controls .
Enpower select entities
Enpower SN Storage mode : Current configured storage mode, Full backup , Self consumption , Savings mode . Changing the selection, in the UI or in an action , will update the setting in the Envoy. Also see limitations, No battery controls .
Enpower sensor entities
Enpower SN Temperature : Current temperature in degrees C or F, based on your localization.
Enpower SN Last reported : Time when Envoy received last update from the enpower device.
Enpower SN Communicating : Communication status of enpower switch, Connected / Disconnected. This is a diagnostics entity.
Enpower switch entities
Enpower SN Charge from grid : Allow or disallow charging Encharge/IQ batteries from grid when a charge schedule is active. Changing the switch, in the UI or in an action , will update the setting in the Envoy. If no charge schedule is active, changing the setting will not have an immediate effect. Also see limitations, No battery controls .
Enpower SN Grid enabled : Enable or disable grid connection. Note that the Enpower has a slight delay built-in between receiving these commands and actually switching the system on or off grid.
Envoy Enpower entities.
If no Enpower is installed, then Charge from grid , Reserve battery level , and Storage mode are available as Envoy device entities instead of Enpower device entities.
With the Enpower/IQ System Controller installed, entities for the state and control of the Enpower’s four load-shedding relays are available. In battery installations without load-shedding and off-grid functionality, used in many EU countries, these sensors and switches are not available.
The Enphase Enpower has 4 load shedding relays (volt-free contacts, often referred to as dry-contacts) that can be used to control non-essential loads in your home. These have two main modes of operation:
Standard : When the mode entity is set to standard, you can simply set the state of the relay to be powered or not powered for each mode of operation: on grid, off grid, and on generator.
Battery level : When the relay mode is set to battery level, the relays will turn on and off based on the remaining battery level of your Encharge IQ batteries. Two number entities are available to control the cutoff and restore levels for the relays. When the battery level drops below the cutoff level, the relays will turn off, removing power from attached loads. When the battery level rises above the restore level, the relays will turn back on and restore power to attached loads.
The names of entities and devices are derived from the load_name configured in the Enpower device.
Dry-contact number entities
LOAD_NAME cutoff battery level : battery level below which relay will turn off when in Battery level mode.
LOAD_NAME restore battery level : battery level above which the relay will turn back on when in Battery level mode.
Dry-contact select entities
LOAD_NAME mode : dry-contact operational mode: standard or battery
LOAD_NAME Grid action : dry-contact on grid action: Powered , Not powered , Follow schedule , None
LOAD_NAME Micro-grid action : dry-contact on micro-grid action: Powered , Not powered , Follow schedule , None
LOAD_NAME Generator action : dry-contact on generator action: Powered , Not powered , Follow schedule , None
Envoy Enpower dry-contact entities.
The IQ Meter Collar has the net-consumption CT integrated. The CT data is reported in the net-consumption data and grid sensors . In addition the status of the collar is available in entities.
Collar status entities
Collar SN Admin state : Collar admin status, on grid / off grid.
Collar SN Grid state : Grid connection status, on grid / off grid / synchronizing to grid / manual override active.
Collar SN MID State : Status of enphase Microgrid Interconnection Device, open / closed.
Collar SN Temperature : Current temperature in degrees C or F, based on your localization.
Collar SN Last reported : Time when Envoy received last update from the collar device.
Collar SN Communicating : Communication status of the collar, Connected / Disconnected. This is a diagnostics entity.
Practical use learned that “Grid state” does not seem to reflect actual grid state changes. Off/On grid state rather seems to be reflected in Admin state values on grid / off grid. Be aware when using these entities. With time, more accurate details for these Collar entities may become available.
The Enphase C6 combiner controller (C6CC) provides some status information to the Envoy which are available in entities.
C6CC status entities
C6CC SN Last reported : Time when Envoy received last update from the combiner device.
C6CC SN Communicating : Communication status of C6 Combiner, Connected / Disconnected. This is a diagnostics entity.
Envoy IQ Metered Collar and C6 Combiner Controller entities.
All data is collected in one coordinated collection cycle and sourced from a limited set of endpoints on the Envoy. For example, three different values sourced from the same endpoint are not pulled in three different requests but provided from the same single request. This method minimizes the number of requests to the Envoy. The local REST API of the Envoy is used. Only when the 1-year valid token is to expire, 1 month before due data, a new token is requested from the Enphase Enlighten website.
The integration collects data for all entities by default every 60 seconds. To customize the collection interval, refer to defining a custom polling interval . Specify one single entity from the envoy device as target of the action using the + choose entity button. Updating one entity will update all entities of the Envoy and the related devices like the inverters; there is no need to specify multiple or all entities or add (all) inverter entities. When using multiple Envoys, add one entity for each envoy as targets or create separate custom polling intervals with a single entity as needed.
Envoy installations without installed CT , collect individual solar inverter data every 5 minutes. This collection does not occur for each inverter at the same time in the 5-minute period. Shortening the collection interval will at best show updates for individual inverters quicker, but not yield more granular data.
With installed CT , data granularity increases and shortening the collection interval can provide more details. The Envoy, however, has no unlimited resources and shortening the collection interval may result in dropped connections, Envoy freeze or restarts. It will require some step-wise tuning for each individual situation.
The firmware version is read from the envoy when the configuration entry is loaded. The firmware version is then used in the process of determining capabilities and required authorization methods. The firmware version is available as the sw_version attribute of the configuration entry and shown on the device view of the envoy.
Every 4 hours, the actual firmware version in the Envoy is compared to the known one. If the actual version differs, the configuration entry is reloaded to effect any needed configuration changes. If the moment of the firmware update is known, a manual reload on the envoy configuration entry can be done to achieve the same.
The firmware version is not available as an entity, but rather as an attribute of the envoy. To use the firmware in automation, scripts or templates, use below example with any envoy entity.
{{device_attr(device_id('sensor.envoy_SN_current_power_production'),'sw_version')}}
To receive a notification when the firmware is updated, use this Enphase Envoy Firmware update notification automation blueprint from the community blueprints exchange.
Import the blueprint using the import blueprint to button. This will install the blueprint as /config/blueprints/automation/catsmanac/Track_envoy_firmware.yaml . Use the automation example shown in the blueprint exchange to implement an automation that will create a notification when the firmware changes.
This integration provides several entities suitable for the energy dashboard.
For Solar production , use the Envoy SN Lifetime energy production entity. Overall this has proven to be more stable as the daily value reported by the Envoy. (See known limitations Late reset , Energy Incorrect ).
Whether there is data available to use with the electricity grid depends on the installed CT , if any. Also, see Limitations, Grid Import/Export values incorrect and Balancing grid meter .
Electricity grid with net-consumption CT
With a net-consumption CT installed, both grid consumption and return to grid data is available. (Also, see Limitations )
For Grid consumption , use the Envoy SN Lifetime net energy consumption entity.
For Return to grid , use the Envoy SN Lifetime net energy production entity.
Electricity grid with balanced consumption entities
With a total-consumption CT , the balanced grid import-export energy value is available. This value is not suited for direct use with the energy dashboard. It will require some templating to split the value into an import and export value.
To split the balanced energy value Envoy SN Lifetime balanced net energy consumption into import-export values, a sensor blueprint template named Filter positive or negative value changes in a sensor entity is available in the community blueprints exchange.
Import the blueprint using the import blueprint to button. This will install the blueprint as /config/blueprints/template/catsmanac/Filter_positive_or_negative_value_changes_in_sensor_entity.yaml . Use the directions and templates in the blueprint exchange topic to implement such a split.
Alternatively, creating 2 split energy sensors can be done by splitting the Envoy SN balanced net power consumption into power import and export using filter range helpers. These are then the source for two Riemann sum integral helpers to calculate energy from the power values.
Whether there is data available to use with the electricity grid depends on the installed storage CT , if any.
Home battery storage with storage CT
With a storage CT installed, data for both Energy coming out and going into the battery is available.
For Energy going into the battery , use the Envoy SN Lifetime battery energy charged entity.
For Energy coming out of the battery , use the Envoy SN Lifetime battery energy discharged entity.
Home battery storage without storage CT
Without a storage CT installed, only the current Power in and out of individual batteries, or the current aggregated battery energy content is available. These values are not suited for direct use with the energy dashboard. It will require some templating to split the value into an import and export values.
Home battery storage data using battery power
Battery power is the current power flow in or out of an individual battery. Using the summed Power values of all batteries, the result needs to be split in 2 entities, representing total power in and power out.
This can be done using the filter range helper. Next, each entity needs to be integrated into energy, using two Riemann sum integral helpers. The resulting data can be used for Energy going into the battery and Energy coming out of the battery.
If desired, this can also be done in a similar way for individual batteries.
Home battery storage data on the available battery energy
Changes in the Available battery energy are a result from Energy going in or out of the battery. Splitting these energy changes into 2 entities, one tracking positive changes, one the negative changes, results in data that can be used for Energy going into the battery and Energy coming out off the battery. This method does not account for conversion losses as Energy content changes do not exactly match actual energy flow in and out of the battery.
To split the changes in Available battery energy into charge-discharge values, a sensor blueprint template named Filter positive or negative value changes in a sensor entity is available in the community blueprints exchange.
Import the blueprint using the import blueprint to button. This will install the blueprint as /config/blueprints/template/catsmanac/Filter_positive_or_negative_value_changes_in_sensor_entity.yaml . Use the directions and templates in the blueprint exchange topic to implement such a split using the Envoy SN available battery energy entity as source entity. Add positive changes to a battery_charge entity and add negative changes to a battery_discharge entity.
Although not a replacement for individual energy or power measurement devices, with multiphase CT installed, energy consumption for phases is available. These can be used for individual devices, if of interest.
Available actions are: switch.turn_on , switch.turn_off , switch.toggle , number.set_value , select.select
Action switch.turn_on / switch.turn_off / switch.toggle
These actions turn on, off or toggle
the Enpower device switches grid_enabled , charge_from_grid
the Enpower load shedding relays switch.
Data attribute Optional Description entity_id no Name(s) of entities. For example, switch.enpower_12345678901001_grid_enabled .
Example:
action : switch.toggle target : entity_id : - switch.enpower_12345678901001_grid_enabled data : {} action : switch.turn_on data : {} target : entity_id : - switch.no2 - switch.nc2
This action changes the setting for the Enpower Reserve battery level .
Data attribute Optional Description entity_id no Name(s) of entities. For example, number.enpower_12345678901001_reserve_battery_level . value no The target value between 0 and 100 to set Enpower reserve battery level to.
action : number.set_value target : entity_id : number.enpower_12345678901001_reserve_battery_level data : value : " 25"
This action changes the:
Relays relay_mode, grid_action, micro_grid_action or generator_action
Battery storage mode
Data attribute Optional Description entity_id no Name(s) of entities. For example, select.nc2_generator_action . option no For relay modes: powered , not_powered , schedule , none .
For storage modes: backup , self_consumption , savings
action : select.select_option target : entity_id : - select.nc2_generator_action data : option : not_powered action : select.select_option target : entity_id : - select.enpower_12345678901001_storage_mode data : option : backup
Technically select.first , select.last , select.previous , select.next are available as well, but as there’s no logical sequence in the values to select, their use is not advocated.
When the physical Envoy needs to be replaced, some preparation is needed to assure data continuation from the old one. This description assumes that the new Envoy replaces the old one in the existing installation and is connected in the same way. The new Envoy will have a different serial number and probably a different IP address.
In the Home Assistant configuration, the Envoy entities are identified by their unique identification. The Envoy serial number is part of this unique_id. For micro-inverters, Enpower and/or Encharge devices, the unique_id contains the serial number of these devices instead of the Envoy serial number.
The actual data stored in states, short- and long-term statistics, is identified by an entity identifier. This entity_id is registered in the entity configuration as well. Using the entity_id, the data in the data stores is connected to the entity. Similar to the unique_id, this entity_id contains the serial number of the Envoy, micro-inverters, Enpower, and/or Encharge devices.
When adding the new Envoy, new entities are created, each containing the new Envoy’s serial number in unique_id and entity_id. For the Envoy data, this results in states and short- and long-term statistics starting from that point in time. Data from the old Envoy cannot be seen in the new Envoy. For the micro-inverters and Enpower/Encharge device data, the serial numbers remain the same, and data will continue from the old data.
To ‘chain’ the data of the old Envoy to the new Envoy, the entities of the new Envoy should connect to the existing data. To do so, we need to make sure the existing data can be found when using the new entity_id that contains the new Envoy serial number. This can be done by updating the entity_id of the old Envoy entities and replacing their old serial numbers with the new Envoy serial number. See customizing entities for how to change the entity_id. This should be done before the new Envoy is configured in Home Assistant.
Do not add the new Envoy to Home Assistant yet, even if it shows as discovered. First, complete the steps below.
Find all entities for the old Envoy.
Go to Settings > Devices & services > Entities .
Use the filter to filter the Enphase_envoy integration. Also include disabled entities.
For each entity inspect the entity ID field ( customizing entities ) and replace the old Envoy serial number by the new Envoy serial number.
Update any actions, cards, scripts, automations, dashboards, and other tools that use the original entity_id to use the new entity_id.
Once completed, remove the old Envoy from Home Assistant
Only now add the new Envoy to Home Assistant. The data from the old Envoy should now be visible in the new Envoy.
Even though the data continues from the old envoy, there will be a discontinuity in time and/or value for entities. The lifetime values for Envoy and/or connected devices will most likely start from zero again, unless they were transferred between the old and new physical Envoy, if possible. Such discontinuity will be visible in trends and may affect any automations, calculations, and more.
When used with the energy dashboard, it may result in a peak at the start of the new data. Although the energy dashboard probably handles any reset to zero well. If any peaks occur, correct the first statistics entry of new data in Settings > Developer tools > Statistics and set the value to zero. (See Statistics Tab )
For reported issues in GitHub, refer to issues list for the Enphase Envoy integration .
For topics in the Home Assistant community, use this filter of topics that contain the text Enphase .
Envoy firmware versions come with changing behavior, features, and potential issues. Firmware is pushed to the Envoy by Enphase, while ‘not always communicated in detail upfront’. This may result in sudden changes in the Envoy behavior and is always accompanied by an outage while Envoy is being updated.
As of Envoy firmware 8.2.4225, the Envoy no longer supports the following operations through the local REST API used by Home Assistant:
Setting battery modes
Enabling/disabling charging from the grid
Changing reserve battery level
Until a resolution is found, you must use the Enphase App to control these features.
Not all firmware versions reset Energy production today or Energy consumption today , Energy production last seven days and Energy consumption last seven days at midnight. A 1 hour delay is reported. In this case, best use a utility meter with the ‘Lifetime’ entity for daily reporting. This seems to be daylight savings time change related and surfaced in recent firmware versions. Some older firmware versions would reset up to 15 minutes late, even outside daylight saving periods.
When using Envoy Metered with CT
not all firmware versions report Energy production today and/or Energy consumption today correctly. Zero data, changes to a lower value and unexpected spikes have been reported. Enphase reportedly indicated it is an issue in summing phase values to aggregated data. In this case, either use individual phase data or a utility meter with the Lifetime energy production or Lifetime energy consumption entity for daily reporting.
not all firmware versions report Energy production last seven days and/or Energy consumption last seven days correctly. Zero and unexpected values have been reported. Enphase reportedly indicated it is an issue in summing phase values to aggregated data. In this case, use the individual phase data.
Energy production today and Energy consumption today have been reported not to reset to zero. Instead, it resets to a non-zero value that seems to gradually increase over time, although other values have been reported as well. This issue has also been reported as starting suddenly overnight. For daily reporting, it is recommended to use a utility meter with the Lifetime energy production or Lifetime energy consumption entity.
History examples for Today’s energy production value not resetting to zero
Envoy Today's energy production value exhibits a daily reset to an ever increasing non-zero value. Envoy Today's energy production value exhibits a sudden onset of non-zero resets.
These issues may result in log entries like:
Entity sensor.envoy_123456789012_energy_consumption_today from integration enphase_envoy has state class total_increasing, but its state is not strictly increasing. Triggered by state 12.345 (12.543) with last_updated set to 2025-09-05T18:00:23.432536+00:00. Please create a bug report at ...
If these entries occur frequently and are a nuisance then disable the entity. Its data is at best doubtful.
Envoy Metered without installed CT, running older firmware versions, reportedly resets Lifetime energy production to 0 when reaching 1.2 MWh. For use with the energy dashboard, the reset is not an issue. In a recent firmware version 8.x.x the reset is solved, but results in a one-time step change to the full lifetime value. This has impact on the energy dashboard, it can be solved by setting the statistics value for that moment to 0 in Developer tools: Statistics
History example for Envoy Lifetime energy production value reset
Envoy Lifetime energy production value reset.
The envoy, as of firmware 8.2.4264, reportedly decreases the Lifetime energy production value by 1.2 MWh at irregular times. The current hypothesis is that the step change occurs when one of the inverters exceeds an internal lifetime joules counter of 32 bit, which is 1.19 MWh, and resets to zero. This leads to a decrease of 1.2 MWh in the aggregated value for all inverters.
History example for Envoy Lifetime energy production value decrease
The example below shows decreases when multiple inverters reach a 1.2 MWh lifetime value over time. This would typically occur after some year(s) lifetime and then spread over some months based on individual solar panel production variations.
Envoy Lifetime energy production value decrease.
To correct for this issue, a sensor blueprint template named Correct Envoy lifetime production energy is available in the community blueprints exchange.
Import the blueprint using the import blueprint to button. This will install the blueprint as /config/blueprints/template/marcelhoogantink/correct_envoy_lifetime_production_energy.yaml . Use the templates shown in the blueprint exchange to implement an entity with a corrected lifetime value.
If you are not seeing all your installed inverters , and you have more than 49 inverters installed, and you are running HA 2025.7, 2025.7.1, or 2025.7.2, then upgrade HA to 2025.7.3 or newer. Due to a limitation in the Envoy firmware. Only the inverter details for 49 inverters are available. In the mentioned releases, any more inverters got dropped. The 2025.7.3 version fixed this by only using the inverter base data, which does not have this limitation.
If you are not seeing inverters detail data, verify if you have more than 49 inverters installed. Due to a limitation in the Envoy firmware, the inverter device detail data is only available when 49 or fewer inverters are configured. When more than 49 inverters are configured, only the 3 power production entities are available for each inverter.
The Envoy Metered in multiphase setup, sums the voltages of the phases measured on the CT for the aggregated data. This may be valid for split-phase, but for 3-phase systems, use the individual phases rather than the summed value.
Envoy Metered with a net-consumption CT measures current and energy exchange between switchboard and grid. Mismatches with other grid-meters and/or the Enphase web-site have been reported. It’s not clear if this is related to a recent firmware version or longer existing. When using these values best validate if they are correct in your specific case.
In multiphase installations with batteries, in countries with phase-balancing grid meters, the battery will export to the grid on one phase the amount it lacks on another phase. This other phase pulls the missing amount from the grid, as if it is using the grid as a ‘transport’ between phases. Since the grid meter will balance the amount imported and exported on the two phases, the net result is zero. The Envoy multiphase net-consumption CTs, however, will report the amounts on both phases, resulting in too high export on one and too high import on the other. One may consider using the lifetime balanced net energy consumption which is the sum of grid import and export to eliminate this effect. This would require some templating to split these values into import and export values. Alternatively, use the current net power consumption or balanced net power consumption with a Riemann integral sum helper.
Shortly after 11 PM, data requests to the Envoy may fail. This has been reported for various firmware versions and at different times. The Envoy is reportedly recycling internal processes or performing cleanup tasks. While this activity is ongoing, data requests may fail. The issue is typically observed as log entries and gaps in historical data. These gaps may last until a new value comes in. For some entities, this may not happen until the next sunrise, when solar generation resumes.
History example for Envoy Lifetime energy production with gaps at 11 PM
The example below shows data gaps starting at 11 PM on multiple, but not all, days.
Envoy Lifetime energy production data gaps at 11 PM.
If you experience authentication errors during the configuration of the Envoy, ensure if Multi Factor Authentication (MFA) is disabled for your Enlighten account. Currently, this integration does not support MFA for token retrieval. If any of the below errors show, verify if MFA is disabled.
Before HA version 2026.1.2: KeyError: ‘is_consumer’
As of Home Assistant version 2026.1.2
KeyError: ‘session_id’
EnvoyAuthenticationError: No session id in Enlighten login reply, disable Multi Factor Authentication
These error may also appear in the log upon token refresh, 11 months after initial token collection.
If you experience periodic connection issues, ensure the Envoy is connected to only one interface (either Ethernet OR Wi-Fi, not both). The Envoy should not be both on your local LAN (Ethernet) and local Wi-Fi simultaneously. Having both connections active can cause auto-discovery to alternate between interfaces, resulting in connection interruptions approximately every 30 minutes.
The CT active flag count value shows the number of CT status flags that are raised. In a normal state, the value of CT active flag count is zero. If the value is non-zero, consult the diagnostic report of the Envoy and look for raw_data - /ivp/meters - statusFlags for set flags, one or more from ( production-imbalance | negative-production | power-on-unused-phase | negative-total-consumption ). Their somewhat descriptive names may be an indication of installation issues.
The log shows an entry like below for energy consumption today or energy production today. See the energy incorrect topic for a description of this issue.
This integration provides debug log and diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] report as described in the Home Assistant troubleshooting pages .
Debug log
When experiencing issues during the use of the integration, enable the debug log for the Envoy . Then restart the integration. This will add details on the data collection to the Home Assistant log file. Leave the debug log enabled long enough to capture the occurrence of the issue. If the issue is intermittent, this may take a while and it may grow the log file quite a bit.
If you’re expecting features to show but they are not shown, make sure to reload the integration while debug logging is enabled.
When this integration is loaded, it will scan the Envoy for available features and configure these as needed. Following this initial scan, only data for the found features is collected. Performing a reload with debug enabled results in the debug log containing the initial full scan to assist with analyzing any missing features. Some features are disabled by default, and you need to enable them if you want them to show. Verify this before starting a debug session.
Once the issue occurred, stop the debug logging again ( download of debug log file will start automatically ). When reporting the issue, include the debug log file as well as a diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] file.
The debug log will show all communication with the Envoy / IQ Gateway. Lines starting with below examples are log entries for the integration:
2024-03-07 11:20:11.897 DEBUG (MainThread) [homeassistant.components.enphase_envoy
2024-03-07 11:20:11.898 DEBUG (MainThread) [pyenphase
Below a typical data request / reply sequence in the log file. These lines will contain the data details received from the Envoy .
... [pyenphase.envoy] Requesting https://192.168.1.2/ivp/meters with timeout ...
... [pyenphase.envoy] Request reply from https://192.168.1.2/ivp/meters status 200:...
The end of a collection cycle is marked by:
... [homeassistant.components.enphase_envoy.coordinator] Finished fetching Envoy 123456 data in 1.234 seconds (success: True)
Diagnostics
The diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data file is a JSON file and includes a data section with the details for this integration. The file can be viewed with any text editor. The data section has up to 6 major subsections which reflect how the integration is set up and data is used. Include the file when reporting issues.
Below the 6 subsections, each collapsed.
"data": {
"config_entry": { ...
},
"envoy_properties": { ...
"raw_data": { ...
"envoy_model_data": { ...
"envoy_entities_by_device": [ ...
],
"fixtures" : { ...
}
Config entry
Shows the integration configuration created when the integration was added.
Envoy properties
Shows the conclusions of the initial data scan and what features were identified, including the detected firmware version in the Envoy.
Raw data
Shows the data collected from the Envoy during the last data scan when the diagnostic report was created. If in doubt about data shown in the dashboards, consult this section to find the raw data sent by the Envoy. The integration is not modifying this data, it’s just providing the data to the entities.
Envoy model data
Shows the data of the Envoy extracted from the raw_data into Envoy class data used by the Home Assistant integration. This is a subset of the full raw dataset.
Envoy entities by device
Shows all entities created by the integration based on the findings of the initial scan, grouped by device. Entity state based on the last data collection cycle is included. State values here come from the Envoy model data and are the values visible in the dashboards.
Fixtures
The data to build test fixtures from. This section is only available when the option to Collect test fixture data is enabled in the integration options .
EB-00060-2.0-EN, June 2025
TEB-00269-2.0-EN, March 2025
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Enphase Envoy hub was introduced in Home Assistant 0.76, and it's used by
1.9% of the active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@cgarwood
@catsmanac
Categories
Energy
Back to top
