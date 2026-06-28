---
source_url: "https://www.home-assistant.io/integrations/faa_delays"
final_url: "https://www.home-assistant.io/integrations/faa_delays"
canonical_url: "https://www.home-assistant.io/integrations/faa_delays/"
source_handle: "web:www-home-assistant-io:e00030e59a03"
source_section: "integrations-faa-delays"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "28e5e75795e97fdd6f88d35b2fd302a677ce1444d5e2138eba85da9f3a98a181"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FAA Delays - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/faa_delays
- Final URL: https://www.home-assistant.io/integrations/faa_delays
- Canonical URL: https://www.home-assistant.io/integrations/faa_delays/
- Fetched at: 2026-06-28T02:41:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use FAA Delays data within Home Assistant

## Extracted Text

On this page
Configuration
Supported airports
Additional delay information
The FAA Delays integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] collects and displays information about delays at US Airports based on the
FAA’s National Airspace System Status .
Data measured includes:
Ground Delays
Ground Stops
Arrival/Departure Delays
Closures
To add the FAA Delays service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FAA Delays .
Follow the instructions on screen to complete the setup.
The airport entered must be a valid IATA
airport code for an airport in the US. You can find this by looking up the
FAA Identifier at Airnav .
Each airport added will expose 5 binary sensors, one for each type of delay. Within each sensor there is additional
information listed as attributes, which depends on the type of delay it is. Each delay type has the attributes
listed below:
Ground Delay
Average Delay Time
Delay reason
Ground Stop
Expected End Time for stop
Arrival/Departure Delay
Minimum delay time
Maximum delay time
Delay trend (increasing/decreasing)
Closure
Start of closure (begin)
End of closure (end)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FAA Delays service was introduced in Home Assistant 2021.3, and it's used by
364 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ntilley905
Categories
Transport
Back to top
