---
source_url: "https://www.home-assistant.io/integrations/firefly_iii"
final_url: "https://www.home-assistant.io/integrations/firefly_iii"
canonical_url: "https://www.home-assistant.io/integrations/firefly_iii/"
source_handle: "web:www-home-assistant-io:a77ba2cb7264"
source_section: "integrations-firefly-iii"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "51b0efbab7371dfa94e4c444aec49851969ee6f5eb238c5f05cd60e25875978f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Firefly III - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/firefly_iii
- Final URL: https://www.home-assistant.io/integrations/firefly_iii
- Canonical URL: https://www.home-assistant.io/integrations/firefly_iii/
- Fetched at: 2026-06-28T02:42:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Firefly III with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Removing the integration
To remove an integration instance from Home Assistant
The Firefly III integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used as an interface to the Firefly III API .
Firefly III is a free open-source personal finance manager. It contains a full transaction management system, budgets, categories and reports. You can easily import transactions via the diverse options Firefly III offers. It even contains a rule engine to automate and help organize your bookkeeping.
Before you can configure Firefly III within Home Assistant, you need a few things:
Have Firefly III installed and a user with administrator rights
An access token.
Create a Firefly III Personal Access Token by following these steps:
Log in to your Firefly III instance.
To create an access token, follow the steps in the Firefly III documentation .
Copy the generated Access Token and store it somewhere safe, you will need it in the next steps.
To add the Firefly III service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Firefly III .
Follow the instructions on screen to complete the setup.
There is currently support for the following device types within Home Assistant:
Sensors - for monitoring the accounts, categories and their balances.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After removing the integration, consider deleting the Firefly III access token.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Firefly III service was introduced in Home Assistant 2025.11, and it's used by
91 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@erwindouna
Categories
Finance
Sensor
Back to top
