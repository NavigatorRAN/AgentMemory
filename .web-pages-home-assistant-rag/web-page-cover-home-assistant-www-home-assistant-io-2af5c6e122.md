# Cover - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cover
- Final URL: https://www.home-assistant.io/integrations/cover
- Canonical URL: https://www.home-assistant.io/integrations/cover/
- Fetched at: 2026-06-28T02:35:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate covers into Home Assistant.

## Extracted Text

On this page
The state of a cover
Device class
List of triggers
List of conditions
List of actions
Cover automation examples
Automation: turn off the office lamp when the blind opens after sunrise
Automation: close the bedroom shutter at sunset if it is still open
Known limitations
Related topics
Home Assistant can give you an interface to control covers such as roller shutters, blinds, and garage doors.
Note
Building block integration
This cover is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this cover building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the cover building block offers.
A cover can have the following states:
Opening : The cover is in the process of opening to reach a set position.
Open : The cover has reached the open position.
Closing : The cover is in the process of closing to reach a set position.
Closed : The cover has reached the closed position.
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
How the state of a cover is represented in the frontend depends on the device class.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The screenshot shows different icons representing different device classes for covers:
List of cover examples.
Example of various device classes icons in open and closed state. The open image in this example has state_color: true specified in the Entities card configuration to receive the icon coloring.
The following device classes are supported for covers.
None : Generic cover. This is the default and doesn’t need to be set.
awning : Control of an awning, such as an exterior retractable window, door, or patio cover.
blind : Control of blinds, which are linked slats that expand or collapse to cover an opening or may be tilted to partially covering an opening, such as window blinds.
curtain : Control of curtains or drapes, which is often fabric hung above a window or door that can be drawn open.
damper : Control of a mechanical damper that reduces airflow, sound, or light.
door : Control of a door or gate that provides access to an area.
garage : Control of a garage door that provides access to a garage.
gate : Control of a gate. Gates are found outside of a structure and are typically part of a fence.
shade : Control of shades, which are a continuous plane of material or connected cells that expanded or collapsed over an opening, such as window shades.
shutter : Control of shutters. Shutters are linked slats that can be raised or lowered to cover an opening, such as window or door roller shutters. Some shutters, for example, some indoor or exterior window shutters, swing out or in to cover an opening or may be tilted to provide partial cover.
window : Control of a physical window that opens and closes or may tilt.
The Cover integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Awning closed ( cover.awning_closed )
Triggers when one or more awnings close.
Awning opened ( cover.awning_opened )
Triggers when one or more awnings open.
Blind closed ( cover.blind_closed )
Triggers when one or more blinds close.
Blind opened ( cover.blind_opened )
Triggers when one or more blinds open.
Curtain closed ( cover.curtain_closed )
Triggers when one or more curtains close.
Curtain opened ( cover.curtain_opened )
Triggers when one or more curtains open.
Shade closed ( cover.shade_closed )
Triggers when one or more shades close.
Shade opened ( cover.shade_opened )
Triggers when one or more shades open.
Shutter closed ( cover.shutter_closed )
Triggers when one or more shutters close.
Shutter opened ( cover.shutter_opened )
Triggers when one or more shutters open.
For an overview of every trigger across all integrations, see the triggers reference .
The Cover integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Awning is closed ( cover.awning_is_closed )
Tests if one or more awnings are closed.
Awning is open ( cover.awning_is_open )
Tests if one or more awnings are open.
Blind is closed ( cover.blind_is_closed )
Tests if one or more blinds are closed.
Blind is open ( cover.blind_is_open )
Tests if one or more blinds are open.
Curtain is closed ( cover.curtain_is_closed )
Tests if one or more curtains are closed.
Curtain is open ( cover.curtain_is_open )
Tests if one or more curtains are open.
Shade is closed ( cover.shade_is_closed )
Tests if one or more shades are closed.
Shade is open ( cover.shade_is_open )
Tests if one or more shades are open.
Shutter is closed ( cover.shutter_is_closed )
Tests if one or more shutters are closed.
Shutter is open ( cover.shutter_is_open )
Tests if one or more shutters are open.
For an overview of every condition across all integrations, see the conditions reference .
The Cover integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Close cover ( cover.close_cover )
Closes a cover.
Close cover tilt ( cover.close_cover_tilt )
Tilts a cover closed.
Open cover ( cover.open_cover )
Opens a cover.
Open cover tilt ( cover.open_cover_tilt )
Tilts a cover open.
Set cover position ( cover.set_cover_position )
Moves a cover to a specific position.
Set cover tilt position ( cover.set_cover_tilt_position )
Tilts a cover to a specific position.
Stop cover ( cover.stop_cover )
Stops the movement of a cover.
Stop cover tilt ( cover.stop_cover_tilt )
Stops the tilting of a cover.
Toggle cover ( cover.toggle )
Toggles a cover open or closed.
Toggle cover tilt ( cover.toggle_cover_tilt )
Toggles a cover tilt open or closed.
For an overview of every action across all integrations, see the actions reference .
You can use cover triggers and conditions to adjust lighting, remind yourself when something is still open, and run routines that depend on whether a cover is open or closed.
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If daylight is enough for the room, this automation turns off the office lamp when the blind opens in the morning.
Trigger : Blind opened
Target : Office blind
Action : Turn off light
Target : Office lamp
YAML example for turning off the office lamp
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Turn off the office lamp when the blind opens"
triggers:
- trigger: cover.blind_opened
target:
entity_id: cover.office_blind
conditions:
- condition: sun
after: sunrise
actions:
- action: light.turn_off
entity_id: light.office_lamp
At sunset, this automation checks whether the bedroom shutter is still open. If it is, Home Assistant closes it for the night.
Trigger : Sun: Sunset
Condition : Shutter is open
Target : Bedroom shutter
Action : Close cover
YAML example for closing the bedroom shutter at sunset
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Close the bedroom shutter at sunset"
- trigger: sun
event: sunset
- condition: cover.shutter_is_open
entity_id: cover.bedroom_shutter
- action: cover.close_cover
The triggers and conditions documented on this page work only with cover entities that use the awning , blind , curtain , shade , or shutter device class.
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cover entity was introduced in Home Assistant 0.27.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Cover
Back to top
