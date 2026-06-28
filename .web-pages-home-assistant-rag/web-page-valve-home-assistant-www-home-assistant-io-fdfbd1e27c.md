# Valve - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/valve
- Final URL: https://www.home-assistant.io/integrations/valve
- Canonical URL: https://www.home-assistant.io/integrations/valve/
- Fetched at: 2026-06-28T03:26:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate valves into Home Assistant.

## Extracted Text

On this page
The state of a valve entity
Device class
List of triggers
List of conditions
List of actions
Related topics
The Valve entity in Home Assistant provides an interface to control valves such as water, gas, or air valves.
Note
Building block integration
This valve is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this valve building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the valve building block offers.
The valve entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] can have the following states:
Open : The valve is fully open.
Opening : The valve is in the process of opening.
Closed : The valve is fully closed.
Closing : The valve is in the process of closing.
Stopped : The valve has stopped moving before reaching a fully open or closed position.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The following device classes are supported for valves:
None : Generic valve. This is the default and doesn’t need to be set.
water : Valve that controls the flow of water through a system.
gas : Valve that controls the flow of gas through a system.
The Valve integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Valve closed ( valve.closed )
Triggers when one or more valves close.
Valve opened ( valve.opened )
Triggers when one or more valves open.
For an overview of every trigger across all integrations, see the triggers reference .
The Valve integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Valve is closed ( valve.is_closed )
Tests if one or more valves are closed.
Valve is open ( valve.is_open )
Tests if one or more valves are open.
For an overview of every condition across all integrations, see the conditions reference .
The Valve integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Close valve ( valve.close_valve )
Closes a valve.
Open valve ( valve.open_valve )
Opens a valve.
Set valve position ( valve.set_valve_position )
Moves a valve to a specific position.
Stop valve ( valve.stop_valve )
Stops a moving valve.
Toggle valve ( valve.toggle )
Toggles a valve open or closed.
For an overview of every action across all integrations, see the actions reference .
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Valve entity was introduced in Home Assistant 2024.1.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Valve
Back to top
