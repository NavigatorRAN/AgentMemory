---
source_url: "https://www.home-assistant.io/integrations/blinksticklight"
final_url: "https://www.home-assistant.io/integrations/blinksticklight"
canonical_url: "https://www.home-assistant.io/integrations/blinksticklight/"
source_handle: "web:www-home-assistant-io:01a1eb07db7e"
source_section: "integrations-blinksticklight"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4a2f8d5463d0f5586030b6b6cbda0263572239934c1b9ccf90776cb93433e64d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# BlinkStick - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/blinksticklight
- Final URL: https://www.home-assistant.io/integrations/blinksticklight
- Canonical URL: https://www.home-assistant.io/integrations/blinksticklight/
- Fetched at: 2026-06-28T02:31:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Blinkstick lights within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The BlinkStick integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your Blinkstick lights from within Home Assistant.
To use your Blinkstick, you need to allow the access to the device for non-root users .
sudo blinkstick --add-udev-rule
To add a Blinkstick to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry light : - platform : blinksticklight serial : BS000795-1.1
Configuration Variables
Looking for your configuration file?
serial string Required , default: 640
The serial number of your stick.
name string ( Optional , default: Blinkstick )
Name of the stick.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The BlinkStick integration was introduced in Home Assistant 0.7.5, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
DIY
Back to top
