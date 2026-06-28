# Humidifier - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/humidifier
- Final URL: https://www.home-assistant.io/integrations/humidifier
- Canonical URL: https://www.home-assistant.io/integrations/humidifier/
- Fetched at: 2026-06-28T02:50:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up humidity control devices within Home Assistant.

## Extracted Text

On this page
The state of a humidifier entity
Device class
List of actions
List of triggers
List of conditions
Related topics
The Humidifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is built for the controlling and monitoring of humidifiers, dehumidifiers, and hygrostat devices.
Note
Building block integration
This humidifier is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this humidifier building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the humidifier building block offers.
The state of a humidifier entity can be either On or Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The screenshot shows different text and UI for different device classes for humidifiers:
Humidifier device classes.
The following device classes are supported for humidifiers:
Humidifier : Adds humidity to the air around it.
Dehumidifier : Removes humidity from the air around it.
The Humidifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set humidifier target humidity ( humidifier.set_humidity )
Sets the target humidity of a humidifier.
Set humidifier mode ( humidifier.set_mode )
Sets the mode of a humidifier.
Toggle humidifier ( humidifier.toggle )
Toggles a humidifier on or off.
Turn off humidifier ( humidifier.turn_off )
Turns off a humidifier.
Turn on humidifier ( humidifier.turn_on )
Turns on a humidifier.
For an overview of every action across all integrations, see the actions reference .
The Humidifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Humidifier mode changed ( humidifier.mode_changed )
Triggers when the mode of one or more humidifiers changes.
Humidifier started drying ( humidifier.started_drying )
Triggers when one or more humidifiers start drying.
Humidifier started humidifying ( humidifier.started_humidifying )
Triggers when one or more humidifiers start humidifying.
Humidifier turned off ( humidifier.turned_off )
Triggers when one or more humidifiers turn off.
Humidifier turned on ( humidifier.turned_on )
Triggers when one or more humidifiers turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The Humidifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Humidifier is drying ( humidifier.is_drying )
Tests if one or more humidifiers are drying.
Humidifier is humidifying ( humidifier.is_humidifying )
Tests if one or more humidifiers are humidifying.
Humidifier is in mode ( humidifier.is_mode )
Tests if one or more humidifiers are set to a specific mode.
Humidifier is off ( humidifier.is_off )
Tests if one or more humidifiers are off.
Humidifier is on ( humidifier.is_on )
Tests if one or more humidifiers are on.
Humidifier target humidity ( humidifier.is_target_humidity )
Tests the target humidity of one or more humidifiers.
For an overview of every condition across all integrations, see the conditions reference .
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Humidifier entity was introduced in Home Assistant 0.112.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Humidifier
Back to top
