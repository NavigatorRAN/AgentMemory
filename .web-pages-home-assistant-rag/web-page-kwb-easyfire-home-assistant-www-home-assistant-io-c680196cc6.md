---
source_url: "https://www.home-assistant.io/integrations/kwb"
final_url: "https://www.home-assistant.io/integrations/kwb"
canonical_url: "https://www.home-assistant.io/integrations/kwb/"
source_handle: "web:www-home-assistant-io:c680196cc612"
source_section: "integrations-kwb"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0aa1ad2bed9a7d08d19275957b59488a2a51bf1ec39b5abdd06dca73e7bd0d39"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# KWB Easyfire - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kwb
- Final URL: https://www.home-assistant.io/integrations/kwb
- Canonical URL: https://www.home-assistant.io/integrations/kwb/
- Fetched at: 2026-06-28T02:55:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the KWB Easyfire sensor into Home Assistant.

## Extracted Text

On this page
Related topics
The KWB Easyfire integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates the sensors of KWB Easyfire pellet central heating units with the Comfort3 controller ( https://www.kwb.net/produkte/ ) into Home Assistant.
Direct connection via serial (RS485) or via telnet terminal server is supported. The serial cable has to be attached to the control unit port 25 (which is normally used for detached control terminals).
Since this serial protocol is proprietary and closed, only most temperature sensors and a few control relays are supported, the rest is still WIP (see this mikrocontroller.net forum thread ).
To enable the KWB Easyfire integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Direct connection via serial port:
# Example configuration.yaml entry - platform : kwb name : kwb device : " /dev/ttyUSB0" type : serial raw : false
Telnet terminal server with a serial-ethernet converter:
# Example configuration.yaml entry - platform : kwb name : kwb host : <ip> port : 23 type : tcp raw : false
Take a good look at which configuration variables are for TCP use or for serial use.
Configuration Variables
Looking for your configuration file?
raw boolean ( Optional , default: false )
Should the raw serial output be shown as a sensor.
name string ( Optional , default: KWB )
The name of the device used in the frontend.
device string Required
(For serial use) The serial device of the machine.
host string Required
(For tcp use) The IP-address of the serial server.
port integer Required
(For tcp use) The TCP-port of the serial server.
type string Required
Type of sensor, you can choose between: serial and tcp .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The KWB Easyfire integration was introduced in Home Assistant 0.40, and it's used by
1 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
