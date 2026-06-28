---
source_url: "https://www.home-assistant.io/integrations/select"
final_url: "https://www.home-assistant.io/integrations/select"
canonical_url: "https://www.home-assistant.io/integrations/select/"
source_handle: "web:www-home-assistant-io:3b67b69f092b"
source_section: "integrations-select"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f72b9e0eddc1ca81d4ee5270206f9a4c4f2e77b469dd5a996458e8d19e57899b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Select - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/select
- Final URL: https://www.home-assistant.io/integrations/select
- Canonical URL: https://www.home-assistant.io/integrations/select/
- Fetched at: 2026-06-28T03:14:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to manage your Select entities with Home Assistant.

## Extracted Text

On this page
The state of a select entity
List of actions
List of triggers
List of conditions
The Select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] manages the state of the select entities and allows
you to control them. This integration allows other integrations to offer
a limited set of selectable options for the entity.
Note
Building block integration
This select is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this select building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the select building block offers.
The state of a select entity is the value of the currently selected option.
Screenshot showing the state of a select entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Select first option ( select.select_first )
Selects the first option of a select entity.
Select last option ( select.select_last )
Selects the last option of a select entity.
Select next option ( select.select_next )
Selects the next option of a select entity.
Select option ( select.select_option )
Selects a specific option of a select entity.
Select previous option ( select.select_previous )
Selects the previous option of a select entity.
For an overview of every action across all integrations, see the actions reference .
The Select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Dropdown selection changed ( select.selection_changed )
Triggers when the selected option of one or more dropdowns changes.
For an overview of every trigger across all integrations, see the triggers reference .
The Select integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Dropdown option is selected ( select.is_option_selected )
Tests if one or more dropdowns have a specific option selected.
For an overview of every condition across all integrations, see the conditions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Select entity was introduced in Home Assistant 2021.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Select
Back to top
