---
source_url: "https://www.home-assistant.io/integrations/remote"
final_url: "https://www.home-assistant.io/integrations/remote"
canonical_url: "https://www.home-assistant.io/integrations/remote/"
source_handle: "web:www-home-assistant-io:643461c24822"
source_section: "integrations-remote"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6f3cd22950e93f4b547dc8cf8f48127d65ef1c565edb13052eb5e8239a905399"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Remote - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/remote
- Final URL: https://www.home-assistant.io/integrations/remote
- Canonical URL: https://www.home-assistant.io/integrations/remote/
- Fetched at: 2026-06-28T03:11:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your remotes with Home Assistant.

## Extracted Text

On this page
The state of a remote entity
List of triggers
List of conditions
Use the actions
The Remote integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] manages the state of the remote entities and allows you to control them.
Maintains a state per remote and a combined state all_remotes .
Registers actions remote.turn_on , remote.turn_off , remote.toggle , and remote.send_command to control remotes.
Note
Building block integration
This remote is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this remote building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the remote building block offers.
The state of a remote entity can be either On or Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The Remote integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Remote turned off ( remote.turned_off )
Triggers after one or more remotes turn off.
Remote turned on ( remote.turned_on )
Triggers after one or more remotes turn on.
For an overview of every trigger across all integrations, see the triggers reference .
The Remote integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Remote is off ( remote.is_off )
Tests if one or more remotes are off.
Remote is on ( remote.is_on )
Tests if one or more remotes are on.
For an overview of every condition across all integrations, see the conditions reference .
Go to Settings > Developer tools > Actions . From the Actions dropdown, choose remote.turn_on , remote.turn_off , or remote.toggle . Under target, select the target device. If you are in YAML mode, enter something like the sample below into the Data field. Once you are done, select Perform action .
{ "entity_id" : "remote.family_room" }
Data attribute Optional Description entity_id yes Only act on a specific remote, else target all.
See the platform documentation for each type of remote for more detailed examples.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Remote entity was introduced in Home Assistant 0.34.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Remote
Back to top
