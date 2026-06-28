---
source_url: "https://www.home-assistant.io/docs/organizing"
final_url: "https://www.home-assistant.io/docs/organizing"
canonical_url: "https://www.home-assistant.io/docs/organizing/"
source_handle: "web:www-home-assistant-io:e581c035b62e"
source_section: "docs-organizing"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2ad09517fc8ce917ea1cf20803f7aee50187f4dca68b27d1f06ba43667671999"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Grouping your assets - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/organizing
- Final URL: https://www.home-assistant.io/docs/organizing
- Canonical URL: https://www.home-assistant.io/docs/organizing/
- Fetched at: 2026-06-28T02:22:16Z
- Content type: text/html; charset=UTF-8

## Description

Grouping your assets makes it easier to find them and allows you to target groups in automations.

## Extracted Text

On this page
Area
Floor
Labels
Category
Group Integration
Related topics
Once you have more devices, you may want to target entire groups of devices in automations. It also becomes more challenging to find items in lists.
There are a few tools to group your assets: Areas , floors , labels , categories and group integration .
Taxonomy Automation target Entity can have multiple Area Floor Label Category Group integration
For example, a smart plug with energy monitoring is a single device, but it has multiple entities of different types: a switch entity and a sensor entity. Each of those entities can only belong to one area and one floor, but they can each have multiple labels and be a member of multiple groups.
When you assign a device to an area, all its entities inherit that area. You can override this for individual entities. For example, you could keep the sensor entities of the smart plug in the living room, but assign the switch entity to the kitchen.
Groups devices A device is a model representing a physical or logical unit that contains entities. and entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
Can be assigned to one floor.
Reflects a physical area (or room) in your home.
Can be used in automations: Allows targeting an entire group of devices with an action. For example, turning off all the lights in the living room.
Areas can also be used to automatically generate cards, such as the Area card .
Groups areas.
Devices A device is a model representing a physical or logical unit that contains entities. and entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] cannot be assigned to floors, but to areas only.
Can have multiple areas.
Can be used in automations and scripts as a target for actions. For example, to turn off all the lights on the downstairs floor when you go to bed.
Can be assigned to areas, devices, entities, automations, scenes, scripts, and helpers.
Can be used in automations and scripts as a target for actions.
Labels can also be used to filter data in tables. For example, you can filter the list of devices to show only devices with the label heavy energy usage or turn these devices off when there is not a lot of solar energy available.
Groups items in a table.
Categories are unique for each table. The automations page can have different categories than the scene, scripts, or helpers settings page.
Designed to combine multiple entities into one entity representing the group.
The combined entity can also have an area and labels.
An entity can be a member of multiple groups.
Does not assist with organizing entities in the UI like the other methods above. For example, you cannot use group integration to sort or filter other entities.
Areas
Floors
Categories
Group integration
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Grouping your assets
Working with tables
Icons
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
