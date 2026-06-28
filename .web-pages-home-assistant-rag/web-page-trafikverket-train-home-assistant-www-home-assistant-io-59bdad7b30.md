---
source_url: "https://www.home-assistant.io/integrations/trafikverket_train"
final_url: "https://www.home-assistant.io/integrations/trafikverket_train"
canonical_url: "https://www.home-assistant.io/integrations/trafikverket_train/"
source_handle: "web:www-home-assistant-io:59bdad7b3071"
source_section: "integrations-trafikverket-train"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6364e6f7d3a565385babf6a799d87693ca035a10192d37ff88508f97dffd51b4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Trafikverket Train - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trafikverket_train
- Final URL: https://www.home-assistant.io/integrations/trafikverket_train
- Canonical URL: https://www.home-assistant.io/integrations/trafikverket_train/
- Fetched at: 2026-06-28T03:23:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Trafikverket Train within Home Assistant.

## Extracted Text

On this page
Use cases
Retrieved data
Prerequisites
Configuration
Train station names
Retrieve train departure information from Trafikverket .
Retrieve the next departure between two stations.
Retrieve information for specific departure time between two stations.
Set up an alert or perform actions if your train is delayed or canceled.
Next departure for the specific train line.
Canceled status.
Delayed time.
Planned time if no delays occur.
Estimated time of arrival if delays occur.
Actual time - when it did arrive.
Other information / additional texts.
Deviations.
The next departure is calculated from actual, estimated, and planned to provide the most accurate information about departure.
If a specific departure time has not been set, the integration will return the 3 next departures.
You can filter based on product descriptions such as SJ Regionaltåg to only see specific trains between the two stations.
Please click here and register to obtain the API key.
To add the Trafikverket Train service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Trafikverket Train .
Follow the instructions on screen to complete the setup.
Click here to see examples of train station names.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trafikverket Train service was introduced in Home Assistant 0.96, and it's used by
103 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Sensor
Transport
Back to top
