---
source_url: "https://www.home-assistant.io/integrations/illuminance"
final_url: "https://www.home-assistant.io/integrations/illuminance"
canonical_url: "https://www.home-assistant.io/integrations/illuminance/"
source_handle: "web:www-home-assistant-io:bb47d83f955a"
source_section: "integrations-illuminance"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a1d43c663df6966cbf8f709fb9863d9617e15f3788d86ae242d3ecc61e6151d6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Illuminance - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/illuminance
- Final URL: https://www.home-assistant.io/integrations/illuminance
- Canonical URL: https://www.home-assistant.io/integrations/illuminance/
- Fetched at: 2026-06-28T02:51:32Z
- Content type: text/html; charset=UTF-8

## Description

This integration provides illuminance automation triggers and conditions.

## Extracted Text

On this page
Illuminance and brightness
List of triggers
List of conditions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides automation triggers and conditions for binary sensors with device class light and for sensor and number entities with device class illuminance. There are no configuration options for this integration.
Illuminance is a measured input. It describes how much ambient light is reaching a sensor and is reported in lux (lx) by entities like a room or outdoor light sensor. You react to it with the triggers and conditions in this integration.
Brightness is a controllable output. It is a property of light entities in the Light integration , expressed as a value between 0 and 255, or as a percentage in the UI. You set it when turning a lamp on, for example with the Turn on light action and setting Brightness to 40%.
A common pattern is to combine them: use an Illuminance crossed threshold trigger to react when ambient light drops, then use the Light integration’s Turn on light action to set the lamps to the brightness level you want.
The Illuminance integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Illuminance changed ( illuminance.changed )
Triggers when one or more illuminance values change.
Light level cleared ( illuminance.cleared )
Triggers when one or more light sensors stop detecting light.
Illuminance crossed threshold ( illuminance.crossed_threshold )
Triggers when one or more illuminance values cross a threshold.
Light level detected ( illuminance.detected )
Triggers when one or more light sensors start detecting light.
For an overview of every trigger across all integrations, see the triggers reference .
The Illuminance integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Light level is detected ( illuminance.is_detected )
Tests if one or more light sensors are detecting light.
Light level is not detected ( illuminance.is_not_detected )
Tests if one or more light sensors are not detecting light.
Illuminance ( illuminance.is_value )
Tests the illuminance of one or more entities.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Illuminance system was introduced in Home Assistant 2026.4, and it's used by
20 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Automation
Back to top
