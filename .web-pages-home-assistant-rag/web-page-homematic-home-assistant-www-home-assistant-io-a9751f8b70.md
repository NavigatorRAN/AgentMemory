---
source_url: "https://www.home-assistant.io/integrations/homematic"
final_url: "https://www.home-assistant.io/integrations/homematic"
canonical_url: "https://www.home-assistant.io/integrations/homematic/"
source_handle: "web:www-home-assistant-io:a9751f8b7093"
source_section: "integrations-homematic"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "211a277828684e45a46c1ee4ce8e61c013d1577de79646bb84f64c839e941b6d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Homematic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/homematic
- Final URL: https://www.home-assistant.io/integrations/homematic
- Canonical URL: https://www.home-assistant.io/integrations/homematic/
- Fetched at: 2026-06-28T02:49:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for integrating Homematic into Home Assistant.

## Extracted Text

On this page
Configuration
Example configuration with multiple protocols and some other options set
The resolvenames option
Multiple hosts
Reading attributes of entities
Variables
Events
List of actions
Integrating HMIP-DLD
Detecting lost connections
Notifications
Usage
Related topics
The Homematic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides bi-directional communication with your CCU/Homegear. It uses an XML-RPC connection to set values on devices and subscribes to receive events the devices and the CCU emit.
If you are using Homegear with paired Intertechno devices, uni-directional communication is possible as well.
There is currently support for the following device types within Home Assistant:
Binary sensor
Climate
Cover
Light
Lock
Sensor
Switch
Device support is available for most of the wired and wireless devices, as well as a lot of IP devices. If you have a setup with mixed protocols, you have to configure additional interfaces with the appropriate ports. The default is using port 2001, which are wireless devices. Wired devices usually are available through port 2000 and IP devices through port 2010. The virtual thermostatgroups the CCU provides use port 9292 and require you to set the path setting to /groups . When using SSL on a CCU3, by default the same ports as usual with a prepended 4 are available. So 2001 becomes 42001, 2010 becomes 42010, and so on.
Important
Since CCU Version 3, the internal firewalls are enabled by default. You have to grant full access for the XML-RPC API or specify the IP-address of the Home Assistant instance and allowlist it, inside the CCU’s security settings.
If you want to see if a specific device you have is supported, head over to the pyhomematic repository and browse through the source code. A dictionary with the device identifiers (e.g., HM-Sec-SC-2) can be found within the relevant modules near the bottom. If your device is not supported, feel free to contribute.
We automatically detect all devices we currently support and try to generate useful names. If you enable name-resolving, we try to fetch names from Metadata (Homegear), via JSON-RPC or the XML-API you may have installed on your CCU. Since this may fail this is disabled by default.
You can manually rename the created entities by using Home Assistant’s Customizing feature. The Homematic integration is also supported by the Entity Registry , which allows you to change the friendly name and the entity ID directly in the Home Assistant UI.
To set up the integration, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
homematic : interfaces : wireless : host : 127.0.0.1
Configuration variables (global):
Configuration Variables
Looking for your configuration file?
interfaces list Required
Configuration for each XML-RPC interface to integrate into Home Assistant.
hosts list ( Optional )
Configuration for each Hub (CCU/Homegear) to integrate into Home Assistant.
local_ip string ( Optional , default: 0.0.0.0 )
IP of device running Home Assistant. Override auto-detected value for exotic network setups.
local_port integer ( Optional )
Port for connection with Home Assistant. By default it is randomly assigned.
Configuration variables (interface):
host string Required
IP address or hostname of CCU/Homegear device or app for Home Assistant.
port integer ( Optional )
Port of CCU/Homegear XML-RPC Server. Wireless: 2001, wired: 2000, IP: 2010, thermostatgroups: 9292. With enabled SSL on the CCU3 usually a 4 is prepended to the Port. e.g., 2001 becomes 42001 with enabled SSL.
ssl boolean ( Optional , default: false )
Set to true if SSL support is enabled on the CCU3.
verify_ssl boolean ( Optional , default: false )
Set to true if a valid certificate is being used. The default is false as usually a self-signed certificate is configured.
callback_ip string ( Optional )
Set this, if Home Assistant is reachable under a different IP from the CCU (such as NAT or Docker).
callback_port integer ( Optional )
Set this, if Home Assistant is reachable under a different port from the CCU (such as NAT or Docker).
resolvenames string ( Optional , default: false )
Try to fetch device names. Defaults to false if not specified.
jsonport integer ( Optional )
Port of CCU JSON-RPC Server. The default is 80, but it may be different when running CCU virtually via Docker or with enabled SSL.
username string ( Optional )
When fetching names via JSON-RPC, you need to specify a user with guest-access to the CCU. Admin-access is required if you work with variables on the CCU.
password string ( Optional )
When fetching names via JSON-RPC, you need to specify the password of the user you have configured above.
path string ( Optional )
Set to /groups when using port 9292.
Configuration variables (host):
IP address of CCU/Homegear device.
Port of CCU/Homegear XML-RPC Server. Wireless: 2001, wired: 2000, IP: 2010
When fetching names via JSON-RPC, you need to specify a user with guest-access to the CCU.
homematic : interfaces : rf : host : 127.0.0.1 resolvenames : " json" username : " Admin" password : " secret" wired : host : 127.0.0.1 port : 2000 resolvenames : " json" username : " Admin" password : " secret" ip : host : 127.0.0.1 port : 2010 groups : host : 127.0.0.1 port : 9292 resolvenames : " json" username : " Admin" password : " secret" path : /groups hosts : ccu2 : host : 127.0.0.1 port : 2001 username : " Admin" password : " secret"
We use three approaches to fetch the names of devices. Each assumes you have properly named your devices in your existing Homematic setup. As a general advice: Use ASCII for your devices names. Home Assistant won’t include non-ASCII characters in entity-names.
json : The CCU allows you to fetch details of the paired devices via JSON-RPC. For this to work, you need to add valid credentials to your integration configuration. Guest-access is sufficient to query for device names.
xml : If you use a CCU, there is a Home Assistant app called the “XML-API”. With it installed, you can fetch all kinds of information from you CCU using XML-RPC. We can leverage this and fetch the names of devices set within the CCU. We don’t support authentication with this method. The json method should be preferred over xml . Support for the XML-API is only available for downwards compatibility and may be disabled in a future release.
metadata : Homegear provides device-names through the metadata devices internally have. When using an HM-CFG-LAN interface, you typically use a configuration software (“HomeMatic-Komponenten konfigurieren” is the name of the shortcut on your desktop by default) to pair and configure your devices. If you have paired devices, you’ll see them listed in a table. The leftmost column (Name) is prefilled with default names. You can click such a name and enter whatever you like.
Resolving names can take some time. So when you start Home Assistant you won’t see you devices at first. For a setup with 20+ devices it can take up to a minute until all devices show up in the UI.
To allow communication with multiple hosts or different protocols in parallel (wireless, wired and IP), multiple connections will be established, each to the configured destination. The name you choose for the host has to be unique and limited to ASCII letters.
Using multiple hosts has the drawback, that the actions (explained below) may not work as expected. Only one connection can be used for actions, which limits the devices/variables an action can use to the scope/protocol of the host.
This does not affect the entities in Home Assistant. They all use their own connection and work as expected.
Most devices have, besides their state, additional attributes like their battery state or valve position. These can be accessed using templates in automations, or even as their own entities using the template sensor integration. Here’s an example of a template sensor that exposes the valve position of a thermostat.
template : - sensor : - name : " Bedroom valve" state : " {{ state_attr('climate.leq123456', 'level') }}"
It is possible to read and set values of system variables you have set up on the CCU/Homegear. The supported types for setting values are float- and bool-variables. With the CCU a user with Admin-access is required.
The states of the variables are available through the attributes of your hub entity (e.g., homematic.ccu2 ). Use templates (as mentioned above) to make your variables available to automations or as entities.
The values of variables are polled from the CCU/Homegear in an interval of 30 seconds. Setting the value of a variable happens instantly and is directly pushed.
When Homematic devices change their state or some other internal value, the CCU/Homegear sends event messages to Home Assistant. These events are automatically parsed and the entities in Home Assistant are updated. However, you can also manually use these events to trigger automations. Two event-types are available:
homematic.keypress : For devices with buttons, see information below
homematic.impulse : For impulse sensors
Devices with buttons
Devices with buttons (e.g., HM-Sen-MDIR-WM55, remote controls) may not be fully visible in the UI. This is intended, as buttons don’t serve any value here and all they do is trigger events.
As an example:
The HM-Sen-MDIR-WM55 motion detector will be displayed as 2 entities. A motion sensor and a brightness sensor. On top of that we have 2 sets (one set per button) of 4 events: PRESS_SHORT, PRESS_LONG, PRESS_CONT, PRESS_LONG_RELEASE. Be aware, that there are devices which don’t provide all of these events. But in general: if you can press it, it usually at least has PRESS_SHORT.
Here’s an example of how to use these events for automations:
automation : triggers : - trigger : event event_type : homematic.keypress event_data : name : " Kitchen Switch" channel : 1 param : PRESS_SHORT actions : - action : switch.turn_on target : entity_id : switch.Kitchen_Ambience
The channel parameter is equal to the channel of the button you are configuring the automation for. You can view the available channels in the UI you use to pair your devices.
The name depends on if you chose to resolve names or not. If not, it will be the device ID (e.g., LEQ1234657). If you chose to resolve names (and that is successful), it will be the name you have set in your CCU or in the metadata (e.g., “Kitchen Switch”).
You can test whether your button works within Home Assistant if you look at the terminal output. When pressing a button, lines similar to those should appear:
2018-01-27 11:51:32 INFO ( Thread-12 ) [ pyhomematic.devicetypes.generic] HMGeneric.event: address = MEQ1234567:6, interface_id = homeassistant-CCU2, key = PRESS_SHORT, value = True
2018-01-27 11:51:32 INFO ( MainThread ) [ homeassistant.core] Bus:Handling <Event homematic.keypress[L]: param = PRESS_SHORT, name = your_nice_name, channel = 6>
2018-01-27 11:51:32 INFO ( Thread-12 ) [ pyhomematic.devicetypes.generic] HMGeneric.event: address = MEQ1234567:6, interface_id = homeassistant-CCU2, key = INSTALL_TEST, value = True
It may happen that “your_nice_name” is not resolved correctly; the according message (#2 in the above example) will be missing. This might be due to secure communication between your HM interface and the HM device. You can change the communication from “secure” to “standard” within your HM-interface to solve that issue (in “Einstellungen” - “Geräte” find your device and change “Übertragungsmodus” from secure to standard) - not recommended for devices that should have secure communication.
homematic.keypress events for Homematic IP devices
To get the homematic.keypress event for some Homematic IP devices like WRC2 / WRC6 (wall switch) or SPDR (passage sensor) or the KRC4 (key ring remote control) you have to temporary create an empty program for each channel in the CCU:
In the menu of your CCU’s admin panel go to Programs and connections > Programs & CCU connection
Go to New in the footer menu
Click the plus icon below Condition: If... and press the button Device selection
Select one of the device’s channels you need (1-2 / 1-6 for WRC2 / WRC6 and 2-3 for SPDR)
Select short or long key press
Save the program with the OK button
Trigger the program by pressing the button as configured in step 5. Your device might indicate success via a green LED or similar. When you select the device in Status and control > Devices on the CCU, the Last Modified field should no longer be empty
When your channel is working now, you can edit it to select the other channels one by one
At the end, you can delete this program from the CCU
The Homematic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Put paramset ( homematic.put_paramset )
Manually changes a Homematic device’s paramset using its putParamset method.
Reconnect ( homematic.reconnect )
Reconnects to all Homematic hubs.
Set device value ( homematic.set_device_value )
Controls a Homematic device manually using its setValue method.
Set install mode ( homematic.set_install_mode )
Sets a Homematic XML-RPC interface into installation mode.
Set variable value ( homematic.set_variable_value )
Sets the value of a Homematic system variable.
Virtual key ( homematic.virtualkey )
Simulates a keypress on a Homematic device or virtual remote.
For an overview of every action across all integrations, see the actions reference .
There is no available default integration for HMIP Doorlock (HMIP-DLD) in the current pyhomematic implementation.
A workaround is to define a template lock in your configuration:
lock : - platform : template name : Basedoor unique_id : basedoor value_template : " {{ is_state('sensor.lock_status', 'locked') }}" lock : action : homematic.set_device_value data : address : " 002A1BE9A792D2" channel : 1 param : LOCK_TARGET_LEVEL value : 0 unlock : action : homematic.set_device_value data : address : " 002A1BE9A792D2" channel : 1 param : LOCK_TARGET_LEVEL value : 1
When the connection to your Homematic CCU or Homegear is lost, Home Assistant will stop getting updates from devices. This may happen after rebooting the CCU for example. Due to the nature of the communication protocol this cannot be handled automatically, so you must call homematic.reconnect in this case. That’s why it is usually a good idea to check if your Homematic integrations are still updated properly, to detect connection losses. This can be done in several ways through an automation:
If you have a sensor which you know will be updated frequently (e.g., an outdoor temperature sensor, voltage sensor or light sensor) you could set up a helper binary sensor and an automation like this:
template : - binary_sensor : - name : " Homematic is sending updates" state : >- {{ (now() - states.sensor.office_voltage.last_changed).seconds < 600 }} automation : - alias : " Homematic Reconnect" triggers : - trigger : state entity_id : binary_sensor.homematic_is_sending_updates to : " off" actions : # Reconnect, if sensor has not been updated for over 10 minutes - action : homematic.reconnect
The important part is the sensor.time entity (from time_date integration). This will update the binary sensor on every change of the sensor and every minute. If the Homematic sensor does not send any updates anymore, the sensor.time will set the binary sensor to off 10 minutes after the last sensor update. This will trigger the automation.
If you have a CCU you can also create a system variable on the CCU, which stores its last reboot time. Since Home Assistant can still refresh system variables from the CCU (even after a reboot) this is another option to call homematic.reconnect . Even though this option might look preferable to many since it does not rely on a sensor, it is less fail-safe than checking for updates of a sensor. Since the variable on the CCU is only changed on boot, any problem that causes the connection between Home Assistant and the CCU to break but will not result in a reboot will not be detected (eg. in case of networking issues). This is how this can be done:
Create a string variable V_Last_Reboot on the CCU
Create a new program on the CCU without any conditions , which executes the following HM-Script with a delay of 30 seconds. The script needs to be implemented within the section Activity: Then .
var obj = dom . GetObject ( " V_Last_Reboot " ); string now = system . Date ( " %d.%m.%Y %H:%M:%S " ); obj . State ( now );
The Homematic CCU will execute all active programs which meet their conditions (none in this case) on every reboot.
Set up a template sensor in Home Assistant, which contains the value of the system variable:
template : - sensor : - name : " v last reboot" state : " {{ state_attr('homematic.ccu2', 'V_Last_Reboot') or '01.01.1970 00:00:00' }}" icon : " mdi:clock"
Set up an automation which calls homematic.reconnect whenever the sensor variable changes:
automation : - alias : " Homematic CCU Reboot" triggers : - trigger : state entity_id : sensor.v_last_reboot actions : - action : homematic.reconnect
The homematic notification platform enables invoking Homematic devices.
To use this notification platform in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : my_hm platform : homematic address : " NEQXXXXXXX" channel : 2 param : " SUBMIT" value : " 1,1,108000,8"
address string Required
The address of your Homematic device. The address is the serial number of the device shown in the CCU in the devices section in the column serial number .
channel integer Required
The channel of your Homematic device.
param string Required
An additional parameter for the Homematic device.
interface string ( Optional )
Set the name of the interface from the configuration.
value string Required
This is the value that is set on the device. It’s device specific.
homematic is a notify platform and can be controlled by calling the notify action as described here .
Only the data part of the event payload is processed. This part can specify or override the value given as configuration variable:
{ "data" : { "address" : "NEQXXXXXXX" , "channel" : 2 , "param" : "SUBMIT" , "value" : "1,1,108000,8" } }
It is possible to provide a template to compute the value:
{ "data" : { "value" : "1,1,108000{% if is_state('binary_sensor.oeqxxxxxxx_state', 'on') %},1{% endif %}{% if is_state('binary_sensor.oeqxxxxxxx_state', 'on') %},2{% endif %}" } }
You can also specify the event payload using a group notification (instead of specifying the value for the notify itself):
notify : - name : my_hm platform : homematic address : NEQXXXXXXX - name : group_hm platform : group services : - action : my_hm data : data : value : " 1,1,108000{% if is_state('binary_sensor.oeqxxxxxxx_state', 'on') %},1{% endif %}{% if is_state('binary_sensor.oeqxxxxxxx_state', 'on') %},2{% endif %}" alert : temperature : name : Temperature too high done_message : Temperature OK entity_id : binary_sensor.temperature_too_high can_acknowledge : true notifiers : - group_hm
The first data element belongs to the my_hm action, while the second one belongs to the event payload.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Homematic integration was introduced in Home Assistant 0.23, and it's used by
1339 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pvizeli
Categories
Hub
Back to top
