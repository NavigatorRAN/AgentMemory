---
source_url: "https://www.home-assistant.io/integrations/awair"
final_url: "https://www.home-assistant.io/integrations/awair"
canonical_url: "https://www.home-assistant.io/integrations/awair/"
source_handle: "web:www-home-assistant-io:e41d47d080d0"
source_section: "integrations-awair"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6a8728eeda7112d188b8fded01f571aa92fb92994952fc1b18d2e411880ef45d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Awair - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/awair
- Final URL: https://www.home-assistant.io/integrations/awair
- Canonical URL: https://www.home-assistant.io/integrations/awair/
- Fetched at: 2026-06-28T02:30:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Awair devices in Home Assistant.

## Extracted Text

On this page
Prerequisites
Connect locally (preferred)
Connect via the cloud
Configuration
Available sensors
Removing the integration
To remove an integration instance from Home Assistant
The Awair integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will fetch data from your Awair devices .
When connecting locally, the integration will poll the device every 30 seconds. Awair provides a list of devices that support the Local API. This API must be enabled via the Awair app via these steps . If you add new Awair devices to your home, you must follow these steps again.
When connecting via the cloud, data is summarized over 5-minute intervals. All devices are supported. You will need to request access to the Awair API and obtain an access token from the Awair Developer Console . It is free, but getting a token can take up to 24 hours.
This integration refreshes once every 5 minutes, based on the default per-device quota of 300 API calls per day.
To add the Awair integration to your Home Assistant instance, use this My button:
Awair can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Awair .
Follow the instructions on screen to complete the setup.
The integration will fetch data from each device. The following sensors are supported:
Temperature
Humidity
Absolute humidity
Dew point
Carbon dioxide
Total volatile organic compounds
PM2.5 density
PM10 density
Sound level
Luminescence
Not all devices support all sensors; consult Awair’s documentation to find out what sensors are present on your device. For first-generation Awair devices with a “dust” sensor, the integration will create identical PM2.5 and PM10 sensors (which reflects the capabilities of the sensor - it can detect dust between PM2.5 and PM10 but cannot differentiate between them).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Awair integration was introduced in Home Assistant 0.84, and it's used by
1511 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ahayworth
@ricohageman
Categories
Health
Back to top
