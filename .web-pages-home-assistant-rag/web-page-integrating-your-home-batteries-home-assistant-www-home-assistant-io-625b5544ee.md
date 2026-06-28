---
source_url: "https://www.home-assistant.io/docs/energy/battery"
final_url: "https://www.home-assistant.io/docs/energy/battery"
canonical_url: "https://www.home-assistant.io/docs/energy/battery/"
source_handle: "web:www-home-assistant-io:625b5544ee5e"
source_section: "docs-energy"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "768e606b94c5d9c5f472e8710b6dd184c899916d75d7994ee783d522a192cda4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Integrating your home batteries - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/energy/battery
- Final URL: https://www.home-assistant.io/docs/energy/battery
- Canonical URL: https://www.home-assistant.io/docs/energy/battery/
- Fetched at: 2026-06-28T02:21:53Z
- Content type: text/html; charset=UTF-8

## Description

Learn how to add information about your home batteries to Home Assistant home energy management.

## Extracted Text

On this page
Hardware
Provided by the battery
Using a CT clamp sensor
A home battery allows homes to store energy when you are either producing more solar power than you’re using, or store energy from the grid if the current price is low.
Home Assistant allows you to track how much energy flows from/to your battery.
Home Assistant will need to know the amount of energy flowing from/to your batteries. This data can be tracked in various ways.
Some battery vendors have an API to integrate the data into your Home Assistant instance. An example is Tesla Powerwall .
Current transformer (CT) clamp sensors measure your energy usage by looking at the current passing through an electrical wire. This makes it possible to calculate the energy usage. In Home Assistant we have support for off-the-shelf CT clamp sensors or you can build your own.
The off-the-shelf solution that we advise is the Shelly EM . The device has a local API, updates are pushed to Home Assistant and it has a high quality integration .
You can build your own using ESPHome’s CT Clamp Current sensor or energy meter sensors like the ATM90E32 . For the DIY route, check out this video by digiblur to get started.
Using a Raspberry Pi, you can use a CT clamp HAT from LeChacal called RPICT hats . They can be stacked to expand the number of lines to monitor. They also provide Active, Apparent, and Reactive power and power factor for single-phase and three-phase installations. They integrate with Home Assistant using MQTT.
Attention! Installing CT clamp sensor devices requires opening your electrical cabinet. This work should be done by someone familiar with electrical wiring and may require a licensed professional in some regions. Your qualified installer will know how to do this.
Disclaimer: Some links in this section are affiliate links.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Electricity grid
Solar panels
Home batteries
Gas usage
Water usage
Individual devices
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
