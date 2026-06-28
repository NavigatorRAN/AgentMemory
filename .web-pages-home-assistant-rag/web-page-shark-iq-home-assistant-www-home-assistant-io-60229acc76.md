---
source_url: "https://www.home-assistant.io/integrations/sharkiq"
final_url: "https://www.home-assistant.io/integrations/sharkiq"
canonical_url: "https://www.home-assistant.io/integrations/sharkiq/"
source_handle: "web:www-home-assistant-io:60229acc76a5"
source_section: "integrations-sharkiq"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "014a999a0978115e515908d928c0d41fa7dfaa4cf0aea88a0343f733184e8931"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Shark IQ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sharkiq
- Final URL: https://www.home-assistant.io/integrations/sharkiq
- Canonical URL: https://www.home-assistant.io/integrations/sharkiq/
- Fetched at: 2026-06-28T03:15:30Z
- Content type: text/html; charset=UTF-8

## Description

Integrate your Shark IQ robot vacuum with Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Troubleshooting
Integration Disconnecting
The Shark IQ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Shark IQ vacuum.
To add the Shark IQ hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Shark IQ .
Follow the instructions on screen to complete the setup.
The Shark IQ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clean room ( sharkiq.clean_room )
Cleans a specific user-defined room or set of rooms.
For an overview of every action across all integrations, see the actions reference .
The currently supported Vacuum actions are:
vacuum.start
vacuum.pause
vacuum.stop
vacuum.return_to_base
vacuum.locate
vacuum.set_fan_speed
If the integration frequently disconnects and you have an ad blocker runner like Pi-hole or AdGuard add ads-field.aylanetworks.com to the Allow list . This domain is needed for the connection and can be part of the automatic blocking because of ads being part of the subdomain.
If pause does not work for you, then it is not supported by your vacuum. The stop action will provide similar functionality.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Shark IQ hub was introduced in Home Assistant 0.115, and it's used by
1173 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@JeffResc
@funkybunch
@TheOneOgre
Categories
Vacuum
Back to top
