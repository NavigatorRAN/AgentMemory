---
source_url: "https://www.home-assistant.io/integrations/qrcode"
final_url: "https://www.home-assistant.io/integrations/qrcode"
canonical_url: "https://www.home-assistant.io/integrations/qrcode/"
source_handle: "web:www-home-assistant-io:d76ccdb7bf05"
source_section: "integrations-qrcode"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d07f9789361797e4a744aecafd17320576eb602822263e32e550b05eb18a8bf2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# QR Code - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qrcode
- Final URL: https://www.home-assistant.io/integrations/qrcode
- Canonical URL: https://www.home-assistant.io/integrations/qrcode/
- Fetched at: 2026-06-28T03:10:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate QR Code Recognition into Home Assistant.

## Extracted Text

On this page
Configuration
Basic example
Related topics
The QR Code integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables QR code recognition from cameras.
To get this running, please install zbar-tools (Ubuntu 18.04)
To enable this, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry image_processing : - platform : qrcode source : - entity_id : camera.door
Configuration Variables
Looking for your configuration file?
source list Required
List of image sources.
entity_id string Required
A camera entity id to get picture from.
name string ( Optional )
This parameter allows you to override the name of your image_processing entity.
An automation using this integration could look like this:
automation : - alias : " Catch QR code and arm the alarm system" triggers : - trigger : state entity_id : image_processing.qr_front_door to : ARM_QR_CODE_VALUE actions : - action : alarm_control_panel.alarm_arm_away target : entity_id : alarm_control_panel.home_alarm data : code : MY_ALARM_CODE
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The QR Code integration was introduced in Home Assistant 0.87, and it's used by
54 active installations.
Its IoT class is Calculated.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Image processing
Back to top
