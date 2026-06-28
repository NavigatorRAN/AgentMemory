---
source_url: "https://www.home-assistant.io/integrations/monarch_money"
final_url: "https://www.home-assistant.io/integrations/monarch_money"
canonical_url: "https://www.home-assistant.io/integrations/monarch_money/"
source_handle: "web:www-home-assistant-io:8fe7b5695ec1"
source_section: "integrations-monarch-money"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "58a649c6b39df694269412ce24675faa6587a7e3b02d03cc573a5471c3e20fbc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Monarch Money - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/monarch_money
- Final URL: https://www.home-assistant.io/integrations/monarch_money
- Canonical URL: https://www.home-assistant.io/integrations/monarch_money/
- Fetched at: 2026-06-28T03:00:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on the Monarch Money Integration for personal finance.

## Extracted Text

On this page
Prerequisites
Configuration
Accounts & devices
Monarch Money is a personal finance aggregation and budgeting service that integrates with Plaid, MX, and FinCity, the three major financial backends.
You need a Monarch Money account to use this integration.
You need account credentials. This integration supports both username and password login, as well as accounts configured with MFA .
To add the Monarch Money service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Monarch Money .
Follow the instructions on screen to complete the setup.
Each account is set up as a device in Home Assistant and contain the following sensors:
Sensor Description Balance Account balance Age This sensor shows when the data was retrieved by Monarch’s back end
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Monarch Money service was introduced in Home Assistant 2024.10, and it's used by
69 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jeeftor
Categories
Finance
Sensor
Back to top
