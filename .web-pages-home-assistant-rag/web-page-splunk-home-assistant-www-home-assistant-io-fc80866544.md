---
source_url: "https://www.home-assistant.io/integrations/splunk"
final_url: "https://www.home-assistant.io/integrations/splunk"
canonical_url: "https://www.home-assistant.io/integrations/splunk/"
source_handle: "web:www-home-assistant-io:fc8086654437"
source_section: "integrations-splunk"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "dc81fbeeb1d81089227f86c8ba00bad2136e9dbeb2d7e55527d8bdf1218e8300"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Splunk - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/splunk
- Final URL: https://www.home-assistant.io/integrations/splunk
- Canonical URL: https://www.home-assistant.io/integrations/splunk/
- Fetched at: 2026-06-28T03:18:31Z
- Content type: text/html; charset=UTF-8

## Description

Record events in Splunk.

## Extracted Text

On this page
Prerequisites
Configuration
Filters
Configuring a filter
Removing the integration
Related topics
Splunk is a data platform for searching, monitoring, and analyzing machine-generated data. The Splunk integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sends all Home Assistant state changes to a Splunk instance using the HTTP Event Collector (HEC) feature.
A Splunk instance (version 6.3 or later) that is network-accessible from Home Assistant.
The HTTP Event Collector (HEC) must be enabled and a token created. To set this up in Splunk:
Go to Settings > Data inputs .
Select HTTP Event Collector .
Select Global Settings and ensure HEC is Enabled .
Select New Token and follow the prompts to create a token for Home Assistant.
Copy the generated token value for use in the configuration below.
To add the Splunk service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Splunk .
Follow the instructions on screen to complete the setup.
Token
The HTTP Event Collector (HEC) token configured in your Splunk instance.
Host
The hostname or IP address of your Splunk instance.
Port
The port of the HTTP Event Collector on your Splunk instance.
Uses an SSL certificate
Whether to use HTTPS to connect to your Splunk instance.
Verify SSL certificate
Whether to verify the SSL certificate of your Splunk instance.
Name
A friendly name to send to Splunk as the host, instead of the name of the HTTP Event Collector.
Optionally, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file for filtering which entities are sent to Splunk:
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry with entity filter splunk : filter : include_domains : - sensor - binary_sensor
Configuration Variables
Looking for your configuration file?
filter map ( Optional )
Filters for entities to be included/excluded from Splunk. Default is to include all entities. ( Configuring a filter )
include_domains list ( Optional )
Domains to be included.
include_entity_globs list ( Optional )
Include all entities matching a listed pattern (e.g., sensor.weather_* ).
include_entities list ( Optional )
Entities to be included.
exclude_domains list ( Optional )
Domains to be excluded.
exclude_entity_globs list ( Optional )
Exclude all entities matching a listed pattern (e.g., sensor.weather_* ).
exclude_entities list ( Optional )
Entities to be excluded.
By default, no entity will be excluded. To limit which entities are exposed to Splunk, you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities splunk : filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
Filters are applied as follows:
No filter
All entities included
Only includes
Entity listed in entities include: include
Otherwise, entity matches domain include: include
Otherwise, entity matches glob include: include
Otherwise: exclude
Only excludes
Entity listed in exclude: exclude
Otherwise, entity matches domain exclude: exclude
Otherwise, entity matches glob exclude: exclude
Otherwise: include
Domain and/or glob includes (may also have excludes)
Otherwise, entity listed in entities exclude: exclude
Domain and/or glob excludes (no domain and/or glob includes)
Otherwise, entity listed in exclude: exclude
No Domain and/or glob includes or excludes
The following characters can be used in entity globs:
* - The asterisk represents zero, one, or multiple characters
? - The question mark represents zero or one character
To remove the Splunk integration:
Remove the splunk: section from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
Restart Home Assistant.
Data already sent to your Splunk instance will remain there and can still be queried.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Splunk service was introduced in Home Assistant 0.13, and it's used by
56 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Bre77
Categories
History
Back to top
