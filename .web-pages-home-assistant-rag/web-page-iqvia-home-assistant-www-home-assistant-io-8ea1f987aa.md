---
source_url: "https://www.home-assistant.io/integrations/iqvia"
final_url: "https://www.home-assistant.io/integrations/iqvia"
canonical_url: "https://www.home-assistant.io/integrations/iqvia/"
source_handle: "web:www-home-assistant-io:8ea1f987aad5"
source_section: "integrations-iqvia"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dc6cf0a06fa7d266953c8c52b651f9b2d937087372ab1d69ea71091a4a111844"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IQVIA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iqvia
- Final URL: https://www.home-assistant.io/integrations/iqvia
- Canonical URL: https://www.home-assistant.io/integrations/iqvia/
- Fetched at: 2026-06-28T02:53:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use IQVIA data within Home Assistant

## Extracted Text

On this page
Configuration
Understanding the Indices
Understanding Asthma Allergens
The IQVIA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] collects and displays allergy, asthma and disease
information (based on a U.S. ZIP code) from IQVIA .
Data measured includes:
Indices for allergies, asthma and cold/flu indices
Trends
Current outlook
more!
To add the IQVIA service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IQVIA .
Follow the instructions on screen to complete the setup.
Any index-related sensor will have a value between 0.0 and 12.0. The values
map to the following human-friendly ratings:
Range Rating 0.0 - 2.4 Low 2.5 - 4.8 Low/Medium 4.9 - 7.2 Medium 7.3 - 9.6 Medium/High 9.7 - 12.0 High
Several asthma-related sensors carry information regarding the top three
“asthma allergens” (that is, irritants that may exacerbate asthma symptoms).
Example values include:
Pollutant Symbol More Info Particulate (<= 2.5 μm) PM2.5 EPA: Particulate Matter (PM) Pollution Particulate (<= 10 μm) PM10 EPA: Particulate Matter (PM) Pollution Ozone O EPA: Ozone Pollution Sulfur Dioxide SO2 EPA: Sulfur Dioxide (SO2) Pollution Carbon Monoxide CO EPA: Carbon Monoxide (CO) Pollution in Outdoor Air
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IQVIA service was introduced in Home Assistant 0.63, and it's used by
835 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Health
Back to top
