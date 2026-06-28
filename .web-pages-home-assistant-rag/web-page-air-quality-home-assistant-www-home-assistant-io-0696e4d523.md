# Air quality - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/air_quality
- Final URL: https://www.home-assistant.io/integrations/air_quality
- Canonical URL: https://www.home-assistant.io/integrations/air_quality/
- Fetched at: 2026-06-28T02:26:25Z
- Content type: text/html; charset=UTF-8

## Description

Monitor air pollutants and receive alerts from gas, smoke, and carbon monoxide sensors with the Air quality integration in Home Assistant.

## Extracted Text

On this page
Air quality automation examples
Automation: ventilate a stuffy bedroom overnight
Automation: get an urgent alert when carbon monoxide is detected
Automation: run the air purifier during wildfire season
Automation: only open the windows if outdoor air is clean
List of triggers
List of conditions
List of actions
The Air quality integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] brings together all the air quality sensors and detectors in your home. It gives you purpose-built triggers and conditions for pollutants like particulate matter (PM2.5, PM10), carbon dioxide (CO2), carbon monoxide (CO), volatile organic compounds (VOCs), ozone, nitrogen dioxide (NO2), and gas or smoke detectors.
Instead of writing complex template triggers to watch sensor values, you get dedicated triggers that understand pollutant thresholds, unit conversions, and multi-sensor behavior out of the box. Pair them with conditions to build automations that respond intelligently to the air around you.
Note
Building block integration
This air quality is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this air quality building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the air quality building block offers.
The real power of this integration is combining triggers and conditions into automations that keep your home healthy without you having to think about it. Here are a few ideas to get you started.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
CO2 builds up in a closed bedroom as you sleep. By the time you notice the air feels stale, the level is already well above 1,000 ppm. This automation turns on the bedroom ventilation fan when CO2 crosses that threshold and turns it off again once the air is fresh.
Trigger : Carbon dioxide level crossed threshold (above 1,000 ppm)
Action : Turn on the bedroom ventilation fan
Second trigger : Carbon dioxide level crossed threshold (below 800 ppm)
Second action : Turn off the fan
YAML example for overnight bedroom ventilation
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Ventilate bedroom when CO2 is high"
triggers:
- trigger: air_quality.co2_crossed_threshold
target:
entity_id: sensor.bedroom_co2
options:
threshold: 1000
behavior: each
actions:
- action: fan.turn_on
entity_id: fan.bedroom_ventilation
Carbon monoxide is colorless and odorless. You rely entirely on your sensors to know it is there. This automation sends an urgent notification the moment any CO sensor in the house detects carbon monoxide, no matter the time of day.
Trigger : Carbon monoxide detected
Target : All CO sensors (by label)
Action : Send a critical notification to every household member
YAML example for a carbon monoxide alert
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Carbon monoxide alert"
- trigger: air_quality.co_detected
label_id: co_sensors
- action: notify.notify
data:
title: "Carbon monoxide detected"
message: >
A carbon monoxide sensor has triggered.
Open windows, leave the house, and call
emergency services if needed.
When wildfire smoke raises outdoor PM2.5 above a safe level, the last thing you want is to open the windows. This automation starts the air purifier when PM2.5 crosses 25 µg/m³ and stops it when the air clears.
Trigger : PM2.5 level crossed threshold (above 25 µg/m³)
Action : Turn on the air purifier
YAML example for a wildfire-triggered air purifier
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Air purifier on high PM2.5"
- trigger: air_quality.pm25_crossed_threshold
entity_id: sensor.outdoor_pm25
threshold: 25
entity_id: fan.living_room_purifier
Before letting fresh air in, check that outdoor pollution is actually low. This automation runs when you press a dashboard button to open the living room covers, but only if PM2.5 is below a safe limit.
Trigger : Dashboard button pressed
Condition : PM2.5 value is below 15 µg/m³
Action : Open the living room window covers
YAML example for pollution-gated window covers
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Open covers only if air is clean"
- trigger: state
entity_id: input_button.open_windows
conditions:
- condition: air_quality.is_pm25_value
threshold: 15
behavior: any
- action: cover.open_cover
area_id: living_room
The Air quality integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Carbon dioxide level changed ( air_quality.co2_changed )
Triggers when one or more carbon dioxide levels change.
Carbon dioxide level crossed threshold ( air_quality.co2_crossed_threshold )
Triggers when one or more carbon dioxide levels cross a threshold.
Carbon monoxide level changed ( air_quality.co_changed )
Triggers when one or more carbon monoxide levels change.
Carbon monoxide cleared ( air_quality.co_cleared )
Triggers when one or more carbon monoxide sensors stop detecting carbon monoxide.
Carbon monoxide level crossed threshold ( air_quality.co_crossed_threshold )
Triggers when one or more carbon monoxide levels cross a threshold.
Carbon monoxide detected ( air_quality.co_detected )
Triggers when one or more carbon monoxide sensors start detecting carbon monoxide.
Gas cleared ( air_quality.gas_cleared )
Triggers when one or more gas sensors stop detecting gas.
Gas detected ( air_quality.gas_detected )
Triggers when one or more gas sensors start detecting gas.
Nitrous oxide level changed ( air_quality.n2o_changed )
Triggers when one or more nitrous oxide levels change.
Nitrous oxide level crossed threshold ( air_quality.n2o_crossed_threshold )
Triggers when one or more nitrous oxide levels cross a threshold.
Nitrogen dioxide level changed ( air_quality.no2_changed )
Triggers when one or more nitrogen dioxide levels change.
Nitrogen dioxide level crossed threshold ( air_quality.no2_crossed_threshold )
Triggers when one or more nitrogen dioxide levels cross a threshold.
Nitrogen monoxide level changed ( air_quality.no_changed )
Triggers when one or more nitrogen monoxide levels change.
Nitrogen monoxide level crossed threshold ( air_quality.no_crossed_threshold )
Triggers when one or more nitrogen monoxide levels cross a threshold.
Ozone level changed ( air_quality.ozone_changed )
Triggers when one or more ozone levels change.
Ozone level crossed threshold ( air_quality.ozone_crossed_threshold )
Triggers when one or more ozone levels cross a threshold.
PM10 level changed ( air_quality.pm10_changed )
Triggers when one or more PM10 levels change.
PM10 level crossed threshold ( air_quality.pm10_crossed_threshold )
Triggers when one or more PM10 levels cross a threshold.
PM1 level changed ( air_quality.pm1_changed )
Triggers when one or more PM1 levels change.
PM1 level crossed threshold ( air_quality.pm1_crossed_threshold )
Triggers when one or more PM1 levels cross a threshold.
PM2.5 level changed ( air_quality.pm25_changed )
Triggers when one or more PM2.5 levels change.
PM2.5 level crossed threshold ( air_quality.pm25_crossed_threshold )
Triggers when one or more PM2.5 levels cross a threshold.
PM4 level changed ( air_quality.pm4_changed )
Triggers when one or more PM4 levels change.
PM4 level crossed threshold ( air_quality.pm4_crossed_threshold )
Triggers when one or more PM4 levels cross a threshold.
Smoke cleared ( air_quality.smoke_cleared )
Triggers when one or more smoke sensors stop detecting smoke.
Smoke detected ( air_quality.smoke_detected )
Triggers when one or more smoke sensors start detecting smoke.
Sulphur dioxide level changed ( air_quality.so2_changed )
Triggers when one or more sulphur dioxide levels change.
Sulphur dioxide level crossed threshold ( air_quality.so2_crossed_threshold )
Triggers when one or more sulphur dioxide levels cross a threshold.
Volatile organic compounds level changed ( air_quality.voc_changed )
Triggers when one or more volatile organic compound levels change.
Volatile organic compounds level crossed threshold ( air_quality.voc_crossed_threshold )
Triggers when one or more volatile organic compounds levels cross a threshold.
Volatile organic compounds ratio changed ( air_quality.voc_ratio_changed )
Triggers when one or more volatile organic compound ratios change.
Volatile organic compounds ratio crossed threshold ( air_quality.voc_ratio_crossed_threshold )
Triggers when one or more volatile organic compounds ratios cross a threshold.
For an overview of every trigger across all integrations, see the triggers reference .
The Air quality integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Carbon dioxide value ( air_quality.is_co2_value )
Tests the carbon dioxide level of one or more entities.
Carbon monoxide cleared ( air_quality.is_co_cleared )
Tests if one or more carbon monoxide sensors are cleared.
Carbon monoxide detected ( air_quality.is_co_detected )
Tests if one or more carbon monoxide sensors are detecting carbon monoxide.
Carbon monoxide value ( air_quality.is_co_value )
Tests the carbon monoxide level of one or more entities.
Gas cleared ( air_quality.is_gas_cleared )
Tests if one or more gas sensors are cleared.
Gas detected ( air_quality.is_gas_detected )
Tests if one or more gas sensors are detecting gas.
Nitrous oxide value ( air_quality.is_n2o_value )
Tests the nitrous oxide level of one or more entities.
Nitrogen dioxide value ( air_quality.is_no2_value )
Tests the nitrogen dioxide level of one or more entities.
Nitrogen monoxide value ( air_quality.is_no_value )
Tests the nitrogen monoxide level of one or more entities.
Ozone value ( air_quality.is_ozone_value )
Tests the ozone level of one or more entities.
PM10 value ( air_quality.is_pm10_value )
Tests the PM10 level of one or more entities.
PM1 value ( air_quality.is_pm1_value )
Tests the PM1 level of one or more entities.
PM2.5 value ( air_quality.is_pm25_value )
Tests the PM2.5 level of one or more entities.
PM4 value ( air_quality.is_pm4_value )
Tests the PM4 level of one or more entities.
Smoke cleared ( air_quality.is_smoke_cleared )
Tests if one or more smoke sensors are cleared.
Smoke detected ( air_quality.is_smoke_detected )
Tests if one or more smoke sensors are detecting smoke.
Sulphur dioxide value ( air_quality.is_so2_value )
Tests the sulphur dioxide level of one or more entities.
Volatile organic compounds ratio value ( air_quality.is_voc_ratio_value )
Tests the volatile organic compounds ratio of one or more entities.
Volatile organic compounds value ( air_quality.is_voc_value )
Tests the volatile organic compounds level of one or more entities.
For an overview of every condition across all integrations, see the conditions reference .
This integration does not provide any documented actions yet. See the actions reference for actions from other integrations.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Air quality entity was introduced in Home Assistant 0.85.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Back to top
