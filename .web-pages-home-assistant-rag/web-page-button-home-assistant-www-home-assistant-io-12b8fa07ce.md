---
source_url: "https://www.home-assistant.io/integrations/button"
final_url: "https://www.home-assistant.io/integrations/button"
canonical_url: "https://www.home-assistant.io/integrations/button/"
source_handle: "web:www-home-assistant-io:12b8fa07ceee"
source_section: "integrations-button"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8a4badeef2e6e8b1ae58053c07b68665a1cb3d9490be994784b061b5e360a8d2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Button - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/button
- Final URL: https://www.home-assistant.io/integrations/button
- Canonical URL: https://www.home-assistant.io/integrations/button/
- Fetched at: 2026-06-28T02:33:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your button with Home Assistant.

## Extracted Text

On this page
The state of a button
List of triggers
List of actions
Device class
Button automation examples
Automation: send a notification when a button is pressed
Automation: restart a device with a button action
Related topics
A button entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is an entity that can fire an event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] or trigger an action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] toward a device A device is a model representing a physical or logical unit that contains entities. or service The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware. , but remains stateless from the Home Assistant perspective.
It can be compared to a momentary switch, push-button, or other form of stateless switch.
Note
Building block integration
This button is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this button building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the button building block offers.
The button entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is stateless. Unlike a normal switch entity, it does not have an on or off state.
The state of a button is a timestamp showing when the button was last pressed via the Home Assistant UI or an action.
Screenshot showing the state of a button entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
You can use button entities in automations to react when a button is pressed, or to simulate pressing the button from Home Assistant, like pressing a physical button on the device itself.
The Button integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Button pressed ( button.pressed )
Triggers when one or more buttons are pressed.
For an overview of every trigger across all integrations, see the triggers reference .
The Button integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Press button ( button.press )
Presses a button entity.
For an overview of every action across all integrations, see the actions reference .
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The screenshot shows different icons representing different device classes for buttons:
Example of device class icons.
The following device classes are supported for buttons:
None : Generic button. This is the default and doesn’t need to be set.
identify : The button is used to identify a device.
restart : The button restarts the device.
update : The button updates the software of the device.
The following examples show how you can use button entities in automations.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
Use the button trigger to react when you press a button entity, like a reset or maintenance button.
Trigger : Button pressed
Target : Air purifier filter reset button
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for a button-press notification
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] - alias: "Notify when the filter reset button is pressed"
triggers:
- trigger: button.pressed
target:
entity_id: button.air_purifier_reset_filter
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
message: "The air purifier filter reset button was pressed."
Use the button action when an integration exposes a restart or update button that you want to run from an automation.
Trigger : Internet connection turns off for 10 minutes
Action : Press button
Target : Router restart button
YAML example for restarting a device with a button action
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] - alias: "Restart the router when the internet has been down"
- trigger: state
entity_id: binary_sensor.internet_connection
to: "off"
for: "00:10:00"
- action: button.press
entity_id: button.router_restart
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Button entity was introduced in Home Assistant 2021.12.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Button
Back to top
