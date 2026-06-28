---
source_url: "https://www.home-assistant.io/integrations/binary_sensor"
final_url: "https://www.home-assistant.io/integrations/binary_sensor"
canonical_url: "https://www.home-assistant.io/integrations/binary_sensor/"
source_handle: "web:www-home-assistant-io:fac89de32447"
source_section: "integrations-binary-sensor"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f97d23caac873509dc7c347bfae90155894af96c5f1f3246348eb8f60ee732a1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Binary sensor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/binary_sensor
- Final URL: https://www.home-assistant.io/integrations/binary_sensor
- Canonical URL: https://www.home-assistant.io/integrations/binary_sensor/
- Fetched at: 2026-06-28T02:31:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how-to set up binary sensors with Home Assistant.

## Extracted Text

On this page
The state of binary sensor
Device class
Binary sensors are similar to other sensors in that they
monitor the states and conditions of different entities. Where binary sensors
differ is they can only return one of two mutually exclusive values.
For example, a binary sensor for a window may report a value
of open or closed , a switch on or off , a condition true or false .
This either/or constraint is what makes these sensors binary. They are digital
in nature, whereas analog sensors, like temperature and weight sensors,
return a range of values.
Some binary sensors are created automatically when you add a device integration.
For example, adding the ecobee integration will create
a binary sensor to detect room occupancy. Other binary sensors can be created
manually using the template integration
or using an input boolean helper .
Note
Building block integration
This binary sensor is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this binary sensor building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the binary sensor building block offers.
A binary sensor can have two states: on or off . However, in the frontend, they might not be called on or off , but use an alternative term to be more meaningful in context. For example, hot/cold, locked/unlocked. The meaning of an on or off state depends on the device class.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The screenshot shows a few examples of different device classes for binary sensors:
Example of various device classes icons in on and off state. The on image
in this example has state_color: true specified in the entities card
configuration to receive the icon coloring.
The following device classes are supported for binary sensors:
None : Generic on/off. This is the default and doesn’t need to be set.
battery : on means low, off means normal
battery_charging : on means charging, off means not charging
carbon_monoxide : on means carbon monoxide detected, off no carbon monoxide (clear)
cold : on means cold, off means normal
connectivity : on means connected, off means disconnected
door : on means open, off means closed
garage_door : on means open, off means closed
gas : on means gas detected, off means no gas (clear)
heat : on means hot, off means normal
light : on means light detected, off means no light
lock : on means open (unlocked), off means closed (locked)
moisture : on means moisture detected (wet), off means no moisture (dry)
motion : on means motion detected, off means no motion (clear)
moving : on means moving, off means not moving (stopped)
occupancy : on means occupied (detected), off means not occupied (clear)
opening : on means open, off means closed
plug : on means device is plugged in, off means device is unplugged
power : on means power detected, off means no power
presence : on means home, off means away
problem : on means problem detected, off means no problem (OK)
running : on means running, off means not running
safety : on means unsafe, off means safe
smoke : on means smoke detected, off means no smoke (clear)
sound : on means sound detected, off means no sound (clear)
tamper : on means tampering detected, off means no tampering (clear)
update : on means update available, off means up-to-date
vibration : on means vibration detected, off means no vibration (clear)
window : on means open, off means closed
For comparison, here are the device classes for analog sensors.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Binary sensor entity was introduced in Home Assistant 0.9.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Binary sensor
Back to top
