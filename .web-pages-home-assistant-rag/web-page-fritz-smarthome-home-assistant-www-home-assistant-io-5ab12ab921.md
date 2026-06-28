---
source_url: "https://www.home-assistant.io/integrations/fritzbox"
final_url: "https://www.home-assistant.io/integrations/fritzbox"
canonical_url: "https://www.home-assistant.io/integrations/fritzbox/"
source_handle: "web:www-home-assistant-io:5ab12ab92196"
source_section: "integrations-fritzbox"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "55626b8e46047d70ee8e1d978ceea2984107464605e5ad898672f995083e48a6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FRITZ!SmartHome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fritzbox
- Final URL: https://www.home-assistant.io/integrations/fritzbox
- Canonical URL: https://www.home-assistant.io/integrations/fritzbox/
- Fetched at: 2026-06-28T02:44:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate FRITZ! Smart Home (former AVM FRITZ!DECT) components into Home Assistant.

## Extracted Text

On this page
Prerequisites
Username
Configuration
Data fetching and limitations
Devices
Light bulbs
Plugs
Routines
Shutter drivers
Templates
Thermostats
Other devices
Automation examples
Control heating by presence
Control lights based on sun state
Troubleshooting
Remove the integration
To remove an integration instance from Home Assistant
The FRITZ!SmartHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to integrate FRITZ! Smart Home ( former AVM FRITZ!DECT ) devices like plugs, thermostats or shutter drivers as also trigger so called smart home templates ( contains settings for Smart Home devices of the same type ).
Tested devices
FRITZ!Box routers
FRITZ!Box 5590 Fiber
FRITZ!Box 6490 Cable
FRITZ!Box 6591 Cable
FRITZ!Box 6690 Cable
FRITZ!Box 7590
FRITZ!Box 7490
FRITZ!Box 7430
FRITZ!Box 7590 AX
FRITZ!Box 7530 AX
FRITZ!Smart Gateway
FRITZ!SmartHome devices
FRITZ!Smart Energy 200 ( former FRITZ!DECT 200 )
FRITZ!Smart Energy 210 ( former FRITZ!DECT 210 )
FRITZ!Smart Thermo 301 ( former FRITZ!DECT 301 )
FRITZ!Smart Thermo 302 ( former FRITZ!DECT 302 )
FRITZ!DECT 500
Smart home devices from other vendors
Eurotronic Comet DECT
Magenta SmartHome LED E27 Color
Magenta SmartHome LED E27 warmwhite
Homepilot RolloTron DECT 1213 ( former Rademacher RolloTron DECT 1213 )
In a mesh setup, only the FRITZ!Box with the mesh master role should be added with the FRITZ!SmartHome integration.
It is recommended to create a separate user to connect Home Assistant to your FRITZ!Box. To create a user, in the FRITZ!Box go to System > FRITZ!Box Users > Users > Add User . Make sure the user has the Smart Home permission.
Note
If you still want to use the predefined user, as of FRITZ!OS 7.24, the FRITZ!Box creates a random username for the admin user if you didn’t set one yourself. This can be found after logging into the FRITZ!Box and visit System > FRITZ!Box Users > Users . The username starts with fritz followed by four random numbers. Under properties on the right it says created automatically . Before FRITZ!OS 7.24, the default username was admin .
To add the FRITZ!SmartHome hub to your Home Assistant instance, use this My button:
FRITZ!SmartHome can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FRITZ!SmartHome .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your FRITZ!Box router.
Name of the user to connect Home Assistant to your FRITZ!Box ( see Username )
Password
Password for the user to connect Home Assistant to your FRITZ!Box ( see Username )
Since the API of the FRITZ!Box does not provide a push mechanism, this integration polls the data every 30 seconds from the FRITZ!Box. Because of this, the integration can’t support the main features of event-based devices like the FRITZ!Smart Control 350 door/window contact sensors or the FRITZ!Smart Control 440 buttons ( see the other devices section for details ).
Light bulbs like the FRITZ!DECT 500 or Magenta SmartHome LED E27 Color will be integrated as light A light has a brightness you can control, and optionally color temperature or RGB color control. [Learn more] entities.
The FRITZ!DECT 500 light bulb supports only 36 colors. When a color is picked in Home Assistant that is not supported by the device, a color that comes close will be activated.
Plugs like the FRITZ!Smart Energy 200 or FRITZ!Smart Energy 210 will be integrated as switch Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] entities.
Further there are additional sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] and “binary sensor” A binary sensor returns information about things that only have two states - such as on or off. [Learn more] entities created for each device, based on its capabilities:
Button lock via UI
Button lock on device
Electric Current
Power Consumption
Temperature
Total Energy
Voltage
Self-defined routines within the FRITZ!The box smart home configuration menu will be integrated as switch Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] entities. Those entities can be activated or deactivated from Home Assistant.
Shutter drivers like the Homepilot RolloTron DECT 1213 will be integrated as cover Covers are devices such as blinds, garage doors, etc that can be opened and closed and optionally set to a specific position. [Learn more] entities.
Self defined templates within the FRITZ!Box smart home configuration menu, will be integrated as button A button entity can fire an event, or trigger an action towards a device or service. It can be compared to a physical push button. The button entity does not have a state like on or off , but keeps the timestamp of when it was last pressed in the Home Assistant UI or via an action. [Learn more] entities and those can be triggered from within Home Assistant.
Thermostats like the FRITZ!Smart Thermo series or Eurotronic Comet DECT will be integrated as climate The Climate entity allows you to control and monitor HVAC (heating, ventilating, and air conditioning) devices and thermostats. [Learn more] entities.
Further there are additional sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] and “binary sensor” A binary sensor returns information about things that only have two states - such as on or off. [Learn more] entities created for each device which can be useful for automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] and templates A template is an automation definition that can include variables for the action or data from the trigger values. This allows automations to generate dynamic actions. [Learn more] , based on its capabilities:
Battery
Battery low
Comfort Temperature
Current Scheduled Preset
Eco Temperature
Holiday mode
Next Scheduled Change Time
Next Scheduled Preset
Next Scheduled Temperature
Open window detected
Summer mode
Event based devices like motion detection sensors or window/door contacts or buttons ( for example, FRITZ!Smart Control 350 or the FRITZ!Smart Control 440 ) cannot be controlled or used via this integration, but their sensors can still be integrated.
The availability of these sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] and “binary sensor” A binary sensor returns information about things that only have two states - such as on or off. [Learn more] entities depends on the features and capabilities of the connected device and can be one or multiple of:
Humidity
This will apply the comfort preset to climate.livingroom when at
least one person is in zone.home , and apply eco when nobody is in
the zone.
description : " Set comfort when at least one person is home, otherwise set eco." mode : single triggers : - trigger : state entity_id : - zone.home conditions : - condition : not conditions : - condition : state entity_id : zone.home state : - unavailable - unknown actions : - if : - condition : numeric_state entity_id : zone.home above : 0 then : - action : climate.set_preset_mode target : entity_id : climate.livingroom data : preset_mode : comfort else : - action : climate.set_preset_mode target : entity_id : climate.livingroom data : preset_mode : eco
This will turn on the light.outdoor at sunset and turn it off at sunrise.
description : " Turn on the outdoor lights when the sun goes down." mode : single triggers : - trigger : state entity_id : - sun.sun conditions : - condition : not conditions : - condition : state entity_id : sun.sun state : - unavailable - unknown actions : - if : - condition : state entity_id : sun.sun state : - below_horizon then : - action : light.turn_on target : entity_id : light.outdoor else : - action : light.turn_off target : entity_id : light.outdoor
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue re-occurs stop the debug logging again ( download of debug log file will start automatically ). Further if still possible , please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you don’t use the separate created FRITZ!Box user anymore, than remove it from the FRITZ!Box under to System > FRITZ!Box Users > Users .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FRITZ!SmartHome hub was introduced in Home Assistant 0.68, and it's used by
6.7% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
@flabbamann
Categories
Binary sensor
Button
Climate
Light
Sensor
Switch
Back to top
