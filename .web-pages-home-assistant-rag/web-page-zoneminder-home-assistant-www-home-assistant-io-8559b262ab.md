---
source_url: "https://www.home-assistant.io/integrations/zoneminder"
final_url: "https://www.home-assistant.io/integrations/zoneminder"
canonical_url: "https://www.home-assistant.io/integrations/zoneminder/"
source_handle: "web:www-home-assistant-io:8559b262ab4b"
source_section: "integrations-zoneminder"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0d6fef5de0f2e78f1bd7b6519e69d729dc930d4045058065392e1f6f20c63a3e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ZoneMinder - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zoneminder
- Final URL: https://www.home-assistant.io/integrations/zoneminder
- Canonical URL: https://www.home-assistant.io/integrations/zoneminder/
- Fetched at: 2026-06-28T03:31:20Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate ZoneMinder into Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration
List of actions
Binary sensor
Camera
Sensor
Switch
Related topics
The ZoneMinder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sets up Home Assistant with your ZoneMinder instance.
There is currently support for the following device types within Home Assistant:
To add the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to your installation, add it to the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry zoneminder : - host : ZM_HOST
Configuration Variables
Looking for your configuration file?
host string Required
Your ZoneMinder server’s host (and optional port), not including the scheme.
path string ( Optional , default: /zm/ )
Path to your ZoneMinder install.
path_zms string ( Optional )
Path to the CGI script for streaming. This should match PATH_ZMS in ZM’s “Paths” settings.
Default:
/zm/cgi-bin/nph-zms
ssl boolean ( Optional , default: false )
Set to true if your ZoneMinder installation is using SSL.
verify_ssl boolean ( Optional , default: true )
Verify the certification of the endpoint.
username string ( Optional )
Your ZoneMinder username.
password string ( Optional )
Your ZoneMinder password. Required if OPT_USE_AUTH is enabled in ZM.
# Example configuration.yaml entry zoneminder : - host : ZM_HOST path : ZM_PATH path_zms : ZM_PATH_ZMS ssl : true verify_ssl : true username : YOUR_USERNAME password : YOUR_PASSWORD
The ZoneMinder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set run state ( zoneminder.set_run_state )
Changes the active run state of a ZoneMinder instance.
For an overview of every action across all integrations, see the actions reference .
The zoneminder binary sensor platform lets you monitor the availability of your ZoneMinder install.
Each binary_sensor created will be named after the hostname used when configuring the ZoneMinder integration .
The zoneminder camera platform lets you monitor the current stream of your ZoneMinder cameras.
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry camera : - platform : zoneminder
The zoneminder sensor platform lets you monitor the current state of your ZoneMinder install including the number of events, the current state of the cameras and ZoneMinder’s current run state.
# Example configuration.yaml entry sensor : - platform : zoneminder include_archived : false
include_archived boolean ( Optional , default: false )
Whether to include archived ZoneMinder events in event counts.
monitored_conditions list ( Optional )
Event count sensors to display in the frontend.
all
All events.
month
Events in the last month.
week
Events in the last week.
day
Events in the last day.
hour
Events in the last hour.
The zoneminder switch platform allows you to toggle the current function of all cameras attached to your ZoneMinder instance.
Important
You must have the ZoneMinder integration configured to use this and if ZoneMinder authentication is enabled the account specified in the integration configuration must have “Edit” permission for “System”.
To enable this switch, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry switch : - platform : zoneminder command_on : Modect command_off : Monitor
command_on string Required
The function you want the camera to run when turned on.
command_off string Required
The function you want the camera to run when turned off.
Note
The default functions installed by ZoneMinder are: None, Monitor, Modect, Record, Mocord, Nodect.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ZoneMinder integration was introduced in Home Assistant 0.31, and it's used by
226 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rohankapoorcom
@nabbi
Categories
Hub
Back to top
