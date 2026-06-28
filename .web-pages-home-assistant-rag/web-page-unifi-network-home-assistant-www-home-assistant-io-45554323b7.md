---
source_url: "https://www.home-assistant.io/integrations/unifi"
final_url: "https://www.home-assistant.io/integrations/unifi"
canonical_url: "https://www.home-assistant.io/integrations/unifi/"
source_handle: "web:www-home-assistant-io:45554323b76e"
source_section: "integrations-unifi"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "66e3ded9af6b99ebcbed8b7be58238e3abaca0125d32eae518d753929d121e91"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# UniFi Network - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/unifi
- Final URL: https://www.home-assistant.io/integrations/unifi
- Canonical URL: https://www.home-assistant.io/integrations/unifi/
- Fetched at: 2026-06-28T03:24:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure UniFi Network integration with UniFi Network application by Ubiquiti.

## Extracted Text

On this page
Prerequisites
Hardware support
Software support
Local user
Configuration
Configuration options
Button
Power cycle PoE
Restart UniFi device
WLAN regenerate password
Image
Presence detection
Troubleshooting and Time Synchronization
List of actions
Switch
Block network access for clients
PoE port control
Port control
Control DPI Traffic Restrictions
Control WLAN availability
Control Port Forwarding Rules
Control Traffic Rules
Control Policy-Based Routing Rules
Control Zone-Based Firewall Policies
Sensor
Bandwidth sensor
Wired client link speed sensor
Wlan clients sensor
Uptime sensor
Power Outlet sensor
Device temperature sensor
Device state
Device CPU
Device memory
Port Bandwidth sensor
Port link speed sensor
Light
LED control
Firmware updates
Examples
Community blueprints
Data updates
Known limitations
Removing a device in Home Assistant
Debugging integration
UniFi Network by Ubiquiti Networks, inc. is a software that binds gateways, switches and wireless access points together with one graphical front end.
With this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you can bring your UniFi Network into Home Assistant to automate and monitor your network. Common use cases include:
Use connected clients as presence detection to trigger automations when family members arrive home or leave.
Control Wi-Fi availability on a schedule, for example to disable guest networks overnight or pause kids’ Wi-Fi during homework time.
Monitor bandwidth usage and uptime of clients and network devices.
Control PoE power on individual switch ports to remotely restart connected devices like cameras or access points.
Toggle firewall rules, port forwarding, or traffic rules as part of broader home automations.
Get notified about firmware updates and install them from Home Assistant.
This integration supports all UniFi OS Consoles that run UniFi Network. It also supports self hosted versions of UniFi Network.
It is recommended to run latest stable versions of UniFi Network and UniFi OS.
Important
Early Access and Release Candidate versions are not supported by Home Assistant.
Using Early Access Release Candidate versions of UniFi Network or UniFi OS can bring unexpected changes. If you choose to opt into either the Early Access or the Release Candidate release channel and anything breaks in Home Assistant, you will need to wait until that version goes to the official Stable Release channel before it is expected to work.
You need a local user created in your UniFi OS Console. Ubiquiti SSO cloud users will not work. Using an administrator or a user with full read/write access is recommended to get the most out of the integration, but it is not required. The entities that are created automatically adjust based on the permissions of the user you use.
Sign in to your UniFi OS device.
Go to Admins & Users from the left-hand side menu.
Select Create New .
Check Admin , then check Restrict to local access only and fill out the fields for your user. Select Full Management for Network . OS Settings are not used, so they can be set to None .
In the bottom right, select Create .
There is currently support for the following device types within Home Assistant:
Actions
To add the UniFi Network hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select UniFi Network .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your UniFi Network application.
Username
The username of the local UniFi Network user.
Password
The password of the local UniFi Network user.
Port
The port your UniFi Network application is running on. Defaults to 443 .
Verify SSL
Whether to verify the SSL certificate of the UniFi Network application. Keep this enabled unless you are using a self-signed certificate in a trusted environment and understand the security risk of disabling certificate verification.
Site ID
The site ID of the UniFi Network site to manage. Only shown if your UniFi Network application has more than one site.
Note
Permissions : The below sections on the features available to your Home Assistant instance assume you have full
write access to each device. If the user you are using has limited access to some devices, you will get fewer entities
and in many cases, get a read-only sensor instead of an editable switch entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
All configuration options are offered from the front end. Go to Settings > Devices & services , select the UniFi Network integration, and select Configure .
Track network clients
Create device tracker entities for network clients for presence detection.
Include wired network clients
Also track wired clients, not just wireless clients.
Track network devices
Create device tracker entities for Ubiquiti network devices such as access points and switches.
Select SSIDs to track wireless clients on
Only track wireless clients connected to the selected SSIDs. Leave empty to track clients on all SSIDs.
Time in seconds from last seen until considered away
Number of seconds since last seen before a client is considered away. Defaults to 300 seconds.
Disable UniFi Network wired bug logic
Disable the workaround for a UniFi Network bug that sometimes reports wired clients as wireless.
Network access controlled clients
Select clients whose network access you want to control via switches by adding their MAC addresses.
Allow control of DPI restriction groups
Enable switches to control DPI (Deep Packet Inspection) restriction groups.
Bandwidth usage sensors for network clients
Create bandwidth usage sensors for network clients. Disabled by default.
Uptime sensors for network clients
Create uptime sensors for network clients. Disabled by default.
Create entities from network clients
Select which network clients to create entities from.
The Button entities will only be available and usable if the integration has a UniFi Network account with administrator privileges.
Use the Power cycle PoE button entity to power cycle one specific PoE port to cause the connected device to restart.
Use the Restart UniFi device button entity to restart the entire UniFi device. In case the device is a PoE switch, the PoE supply is not affected.
Use the WLAN regenerate password button entity to generate and apply a new password to the specified WLAN (Wireless Local Area Network). It will be randomly generated with 20 characters, consisting of lowercase letters, uppercase letters, and digits.
Provides QR Code images that can be scanned to easily join a specific WLAN. Entities are disabled by default. This feature requires admin privileges.
This platform allows you to detect presence by looking at devices connected to a Ubiquiti UniFi Network application. By default devices are marked as away 300 seconds after they were last seen.
If tracked devices continue to show “Home” when not connected/present and show connected in the UniFi Controller, disable 802.11r Fast Roaming. When enabled, various UniFi Controller versions have been observed to fail to declare clients disconnected.
Presence detection is not compatible with Client MAC Address Randomization, enabled by default on most modern SmartPhones. This feature will need to be disabled within the client device settings, usually under the settings for the specific network.
Presence detection depends on accurate time configuration between Home Assistant and the UniFi Network application.
If Home Assistant and the UniFi Network application are running on separate machines or VMs ensure that all clocks are synchronized. Failing to have synchronized clocks will lead to Home Assistant failing to mark a device as home.
Related Issue
The UniFi Network integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reconnect wireless client ( unifi.reconnect_client )
Tries to get a wireless client to reconnect to the UniFi network.
Remove clients from the UniFi Network ( unifi.remove_clients )
Cleans up short-lived clients from the UniFi Network application.
For an overview of every action across all integrations, see the actions reference .
Allow control of network access to clients configured in the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] options by adding MAC addresses. Items in this list will have a Home Assistant switch created, using the UniFi Device name, allowing for blocking and unblocking.
Provides per-port PoE control. Entities are disabled by default. This feature requires admin privileges.
Provides individual control to enable or disable switch ports. Entities are disabled by default. This feature requires admin privileges.
Entities appear automatically for each restriction group. If there are no restrictions in a group, no entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will be visible. Toggling the switch in Home Assistant will enable or disable all restrictions inside a group.
Entities appear for each WLAN. Changing the state of WLAN will trigger a reconfiguration of affected access points, limiting access to all WLANs exposed by the access point.
Entities appear for each port Forwarding Rule. The switches can be identified from icon .
Entities appear for each Traffic Rule. The switches can be identified from icon .
Entities appear for each Policy-Based Routing Rule. The switches can be identified from icon .
Entities appear for each Zone-Based Firewall Policy. The switches can be identified from icon .
Get entities reporting receiving and transmitting bandwidth per network client. These sensors are disabled by default. To enable the bandwidth sensors, on the UniFi integration page, select Configure , go to page 3/3 and enable the bandwidth sensors.
Get entities reporting the link speed for wired network clients. This sensor shows the connection speed in megabits per second (Mbit/s) between the wired client and the network switch or gateway. These sensors are disabled by default and are only available for wired clients with an active connection.
Entities reporting connected clients to a WLAN.
Get entities reporting uptime per network client or UniFi Network device.
Get entities reporting the power utilization for outlets that support metrics (such as the AC outlets on the USP-PDU-Pro).
Get entities reporting the general temperature of a UniFi Network device.
Get entities reporting the current state of a UniFi Network device.
Get entities reporting the current CPU utilization of a UniFi Network device.
Get entities reporting the current memory utilization of a UniFi Network device.
Get entities reporting receiving and transmitting bandwidth per port. These sensors are disabled by default. To enable the bandwidth sensors, on the UniFi integration page, select Configure , go to page 3/3 and enable the bandwidth sensors.
Get entities reporting the link negotiation speed for network device ports. These sensors show the connection speed in megabits per second (Mbit/s) at which each port negotiated its link. Entities are disabled by default.
The Light entities will only be available for UniFi access points that support LED ring customization. Not all access points have this capability.
Provides control over the LED ring on compatible UniFi access points. Entities appear automatically for devices that support LED customization. The LED state, brightness, and color can be controlled. This feature requires admin privileges.
Changes may take over 5 seconds to apply as the device must adopt a new configuration. The UI updates optimistically.
This will show if there are firmware updates available for the UniFi network devices connected to the controller. If the configured user has admin privileges, the firmware upgrades can also be installed directly from Home Assistant.
The Home Assistant community has created blueprints that use the UniFi Network integration for common use cases like presence-based automations or Wi-Fi scheduling. You can browse them in the blueprints exchange on the community forum .
The UniFi Network integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses a local push connection (WebSocket) to the UniFi Network application. This means state changes for clients, devices, and network configuration are received in near-real-time as they happen on the controller, without the need for polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] .
If the WebSocket connection is lost, the integration automatically tries to reconnect. While disconnected, entities are marked as unavailable until the connection is restored.
Ubiquiti SSO cloud users are not supported. You must create a local user in your UniFi OS Console. See the Local user section for instructions.
Early Access and Release Candidate versions of UniFi Network and UniFi OS are not supported. Only the official Stable Release channel is expected to work with this integration.
Presence detection is not compatible with MAC Address Randomization , which is enabled by default on most modern smartphones. This feature must be disabled per network on the client device.
Changes to LED control on access points may take over 5 seconds to apply because the device must adopt a new configuration first.
Lingering entities : In some edge cases, clients or devices removed from UniFi Network may remain in the Home Assistant device registry and need to be removed manually .
Integration populates both UniFi devices as well as network clients into Home Assistant. In certain edge cases entities are left lingering even if they are not present in UniFi network anymore. This can lead to an accumulation of entries in the device registry.
To manually remove a device entry, go to the Device Info page and select “Delete” from the Device Info menu.
Only clients/devices which are no longer known by UniFi since the startup or reload of the UniFi integration can be removed.
If you have problems with the UniFi Network application or integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can add debug prints to the log.
logger : default : info logs : aiounifi : debug homeassistant.components.unifi : debug
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UniFi Network hub was introduced in Home Assistant 0.81, and it's used by
7.2% of the active installations.
Its IoT class is Local Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Kane610
Categories
Hub
Update
Back to top
