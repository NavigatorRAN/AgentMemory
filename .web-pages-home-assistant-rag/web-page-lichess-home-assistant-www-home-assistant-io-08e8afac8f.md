---
source_url: "https://www.home-assistant.io/integrations/lichess"
final_url: "https://www.home-assistant.io/integrations/lichess"
canonical_url: "https://www.home-assistant.io/integrations/lichess/"
source_handle: "web:www-home-assistant-io:08e8afac8f7a"
source_section: "integrations-lichess"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6791296aa0781b16302eb814364d8a0762881fe65a98fe1e6dc481fa61b9017f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Lichess - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lichess
- Final URL: https://www.home-assistant.io/integrations/lichess
- Canonical URL: https://www.home-assistant.io/integrations/lichess/
- Fetched at: 2026-06-28T02:56:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Lichess with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Generate an API token
Supported functionality
Sensors
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Lichess integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Lichess chess statistics in Home Assistant.
You need a Lichess personal API token to use this integration. You can create one on the Lichess API token page .
To add the Lichess service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lichess .
Follow the instructions on screen to complete the setup.
API Token
Your Lichess personal API token.
The API token is used to authenticate requests to the Lichess API. To generate an API token, take the following steps:
Visit the Lichess API token page .
When creating the token, make sure Read preferences is allowed.
The integration creates sensors for your rating in Bullet, Blitz, Rapid, and Classical, and also the number of games played in each of these formats.
Entities for your rating and the number of games played in the following formats are also available, but are disabled by default:
Puzzles
Ultra Bullet
Correspondence
Chess960
Crazyhouse
Antichess
Atomic
Horde
King of the Hill
Racing Kings
Three-check
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Lichess API every hour to update sensor data.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lichess service was introduced in Home Assistant 2026.4, and it's used by
26 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@aryanhasgithub
Categories
Sensor
Back to top
