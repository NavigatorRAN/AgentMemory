---
source_url: "https://www.home-assistant.io/integrations/justnimbus"
final_url: "https://www.home-assistant.io/integrations/justnimbus"
canonical_url: "https://www.home-assistant.io/integrations/justnimbus/"
source_handle: "web:www-home-assistant-io:011e86b5e645"
source_section: "integrations-justnimbus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "06808340e837fb678e411c5f465a61a0390208ff7db8c63662b6aa2f3bec70ea"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# JustNimbus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/justnimbus
- Final URL: https://www.home-assistant.io/integrations/justnimbus
- Canonical URL: https://www.home-assistant.io/integrations/justnimbus/
- Fetched at: 2026-06-28T02:53:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the JustNimbus integration within Home Assistant

## Extracted Text

On this page
Prerequisites
Configuration
Sensor types
The JustNimbus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] queries the JustNimbus API used by the JustNimbus web dashboard.
This integration allows you to collect and save data to get a historical overview of your water bag
usage.
To configure and use this integration, you need to have a
JustNimbus water bag (Dutch), and
you need to be subscribed for the web dashboard functionality. For this configuration, you need the
client ID and ZIP code from the URL. For example: https://dashboard.justnimbus.com/user/view.php?system=<client_id>&zip=<zip_code> . For more help see JustNimbus’ help page .
To add the JustNimbus device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select JustNimbus .
Follow the instructions on screen to complete the setup.
When configured, the integration will create seven sensors for each configured client ID:
Pump pressure, in bar
Pump type, text
Reservoir temperature, in °C
Reservoir content, in L (Liters)
Reservoir capacity, in L (Liters)
Water saved, in L (Liters)
Water used, in L (Liters)
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The JustNimbus device was introduced in Home Assistant 2022.9, and it's used by
6 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kvanzuijlen
Categories
Environment
Back to top
