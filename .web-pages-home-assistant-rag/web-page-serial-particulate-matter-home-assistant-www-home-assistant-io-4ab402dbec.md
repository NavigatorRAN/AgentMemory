---
source_url: "https://www.home-assistant.io/integrations/serial_pm"
final_url: "https://www.home-assistant.io/integrations/serial_pm"
canonical_url: "https://www.home-assistant.io/integrations/serial_pm/"
source_handle: "web:www-home-assistant-io:4ab402dbecb4"
source_section: "integrations-serial-pm"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a23ed56410d32543fe0e098eb60ba43ac73349a016b82e4017fb24f267beaa86"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Serial Particulate Matter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/serial_pm
- Final URL: https://www.home-assistant.io/integrations/serial_pm
- Canonical URL: https://www.home-assistant.io/integrations/serial_pm/
- Fetched at: 2026-06-28T03:15:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate particulate matter (dust) sensors with Home Assistant.

## Extracted Text

On this page
Supported Sensors
Configuration
Named Sensor Configuration Example
Particulate matter sensors measure the amount of very small particles in the air.
Cheap LED based sensors usually use a GPIO interface that is hard to attach to computers. However, there are a lot of laser LED based sensors on the market that use a serial interface and can be connected to your Home Assistant system easily with a USB to serial converter.
At this time, the following sensors are supported:
oneair,s3
novafitness,sds021
novafitness,sds011
plantower,pms1003
plantower,pms5003
plantower,pms7003
plantower,pms2003
plantower,pms3003
To use your PM sensor in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
sensor : - platform : serial_pm serial_device : /dev/tty.SLAB_USBtoUART brand : oneair,s3
Configuration Variables
Looking for your configuration file?
serial_device string Required
The serial port to use. On *nix systems, it can often be identified by $ ls /dev/tty*
name string ( Optional )
The name displayed in the frontend.
brand string Required
Manufacturer and type of the sensor. (Use a value from the supported sensors list.).
sensor : - platform : serial_pm serial_device : /dev/tty.SLAB_USBtoUART name : Nova brand : novafitness,sds011
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Serial Particulate Matter integration was introduced in Home Assistant 0.26, and it's used by
14 active installations.
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
