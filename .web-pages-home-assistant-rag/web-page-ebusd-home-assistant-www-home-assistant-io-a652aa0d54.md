---
source_url: "https://www.home-assistant.io/integrations/ebusd"
final_url: "https://www.home-assistant.io/integrations/ebusd"
canonical_url: "https://www.home-assistant.io/integrations/ebusd/"
source_handle: "web:www-home-assistant-io:a652aa0d54e7"
source_section: "integrations-ebusd"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "45cea61cef18edd4bea17a8f7760c1541847c39fda218da462dcf7ac26e0aba3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# ebusd - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ebusd
- Final URL: https://www.home-assistant.io/integrations/ebusd
- Canonical URL: https://www.home-assistant.io/integrations/ebusd/
- Fetched at: 2026-06-28T02:38:55Z
- Content type: text/html; charset=UTF-8

## Description

The ebusd integration allows the integration between eBUS heating system and Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
Integration between the ebusd daemon (used for communication with the eBUS heating systems), and Home Assistant. The ebusd integrations uses the sensor integration.
Enable the sensor by adding the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry ebusd : host : 127.0.0.1 circuit : " 700"
Configuration Variables
Looking for your configuration file?
host string Required
This is the IP address of your ebus daemon, e.g., 127.0.0.1 .
circuit string Required
The heating circuit name to monitor, e.g., ‘700’, ‘ehp’ or ‘bai’.
port integer ( Optional , default: 8888 )
The port your ebus daemon uses.
name string ( Optional , default: ebusd )
The name to use when displaying this ebusd instance.
monitored_conditions list ( Optional )
List of conditions to monitor. Note that not all monitored_conditions listed here can be supported by your circuit. This integration maps limited set of keys to circuit specific ebusd values.
ActualFlowTemperatureDesired
Heating circuit flow temperature desired.
MaxFlowTemperatureDesired
Heating circuit maximum flow temperature.
MinFlowTemperatureDesired
Heating circuit minimum flow temperature.
PumpStatus
Heating circuit pump status.
HCSummerTemperatureLimit
Heating circuit summer temperature limit.
HolidayTemperature
Heating circuit holiday temperature.
HWTemperature
Hot water circuit actual temperature.
HWTemperatureDesired
Hot water circuit desired temperature.
HWTimerMonday
Hot water circuit monday timer.
HWTimerTuesday
Hot water circuit tuesday timer.
HWTimerWednesday
Hot water circuit wednesday timer.
HWTimerThursday
Hot water circuit thursday timer.
HWTimerFriday
Hot water circuit friday timer.
HWTimerSaturday
Hot water circuit saturday timer.
HWTimerSunday
Hot water circuit sunday timer.
WaterPressure
Water pressure (bar).
Zone1RoomZoneMapping
Room controller assignment zone 1.
Zone1NightTemperature
Heating circuit night temperature desired on zone 1.
Zone1DayTemperature
Heating circuit day temperature desired on zone 1.
Zone1HolidayTemperature
Heating circuit holiday temperature desired on zone 1.
Zone1RoomTemperature
Actual room temperature on zone 1.
Zone1ActualRoomTemperatureDesired
Actual room temperature desired on zone 1.
Zone1TimerMonday
Heating circuit monday timer on zone 1.
Zone1TimerTuesday
Heating circuit tuesday timer on zone 1.
Zone1TimerWednesday
Heating circuit wednesday timer on zone 1.
Zone1TimerThursday
Heating circuit thursday timer on zone 1.
Zone1TimerFriday
Heating circuit friday timer on zone 1.
Zone1TimerSaturday
Heating circuit saturday timer on zone 1.
Zone1TimerSunday
Heating circuit sunday timer on zone 1.
Zone1OperativeMode
Heating circuit operative mode (on/off/day/night).
ContinuosHeating
Continuous heating.
PowerEnergyConsumptionLastMonth
Power energy consumption from last month.
PowerEnergyConsumptionThisMonth
Power energy consumption from the actual month.
HotWaterTemperature
Hot water circuit temperature.
StorageTemperature
Boiler temperature.
DesiredStorageTemperature
Target boiler temperature.
OutdoorsTemperature
Temperature used for weather dependent calculations.
AverageIgnitionTime
Average flame ignition time (seconds).
MaximumIgnitionTime
Maximum flame ignition time (seconds).
MinimumIgnitionTime
Minimum flame ignition time (seconds).
ReturnTemperature
Temperature returned into heater from water circuit.
DesiredFlowTemperature
Target heat temperature.
FlowTemperature
Out temperature.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ebusd integration was introduced in Home Assistant 0.88, and it's used by
70 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
