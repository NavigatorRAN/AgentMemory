# Power - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/power
- Final URL: https://www.home-assistant.io/integrations/power
- Canonical URL: https://www.home-assistant.io/integrations/power/
- Fetched at: 2026-06-28T03:08:53Z
- Content type: text/html; charset=UTF-8

## Description

This integration provides power automation triggers and conditions.

## Extracted Text

On this page
Power and energy
List of triggers
List of conditions
Power automation examples
Automation: notify when the washing machine finishes
Automation: only turn on the water heater boost when power use is low enough
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides automation triggers and conditions for entities with the power device class, like sensors and number entities. Use it when you want to react to how much power a device or circuit is using right now. There are no configuration options for this integration.
Power is the rate of energy use at a specific moment. It is usually shown in units like W or kW. Use the triggers and conditions in this integration when you want to react to a live load change, such as a washing machine finishing or a heater starting.
Energy is the total amount used over time. It is usually shown in kWh. If you want to track accumulated usage, use an energy sensor or the Energy dashboard .
The Power integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Power changed ( power.changed )
Triggers when one or more power values change.
Power crossed threshold ( power.crossed_threshold )
Triggers when one or more power values cross a threshold.
For an overview of every trigger across all integrations, see the triggers reference .
The Power integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Power value ( power.is_value )
Tests the power value of one or more entities.
For an overview of every condition across all integrations, see the conditions reference .
Here are a few ways you can use power automations in Home Assistant.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
When the washing machine power drops below 3 W for 5 minutes, send a notification so you know the cycle is done.
Trigger : Power crossed threshold
Target : Washing machine power sensor
Threshold type : Below 3 W
For at least : 00:05:00
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a washing machine finished notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Notify when the washing machine finishes"
triggers:
- trigger: power.crossed_threshold
target:
entity_id: sensor.washing_machine_power
options:
threshold:
type: below
value:
number: 3
unit_of_measurement: "W"
for: "00:05:00"
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
message: "The washing machine cycle is finished."
At 02:00, turn on the water heater boost switch only if the current household power use is below 2500 W.
Trigger : Time: 02:00
Condition : Power value (below 2500 W)
Target : Main power sensor
Action : Turn on switch
Target : switch.water_heater_boost
YAML example for checking power before turning on a water heater boost
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn on water heater boost when power use is low enough"
- trigger: time
at: "02:00:00"
conditions:
- condition: power.is_value
entity_id: sensor.main_power
number: 2500
- action: switch.turn_on
entity_id: switch.water_heater_boost
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Power system was introduced in Home Assistant 2026.4, and it's used by
0 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
