---
source_url: "https://www.home-assistant.io/integrations/envisalink"
final_url: "https://www.home-assistant.io/integrations/envisalink"
canonical_url: "https://www.home-assistant.io/integrations/envisalink/"
source_handle: "web:www-home-assistant-io:1a135d21d147"
source_section: "integrations-envisalink"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "61605ebfa341894d7e96616c7e505e2e31d8849af7c836c1f02978d6d7546bb4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Envisalink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/envisalink
- Final URL: https://www.home-assistant.io/integrations/envisalink
- Canonical URL: https://www.home-assistant.io/integrations/envisalink/
- Fetched at: 2026-06-28T02:40:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a DSC/Honeywell alarm panel with Home Assistant using an envisalink evl3/evl4 board.

## Extracted Text

On this page
List of actions
Attributes
Related topics
The Envisalink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will allow Home Assistant users who own either a DSC or Honeywell alarm panel to leverage their alarm system and its sensors to provide Home Assistant with rich information about their homes. Connectivity between Home Assistant and the alarm panel is accomplished through a device produced by Eyez On, known as the Envisalink. The Envisalink evl3 and evl4 boards provide a TCP/IP interface to the alarm panel, where it emulates an alarm keypad. This board also exposes a raw TCP/IP based API, upon which this integration is built. Currently, the Envisalink version 4 is the latest model. This integration supports both the evl3 and the evl4.
Please visit the eyezon website for further information about the evl3 and evl4 boards.
There is currently support for the following device types within Home Assistant:
Binary sensor: Reports on zone status (Check the type/class list for a possible visualization of your zone.)
Sensor: Emulates an alphanumeric keypad attached to the alarm panel
Alarm control panel: Reports on partition status, and can be used to arm/disarm the system
This is a fully event-based integration. Any event sent by the Envisalink device will be immediately reflected within Home Assistant.
As of 0.29, the alarm_trigger service is supported. It is possible to fire off an envisalink-based alarm directly from Home Assistant. For example, a newer Z-Wave/Zigbee sensor can now be integrated into a legacy alarm system using a Home Assistant automation.
An envisalink section must be present in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and contain the following options as required.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry envisalink : host : <envisalink IP address or hostname> panel_type : HONEYWELL or DSC user_name : YOUR_USERNAME password : YOUR_PASSWORD code : " 1234" port : 4025 evl_version : 3 keepalive_interval : 60 zonedump_interval : 30 timeout : 10 panic_type : Police zones : 1 : name : " Back Door" type : " opening" 2 : name : " First Floor Motion" type : " motion" partitions : 1 : name : " Home Alarm"
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname (host.fqdn.tld) of the Envisalink device on your home network.
panel_type string Required
HONEYWELL or DSC , depending upon which alarm system you have.
user_name string Required
Which username to authenticate with when connecting to the device. This must be the username for connecting directly to the device and not the username for your EyezOn account. On a Honeywell alarm panel, the username/password are the same.
password string Required
Which password to authenticate with when connecting to the device. This must be the password for connecting directly to the device and not the password for your EyezOn account. EVL3 only works with max. 6 characters.
code string ( Optional )
Your alarm panel’s code, for authenticating user input during arm/disarm. If you do not provide this value, the integration will prompt the user to enter the code at runtime.
port integer ( Optional , default: 4025 )
Which network port to connect with.
evl_version integer ( Optional , default: 3 )
3 for evl3, or 4 for evl4.
keepalive_interval integer ( Optional , default: 60 )
This is a periodic heartbeat signal (measured in seconds) sent to your Envisalink board to keep it from restarting. This is required for DSC and Honeywell systems.
zonedump_interval integer ( Optional , default: 30 )
This is an interval (measured in seconds) where Envisalink will dump out all zone statuses. This is required for Honeywell systems, which do not properly send zone closure events. DSC boards do not technically need this.
timeout integer ( Optional , default: 10 )
A network connectivity timeout when communicating with the envisalink. If connection is not obtained by this time (in seconds) the integration will stop trying to connect.
panic_type string ( Optional , default: Police )
Both DSC and Honeywell boards support a panic alarm. This is used when the alarm_trigger action is called in Home Assistant. This determines which type of panic alarm to raise. Valid values are: Police, Fire, Ambulance.
zones integer ( Optional )
Envisalink boards have no way to tell us which zones are actually in use, so each zone must be configured in Home Assistant. Zone numbers correspond to the zone numbers configured on your alarm system and must be in the range of 1 to 64. For each zone, at least a name must be given. For more information about the visual representation of a zone, take a look at the binary sensor documentation. Note: If no zones are specified, Home Assistant will not load any binary_sensor integrations.
name string Required
Zone name
type string ( Optional , default: opening )
Zone type
partitions integer ( Optional )
Again, Envisalink boards do not tell us what is in use and what is not, so each partition must be configured with a partition name. If no partition parameter is specified, then no alarm_panel or sensor integrations are loaded.
Partition name
The Envisalink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Alarm keypress ( envisalink.alarm_keypress )
Sends custom keypresses to an Envisalink alarm panel.
Invoke custom function ( envisalink.invoke_custom_function )
Triggers a PGM output on a DSC alarm panel.
For an overview of every action across all integrations, see the actions reference .
Envisalink alarm control panel entities also support the standard alarm control panel actions , such as arming, disarming, and triggering the alarm. For example, you can use the alarm trigger action to integrate a newer Z-Wave or Zigbee sensor into a legacy alarm system through a Home Assistant automation.
The zone status binary sensors have extra attributes representing additional
information about each zone.
Name Description last_tripped_time Last time this zone was tripped. zone Zone number. Can be used in combination with alarm_keypress action to issue commands relating to this zone.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Envisalink integration was introduced in Home Assistant 0.23, and it's used by
889 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Alarm
Binary sensor
Sensor
Back to top
