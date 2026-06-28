---
source_url: "https://www.home-assistant.io/integrations/image"
final_url: "https://www.home-assistant.io/integrations/image"
canonical_url: "https://www.home-assistant.io/integrations/image/"
source_handle: "web:www-home-assistant-io:be6dc6cf985e"
source_section: "integrations-image"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "94e4800cf41acb3eb42eadf80eeebd7f87b63b987339e7e1341d02b20ff19baa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Image - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/image
- Final URL: https://www.home-assistant.io/integrations/image
- Canonical URL: https://www.home-assistant.io/integrations/image/
- Fetched at: 2026-06-28T02:51:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate images within Home Assistant.

## Extracted Text

On this page
The state of an image entity
List of actions
The Image integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows other integrations to display a static image.
Note
Building block integration
This image is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this image building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the image building block offers.
The state of an image entity is a timestamp, showing the date and time when the image was last changed.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Image integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Take image snapshot ( image.snapshot )
Saves the current image from an image entity to a file.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Image entity was introduced in Home Assistant 2023.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Image
Back to top
