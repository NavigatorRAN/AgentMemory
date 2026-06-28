---
source_url: "https://www.home-assistant.io/integrations/escea"
final_url: "https://www.home-assistant.io/integrations/escea"
canonical_url: "https://www.home-assistant.io/integrations/escea/"
source_handle: "web:www-home-assistant-io:730b2bf5a94c"
source_section: "integrations-escea"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1b73ca1c31542e876cc334c1f70e4934931f44a0ed443de301461f03946ebf79"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Escea - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/escea
- Final URL: https://www.home-assistant.io/integrations/escea
- Canonical URL: https://www.home-assistant.io/integrations/escea/
- Fetched at: 2026-06-28T02:41:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Escea fireplaces with Home Assistant.

## Extracted Text

On this page
Supported hardware
Configuration
Network settings
Master controller
Debugging
The Escea integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows monitoring and control of local Escea fireplaces. These fireplaces are manufactured in New Zealand and sold throughout Australia and New Zealand.
Support all current Escea fireplaces with the Smart Heat feature, including the DF, DL, DS, and DX series.
Though these fireplaces are supported, they can only be integrated if they were connected via Ethernet when installed (that is, these fireplaces do not support Wi-Fi).
To add the Escea device to your Home Assistant instance, use this My button:
Escea can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Escea .
Follow the instructions on screen to complete the setup.
The Escea system uses UDP over the local network to find and communicate with Escea devices. For this to work properly, UDP port 3300 must be available for broadcasting and messaging fireplaces, and similarly, UDP port 3300 must be available to listen for responses. The integration currently listens on 0.0.0.0 and broadcasts to all broadcast IPv4 local addresses, which is not configurable.
Fireplace on / off, fan settings, and desired temperature settings are supported. The current room temperature, as measured by the fireplace, is also supported.
If you’re trying to track down issues with this integration, set up logging for it:
# Example configuration.yaml with logging for Escea logger : default : warning logs : homeassistant.components.escea : debug pescea : debug
This will help you to find network connection issues.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Escea device was introduced in Home Assistant 2022.9, and it's used by
52 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lazdavila
Categories
Climate
Back to top
