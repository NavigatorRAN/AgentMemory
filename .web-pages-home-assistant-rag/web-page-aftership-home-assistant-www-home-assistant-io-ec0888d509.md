---
source_url: "https://www.home-assistant.io/integrations/aftership"
final_url: "https://www.home-assistant.io/integrations/aftership"
canonical_url: "https://www.home-assistant.io/integrations/aftership/"
source_handle: "web:www-home-assistant-io:ec0888d5099b"
source_section: "integrations-aftership"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b17cf8231fc5b66c11f15585e06e1c15c3ebc43fa19ad2c913a1febeca1bb138"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AfterShip - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aftership
- Final URL: https://www.home-assistant.io/integrations/aftership
- Canonical URL: https://www.home-assistant.io/integrations/aftership/
- Fetched at: 2026-06-28T02:26:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up AfterShip sensors within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
List of actions
The AfterShip integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to track deliveries by AfterShip , a service that supports 490+ couriers worldwide. To use the tracking API functionality, the Pro plan is required.
The sensor value shows the number of packages that are not in Delivered state. As attributes are the number of packages per status.
To use this sensor, you need an AfterShip Account and set up an API Key. To set up an API Key go to AfterShip API page, and copy existing key or generate a new one.
Important
AfterShip removed the Tracking API functionality from the Forever Free plan, and also no longer offers it in the Essentials plan. Using this integration now requires at least the Pro plan.
To add the AfterShip service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AfterShip .
Follow the instructions on screen to complete the setup.
The AfterShip integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add tracking ( aftership.add_tracking )
Adds a new tracking number to AfterShip.
Remove tracking ( aftership.remove_tracking )
Removes a tracking number from AfterShip.
For an overview of every action across all integrations, see the actions reference .
Note
This integration retrieves data from AfterShip public REST API, but the integration is not affiliated with AfterShip.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AfterShip service was introduced in Home Assistant 0.85, and it's used by
30 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Postal service
Back to top
