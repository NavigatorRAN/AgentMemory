---
source_url: "https://www.home-assistant.io/integrations/wake_word"
final_url: "https://www.home-assistant.io/integrations/wake_word"
canonical_url: "https://www.home-assistant.io/integrations/wake_word/"
source_handle: "web:www-home-assistant-io:f00aaa172bb3"
source_section: "integrations-wake-word"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a265db4a24fb7b04d94c88704e25be0e86622d9bfb5a4f11633b4602015cb099"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Wake-word detection - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wake_word
- Final URL: https://www.home-assistant.io/integrations/wake_word
- Canonical URL: https://www.home-assistant.io/integrations/wake_word/
- Fetched at: 2026-06-28T03:27:29Z
- Content type: text/html; charset=UTF-8

## Description

Detect a wake word in streaming audio.

## Extracted Text

On this page
The state of a wake word detection entity
A wake-word-detection entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] allows other integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] or applications to detect wake words in streaming audio.
The wake-word-detection entities cannot be implemented manually, but can be provided by integrations such as Wyoming . The API in Assist Pipelines enables wake-word-detection as part of Assist .
Note
Building block integration
This wake-word detection is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this wake-word detection building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the wake-word detection building block offers.
The state of a wake word detection entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is a timestamp showing the date and time when the wake word was last detected.
Screenshot showing the state of a wake word detection entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Wake-word detection entity was introduced in Home Assistant 2023.9.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Voice
Back to top
