---
source_url: "https://www.home-assistant.io/integrations/infrared"
final_url: "https://www.home-assistant.io/integrations/infrared"
canonical_url: "https://www.home-assistant.io/integrations/infrared/"
source_handle: "web:www-home-assistant-io:ea9341dee2f1"
source_section: "integrations-infrared"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "669a011087ce6ff039747cbe2fdfaafa7acfd5e0c27437d51e7d45936440ad75"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Infrared - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/infrared
- Final URL: https://www.home-assistant.io/integrations/infrared
- Canonical URL: https://www.home-assistant.io/integrations/infrared/
- Fetched at: 2026-06-28T02:52:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use infrared entities in Home Assistant.

## Extracted Text

On this page
The state of an infrared entity
Setting up devices that use infrared
An infrared entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] represents either an infrared emitter or an infrared receiver. Emitters allow other integrations to send IR commands to control devices such as TVs, air conditioners, and other IR-controlled appliances. Receivers allow other integrations to react to IR signals captured by the hardware.
The Infrared integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] acts as an abstraction layer between IR hardware (such as ESPHome) and device-specific integrations that send commands to infrared-controlled devices, or receive signals from infrared remotes.
Note
Building block integration
This infrared is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this infrared building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the infrared building block offers.
The infrared entity is stateless in the traditional sense, as in, it cannot have a state like on or off . Instead, the state is a timestamp showing when the entity was last active:
For an emitter, the state is the date and time the last IR command was sent.
For a receiver, the state is the date and time the last IR signal was received.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Because the state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] of an infrared entity is a timestamp, it changes every time the entity is used. This means we can use it to track when the emitter last sent a command, or when the receiver last picked up a signal. The logbook can also show context about which integration or action triggered the IR event.
When setting up an integration for an IR-controlled device (such as an LG TV via infrared), you will typically be asked to select which IR emitter and/or receiver to use during the configuration process. This allows you to choose the specific infrared entity that is physically positioned near your device.
The selected infrared entity must be provided by a hardware integration (such as ESPHome) that has already been set up with an IR emitter or receiver.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Infrared entity was introduced in Home Assistant 2026.4.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Infrared
Back to top
