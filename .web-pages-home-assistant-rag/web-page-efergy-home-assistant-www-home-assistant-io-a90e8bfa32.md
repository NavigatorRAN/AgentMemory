---
source_url: "https://www.home-assistant.io/integrations/efergy"
final_url: "https://www.home-assistant.io/integrations/efergy"
canonical_url: "https://www.home-assistant.io/integrations/efergy/"
source_handle: "web:www-home-assistant-io:a90e8bfa32ac"
source_section: "integrations-efergy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a3f81331a4b555adc8cef8ce4874e03afaed3852e844547179cede9cbc8bbea1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Efergy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/efergy
- Final URL: https://www.home-assistant.io/integrations/efergy
- Canonical URL: https://www.home-assistant.io/integrations/efergy/
- Fetched at: 2026-06-28T02:39:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Efergy devices within Home Assistant.

## Extracted Text

On this page
Configuration
Setup
Integration entities
Integrate your Efergy meter information into Home Assistant.
To add the Efergy hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Efergy .
Follow the instructions on screen to complete the setup.
To get an app token:
Log in to your Efergy account
Go to the Settings page
Click on App tokens
Click “Add token”
The following sensors will be created:
Power Usage : Shows the aggregate instant value of power consumption. An entity will also be created for each sensor attached to the household. If only one sensor is detected, it will be disabled by default.
Daily Consumption : Shows the current day’s energy consumption. (disabled by default)
Weekly Consumption : Shows the current week’s energy consumption. (disabled by default)
Monthly Consumption : Shows the current month’s energy consumption.
Yearly Consumption : Shows the current year’s energy consumption. (disabled by default)
Energy Budget : Shows the current status of the budget set for the month.
Daily Cost : Shows the current day’s cost of consumption. (disabled by default)
Weekly Cost : Shows the current week’s cost of consumption. (disabled by default)
Monthly Cost : Shows the current month’s cost of consumption.
Yearly Cost : Shows the current year’s cost of consumption. (disabled by default)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Efergy hub was introduced in Home Assistant pre 0.7, and it's used by
81 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Energy
Back to top
