---
source_url: "https://www.home-assistant.io/integrations/chess_com"
final_url: "https://www.home-assistant.io/integrations/chess_com"
canonical_url: "https://www.home-assistant.io/integrations/chess_com/"
source_handle: "web:www-home-assistant-io:581c8f8aab7f"
source_section: "integrations-chess-com"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5cf746abf1b6cc4aee730870968208e1a6cd89d51b736a6182748c99786bcd04"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Chess.com - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/chess_com
- Final URL: https://www.home-assistant.io/integrations/chess_com
- Canonical URL: https://www.home-assistant.io/integrations/chess_com/
- Fetched at: 2026-06-28T02:33:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Chess.com with Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Entities
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Chess.com integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Chess.com statistics in Home Assistant.
To add the Chess.com service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Chess.com .
Follow the instructions on screen to complete the setup.
Username
The username of your Chess.com account
The Chess.com integration provides the following entities.
Sensors
Followers : The number of followers of your Chess.com account.
For each game mode you have played (daily, rapid, bullet, blitz, and daily Chess960), the following sensors are provided:
Rating : The current rating for that game mode.
Games won : The total number of games won in that game mode.
Games lost : The total number of games lost in that game mode.
Games drawn : The total number of games drawn in that game mode.
Sensors for game modes that you have not played yet are not created.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Chess.com API every hour to update sensor data.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Chess.com service was introduced in Home Assistant 2026.4, and it's used by
136 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Sensor
Back to top
