---
source_url: "https://www.home-assistant.io/integrations/airnow"
final_url: "https://www.home-assistant.io/integrations/airnow"
canonical_url: "https://www.home-assistant.io/integrations/airnow/"
source_handle: "web:www-home-assistant-io:7d56f8510a13"
source_section: "integrations-airnow"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b425ce4dc34c77246b0d8a31203eb3ee598c17bd510085e1a3a41ed45bf33f54"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AirNow - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airnow
- Final URL: https://www.home-assistant.io/integrations/airnow
- Canonical URL: https://www.home-assistant.io/integrations/airnow/
- Fetched at: 2026-06-28T02:26:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AirNow within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Troubleshooting
The AirNow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the AirNow web service
as a source for air quality data for your location.
To generate an AirNow API key, go to the AirNow Developer Tools page.
To add the AirNow service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AirNow .
Follow the instructions on screen to complete the setup.
The EPA AirNow API is often flaky and will occasionally not return any results for a particular location. This will prevent the integration from being added to Home Assistant, but the situation is usually temporary and will resolve itself later.
If the integration continues to report “No results found for that location” and cannot be added to Home Assistant, please do the following before submitting a bug report.
First, navigate to the AirNow Current Observations By Lat/Lon page, enter the same latitude/longitude and station radius, select application/json as the output format, select “Build” and then “Run”.
If the query returns a result other than [] , open a bug report and include the query result (you may sanitize the data to remove your latitude and longitude, but please do not remove any fields). This information will help a lot to figure out the source of the issue.
Note
The AirNow API allows 500 data updates per hour, but since observations are only updated hourly, the default update rate is set to 2 per hour and should not trigger rate limiting. If you use this API key for other purposes, ensure the total request rate does not exceed 500 per hour.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AirNow service was introduced in Home Assistant 2021.2, and it's used by
1115 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@asymworks
Categories
Health
Back to top
