---
source_url: "https://www.home-assistant.io/faq/unique_id"
final_url: "https://www.home-assistant.io/faq/unique_id"
canonical_url: "https://www.home-assistant.io/faq/unique_id/"
source_handle: "web:www-home-assistant-io:fd2b03e7c9d9"
source_section: "faq-unique-id"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bb63a5c2ba9e76842dc2bc0f41dc0413f2dc190a6e17c5f006f81739be1f1a9c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Why doesn't this entity have a unique ID? - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/faq/unique_id
- Final URL: https://www.home-assistant.io/faq/unique_id
- Canonical URL: https://www.home-assistant.io/faq/unique_id/
- Fetched at: 2026-06-28T02:24:26Z
- Content type: text/html; charset=UTF-8

## Description

A unique ID is a permanent identifier (such as a serial number) that some entities don't have. Without one, you can't rename the entity from the UI.

## Extracted Text

When you open the configuration dialog of an entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , you may see this message:
A unique ID is a permanent identifier (for example, a serial number) that is guaranteed never to change. Without one, Home Assistant cannot safely let you rename the entity or change its settings from the user interface, because there would be no reliable way to track which entity you meant.
You will typically see this on entities you created manually in YAML, or on entities from an integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] that has no way to determine a unique ID for the underlying device. This is not an error, but a limitation of the integration. A few integrations (such as template and mqtt ) let you define a unique ID yourself in YAML.
Where each ID is used
Unique ID:
Used only internally in Home Assistant.
Entity ID:
Entity with a unique ID: the entity ID is only used as a reference, for example in automations or dashboards.
Entity without a unique ID: the entity ID acts as the replacement for the missing unique ID, and as the reference in automations or dashboards.
Can the IDs be changed?
No. It is a static identifier.
Entity with a unique ID: the entity ID can be changed freely, as long as it follows the format <domain>.<id> and does not collide with another entity. If you change the entity ID, remember to update the references in automations and dashboards.
Entity without a unique ID: the entity ID is treated as a fixed identifier and cannot be changed.
If your entity has no unique ID, you can still adjust some properties through the manual customization options in YAML.
Can I add a unique ID myself?
No. As an end user, you cannot add a unique ID to an entity that does not have one. Unique IDs must come from the integration itself, because they need to consistently identify the same physical device or service across restarts.
If an integration does not provide unique IDs, it could potentially be improved to do so. Contributions are welcome. See the developer documentation to get started, and the entity registry documentation for more on unique IDs.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Entries
About Home Assistant
Can the rest of my household use Home Assistant?
Do Home Assistant updates break things?
Do I need to know how to code to use Home Assistant?
Do I need to learn YAML to use Home Assistant?
Does Home Assistant work with Apple Home, Google Home, and Alexa?
Does Home Assistant work without an internet connection?
How long does it take to set up Home Assistant?
Is Home Assistant free?
Is Home Assistant reliable?
Is my smart home data private with Home Assistant?
What hardware do I need to run Home Assistant?
Who is Home Assistant for?
Common
When is the next Home Assistant release?
Configuration
My integration does not show up
Why does Home Assistant use YAML for power-user configuration?
Why doesn't this entity have a unique ID?
Documentation
The documentation is missing or out of date
What tools do you use to build the documentation?
Home Assistant
404 Client Error: Not Found ('no such image: homeassistant/...)
Can I run Home Assistant from a USB drive on a Raspberry Pi 4?
Do I need to leave the USB stick connected for Wi-Fi?
I'm trying to find my files on the host or SD card. Where are they?
Why does the start button for an app flash red when I select it?
Installation
What is the difference between Home Assistant Operating System and Home Assistant Container?
Usage
After updating, my browser login gets stuck
Connection error
found character ' ' that cannot start any token
Problems with dependencies
The Home Assistant user interface is acting weird
