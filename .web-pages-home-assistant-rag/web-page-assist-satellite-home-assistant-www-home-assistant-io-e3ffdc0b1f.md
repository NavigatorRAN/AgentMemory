---
source_url: "https://www.home-assistant.io/integrations/assist_satellite"
final_url: "https://www.home-assistant.io/integrations/assist_satellite"
canonical_url: "https://www.home-assistant.io/integrations/assist_satellite/"
source_handle: "web:www-home-assistant-io:e3ffdc0b1f99"
source_section: "integrations-assist-satellite"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bf576a3587241697dce313ba7ea9b56f9c105bb8c290199f5386eb0388f75baa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Assist Satellite - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/assist_satellite
- Final URL: https://www.home-assistant.io/integrations/assist_satellite
- Canonical URL: https://www.home-assistant.io/integrations/assist_satellite/
- Fetched at: 2026-06-28T02:29:30Z
- Content type: text/html; charset=UTF-8

## Description

Remote satellites that use Assist.

## Extracted Text

On this page
List of triggers
List of conditions
List of actions
This is an integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for remote satellites that use Assist to control and interact with Home Assistant. This allows other integrations to represent these satellites in a consistent manner.
Note
Building block integration
This assist satellite is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this assist satellite building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the assist satellite building block offers.
The Assist Satellite integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Satellite became idle ( assist_satellite.idle )
Triggers when one or more Assist satellites become idle after having processed a command.
Satellite started listening ( assist_satellite.started_listening )
Triggers after one or more Assist satellites start listening for a voice command.
Satellite started processing ( assist_satellite.started_processing )
Triggers after one or more Assist satellites start processing a voice command.
Satellite started responding ( assist_satellite.started_responding )
Triggers after one or more Assist satellites start playing back a response.
For an overview of every trigger across all integrations, see the triggers reference .
The Assist Satellite integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Satellite is idle ( assist_satellite.is_idle )
Tests if one or more Assist satellites are idle.
Satellite is listening ( assist_satellite.is_listening )
Tests if one or more Assist satellites are listening for a voice command.
Satellite is processing ( assist_satellite.is_processing )
Tests if one or more Assist satellites are processing a voice command.
Satellite is responding ( assist_satellite.is_responding )
Tests if one or more Assist satellites are playing back a response.
For an overview of every condition across all integrations, see the conditions reference .
The Assist Satellite integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Announce on satellite ( assist_satellite.announce )
Announces a message on an Assist satellite.
Ask question on satellite ( assist_satellite.ask_question )
Asks a question on an Assist satellite and gets the response.
Start conversation on satellite ( assist_satellite.start_conversation )
Starts a conversation from an Assist satellite.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Assist Satellite entity was introduced in Home Assistant 2024.10.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Voice
Back to top
