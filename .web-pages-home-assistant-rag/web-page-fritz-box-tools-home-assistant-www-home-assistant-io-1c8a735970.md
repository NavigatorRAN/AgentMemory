---
source_url: "https://www.home-assistant.io/integrations/fritz"
final_url: "https://www.home-assistant.io/integrations/fritz"
canonical_url: "https://www.home-assistant.io/integrations/fritz/"
source_handle: "web:www-home-assistant-io:1c8a735970b6"
source_section: "integrations-fritz"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a12260743f98ac00981ddc57cb552a922afddae84f1b820c95621a81424e20c3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# FRITZ!Box Tools - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fritz
- Final URL: https://www.home-assistant.io/integrations/fritz
- Canonical URL: https://www.home-assistant.io/integrations/fritz/
- Fetched at: 2026-06-28T02:44:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate FRITZ!Box routers into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Username
Configuration
Options
Supported functionality
Data updates
Actions
Action: Set guest Wi-Fi password
Action: Dial
Additional information
Parental control switches
Device tracker
Port forward switches
WiFi switches
Example Automations and Scripts
Use cases
Script: Reconnect / get new IP
Automation: Reconnect / get new IP every night
Automation: Phone notification with Wi-Fi credentials when guest Wi-Fi is created
Troubleshooting
Authentication fails for a FRITZ!Repeater
Device presence detection is not working as expected
Remove the integration
To remove an integration instance from Home Assistant
Related topics
The FRITZ!Box Tools integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your FRITZ!Box router (by FRITZ!, formerly AVM) and have presence detection for connected network devices.
There is support for the following device families within Home Assistant:
FRITZ!Box routers (4xx0, 5xx0, 6xx0, 7xx0)
FRITZ!Repeater (600, 1200/AX, 2400, 3000/AX)
Important
Both the TR-064 ( Permit access for apps ) and UPnP ( Transmit status information over UPnP ) protocol needs to be enabled in the FRITZ!Box under Home Network > Network > Network settings > Access Settings in the Home Network for Home Assistant to log in and read device info.
To use the dial action, the click to dial service of the FRITZ!Box must also be enabled under Telephony > Calls > Click to Dial .
It is recommended to create a separate user to connect Home Assistant to your FRITZ!Box. To create a user, in the FRITZ!Box go to System > FRITZ!Box Users > Users > Add User . Make sure the user has the FRITZ!Box Settings permission.
Note
If you still want to use the predefined user, as of FRITZ!OS 7.24, the FRITZ!Box creates a random username for the admin user if you didn’t set one yourself. This can be found after logging into the FRITZ!Box and visiting System > FRITZ!Box Users > Users . The username starts with fritz followed by four random numbers. Under properties on the right it says created automatically . Before FRITZ!OS 7.24, the default username was admin .
FRITZ!Powerline devices do not validate the Username value. Only the Password value is checked, so you can enter any value in Username .
To add the FRITZ!Box Tools hub to your Home Assistant instance, use this My button:
FRITZ!Box Tools can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FRITZ!Box Tools .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your FRITZ!Box router.
Port
The port used to connect to your FRITZ!Box router. Leave it empty to use the default port.
Name of the user to connect Home Assistant to your FRITZ!Box ( see username )
Password
Password for the user to connect Home Assistant to your FRITZ!Box ( see username )
Uses an SSL certificate
Whether to use SSL encryption for connecting to your FRITZ!Box router.
Enable network device tracking
Whether to enable or disable the network device tracking feature. When disabled, all network device related entities ( Parental control switches, Device tracker and WoL buttons ) will also be removed or not created.
To define options for FRITZ!Box Tools, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of FRITZ!Box Tools are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Consider home
Number of seconds that must elapse before considering a disconnected device “not at home”.
Enable old discovery method
Required in scenarios such as networks without mesh support ( FritzOS <= 6.x ) or mixed brands network devices or LAN switches.
The FRITZ!Box Tools integration provides the following main features:
Device tracker Device trackers are used to track the presence, or location, of a device. [Learn more] - presence detection by looking at connected devices.
Binary sensor A binary sensor returns information about things that only have two states - such as on or off. [Learn more] - connectivity status.
Image The Image integration allows other integrations to display a static image. [Learn more] - QR code for Guest Wi-Fi.
Button A button entity can fire an event, or trigger an action towards a device or service. It can be compared to a physical push button. The button entity does not have a state like on or off , but keeps the timestamp of when it was last pressed in the Home Assistant UI or via an action. [Learn more] - reboot, reconnect, firmware update.
Sensor Sensors return information about a thing, for instance the level of water in a tank. [Learn more] - external IP address, uptime, CPU temperature, and network monitors.
Switch Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] - call deflection, port forward, parental control and Wi-Fi networks.
Update An update entity is an entity that indicates if an update is available for a device or service. [Learn more] - firmware status of the device.
This integration fetches the data every 30 seconds from the FRITZ!Box router.
Available actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] :
set_guest_wifi_password
dial
The fritz.set_guest_wifi_password action allows you to set a new password for the guest Wi-Fi. The password length must be between 8 and 63 characters long.
Data attribute Required Description device_id yes Only act on a specific router password no New password for the guest wifi ( will be auto-generated if not defined ) length no Length of the auto-generated password. ( default 12 )
The fritz.dial action allows you to make the FRITZ!Box dial a phone number.
Data attribute Required Description device_id yes Only act on a specific router number yes The phone number to dial max_ring_seconds yes The maximum number of seconds to ring after dialing. Note that the actual ring duration might be shorter depending on the receiver’s phone settings. ( default 15 seconds )
Parental control switches Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] can be used to enable and disable internet access of individual devices. You can also find the current blocking state of the individual devices in the UI of the FRITZ!Box under Internet > Filters > Parental Controls > Device Block .
Note : If you don’t want to automatically track newly detected devices, disable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] system option Enable new added entities .
Due to security reasons, FRITZ! implemented the ability to enable/disable a port forward rule only from the host involved in the rule. As a result, this integration will create entities only for rules that have your Home Assistant host as a destination.
Note 1 : On your FRITZ!Box under Internet > Permit Access , enable the setting Permit independent port sharing for this device for the device which runs HA.
Note 2 : Only works if you have a dedicated IPv4 address ( it won’t work with DS-Lite )
WiFi switches Switches are things that have two states you can select between, such as turning on or off a socket. [Learn more] are created for each SSID the FRITZ!Box is serving. With these switches, one can activate and deactivate each single SSID.
Note 1 : In a mesh setup, the WiFi settings are adopted by each mesh repeater ( Home Network > Mesh > Mesh Settings > Automatically Adopting Settings from the Mesh )
Note 2 : For mesh repeaters, these switches are disabled by default, but can be enabled. When your mesh is based on a WiFi connection between the mesh master and the mesh repeater, the WiFi switches won’t be created for the mesh repeater either.
You can use the FRITZ!Box Tools integration for a variety of smart home scenarios, such as:
Automatically reconnect your internet connection at night : Schedule a reconnect or reboot of your FRITZ!Box to refresh your external IP address or resolve connectivity issues.
Send Wi-Fi credentials to your phone when guest Wi-Fi is enabled : Automate notifications with the guest Wi-Fi password when you turn on the guest network.
Control internet access for your kids’ devices : Use parental control switches to enable or disable internet access for specific devices at set times.
Monitor who is home : Track presence based on connected devices, and trigger automations when people arrive or leave.
Monitor your network health : Get alerts if your FRITZ!Box goes offline, or monitor network statistics and device status.
Automate port forwarding : Enable or disable port forwarding rules for your Home Assistant host as needed for remote access or security.
Below are some example automations and scripts to help you get started:
The following script Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] can be used to easily add a reconnect button to your UI. If you want to reboot your FRITZ!Box, you can use fritz.reboot instead.
fritz_box_reconnect : alias : " Reconnect FRITZ!Box" sequence : - action : button.press target : entity_id : button.fritzbox_7530_reconnect
automation : - alias : " Reconnect FRITZ!Box" triggers : - trigger : time at : " 05:00:00" actions : - action : button.press target : entity_id : button.fritzbox_7530_reconnect
automation : - alias : " Guests Wi-Fi Turned On -> Send Password To Phone" triggers : - trigger : state entity_id : switch.fritzbox_7530_wifi_myssid to : " on" actions : - action : notify.notify data : title : " Guest Wi-Fi is enabled" message : " Password: ..."
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue re-occurs stop the debug logging again ( download of debug log file will start automatically ). Further if still possible , please also download the diagnostics data . If you have collected the debug log and the diagnostics data, provide them with the issue report.
Some FRITZ!Repeater models with newer FRITZ!OS versions use their own users for app access. If Home Assistant reports an authentication error after a repeater firmware update, sign in to the repeater web interface and go to System > FRITZ!Box Users > Users .
Create a dedicated user for Home Assistant on the repeater, or use an existing local repeater user in the integration ( see username section above for details ). In a mesh setup, do not assume that a user from the main FRITZ!Box is also available on the repeater.
Check if one of the following cases applies:
You see a device as still present, even if it is offline or disconnected for more than the configured consider home seconds.
You’re using additional network equipment like a network switch or Wi-Fi access point other than a Fritz!Repeater or other FRITZ! components, but not configured as a mesh in your home network.
If one of the above cases applies to your setup, try enabling the old discovery method in the integration options . This might resolve the issue.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you don’t use the separately created FRITZ!Box user anymore, then remove it from the FRITZ!Box under System > FRITZ!Box Users > Users .
Enabling or disabling entities
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FRITZ!Box Tools hub was introduced in Home Assistant 0.10, and it's used by
8.9% of the active installations.
Its IoT class is Local Polling.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@AaronDavidSchneider
@chemelli74
@mib1185
Categories
Binary sensor
Image
Presence detection
Sensor
Update
Back to top
