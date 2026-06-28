# KNX - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/knx
- Final URL: https://www.home-assistant.io/integrations/knx
- Canonical URL: https://www.home-assistant.io/integrations/knx/
- Fetched at: 2026-06-28T02:54:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate KNX components with Home Assistant.

## Extracted Text

On this page
Configuration
KNX Connection
Tunneling specific settings
Routing specific settings
KNX IP Secure specific settings
Reconfiguration
Configure KNX interface
Import KNX Keyring
Options
Basic configuration
Group addresses
Connection
KNX Secure
Tunneling
Routing
Data updates
Triggers
Telegram trigger
Events
List of actions
Exposing entity states, entity attributes or time to KNX bus
Serve current time
Entity exposures
Entity platforms
Common entity configuration options
Binary sensor
Button
Climate
Cover
Date
DateTime
Fan
Light
Notify
Number
Scene
Select
Sensor
More examples
Switch
Text
Time
Weather
Value types
Known limitations
Troubleshooting / Common issues
Logs for the KNX integration
Group address cannot be read
Duplicate entities
Removing the integration
To remove an integration instance from Home Assistant
The KNX integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant to your KNX installation, allowing you to control KNX devices, act on telegrams and forward state changes from other integrations entities to your KNX bus.
This integration requires a local KNX/IP interface or router to establish the connection between Home Assistant and your KNX bus.
There is currently support for the following device types within Home Assistant:
To add the KNX hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select KNX .
Follow the instructions on screen to complete the setup.
Select the connection type to your KNX bus. The integration supports the following connection methods:
‘Automatic’ performs a gateway scan on start, to find a KNX IP interface. It will connect via a tunnel. This option is not available when a gateway scan at setup initiation was not successful.
‘Tunneling’ will connect to a specific KNX IP interface over a tunnel.
‘Routing’ will use Multicast to communicate with KNX IP routers.
For more information about KNX connection types see Connection .
You can select a specific tunnel device if multiple were found during the setup. In case no device was discovered, you can configure connection information manually.
KNX tunneling type
UDP , TCP or Secure Tunneling
Host
IP address or hostname of the KNX/IP tunneling device.
Port
Port used by the KNX/IP tunneling device.
Route back / NAT mode
Enable if your KNXnet/IP tunneling server is behind NAT. Only applies for UDP connections.
Local IP interface
Local IP or interface name used for the connection from Home Assistant. Leave blank to use auto-discovery.
Tunnel endpoint
Select the tunnel endpoint used for the connection. This step is only available for TCP or Secure Tunneling connection types.
Individual address
KNX individual address to be used by Home Assistant to send telegrams. This shall not be used by any other device in your installation.
KNX IP Secure Routing
Select if your installation uses encrypted communication according to the KNX IP Secure standard. This setting requires compatible devices and configuration. You’ll be prompted for credentials in the next step.
Multicast group
Multicast group used by your installation. Default is 224.0.23.12
Multicast port
Multicast port used by your installation. Default is 3671
See Connection on how to get the files or keys needed for this configuration step.
You can change your KNX connection configuration at any time through the integration settings. This is useful when you need to update the Keyring file or switch to a different connection type.
Select KNX .
Click the three-dot menu and then select Reconfigure .
Reconfigure your connection settings. See above for more information.
Provide a new keyring file to be used by the integration. See KNX Secure on how to get this file.
To define options for KNX, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of KNX are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
State updater
Sets the default behavior for periodically reading state addresses from the KNX Bus.
Rate limit
Maximum outgoing telegrams per second. 0 to disable limit - which is recommended.
Telegram history limit
Number of Telegrams to keep in memory for the KNX panels group monitor.
To use the various platforms offered by the KNX integration, you will need to set them up via the KNX panel or add the corresponding configuration yaml to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . See Splitting up the configuration if you like to arrange YAML parts in dedicated files.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
knx : # configure platforms directly in configuration.yaml binary_sensor : - name : " My first binary sensor" state_address : " 1/2/3" # etc... # or outsource platform configuration to separate files sensor : !include knx_sensor.yaml
Please see the dedicated platform sections below about how to configure them correctly.
Group addresses are configured as strings or integers in the format “1/2/3” for 3-level GA-structure, “1/2” for 2-level GA-structure or “1” for free GA-structure.
The Home Assistant KNX integration uses configured state_address or *_state_address to update the state of a function. These addresses are read by GroupValueRead requests on startup and when there was no incoming telegram for one hour (default sync_state ).
It is possible to configure passive/listening group addresses for all functions of every KNX platform (except expose and notify ). This allows having multiple group addresses to update the state of its function (e.g., the brightness of a light). When group addresses are configured as a list of strings, the first item is the active sending or state-reading address and the rest is registered as passive addresses. This schema behaves like in ETS configuration where the first is the “sending” address and others are just for updating the group object.
If your KNX device provides active state group objects it is advised to use *_state_address instead of passive addresses as it reduces configuration complexity and avoids wrong states (e.g., when channels are logically locked).
knx : switch : - name : " Switch without passive addresses" address : " 1/1/1" # this is the address that will be sent to state_address : " 8/8/8" # this is the address GroupValueRead requests are sent to - name : " Switch with passive addresses" address : - " 1/1/1" # this is the address that will be sent to - " 1/1/2" # this and following are passive addresses - " 1/1/3" state_address : - " 8/8/8" # this is the address GroupValueRead requests are sent to - " 8/8/2" # this and following are passive addresses - " 8/8/3"
Connection parameters are configured during integration setup and can be modified later in the integrations settings.
The KNX integration supports both IP Secure and Data Secure.
IP Secure
IP Secure credentials can be provided in two ways:
Using a .knxkeys file: This file can be exported from ETS and imported into the integration settings.
Manual configuration: If you are not using Data Secure, you can manually input the required IP Secure credentials in the integration settings.
Data Secure
Data Secure credentials are always sourced from a .knxkeys file. You can import or update the Keyring file from the integrations settings.
Important
Assign all secured group addresses that Home Assistant will use to either the interface’s tunnel endpoint or a dummy device in ETS before exporting the Keyring file.
When updating secure groups, ensure all participating devices, routers, and couplers applications are updated as well. After making changes, load the updated Keyring file into Home Assistant.
Tunneling uses a KNX IP Interface to connect to the KNX bus. Most KNX IP Routers also support tunneling connections. This is the recommended connection type and is also used when selecting an “Automatic” connection in the integration setup.
For modern interfaces (supporting TCP or IP Secure) you can select a specific tunnel endpoint to be used. Make sure that Home Assistant is the only client connecting to this tunnel endpoint.
In ETS it is recommended to connect the group addresses you want to use to the tunnel endpoint that Home Assistant uses. For secure group addresses, this is mandatory.
If you use KNX IP Secure tunneling or Data Secure, export the Keyring file from ETS and import it in the KNX integration settings.
Note
If you want Home Assistant to use a specific individual address, you can change the address of the used tunnel endpoint in ETS.
Manual IP Secure tunneling credentials
If you opt for manual configuration of IP Secure tunneling, you will need the following:
User-ID: Use a User-ID of 2 or higher. (IDs 0 and 1 are reserved).
The first tunnel endpoint in ETS will typically use User-ID 2 , the second 3 , and so on.
User password.
Device authentication code (optional).
The following screenshot will show how you can find the device authentication code in ETS.
Routing communicates with KNXnet/IP routers via IP Multicast.
When using routing:
Add a dummy device in ETS at the same topology level as your routers.
Assign this dummy device the same individual address configured in the KNX integration setup.
Connect all group addresses that Home Assistant will use to the dummy device.
This ensures routers and couplers maintain updated filter tables and enables the use of secure group addresses in Home Assistant.
If you use KNX IP Secure routing or Data Secure groups, export the Keyring file from ETS and import it in the KNX integration settings.
Manual IP Secure routing credentials
If you opt for manual configuration of IP Secure routing, you will need the backbone key. This can be found in the ETS “Project Security” report.
This integration uses the KNX/IP protocol to receive telegrams live as they appear on the bus. When the integration is loaded, it actively requests data needed to initialize the configured entities. See Group Addresses for more details.
States of diagnostic entities of the “KNX Interface” device are polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] every 10 seconds.
The KNX integration provides its own trigger platform which can be used in automations.
The knx.telegram trigger can be used to trigger automations on incoming or outgoing KNX telegrams.
This trigger is also provided as a device trigger by the KNX Interface device. It supports setting the options in the automation builder UI, but doesn’t support setting a specific DPT ( type ) to decode the payload as it always relies on project data.
Configuration Variables
Looking for your configuration file?
destination string | list ( Optional )
A group address or a list of group addresses the trigger should listen on. If not set, or an empty list, the trigger will listen on all group addresses.
type string | integer ( Optional )
If set, the payload will be decoded as given DPT in the trigger data. When not set, the DPT is sourced from project data. KNX sensor types are valid values KNX Sensor (e.g., “2byte_float” or “percent”).
group_value_write boolean ( Optional , default: true )
If set to false , the trigger will not fire on GroupValueWrite telegrams.
group_value_response boolean ( Optional , default: true )
If set to false , the trigger will not fire on GroupValueResponse telegrams.
group_value_read boolean ( Optional , default: true )
If set to false , the trigger will not fire on GroupValueRead telegrams.
incoming boolean ( Optional , default: true )
If set to false , the trigger will not fire on incoming telegrams.
outgoing boolean ( Optional , default: true )
If set to false , the trigger will not fire on outgoing telegrams.
Available trigger data
In addition to the standard automation trigger data , the knx.telegram trigger platform has additional trigger data available for use.
trigger.destination Destination group address
trigger.destination_name Destination group address name
trigger.direction Telegram direction
trigger.dpt_main Destination group address main datapoint type number
trigger.dpt_sub Destination group address sub datapoint type number
trigger.dpt_name DPT value type name - see Sensor value types
trigger.payload Raw telegram payload. DPT 1, 2, and 3 yield integers 0..255; other DPT yield lists of integers 0..255
trigger.source Source individual address
trigger.source_name Source name
trigger.telegramtype APCI type of telegram
trigger.timestamp Timestamp
trigger.unit Unit according to group address DPT
trigger.value Decoded telegram payload according to DPT
Template variable Type Project data required trigger.destination string no trigger.destination_name string yes trigger.direction string no trigger.dpt_main integer yes trigger.dpt_sub integer yes trigger.dpt_name string yes trigger.payload integer or list of integers no trigger.source string no trigger.source_name string yes trigger.telegramtype string no trigger.timestamp timestamp no trigger.unit string yes trigger.value any yes
For values that require project data: if the information was not found, or if no project file was provided, data will be set to null .
Examples
Example automation configuration
- alias : " Single group address trigger" triggers : - trigger : knx.telegram destination : 1/2/3 group_value_read : false outgoing : false conditions : " {{ trigger.value == 0 }}" actions : []
Example trigger data
variables : triggers : id : " 0" idx : " 0" alias : null destination : 1/2/3 destination_name : Light office brightness direction : Incoming dpt_main : 5 dpt_sub : 1 dpt_name : percent payload : - 255 source : 1.0.51 source_name : Dimming actuator 1 telegramtype : GroupValueWrite timestamp : " 2024-01-09T10:38:28.447487+01:00" unit : " %" value : 100 context : null
Tip
For automation triggers, it is recommended to use the knx.telegram trigger instead of knx_event .
knx : event : - address : - " 0/1/*" - address : - " 1/2/*" - " 1/3/2-4" type : " 2byte_unsigned" - address : - " 3/4/5" type : " 2byte_float"
address list | string Required
Defines a list of patterns for matching KNX group addresses. Telegrams with destination addresses matching one of the patterns are sent to the Home Assistant event bus as knx_event .
Telegram payloads in knx_event events will be decoded using the configured type (DPT) for the addresses in the same block. The decoded value will be written to the event data value key. If not configured the value key will be None - the data key will still hold the raw payload (use this for DPT 1, 2, 3). All sensor types are valid types - see KNX Sensor (e.g., “2byte_float” or “1byte_signed”).
Every telegram that matches an address pattern with its destination field will be announced on the event bus as a knx_event event containing data attributes
data contains the raw payload data (e.g., 1 or “[12, 55]”).
destination the KNX group address the telegram is sent to as string (e.g., “1/2/3”).
direction the direction of the telegram as string (“Incoming” / “Outgoing”).
source the KNX individual address of the sender as string (e.g., “1.2.3”).
telegramtype the APCI service of the telegram. “GroupValueWrite”, “GroupValueRead” or “GroupValueResponse” generate a knx_event.
value contains the decoded payload value if type is configured for the address. Will be None for “GroupValueRead” telegrams.
The KNX integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Register knx_event ( knx.event_register )
Adds or removes group addresses in the knx_event filter.
Expose to KNX bus ( knx.exposure_register )
Adds or removes exposures to the KNX bus.
Read from KNX bus ( knx.read )
Sends GroupValueRead requests to the KNX bus.
Send to KNX bus ( knx.send )
Sends arbitrary data directly to the KNX bus.
For an overview of every action across all integrations, see the actions reference .
Expose Home Assistant entity states and attributes to the KNX bus so other KNX devices can react to changes or read the latest values. You can also broadcast current time and date.
You can broadcast the current local time, date, or combined date and time to the KNX bus every hour. This can be configured from the frontend in the KNX panel or via YAML.
Configuration of time exposures via YAML
knx : expose : - type : time address : " 0/0/1"
address string Required
The KNX group address where the time information will be sent. Other KNX devices can read the current time from this address.
type string Required
Choose time (DPT 10.001) for time only, date (DPT 11.001) for date only, or datetime (DPT 19.001) for both date and time combined.
Expose Home Assistant entities to share their state or attributes with the KNX bus. Home Assistant automatically sends the current value whenever it changes and responds to read requests on the KNX bus. This can be configured from the frontend in the KNX panel or via YAML.
Configuration of entity exposures via YAML
knx : expose : - type : binary entity_id : binary_sensor.kitchen_window address : " 0/6/5" # state of an entity with default value - type : binary entity_id : light.office address : " 0/3/0" default : false # attribute of an entity with default value - type : percent entity_id : light.office attribute : brightness default : 0 address : " 0/3/1" # limit updates and send periodically - type : temperature entity_id : sensor.kitchen_temperature address : " 0/0/2" cooldown : minutes : 10 periodic_send : hours : 1 # value_template examples - type : percent address : " 1/1/1" entity_id : cover.office attribute : current_position value_template : " {{ 100 - value }}" # invert the value cooldown : 2 # seconds - type : percent address : " 2/2/2" entity_id : media_player.kitchen attribute : volume_level value_template : " {{ value * 100 }}" # convert from 0..1 to percent
The KNX group address where state updates will be sent. Other devices can read the value from this address, and Home Assistant will respond to read requests here.
type string | integer Required
The data type. Use binary for on/off states or boolean values (DPT 1), or any value type from KNX Sensor , like temperature , humidity , percent , or string .
entity_id string ( Optional )
The entity ID to expose.
attribute string ( Optional )
Expose a specific entity attribute instead of the main state. For example, use brightness to expose a light’s brightness level instead of whether it’s on or off.
default boolean | string | integer | float ( Optional , default: None )
The value to send if the entity state is unavailable or unknown, or if the attribute is not set. If default is omitted, nothing is sent in these cases, but the last known value remains available for read requests.
value_template template ( Optional , default: None )
A Jinja2 template to transform the value before sending. Access the entity state or attribute value as value in the template.
cooldown time | float ( Optional , default: 0 )
Minimum time between consecutive sends (in seconds or as a time period). This can be used to prevent high traffic on the KNX bus when values change very frequently. Only the most recent value during the cooldown period is sent.
periodic_send time | float ( Optional , default: 0 )
Time interval (in seconds or as a time period) to automatically resend the current value to the KNX bus, even if it hasn’t changed. 0 disables periodic sending.
respond_to_read boolean ( Optional , default: true )
Respond to GroupValueRead telegrams received to the configured address .
All KNX entity platforms support the following common configuration options.
name string ( Optional )
An initial name for this entity. After the entity is created, this configuration setting will no longer be used. You can change the name in the Home Assistant UI.
entity_category string ( Optional , default: None )
The category of the entity.
The KNX binary sensor platform allows you to monitor KNX binary sensors like window/door contacts, motion detectors, or alarms.
Binary sensors are read-only entities. To write to the KNX bus, configure a KNX Switch entity or use the knx.send action .
Binary sensor entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX binary sensor entities via YAML
knx : binary_sensor : - name : " Sensor 1" state_address : " 6/0/2"
See also the common entity configuration options .
state_address string | list Required
KNX group address of the binary sensor. DPT 1
sync_state boolean | string | integer ( Optional , default: true )
Actively read the value from the bus. The maximum time interval ( <minutes> ) is 1440. The following values are valid
true equivalent to “expire 60” (default)
false no GroupValueRead telegrams will be sent to the bus
every <minutes> to update it regularly every <minutes>
expire <minutes> to read the state from the KNX bus when no telegram was received for <minutes>
<minutes> equivalent to “expire <minutes>”
init to just initialize the state on startup
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
reset_after float ( Optional )
Reset back to “off” state after specified time in seconds.
invert boolean ( Optional , default: false )
Invert the telegrams payload before processing. This is applied before context_timeout or reset_after is evaluated.
ignore_internal_state boolean ( Optional , default: false )
Specifies if telegrams should ignore the internal state and always trigger a Home Assistant state update.
context_timeout float ( Optional , default: None )
The time in seconds between multiple identical telegram payloads would count towards an internal counter that can be used for automations. This setting defines the time window that a second telegram would count toward a single state change. So if you set this 3.0 you can take up to 3 seconds to trigger the second button press, and a single press would take 3 seconds to trigger a Home Assistant state update. If this is set, ignore_internal_state will be set to true internally. Maximum value is 10.0.
Automation example
Let’s pretend you have configured a binary sensor with the name Livingroom Switch and you want to toggle a light when the button was pressed once and another light when the button was pressed twice.
context_timeout has to be configured in order for this to work and the switch would have to send the same payloads on each press ( on - on within the time window).
automation : - triggers : - trigger : numeric_state entity_id : binary_sensor.livingroom_switch attribute : counter above : 0 below : 2 actions : - action : light.toggle entity_id : light.livingroom_ceiling_lamp - triggers : - trigger : numeric_state entity_id : binary_sensor.livingroom_switch attribute : counter above : 1 below : 3 actions : - action : light.toggle target : entity_id : - light.livingroom_floor_lamp
The KNX button platform allows you to send concurrent predefined values via the frontend or an action. When a user presses the button, the assigned generic raw payload is sent to the KNX bus.
Telegrams received on the KNX bus for the group address of a button are not reflected in a new button state. Use the knx.telegram trigger if you want to automate on a specific payload received on a group address.
# Example configuration.yaml entry knx : button : - name : " DPT 1 - True button" address : " 0/0/1" - name : " 100% button" address : " 0/0/2" payload : 0xFF payload_length : 1 - name : " Temperature button" address : " 0/0/3" value : 21.5 type : temperature
When type is used value is required, payload is invalid.
When payload_length is used value is invalid.
Group address to send to.
payload integer ( Optional , default: 1 )
The raw payload that shall be sent.
payload_length integer ( Optional , default: 0 )
The length of the payload data in the telegram. Use 0 for DPT 1, 2 or 3.
value integer | float | string ( Optional )
The value that shall be sent encoded by type .
A type from the value types table to encode the configured value .
The KNX climate platform is used as an interface to KNX thermostats and room controllers.
Climate entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX climate entities via YAML
To use your KNX thermostats in your installation, add the following lines to your top level KNX Integration configuration key in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry knx : climate : - name : " Kitchen" temperature_address : " 5/1/1" setpoint_shift_address : " 5/1/2" setpoint_shift_state_address : " 5/1/3" target_temperature_state_address : " 5/1/4" operation_mode_address : " 5/1/5" operation_mode_state_address : " 5/1/6"
Alternatively, if your device has dedicated binary group addresses for frost/night/comfort mode:
# Example configuration.yaml entry knx : climate : - name : " Kitchen" temperature_address : " 5/1/1" setpoint_shift_address : " 5/1/2" setpoint_shift_state_address : " 5/1/3" target_temperature_state_address : " 5/1/4" operation_mode_frost_protection_address : " 5/1/5" operation_mode_night_address : " 5/1/6" operation_mode_comfort_address : " 5/1/7" operation_mode_state_address : " 5/1/8"
If your device doesn’t support setpoint_shift calculations (that is, if you don’t provide a setpoint_shift_address value) please set the min_temp and max_temp
attributes of the climate device to avoid issues with exceeding valid temperature values in the frontend. Please do also make sure to add the target_temperature_address to the configuration in this case.:
# Example configuration.yaml entry knx : climate : - name : " Kitchen" temperature_address : " 5/1/2" target_temperature_address : " 5/1/4" target_temperature_state_address : " 5/1/1" operation_mode_frost_protection_address : " 5/1/5" operation_mode_night_address : " 5/1/6" operation_mode_comfort_address : " 5/1/7" operation_mode_state_address : " 5/1/8" operation_mode_standby_address : " 5/1/9" min_temp : 7.0 max_temp : 32.0
setpoint_shift_mode allows the two following DPTs to be used:
DPT6010 (for 1 byte signed integer with scale factor)
DPT9002 (for 2 byte float)
Example:
# Example configuration.yaml entry knx : climate : - name : " Kitchen" temperature_address : " 5/1/1" setpoint_shift_address : " 5/1/2" setpoint_shift_state_address : " 5/1/3" setpoint_shift_mode : " DPT9002" target_temperature_state_address : " 5/1/4" operation_mode_address : " 5/1/5" operation_mode_state_address : " 5/1/6"
operation_mode_frost_protection_address / operation_mode_night_address / operation_mode_comfort_address / operation_mode_standby_address are not necessary if operation_mode_address is specified.
The following values are valid for the heat_cool_address and the heat_cool_state_address :
0 (cooling)
1 (heating)
Supported HVAC modes for your KNX thermostats are found automatically. This can be overridden by using the controller_modes configuration variable. The following values are valid controller modes:
off
auto
heat
cool
fan_only
dehumidification
Supported preset modes for your KNX thermostats are found automatically. This can be overridden by using the operation_modes configuration variable. The following values are valid operation modes:
comfort
standby
economy
building_protection
temperature_address string | list Required
KNX group address for reading current room temperature from KNX bus. DPT 9.001
temperature_step float ( Optional , default: 0.1 )
Defines the step size in Kelvin for each step of setpoint_shift (scale factor). For non setpoint-shift configurations this is used to set the step of temperature sliders in UI.
target_temperature_address string | list ( Optional )
KNX group address for setting target temperature. DPT 9.001
target_temperature_state_address string | list Required
KNX group address for reading current target temperature from KNX bus. DPT 9.001
setpoint_shift_address string | list ( Optional )
KNX address for setpoint_shift. DPT 6.010 or DPT 9.002 based on setpoint_shift_mode
setpoint_shift_state_address string | list ( Optional )
KNX address for reading setpoint_shift. DPT 6.010 or DPT 9.002 based on setpoint_shift_mode
setpoint_shift_mode string ( Optional , default: None )
Defines the internal device DPT used. Either ‘DPT6010’, ‘DPT9002’ or None. When None or omitted the DPT is auto-assigned from the first incoming telegram.
setpoint_shift_min float ( Optional , default: -6 )
Minimum value of setpoint shift.
setpoint_shift_max float ( Optional , default: 6 )
Maximum value of setpoint shift.
active_state_address string | list ( Optional )
KNX address for reading current activity. 0 is idle, 1 is active. DPT 1
command_value_state_address string | list ( Optional )
KNX address for reading current command value in percent. 0 sets the climate entity to idle if active_state_address is not set. DPT 5.001
humidity_state_address string | list ( Optional )
KNX address for reading current humidity. DPT 9.007
operation_mode_address string | list ( Optional )
KNX address for setting operation mode (auto / building protection / economy / standby / comfort). DPT 20.102
operation_mode_state_address string | list ( Optional )
KNX address for reading operation mode. DPT 20.102
controller_status_address string | list ( Optional )
KNX address for HVAC controller status (in accordance with KNX AN 097/07 rev 3).
controller_status_state_address string | list ( Optional )
KNX address for reading HVAC controller status.
controller_mode_address string | list ( Optional )
KNX address for setting HVAC controller modes. DPT 20.105
controller_mode_state_address string | list ( Optional )
KNX address for reading HVAC control mode. DPT 20.105
heat_cool_address string | list ( Optional )
KNX address for switching between heat/cool mode. DPT 1.100
heat_cool_state_address string | list ( Optional )
KNX address for reading heat/cool mode. DPT 1.100
operation_mode_frost_protection_address string | list ( Optional )
KNX address for switching on/off frost/heat protection mode. DPT 1
operation_mode_night_address string | list ( Optional )
KNX address for switching on/off economy mode. DPT 1
operation_mode_comfort_address string | list ( Optional )
KNX address for switching on/off comfort mode. DPT 1
operation_mode_standby_address string | list ( Optional )
KNX address for switching on/off standby mode. DPT 1
operation_modes list ( Optional )
Overrides the supported operation modes. Provide the supported preset_modes value for your device.
controller_modes list ( Optional )
Overrides the supported controller modes. Provide the supported hvac_modes value for your device.
default_controller_mode string ( Optional , default: heat )
Overrides the default controller mode. Any Home Assistant hvac_mode can be configured. This can, for example, be set to “cool” for cooling-only devices.
on_off_address string | list ( Optional )
KNX address for switching the climate device on/off. DPT 1
on_off_invert boolean ( Optional , default: false )
Value for switching the climate device on/off is inverted.
on_off_state_address string | list ( Optional )
KNX address for gathering the current state (on/off) of the climate device. DPT 1
min_temp float ( Optional )
Override the minimum temperature.
max_temp float ( Optional )
Override the maximum temperature.
fan_speed_address string | list ( Optional )
KNX group address for setting the percentage or step of the fan. DPT 5.001 or DPT 5.010
fan_speed_state_address string | list ( Optional )
KNX group address for retrieving the percentage or step of the fan. DPT 5.001 or DPT 5.010
fan_max_step integer ( Optional , default: 3 )
The maximum amount of steps for the fan.
fan_speed_mode string ( Optional , default: percent )
Fan speed group address data type. percent for DPT 5.001 and step for DPT 5.010 .
fan_zero_mode string ( Optional , default: off )
The fan mode for the zero speed, either off or auto . This affects the fan modes displayed in the UI.
swing_address string | list ( Optional )
KNX address for turning the (vertical) swing on/off. DPT 1
swing_state_address string | list ( Optional )
KNX address for gathering the current state (on/off) of the (vertical) swing. DPT 1
swing_horizontal_address string | list ( Optional )
KNX address for turning the horizontal swing on/off. DPT 1
swing_horizontal_state_address string | list ( Optional )
KNX address for gathering the current state (on/off) of the horizontal swing. DPT 1
The KNX cover platform is used as an interface to KNX covers.
Unlike most KNX devices, Home Assistant defines 0% as closed and 100% as fully open in regards to covers. The corresponding value inversion is done internally by the KNX integration.
Home Assistant will, by default, close a cover by moving it in the DOWN direction in the KNX nomenclature, and open a cover by moving it in the UP direction.
Cover entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX cover entities via YAML
To use your KNX covers in your installation, add the following lines to your top level KNX Integration configuration key in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry knx : cover : - name : " Kitchen shutter" move_long_address : " 3/0/0" stop_address : " 3/0/4" position_address : " 3/0/3" position_state_address : " 3/0/2" travelling_time_down : 51 travelling_time_up : 61 - name : " Bedroom blinds" move_long_address : " 3/1/1" move_short_address : " 3/1/4" position_address : " 3/1/3" position_state_address : " 3/1/2" angle_address : " 3/1/5" angle_state_address : " 3/1/6" travelling_time_down : 40 travelling_time_up : 40
move_long_address string | list ( Optional )
KNX group address for moving the cover full up or down. DPT 1
move_short_address string | list ( Optional )
KNX group address for moving the cover stepwise up or down. Used by some covers also as the means to stop the cover. Stepwise moves are only mapped to tilt angle functions in Home Assistant, as no stepwise move of cover position is generally supported by the architecture. If tilt angle is not supported, prefer the use of a stop_address . DPT 1
stop_address string | list ( Optional )
KNX group address for stopping the current movement of the cover. DPT 1
position_address string | list ( Optional )
KNX group address for moving the cover to the dedicated position. DPT 5.001
position_state_address string | list ( Optional )
Separate KNX group address for requesting the current position of the cover. DPT 5.001
angle_address string | list ( Optional )
KNX group address for tilting the cover to the dedicated angle. DPT 5.001
angle_state_address string | list ( Optional )
Separate KNX group address for requesting the current tilt angle of the cover. DPT 5.001
travelling_time_down integer ( Optional , default: 25 )
Time cover needs to travel down in seconds. Needed to calculate the intermediate positions of cover while traveling.
travelling_time_up integer ( Optional , default: 25 )
Time cover needs to travel up in seconds. Needed to calculate the intermediate positions of cover while traveling.
invert_updown boolean ( Optional , default: false )
Set this to true to invert the up/down commands from/to your KNX actuator. Default is to consider UP (0) as opening of a cover and DOWN (1) as closing of a cover.
invert_position boolean ( Optional , default: false )
Set this to true if your actuator reports fully down position as 0% in KNX.
invert_angle boolean ( Optional , default: false )
Set this to true if your actuator reports fully closed tilt as 0% in KNX.
The KNX date platform allows you to send date values to the KNX bus and update its state from received telegrams. It can optionally respond to read requests from the KNX bus.
Date entities without a state_address will restore their last known state after Home Assistant was restarted.
Dates that have a state_address configured request their current state from the KNX bus.
DPT 11.001 covers the range 1990 to 2089. Year values outside of this range are not allowed.
Date entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX date entities via YAML
# Example configuration.yaml entry knx : date : - name : " Date" address : " 0/0/2" state_address : " 0/0/2"
address string | list Required
The group address to which new values will be sent. DPT 11.001
state_address string | list ( Optional )
Group address for retrieving the state from the KNX bus. DPT 11.001
respond_to_read boolean ( Optional , default: false )
If true , the entity will respond to GroupValueRead telegrams received on the configured address by sending a GroupValueResponse to the same address . This is typically used when Home Assistant acts as the state provider for the KNX bus. In such cases, only address is configured, and state_address is not set. Read-requests to passive or state addresses don’t trigger responses.
The KNX datetime platform allows you to send datetime values to the KNX bus and update its state from received telegrams. It can optionally respond to read requests from the KNX bus.
DateTimes that have a state_address configured request their current state from the KNX bus.
System timezone is used as DPT 19.001 doesn’t provide timezone information.
Year values outside of the range 1900 to 2155 are invalid.
Datetime entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX datetime entities via YAML
# Example configuration.yaml entry knx : datetime : - name : " DateTime" address : " 0/0/3" state_address : " 0/0/4"
The group address to which new values will be sent. DPT 19.001
Group address for retrieving the state from the KNX bus. DPT 19.001
The KNX fan integration is used to control KNX fans. Following control types are supported:
Percentage controlled: Fans that set the percentage directly from 0-100%.
Step controlled: Fans which have a fixed amount of steps to set. The integration will convert percentage to step automatically. The max_step attribute is set to the number of steps of the fan, not counting the off -step. Example: A fan supports the steps 0 to 3. To use this fan the max_step attribute has to be set to 3 . The integration will convert the percentage 66 % to the step 2 when sending data to KNX.
Fan entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX fan entities via YAML
To use your KNX fan in your installation, add the following lines to your top-level KNX Integration configuration key in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry knx : fan : - name : " Ceiling fan" address : " 9/0/1" state_address : " 9/0/2"
At least one of address or switch_address must be provided. If you set only address , Home Assistant also uses this address to switch the fan on and off by sending 0 to turn the fan off.
address string | list ( Optional )
switch_address string | list ( Optional )
KNX group address for switching the fan on/off. DPT 1
switch_state_address string | list ( Optional )
KNX group address for retrieving the on/off state of the fan. DPT 1
oscillation_address string | list ( Optional )
KNX group address for switching the fan oscillation on or off. DPT 1
oscillation_state_address string | list ( Optional )
KNX group address for retrieving the state of the fan oscillation. DPT 1
max_step integer ( Optional )
The maximum amount of steps for a step-controlled fan. If set, the integration will convert percentages to steps automatically.
The KNX light integration is used as an interface to control KNX actuators for lighting applications such as:
Switching actuators
Dimming actuators
LED controllers
DALI gateways
Light entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX light entities via YAML
KNX group address for switching the light on and off. DPT 1.001
KNX group address for retrieving the switch state of the light. DPT 1.001
brightness_address string | list ( Optional )
KNX group address for setting the brightness of the light in percent (absolute dimming). DPT 5.001
brightness_state_address string | list ( Optional )
KNX group address for retrieving the brightness of the light in percent. DPT 5.001
color_address string | list ( Optional )
KNX group address for setting the RGB color of the light. DPT 232.600
color_state_address string | list ( Optional )
KNX group address for retrieving the RGB color of the light. DPT 232.600
rgbw_address string | list ( Optional )
KNX group address for setting the RGBW color of the light. DPT 251.600
rgbw_state_address string | list ( Optional )
KNX group address for retrieving the RGBW color of the light. DPT 251.600
hue_address string | list ( Optional )
KNX group address for setting the hue of the light color in degrees. DPT 5.003
hue_state_address string | list ( Optional )
KNX group address for retrieving the hue of the light color in degrees. DPT 5.003
saturation_address string | list ( Optional )
KNX group address for setting the saturation of the light color in percent. DPT 5.001
saturation_state_address string | list ( Optional )
KNX group address for retrieving the saturation of the light color in percent. DPT 5.001
xyy_address string | list ( Optional )
KNX group address for setting the xyY color of the light. DPT 242.600
xyy_state_address string | list ( Optional )
KNX group address for retrieving the xyY color of the light. DPT 242.600
individual_colors map ( Optional )
Used when the actuator only supports individual group addresses for colors. When individual_colors is used the root address key may be omitted.
red map Required
Group addresses for the red component.
KNX group address to switch the red component. DPT 1.001
KNX group address for the state of the red component. DPT 1.001
brightness_address string | list Required
KNX group address to set the brightness of the red component. DPT 5.001
KNX group address for the current brightness of the red component. DPT 5.001
green map Required
Group addresses for the green component. Same keys available as for red component above.
blue map Required
Group addresses for the blue component. Same keys available as for red component above.
white map ( Optional )
Group addresses for the white component. Same keys available as for red component above.
color_temperature_address string | list ( Optional )
KNX group address for setting the color temperature of the light. DPT 5.001, 7.600 or 9 based on color_temperature_mode
color_temperature_state_address string | list ( Optional )
KNX group address for retrieving the color temperature of the light. DPT 5.001, 7.600 or 9 based on color_temperature_mode
color_temperature_mode string ( Optional , default: absolute )
Color temperature group address data type. absolute for color temperature in Kelvin (2 byte unsigned integer). color_temperature_address -> DPT 7.600 . absolute_float for color temperature represented in 2 byte float. color_temperature_address -> DPT 9 . relative color temperature in percent cold white (0% warmest; 100% coldest). color_temperature_address -> DPT 5.001
min_kelvin integer ( Optional , default: 2700 )
Warmest possible color temperature in Kelvin. Used in combination with color_temperature_address .
max_kelvin integer ( Optional , default: 6000 )
Coldest possible color temperature in Kelvin. Used in combination with color_temperature_address .
Many KNX devices can change their state internally without a message to the switch address on the KNX bus, e.g., if you configure a scene or a timer on a channel. The optional state_address can be used to inform Home Assistant about these state changes. If a KNX message is seen on the bus addressed to the given state_address (in most cases from the light actuator), it will overwrite the state of the object.
For switching/light actuators that are only controlled by a single group address and don’t have dedicated state group objects you can set state_address to the same value as address if it is readable from the bus.
YAML configuration examples
knx : light : # dimmable light # color mode: brightness - name : " Dimmable light" address : " 1/0/9" state_address : " 1/1/9" brightness_address : " 1/2/9" brightness_state_address : " 1/3/9" # XYY light # color mode: xy - name : " XYY light" address : " 1/0/9" state_address : " 1/1/9" brightness_address : " 1/2/9" # optional - if not set brightness will be sent over the xyy data point brightness_state_address : " 1/3/9" xyy_address : " 1/4/9" xyy_state_address : " 1/5/9" # HS light # color mode: hs - name : " HS light" address : " 1/0/9" state_address : " 1/1/9" brightness_address : " 1/2/9" # required for HS brightness_state_address : " 1/3/9" hue_address : " 1/4/8" hue_state_address : " 1/5/8" # required for HS saturation_address : " 1/4/9" saturation_state_address : " 1/5/9" # required for HS # RGB light # color mode: rgb - name : " RGB light" address : " 1/0/9" state_address : " 1/1/9" brightness_address : " 1/2/9" # optional for RGB lights brightness_state_address : " 1/3/9" color_address : " 1/4/9" color_state_address : " 1/5/9" # RGBW light # color mode: rgbw - name : " RGBW light" address : " 0/4/83" state_address : " 0/4/84" brightness_address : " 0/4/85" # optional for RGBW lights brightness_state_address : " 0/4/86" rgbw_address : " 0/4/87" rgbw_state_address : " 0/4/88" # RGB(W) individual object light # color mode: rgb / rgbw - name : " RGBW individual light" address : " 1/0/9" # optional for individual color lights individual_colors : red : brightness_address : " 0/4/61" brightness_state_address : " 0/5/61" green : brightness_address : " 0/4/62" brightness_state_address : " 0/5/62" blue : brightness_address : " 0/4/63" brightness_state_address : " 0/5/63" white : brightness_address : " 0/4/64" brightness_state_address : " 0/5/64" # tunable white light # color mode: color_temp - name : " TW light" address : " 1/0/21" state_address : " 1/1/21" brightness_address : " 1/2/21" brightness_state_address : " 1/3/21" color_temperature_address : " 1/4/21" color_temperature_state_address : " 1/5/21" color_temperature_mode : absolute min_kelvin : 2550 max_kelvin : 6200 # actuator without dedicated state group object # color mode: onoff - name : " Simple light" address : " 1/0/5" state_address : " 1/0/5"
The KNX notify platform allows you to send notifications to KNX devices as DPT16 strings.
knx : notify : - name : " Alarm" address : " 5/1/10"
KNX group address the notification will be sent to. DPT 16
type string ( Optional , default: latin_1 )
A DPT identifier representing a text value (“string” or “latin_1” - see KNX Sensor ) used to encode the notification.
Example action
action : notify.send_message data : message : " Hello from HA!" entity_id : notify.alarm
The KNX number platform allows you to send generic numeric values to the KNX bus and update its state from received telegrams. It can optionally respond to read requests from the KNX bus.
Number entities without a state_address will restore their last known state after Home Assistant was restarted.
Numbers that have a state_address configured request their current state from the KNX bus.
Number entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX number entities via YAML
# Example configuration.yaml entry knx : number : - name : " Duration" address : " 0/0/1" type : time_period_sec - name : " Volume" address : " 0/0/2" state_address : " 0/0/3" type : percent - name : " Temperature threshold" address : " 0/0/4" respond_to_read : true type : temperature min : 20 max : 24.5 step : 0.1 mode : slider
The group address to which new values will be sent.
Group address for retrieving the state from the KNX bus.
Any supported type of KNX Sensor representing a numeric value (e.g., “percent” or “temperature”).
min float ( Optional )
Minimum value that can be sent. Defaults to the type DPT minimum value.
max float ( Optional )
Maximum value that can be sent. Defaults to the type DPT maximum value.
step float ( Optional )
Step value. Defaults to the step size defined for the DPT in the KNX specifications.
mode string ( Optional , default: auto )
Specifies the mode used in the UI. auto , box or slider are valid.
Overrides the DPT’s default device class , changing the device state and icon that is displayed on the frontend.
unit_of_measurement string ( Optional )
Overrides the DPT’s default native unit of measurement. The unit must be valid for the selected device class.
The KNX scene platform allows you to activate KNX scenes and updates scene entities when the corresponding scene number is received on the KNX bus.
Scene entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX scene entities via YAML
# Example configuration.yaml entry knx : scene : - name : " Romantic" address : 8/8/8 scene_number : 23
KNX group address for the scene. DPT 17.001
scene_number integer Required
KNX scene number to be activated (range 1..64 ).
The KNX select platform allows the user to define a list of values that can be selected via the frontend and can be used within conditions of automation. When a user selects a new item, the assigned generic raw payload is sent to the KNX bus. A received telegram updates the state of the select entity. It can optionally respond to read requests from the KNX bus.
Select entities without a state_address will restore their last known state after Home Assistant was restarted.
Selects that have a state_address configured request their current state from the KNX bus.
# Example configuration.yaml entry knx : select : - name : " DPT 2 selector" address : " 0/0/1" payload_length : 0 options : - option : " No control" payload : 0 - option : " Control On" payload : 0b10 - option : " Control Off" payload : 0b11 - name : " DHWMode" address : " 0/0/2" state_address : " 0/0/3" payload_length : 1 options : - option : " Auto" payload : 0 - option : " LegioProtect" payload : 1 - option : " Normal" payload : 2 - option : " Reduced" payload : 3 - option : " Off/FrostProtect" payload : 4
payload_length integer Required
The length of the payload expected for the DPT. Use 0 for DPT 1, 2 or 3.
options list Required
List of options to choose from. Each option and payload have to be unique.
option string Required
The name of the option used to trigger the assigned payload .
payload integer Required
The raw payload assigned to the option .
The KNX sensor platform allows you to monitor KNX sensors.
Sensors are read-only entities. To write to the KNX bus, configure a KNX Number entity or use the knx.send action .
Sensor entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX sensor entities via YAML
# Example configuration.yaml entry knx : sensor : - name : " Heating Valve 1" state_address : " 2/0/0" type : percent
To actively read the sensor data from the bus every 30 minutes you can add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry knx : sensor : - name : " Heating Valve 1" state_address : " 2/0/0" type : percent sync_state : every 30
KNX group address of the sensor.
A type from the value types table below must be defined. The DPT of the group address should match the expected KNX DPT to be parsed correctly.
always_callback boolean ( Optional , default: false )
Defines if telegrams with equal payload as the previously received telegram should trigger a state update within Home Assistant.
state_class string ( Optional )
Overrides the DPT’s default state_class .
# Example configuration.yaml entry knx : sensor : - name : " Heating Valve 1" state_address : " 2/0/0" sync_state : init type : percent - name : " Kitchen Temperature" state_address : " 6/2/1" sync_state : every 60 type : temperature state_class : measurement
The KNX switch platform is used as an interface to switching actuators.
Switch entities can be created from the frontend in the KNX panel or via YAML.
Switch entities without a state_address will restore their last known state after Home Assistant was restarted.
Switches that have a state_address configured request their current state from the KNX bus.
Configuration of KNX switch entities via YAML
knx : switch : - name : " Kitchen coffee maker" address : " 1/1/6"
KNX group address for switching the switch on/off. DPT 1
Separate KNX group address for retrieving the switch state. DPT 1
Invert the telegrams payload before processing or sending.
The optional state_address can be used to inform Home Assistant about state changes not triggered by a telegram to the address e.g., if you configure a timer on a channel. If a KNX message is seen on the bus addressed to the given state address, this will overwrite the state of the switch object.
The KNX text platform allows you to send text values to the KNX bus and update its state from received telegrams. It can optionally respond to read requests from the KNX bus.
Text entities without a state_address will restore their last known state after Home Assistant was restarted.
Texts that have a state_address configured request their current state from the KNX bus.
Text entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX text entities via YAML
# Example configuration.yaml entry knx : text : - name : " Info" address : " 0/0/1" - name : " ASCII Info" address : " 0/0/2" state_address : " 0/0/3" type : string - name : " Greeting" address : " 0/0/4" respond_to_read : true
type string | integer ( Optional , default: latin_1 )
Either latin_1 for DPT 16.001 or string for DPT 16.000 (ASCII).
mode string ( Optional , default: text )
Specifies the mode used in the UI. text or password are valid.
The KNX time platform allows you to send time values to the KNX bus and update its state from received telegrams. It can optionally respond to read requests from the KNX bus.
Time entities without a state_address will restore their last known state after Home Assistant was restarted.
Times that have a state_address configured request their current state from the KNX bus.
The day field of the time telegram will always be set to 0 ( no day ).
Time entities can be created from the frontend in the KNX panel or via YAML.
Configuration of KNX time entities via YAML
# Example configuration.yaml entry knx : time : - name : " Time" address : " 0/0/2" state_address : " 0/0/2"
The group address to which new values will be sent. DPT 10.001
Group address for retrieving the state from the KNX bus. DPT 10.001
The KNX weather platform is used as an interface to KNX weather stations.
To use your KNX weather station in your installation, add the following lines to your top-level KNX Integration configuration key in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry knx : weather : - name : " Home" address_temperature : " 7/0/0" address_brightness_south : " 7/0/1" address_brightness_west : " 7/0/2" address_brightness_east : " 7/0/3" address_brightness_north : " 7/0/11" address_wind_speed : " 7/0/4" address_rain_alarm : " 7/0/5" address_frost_alarm : " 7/0/6" address_wind_alarm : " 7/0/7" address_day_night : " 7/0/8" address_air_pressure : " 7/0/9" address_humidity : " 7/0/10" sync_state : true
address_temperature string | list Required
KNX group address for reading current outside temperature from KNX bus. DPT 9.001
address_brightness_south string | list ( Optional )
KNX group address for reading current brightness to south coordinate from KNX bus. DPT 9.004
address_brightness_west string | list ( Optional )
KNX group address for reading current brightness to west coordinate from KNX bus. DPT 9.004
address_brightness_east string | list ( Optional )
KNX group address for reading current brightness to east coordinate from KNX bus. DPT 9.004
address_brightness_north string | list ( Optional )
KNX group address for reading current brightness to north coordinate from KNX bus. DPT 9.004
address_wind_bearing string | list ( Optional )
KNX group address for reading current wind bearing from KNX bus. DPT 5.003
address_wind_speed string | list ( Optional )
KNX group address for reading current wind speed from KNX bus. DPT 9.005
address_rain_alarm string | list ( Optional )
KNX group address for reading if rain alarm is on/off.
address_frost_alarm string | list ( Optional )
KNX group address for reading if frost alarm is on/off.
address_wind_alarm string | list ( Optional )
KNX group address for reading if wind alarm is on/off.
address_day_night string | list ( Optional )
KNX group address for reading if it’s day/night.
address_air_pressure string | list ( Optional )
KNX address reading current air pressure. DPT 9.006 or 14.058
address_humidity string | list ( Optional )
The following table lists the supported numeric Data Point Types (DPT). You can use either the type field or the DPT number as a string in your YAML configuration to specify the data type for your entities.
KNX DPT type size in byte range unit 5 1byte_unsigned 1 0 … 255 5.001 percent 1 0 … 100 % 5.003 angle 1 0 … 360 ° 5.004 percentU8 1 0 … 255 % 5.005 decimal_factor 1 0 … 255 5.006 tariff 1 0 … 254 5.010 pulse 1 0 … 255 counter pulses 6 1byte_signed 1 -128 … 127 6.001 percentV8 1 -128 … 127 % 6.010 counter_pulses 1 -128 … 127 counter pulses 7 2byte_unsigned 2 0 … 65535 7.001 pulse_2byte 2 0 … 65535 pulses 7.002 time_period_msec 2 0 … 65535 ms 7.003 time_period_10msec 2 0 … 65535 ms 7.004 time_period_100msec 2 0 … 65535 ms 7.005 time_period_sec 2 0 … 65535 s 7.006 time_period_min 2 0 … 65535 min 7.007 time_period_hrs 2 0 … 65535 h 7.011 length_mm 2 0 … 65535 mm 7.012 current 2 0 … 65535 mA 7.013 brightness 2 0 … 65535 lx 7.600 color_temperature 2 0 … 65535 K 8 2byte_signed 2 -32768 … 32767 8.001 pulse_2byte_signed 2 -32768 … 32767 pulses 8.002 delta_time_ms 2 -32768 … 32767 ms 8.003 delta_time_10ms 2 -32768 … 32767 ms 8.004 delta_time_100ms 2 -32768 … 32767 ms 8.005 delta_time_sec 2 -32768 … 32767 s 8.006 delta_time_min 2 -32768 … 32767 min 8.007 delta_time_hrs 2 -32768 … 32767 h 8.010 percentV16 2 -32768 … 32767 % 8.011 rotation_angle 2 -32768 … 32767 ° 8.012 length_m 2 -32768 … 32767 m 9 2byte_float 2 -671088.64 … 670760.96 9.001 temperature 2 -273 … 670760 °C 9.002 temperature_difference_2byte 2 -670760 … 670760 K 9.003 temperature_a 2 -670760 … 670760 K/h 9.004 illuminance 2 0 … 670760 lx 9.005 wind_speed_ms 2 0 … 670760 m/s 9.006 pressure_2byte 2 0 … 670760 Pa 9.007 humidity 2 0 … 670760 % 9.008 ppm 2 -671088.64 … 670760.96 ppm 9.009 air_flow 2 -671088.64 … 670760.96 m³/h 9.010 time_1 2 -670760 … 670760 s 9.011 time_2 2 -670760 … 670760 ms 9.020 voltage 2 -671088.64 … 670760.96 mV 9.021 curr 2 -671088.64 … 670760.96 mA 9.022 power_density 2 -671088.64 … 670760.96 W/m² 9.023 kelvin_per_percent 2 -671088.64 … 670760.96 K/% 9.024 power_2byte 2 -671088.64 … 670760.96 kW 9.025 volume_flow 2 -671088.64 … 670760.96 l/h 9.026 rain_amount 2 -671088.64 … 670760.96 l/m² 9.027 temperature_f 2 -459.6 … 670760 °F 9.028 wind_speed_kmh 2 0 … 670760 km/h 9.029 absolute_humidity 2 0 … 670760 g/m³ 9.030 concentration_ugm3 2 0 … 670760 μg/m³ 9.? enthalpy 2 -671088.64 … 670760.96 H 12 4byte_unsigned 4 0 … 4294967295 12.001 pulse_4_ucount 4 0 … 4294967295 counter pulses 12.100 long_time_period_sec 4 0 … 4294967295 s 12.101 long_time_period_min 4 0 … 4294967295 min 12.102 long_time_period_hrs 4 0 … 4294967295 h 12.1200 volume_liquid_litre 4 0 … 4294967295 l 12.1201 volume_m3 4 0 … 4294967295 m³ 13 4byte_signed 4 -2147483648 … 2147483647 13.001 pulse_4byte 4 -2147483648 … 2147483647 counter pulses 13.002 flow_rate_m3h 4 -2147483648 … 2147483647 m³/h 13.010 active_energy 4 -2147483648 … 2147483647 Wh 13.011 apparant_energy 4 -2147483648 … 2147483647 VAh 13.012 reactive_energy 4 -2147483648 … 2147483647 VARh 13.013 active_energy_kwh 4 -2147483648 … 2147483647 kWh 13.014 apparant_energy_kvah 4 -2147483648 … 2147483647 kVAh 13.015 reactive_energy_kvarh 4 -2147483648 … 2147483647 kVARh 13.016 active_energy_mwh 4 -2147483648 … 2147483647 MWh 13.100 long_delta_timesec 4 -2147483648 … 2147483647 s 13.1200 delta_volume_liquid_litre 4 -2147483648 … 2147483647 L 13.1201 delta_volume_m3 4 -2147483648 … 2147483647 m³ 14 4byte_float 4 14.000 acceleration 4 m/s² 14.001 acceleration_angular 4 rad/s² 14.002 activation_energy 4 J/mol 14.003 activity 4 s⁻¹ 14.004 mol 4 mol 14.005 amplitude 4 14.006 angle_rad 4 rad 14.007 angle_deg 4 ° 14.008 angular_momentum 4 J s 14.009 angular_velocity 4 rad/s 14.010 area 4 m² 14.011 capacitance 4 F 14.012 charge_density_surface 4 C/m² 14.013 charge_density_volume 4 C/m³ 14.014 compressibility 4 m²/N 14.015 conductance 4 S 14.016 electrical_conductivity 4 S/m 14.017 density 4 kg/m³ 14.018 electric_charge 4 C 14.019 electric_current 4 A 14.020 electric_current_density 4 A/m² 14.021 electric_dipole_moment 4 C m 14.022 electric_displacement 4 C/m² 14.023 electric_field_strength 4 V/m 14.024 electric_flux 4 c 14.025 electric_flux_density 4 C/m² 14.026 electric_polarization 4 C/m² 14.027 electric_potential 4 V 14.028 electric_potential_difference 4 V 14.029 electromagnetic_moment 4 A m² 14.030 electromotive_force 4 V 14.031 energy 4 J 14.032 force 4 N 14.033 frequency 4 Hz 14.034 angular_frequency 4 rad/s 14.035 heatcapacity 4 J/K 14.036 heatflowrate 4 W 14.037 heat_quantity 4 J 14.038 impedance 4 Ω 14.039 length 4 m 14.040 light_quantity 4 lm s 14.041 luminance 4 cd/m² 14.042 luminous_flux 4 lm 14.043 luminous_intensity 4 cd 14.044 magnetic_field_strength 4 A/m 14.045 magnetic_flux 4 Wb 14.046 magnetic_flux_density 4 T 14.047 magnetic_moment 4 A m² 14.048 magnetic_polarization 4 T 14.049 magnetization 4 A/m 14.050 magnetomotive_force 4 A 14.051 mass 4 kg 14.052 mass_flux 4 kg/s 14.053 momentum 4 N/s 14.054 phaseanglerad 4 rad 14.055 phaseangledeg 4 ° 14.056 power 4 W 14.057 powerfactor 4 14.058 pressure 4 Pa 14.059 reactance 4 Ω 14.060 resistance 4 Ω 14.061 resistivity 4 Ωm 14.062 self_inductance 4 H 14.063 solid_angle 4 sr 14.064 sound_intensity 4 W/m² 14.065 speed 4 m/s 14.066 stress 4 Pa 14.067 surface_tension 4 N/m 14.068 common_temperature 4 °C 14.069 absolute_temperature 4 K 14.070 temperature_difference 4 K 14.071 thermal_capacity 4 J/K 14.072 thermal_conductivity 4 W/mK 14.073 thermoelectric_power 4 V/K 14.074 time_seconds 4 s 14.075 torque 4 Nm 14.076 volume 4 m³ 14.077 volume_flux 4 m³/s 14.078 weight 4 N 14.079 work 4 J 14.080 apparent_power 4 VA 14.1200 volume_flux_meter 4 m³/h 14.1201 volume_flux_ls 4 L/s 16.000 string 14 ASCII 16.001 latin_1 14 ISO 8859-1 / Latin-1 17.001 scene_number 1 1 … 64 29 8byte_signed 8 ±9223372036854775807 29.010 active_energy_8byte 8 ±9223372036854775807 Wh 29.011 apparant_energy_8byte 8 ±9223372036854775807 VAh 29.012 reactive_energy_8byte 8 ±9223372036854775807 VARh
The integration aims to be compatible with a wide variety of KNX devices from different manufacturers and eras. However, there are some devices that use non-standard DPT or use telegrams in a proprietary way. In these cases, you might not be able to configure entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] directly through this integration. However, you may still use Template entities with the KNX telegram trigger to work around this.
USB bus interfaces are not directly supported by the underlying xknx library . However, you could try to run a software KNX router such as Calimero or knxd alongside Home Assistant to serve as a USB to IP bridge. For best reliability, using a certified KNX IP interface or router is recommended.
The xknx library is used for KNX communication. It provides various logging handlers for monitoring and debug purposes.
Add the following lines to your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] to activate them:
logger : default : warning logs : # For most debugging needs `xnx.log` and `xknx.telegram` are a good choice. xknx : info # sets the level of all loggers # Loggers for different layers of KNX communication xknx.log : debug # provides general information (connection, etc.) xknx.telegram : debug # logs telegrams before they are being processed or sent xknx.cemi : debug # logs incoming and outgoing CEMI frames xknx.data_secure : debug # logs Data Secure relevant information xknx.ip_secure : debug # logs IP Secure relevant information xknx.knx : debug # logs incoming and outgoing KNX/IP frames xknx.raw_socket : warning # logs incoming UDP/TCP frames in raw hex format at socket level # Loggers for xknx internals xknx.ga_dpt : warning # logs when payloads can't be decoded with given project file information xknx.state_updater : warning # provides information about the state updater
You can use the logger.set_level action to change the log level of a handler on a running instance.
Every *_state_address is read on startup sequentially if not configured differently. If you see the following errors in your log, a group address could not be read by a GroupValueRead request from Home Assistant in time.
> Could not sync group address '1/2/3' (Entity name - Feature)
> Error: KNX bus did not respond in time (2.0 secs) to GroupValueRead request for: '1/2/3'
No group object (GO) assigned to the group address (GA) has the Read-Flag set in ETS
Enable the read flag for one GO assigned to the GA. Use the one most likely to hold the current state (e.g., for a light entity’s brightness_state_address the according GO of the dimming actuator).
Response telegrams are not passing a line coupler, router or other filter in the installation
Assign the group addresses used by Home Assistant to the used interface in ETS if your interface application supports that. ETS will generate filter tables that are applied to your line couplers after updating their application.
If your interface application doesn’t support that, use a dummy device in ETS for Home Assistant. These can be found in the ETS online catalog. Assign it to the line your interface connects Home Assistant to and link its group objects to the group addresses you are using in Home Assistant.
Unresponsive system
The timeout for logging the errors (2 seconds) is started when the GroupValueRead request is scheduled to be sent. On systems experiencing high loads sending can be delayed (e.g., Raspberry Pi running lots of integrations at startup).
Incoming response telegrams are always processed, so no information gets lost.
If you find following error in your log you seem to have a duplicated entity in your configuration.
Platform knx does not generate unique IDs. ID 1/2/3 already exists - ignoring platform.name
The unique_id for KNX entities is generated based on required configuration values.
binary_sensor: state_address
climate: temperature_address target_temperature_state_address target_temperature_address setpoint_shift_address
cover: move_long_address position_address
fan: address
light: address or all combined brightness_address if only individual_colors is used
notify: address
scene: address and scene_number
sensor: state_address
switch: address
weather: address_temperature
There cannot be multiple entities on the same platform sharing these exact group addresses, even if they differ in other configuration.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
In addition, remove knx: from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
Warning
Removing the integration will delete an uploaded keyring file, ETS project information, telegram history, and all entity configuration done via the UI panel.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The KNX hub was introduced in Home Assistant 0.24, and it's used by
1.6% of the active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Julius2342
@farmio
@marvin-w
Categories
Hub
Notifications
Back to top
