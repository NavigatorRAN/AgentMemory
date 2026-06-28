---
source_url: "https://www.home-assistant.io/integrations/emulated_kasa"
final_url: "https://www.home-assistant.io/integrations/emulated_kasa"
canonical_url: "https://www.home-assistant.io/integrations/emulated_kasa/"
source_handle: "web:www-home-assistant-io:c9c75329f24d"
source_section: "integrations-emulated-kasa"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b3d910c5ab32e6701abfe5fd8abb24f4c1b7e18424b06b06d5fb7087ce8324bd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Emulated Kasa - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/emulated_kasa
- Final URL: https://www.home-assistant.io/integrations/emulated_kasa
- Canonical URL: https://www.home-assistant.io/integrations/emulated_kasa/
- Fetched at: 2026-06-28T02:40:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Emulated Kasa within Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Emulated Kasa integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] emulates a TP-Link Kasa smart plug and announces the power usage of configured devices to any that might request it on the local network.
For example, the Sense Energy Monitor can use this to identify power usage.
The configuration includes a list of entities to expose with attributes for the published name and current power usage.
If the entity is a sensor, that value will be reported as the current power usage unless the power field is defined.
The power field can contain a hardcoded value, a sensor, or a template (see configuration example).
Note
The provided power unit must be the current power usage in Watts. Values of kW can be converted, but the values of kWh cannot be used.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] requires the entities exposed to be listed in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry emulated_kasa : entities : light.dining_room : power : 40.2
Configuration Variables
Looking for your configuration file?
entities map Required
A list of entities exposed.
name string ( Optional )
Name visible to external devices.
power integer | float | template ( Optional )
The current power usage in watts. This can be set to a static value or a template.
power_entity string ( Optional )
A sensor measuring the current power usage in watts.
A full configuration sample looks like the one below.
# Example configuration.yaml entry emulated_kasa : entities : # uses the sensor state value sensor.power_meter : name : " Power Meter" # uses static value light.dining_room : name : " Dining Room Lights" power : 40.2 # uses template based on state of device fan.ceiling_fan : power : >- {% if is_state_attr('fan.ceiling_fan','speed', 'low') %} 2 {% elif is_state_attr('fan.ceiling_fan','speed', 'medium') %} 12 {% elif is_state_attr('fan.ceiling_fan','speed', 'high') %} 48 {% endif %} # uses value from 3rd party sensor light.wled : name : " Strip Lights" power_entity : sensor.light_power_w # uses template to convert device state into watts sensor.ups_kw : name : UPS Power power : " {{ float(states('sensor.ups_kw')) * 1000 }}"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Emulated Kasa integration was introduced in Home Assistant 0.115, and it's used by
183 active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@kbickar
Categories
Energy
Back to top
