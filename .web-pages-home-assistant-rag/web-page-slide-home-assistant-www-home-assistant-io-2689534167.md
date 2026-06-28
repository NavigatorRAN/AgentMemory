---
source_url: "https://www.home-assistant.io/integrations/slide"
final_url: "https://www.home-assistant.io/integrations/slide"
canonical_url: "https://www.home-assistant.io/integrations/slide/"
source_handle: "web:www-home-assistant-io:2689534167b2"
source_section: "integrations-slide"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c8d9f801fe63dcadc7345f592b7b27a80536a34c670513ae435f345741a78fb2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Slide - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/slide
- Final URL: https://www.home-assistant.io/integrations/slide
- Canonical URL: https://www.home-assistant.io/integrations/slide/
- Fetched at: 2026-06-28T03:16:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Innovation in Motion Slide covers with Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The Slide integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your slide.store devices in Home Assistant using the official API .
To use the Slide integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry slide : username : YOUR_SLIDE_APP_USERNAME password : YOUR_SLIDE_APP_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
Username needed to log in to Slide App.
password string Required
Password needed to log in to Slide App.
scan_interval integer ( Optional , default: 30 seconds )
Minimum time interval between updates.
invert_position boolean ( Optional , default: false )
Invert position percentage.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Slide integration was introduced in Home Assistant 0.99, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ualex73
Categories
Cover
Hub
Back to top
