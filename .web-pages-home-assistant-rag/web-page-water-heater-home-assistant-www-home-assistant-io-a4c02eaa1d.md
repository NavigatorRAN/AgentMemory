---
source_url: "https://www.home-assistant.io/integrations/water_heater"
final_url: "https://www.home-assistant.io/integrations/water_heater"
canonical_url: "https://www.home-assistant.io/integrations/water_heater/"
source_handle: "web:www-home-assistant-io:a4c02eaa1d44"
source_section: "integrations-water-heater"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "708aeec7e1cc39278997d220c93561e46d277f2b8a198602d9595b0ee084e0d1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Water heater - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/water_heater
- Final URL: https://www.home-assistant.io/integrations/water_heater
- Canonical URL: https://www.home-assistant.io/integrations/water_heater/
- Fetched at: 2026-06-28T03:27:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up water heater devices within Home Assistant.

## Extracted Text

On this page
The state of a water heater entity
List of triggers
List of conditions
List of actions
Water heater automation examples
Automation: lower the recirculation pump when the water heater enters Eco mode
Automation: enable away mode only when the target temperature is already low
The Water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor and control supported hot water heaters in Home Assistant. You can use it to check whether a water heater is on or off, adjust the target temperature, change the operation mode, and build automations around those changes.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , pick one of the platforms, and add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry water_heater : platform : demo
Warning
Misconfiguring Water Heater automations may allow water temperatures to drop into ranges between 25°C to 45°C (77°F and 113°F) which allows for Legionella bacteria growth. This can pose serious health risks, including death from Legionnaires’ disease. Maintain water temperature ≥ 60°C (140°F) for bacterial safety.
A water heater entity state reflects the current operation of the device. Common states include:
On : The water heater is on.
Off : The water heater is off.
Eco : Energy efficient mode, provides energy savings and fast heating.
Electric : Electric only mode. This mode uses the most energy.
Performance : High performance mode.
High demand : Meet high demands when the water heater is undersized.
Heat pump : Heat pump is the slowest to heat, but it uses less energy.
Gas : Gas only mode. This mode uses the most energy.
The exact states depend on the platform and the water heater model.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Water heater operation mode changed ( water_heater.operation_mode_changed )
Triggers when the operation mode of one or more water heaters changes to a specific mode.
Water heater target temperature changed ( water_heater.target_temperature_changed )
Triggers when the temperature setpoint of one or more water heaters changes.
Water heater target temperature crossed threshold ( water_heater.target_temperature_crossed_threshold )
Triggers when the temperature setpoint of one or more water heaters crosses a threshold.
Water heater turned off ( water_heater.turned_off )
Triggers when one or more water heaters turn off.
Water heater turned on ( water_heater.turned_on )
Triggers when one or more water heaters turn on, regardless of the operation mode.
For an overview of every trigger across all integrations, see the triggers reference .
The Water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Water heater is off ( water_heater.is_off )
Tests if one or more water heaters are off.
Water heater is on ( water_heater.is_on )
Tests if one or more water heaters are on.
Water heater operation mode ( water_heater.is_operation_mode )
Tests if one or more water heaters are set to a specific operation mode.
Water heater target temperature ( water_heater.is_target_temperature )
Tests the temperature setpoint of one or more water heaters.
For an overview of every condition across all integrations, see the conditions reference .
The Water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set water heater away mode ( water_heater.set_away_mode )
Turns away mode on or off for a water heater.
Set water heater operation mode ( water_heater.set_operation_mode )
Sets the operation mode of a water heater.
Set water heater target temperature ( water_heater.set_temperature )
Sets the target temperature of a water heater.
Turn off water heater ( water_heater.turn_off )
Turns off a water heater.
Turn on water heater ( water_heater.turn_on )
Turns on a water heater.
For an overview of every action across all integrations, see the actions reference .
You can use water heater triggers and conditions in automations to keep hot water ready when you need it, while still using less energy the rest of the day.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
When the water heater changes to Eco mode, lower the recirculation pump speed to match the lower-demand schedule.
Trigger : Water heater operation mode changed
Target : Utility room water heater
Operation mode : Eco
Action : Turn on switch
YAML example for lowering the recirculation pump in Eco mode
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Lower recirculation pump in Eco mode"
triggers:
- trigger: water_heater.operation_mode_changed
target:
entity_id: water_heater.utility_room
options:
operation_mode: eco
actions:
- action: switch.turn_on
entity_id: switch.recirculation_pump_low_speed
When everybody leaves home, enable away mode only if the target temperature is already below your normal daytime setting.
Trigger : State: Person changes to not_home
Condition : Water heater target temperature
Threshold type : Below (50°C)
Action : Set water heater away mode
YAML example for enabling away mode from a lower setpoint
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Enable away mode when the setpoint is already low"
- trigger: state
entity_id: person.alex
to: "not_home"
conditions:
- condition: water_heater.is_target_temperature
threshold:
type: below
value:
number: 50
unit_of_measurement: "°C"
- action: water_heater.set_away_mode
data:
away_mode: true
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Water heater entity was introduced in Home Assistant 0.81.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Back to top
