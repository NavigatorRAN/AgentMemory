# NX584 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nx584
- Final URL: https://www.home-assistant.io/integrations/nx584
- Canonical URL: https://www.home-assistant.io/integrations/nx584/
- Fetched at: 2026-06-28T03:04:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NX584 into Home Assistant.

## Extracted Text

On this page
Alarm control panel
Binary sensor
List of actions
Full example
Related topics
The NX584 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides integration with GE, Caddx, Interlogix (and other brands) alarm panels that support the NX584 interface module (or have it built in). Supported panels include NX4/6/8/8E. Actual integration is done through pynx584 which is required for this to work.
There is currently support for the following device types within Home Assistant:
Alarm
To enable this, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry alarm_control_panel : - platform : nx584
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The host where the nx584 server process is running.
name string ( Optional , default: NX584 )
This parameter allows you to override the name.
port integer ( Optional , default: 5007 )
The port where the alarm panel is listening.
Enabling this binary sensor platform exposes all of your zones as binary sensors, which provides visibility through the UI as well as the ability to trigger automation actions instantly when something happens like a door opening, or a motion sensor trigger.
To enable this feature, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry binary_sensor : platform : nx584
This is the host where the nx584 server process is running. If unset, it is assumed to be localhost , which will work if the server process is running on the same system as Home Assistant.
The port where the server process is running.
exclude_zones list | integer ( Optional )
This is a list of zone numbers that should be excluded. Use this to avoid exposing a zone that is of no interest or unconnected.
zone_types list ( Optional )
This is a list of zone numbers mapped to zone types. Use this to designate zones as doors, motion sensors, or smoke detectors. See the list of available zone types relevant to alarm zones below.
opening
Opening
motion
Motion
gas
Gas
smoke
Smoke
moisture
Moisture
safety
Safety
The NX584 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Bypass zone ( nx584.bypass_zone )
Bypasses a zone on an NX584 alarm panel.
Unbypass zone ( nx584.unbypass_zone )
Removes the bypass from a zone on an NX584 alarm panel.
For an overview of every action across all integrations, see the actions reference .
An extended configuration entry could look like this:
# Full example configuration.yaml entry binary_sensor : platform : nx584 host : 192.168.1.10 port : 5007 exclude_zones : - 3 - 5 zone_types : 1 : opening 2 : opening 4 : motion 6 : moisture
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NX584 integration was introduced in Home Assistant 0.13, and it's used by
21 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
