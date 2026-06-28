---
source_url: "https://www.home-assistant.io/integrations/nad"
final_url: "https://www.home-assistant.io/integrations/nad"
canonical_url: "https://www.home-assistant.io/integrations/nad/"
source_handle: "web:www-home-assistant-io:31205270da84"
source_section: "integrations-nad"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2096021e0e07b1336df313059812b6b0da8ca174dfecb2df93f0bf7105cb1990"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NAD - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nad
- Final URL: https://www.home-assistant.io/integrations/nad
- Canonical URL: https://www.home-assistant.io/integrations/nad/
- Fetched at: 2026-06-28T03:02:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NAD receivers into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The NAD integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an NAD receiver through RS232, TCP and Telnet from Home Assistant.
The RS232 interface is only tested with the NAD T748v2, but it should work with other NAD receivers.
The Telnet interface has been tested with the NAD T787 and the NAD C658.
To add an NAD receiver to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for RS232 configuration media_player : - platform : nad serial_port : /dev/ttyUSB0
# Example configuration.yaml entry for Telnet configuration media_player : - platform : nad type : Telnet host : " IP_ADDRESS"
# Example configuration.yaml entry for TCP configuration media_player : - platform : nad type : TCP host : " IP_ADDRESS"
Configuration Variables
Looking for your configuration file?
type string ( Optional , default: RS232 )
Type of communication. Valid types are RS232 , Telnet or TCP
serial_port string ( Optional , default: /dev/ttyUSB0 )
The serial port. (for RS232 type only)
host string ( Optional )
The IP address of your amplifier. (for TCP and Telnet types)
port integer ( Optional , default: 53 )
The port number of the device. (for Telnet type only)
name string ( Optional , default: NAD Receiver )
Name of the device.
min_volume integer ( Optional , default: -92 )
Minimum volume in dB to use with the slider.
max_volume integer ( Optional , default: -20 )
Maximum volume in dB to use with the slider.
sources list | string ( Optional )
A list of mappings from source to source name. Valid sources are 1 to 12 . (for RS232 and Telnet types)
volume_step integer ( Optional , default: 4 )
The amount in dB you want to increase the volume with when pressing volume up/down. (for TCP type only)
The min_volume and max_volume options are there to protect you against misclicks on the slider so you will not blow up your speakers when you go from -92dB to +20dB. You can still force higher or lower volumes than the values set by using the plus and minus buttons.
Important
On Linux the user running Home Assistant needs dialout permissions to access the serial port.
This can be added to the user by doing sudo usermod -a -G dialout <username> .
Be aware that the user might need to log out and log on again to activate these permissions.
An example of a full configuration:
# Example configuration.yaml entry media_player : - platform : nad serial_port : /dev/ttyUSB0 name : " NAD Receiver" min_volume : -60 max_volume : -20 sources : 1 : " Kodi" 2 : " TV"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NAD integration was introduced in Home Assistant 0.36, and it's used by
62 active installations.
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
