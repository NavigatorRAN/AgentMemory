---
source_url: "https://www.home-assistant.io/docs/energy/solar-panels"
final_url: "https://www.home-assistant.io/docs/energy/solar-panels"
canonical_url: "https://www.home-assistant.io/docs/energy/solar-panels/"
source_handle: "web:www-home-assistant-io:e7808dfd302b"
source_section: "docs-energy"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a7875b172f5d6a4c8d9294f80c59a9d5be962a22f3986773c77bc5d9d7215ab4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Integrating your solar panels - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/energy/solar-panels
- Final URL: https://www.home-assistant.io/docs/energy/solar-panels
- Canonical URL: https://www.home-assistant.io/docs/energy/solar-panels/
- Fetched at: 2026-06-28T02:22:04Z
- Content type: text/html; charset=UTF-8

## Description

Learn how to add information about your solar panels to Home Assistant home energy management.

## Extracted Text

On this page
Hardware
Using a CT clamp sensor
Connecting to your inverter
Gain insight into your energy production by integrating your solar panels into Home Assistant.
If you also set up the Solar Forecast integration , you will be able to see expected solar production and automate based on planned production.
Home Assistant will need to know the amount of energy that is being produced. This can be done in various ways.
Current transformer (CT) clamp sensors measure your energy usage by looking at the current passing through an electrical wire. This makes it possible to calculate the energy usage. In Home Assistant we have support for off-the-shelf CT clamp sensors or you can build your own.
The off-the-shelf solution that we advise is the Shelly EM . The device has a local API, updates are pushed to Home Assistant and it has a high quality integration .
You can build your own using ESPHome’s CT Clamp Current sensor or energy meter sensors like the ATM90E32 . For the DIY route, check out this video by digiblur to get started.
Using a Raspberry Pi, you can use a CT clamp HAT from LeChacal called RPICT hats . They can be stacked to expand the number of lines to monitor. They also provide Active, Apparent, and Reactive power and power factor for single-phase and three-phase installations. They integrate with Home Assistant using MQTT.
Attention! Installing CT clamp sensor devices requires opening your electrical cabinet. This work should be done by someone familiar with electrical wiring and may require a licensed professional in some regions. Your qualified installer will know how to do this.
Disclaimer: Some links in this section are affiliate links.
Some solar inverters have APIs that can be read by Home Assistant.
Energy integrations
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
