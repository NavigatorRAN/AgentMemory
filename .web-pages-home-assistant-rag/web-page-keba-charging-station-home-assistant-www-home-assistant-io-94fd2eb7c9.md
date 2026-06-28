---
source_url: "https://www.home-assistant.io/integrations/keba"
final_url: "https://www.home-assistant.io/integrations/keba"
canonical_url: "https://www.home-assistant.io/integrations/keba/"
source_handle: "web:www-home-assistant-io:94fd2eb7c958"
source_section: "integrations-keba"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "010c6aff16eebfe8501447dd3434d0f384a3426786d1ce7aa6243e9824f2be4f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Keba Charging Station - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/keba
- Final URL: https://www.home-assistant.io/integrations/keba
- Canonical URL: https://www.home-assistant.io/integrations/keba/
- Fetched at: 2026-06-28T02:54:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up your Keba charging station with Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Notifications
Usage
Disclaimer
Related topics
The Keba Charging Station integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates your Keba P30/P20 charging station/BMW Wallbox into your Home Assistant instance using the UDP Smart Home Interface ( manual ). Keba P40 charging stations are not yet supported as they use a different protocol. The fetching interval to the charging station is set to 5 seconds, same as in the official mobile app. To use the integration, enable the UDP Smart Home Interface by adjusting the DIP switches within the charging station according to the installation manual .
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following platforms:
Binary sensors: Online state, plug state, charging state and failsafe mode state.
Lock: Authorization (like with the RFID card).
Sensors: current set by the user, target energy set by the user, charging power, charged energy of the current session and total energy charged.
Actions: authorize, deauthorize, set energy target, set the maximum allowed current and manually update the states. More details can be found in the actions section.
Notify: Show a text on chargers with a built-in LED display.
To enable this integration in your installation, add at least the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry keba : host : KEBA_HOST
Configuration Variables
Looking for your configuration file?
keba map Required
configuration
host string Required
Keba host.
rfid string ( Optional , default: 00845500 )
RFID tag used for authorization.
failsafe boolean ( Optional , default: false )
Enable failsafe mode at Home Assistant startup.
failsafe_timeout integer ( Optional , default: 30 )
Timeout of the failsafe mode in seconds. Allowed values are between 10 seconds and 600 seconds (this parameter is only used if failsafe mode is enabled). Make sure to call the keba.set_curr action regularly within this timeout period!
failsafe_fallback integer ( Optional , default: 6 )
Fallback current of the failsafe mode in A. Allowed values are between 6 Ampere and 63 Ampere. 0 Ampere disables the running charging process completely (this parameter is only used if failsafe mode is enabled).
failsafe_persist integer ( Optional , default: 0 )
Saving the failsafe configuration to internal EEPROM of the Keba charging station. 1 means save it, 0 means do only keep this configuration until the next restart of the charging station (this parameter is only used if failsafe mode is enabled).
refresh_interval integer ( Optional , default: 5 )
Refresh interval to fetch new data from the charging station. 5 seconds (same as in the official app) is recommended.
The Keba Charging Station integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Authorize ( keba.authorize )
Authorizes a charging process on a Keba charging station.
Deauthorize ( keba.deauthorize )
Deauthorizes the running charging process on a Keba charging station.
Disable ( keba.disable )
Stops the charging process on an authorized Keba charging station.
Enable ( keba.enable )
Starts a charging process on an authorized Keba charging station.
Request data ( keba.request_data )
Requests new data from a Keba charging station.
Set current ( keba.set_current )
Sets the maximum charging current on a Keba charging station.
Set energy ( keba.set_energy )
Sets the target energy for the current charging session on a Keba charging station.
Set failsafe ( keba.set_failsafe )
Configures the failsafe mode of a Keba charging station.
For an overview of every action across all integrations, see the actions reference .
Caution
Using these actions changes the state of your charging station. Use them with care.
Some Keba chargers are equipped with an LED text display. The notification platform may be used to display text on this display. To enable this, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : keba
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
The use of the notify action is described here .
The message part of the event payload is shown on the display. Scrolling is performed if needed. A maximum of 23 characters can be shown.
The optional data part may contain specifications of the message duration. min_time is the minimum time in seconds the text will be shown if another message is requested. max_time is the maximum time to display the message when nothing else is requested. By default, the message is shown a minimum of 2 seconds and a maximum of 10 seconds.
message : " Welcome home" data : min_time : 4 max_time : 10
This software is not affiliated with or endorsed by Keba.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Keba Charging Station integration was introduced in Home Assistant 0.98, and it's used by
395 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dannerph
Categories
Binary sensor
Lock
Sensor
Back to top
