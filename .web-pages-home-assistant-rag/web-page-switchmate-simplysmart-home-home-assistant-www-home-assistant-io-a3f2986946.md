---
source_url: "https://www.home-assistant.io/integrations/switchmate"
final_url: "https://www.home-assistant.io/integrations/switchmate"
canonical_url: "https://www.home-assistant.io/integrations/switchmate/"
source_handle: "web:www-home-assistant-io:a3f2986946fa"
source_section: "integrations-switchmate"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b56cc38b16b1e3904c34c2b32f87e5db23bc22cbf8a7927e6a0d71d7d5ae01cd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Switchmate SimplySmart Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/switchmate
- Final URL: https://www.home-assistant.io/integrations/switchmate
- Canonical URL: https://www.home-assistant.io/integrations/switchmate/
- Fetched at: 2026-06-28T03:20:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Switchmate switches.

## Extracted Text

On this page
Configuration
The Switchmate SimplySmart Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Switchmate devices .
To enable it, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
switch : - platform : switchmate mac : " cb:25:0b......"
Configuration Variables
Looking for your configuration file?
mac string Required
Device MAC address.
name string ( Optional )
The name used to display the switch in the frontend.
flip_on_off boolean ( Optional , default: false )
Option to flip the on/off state.
The integration is tested with SwitchMate Lighting Control Rocker and SwitchMate Lighting Control Toggle.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Switchmate SimplySmart Home integration was introduced in Home Assistant 0.78, and it's used by
35 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
@qiz-li
Categories
Switch
Back to top
