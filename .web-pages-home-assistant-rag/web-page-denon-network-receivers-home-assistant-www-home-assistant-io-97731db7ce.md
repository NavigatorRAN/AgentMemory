---
source_url: "https://www.home-assistant.io/integrations/denon"
final_url: "https://www.home-assistant.io/integrations/denon"
canonical_url: "https://www.home-assistant.io/integrations/denon/"
source_handle: "web:www-home-assistant-io:97731db7ce2b"
source_section: "integrations-denon"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "441238ea366616854ffdd84df9e4c86cc9aeccbab8489a2a4172e590fbaded21"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Denon Network Receivers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/denon
- Final URL: https://www.home-assistant.io/integrations/denon
- Canonical URL: https://www.home-assistant.io/integrations/denon/
- Fetched at: 2026-06-28T02:36:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Denon Network Receivers into Home Assistant.

## Extracted Text

On this page
Telnet platform
Related topics
The Denon Network Receivers integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Denon Network Receiver from Home Assistant. It might be that your device is supported by the Denon AVR platform.
Supported devices:
Denon DRA-N5
Denon RCD-N8 (untested)
Denon RCD-N9 (partial support)
Denon AVR receivers with integrated Network support (partial support)
To add a Denon Network Receiver to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : denon host : IP_ADDRESS
Configuration Variables
Looking for your configuration file?
host string Required
IP address of the device. Example: 192.168.1.32
name string ( Optional )
The name of the device
A few notes for platform: denon
The receiver handles only one telnet connection and refuses others.
Be careful with the volume. 100% or even 50% is very loud.
To be able to wake up the receiver, activate the “remote” setting in the receiver’s settings.
Play and pause are supported, toggling is not possible.
Seeking cannot be implemented as the UI sends absolute positions. Only seeking via simulated button presses is possible.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Denon Network Receivers integration was introduced in Home Assistant 0.7.2, and it's used by
120 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
