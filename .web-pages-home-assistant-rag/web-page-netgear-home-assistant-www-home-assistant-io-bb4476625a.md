# NETGEAR - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/netgear
- Final URL: https://www.home-assistant.io/integrations/netgear
- Canonical URL: https://www.home-assistant.io/integrations/netgear/
- Fetched at: 2026-06-28T03:02:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NETGEAR routers into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Router entities
Reboot button
Update entity
Traffic meter data
Router feature switches
Speed test data
Ethernet link status
Utilization sensors
Connected device entities
Device tracker
Allowed on Network
Signal strength
Link rate
Link type
Troubleshooting
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence by looking at connected devices to a NETGEAR device and control the NETGEAR device.
Both routers and access points can be used with this integration. Some access points will not be automatically discovered and need to be set up manually.
Attached devices are only tracked on NETGEAR devices set to the router mode, otherwise, duplicate entities will occur from access points that also report the same devices.
To add the NETGEAR hub to your Home Assistant instance, use this My button:
NETGEAR can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NETGEAR .
Follow the instructions on screen to complete the setup.
To define options for NETGEAR, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of NETGEAR are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Consider_home
The consider home time is the number of seconds to wait till marking someone as not home after not being seen. This parameter is most useful for households with Apple iOS devices that go into sleep mode while still at home to conserve battery life. iPhones will occasionally drop off the network and then re-appear. This option helps prevent false alarms in presence detection.
The NETGEAR router will have the following entities.
Note that not all routers support all features, if a router does not support a feature, the corresponding entity will have the unavailable status even when the entity is disabled.
You might also see the following error in the log 404 service '...', method '...' not found , to prevent these errors, keep the unsupported entities disabled.
All possibly unsupported entities are disabled by default.
Button entity to restart the router.
Update entity to view current and latest firmware version, and install the latest firmware of the router.
The total and average amount of downloaded/uploaded data through the router can be tracked per day/week/month.
In order for these entities to display the data (instead of 0), the “Traffic Meter” should be enabled in the router settings.
Enable the Traffic Meter switch entity and turn it on.
The following router features can be turned on/off, and the status can be read:
Access Control
Traffic Meter
Parental Control
Quality of Service
2.4G Guest Wifi
5G Guest Wifi
Smart Connect
The “Average Ping”, “Downlink Bandwidth,” and “Uplink Bandwidth” can be tracked by performing a speed test every 2 hours.
If these sensor entities are enabled, they will first show previous results on integration load. The first new speed tests happens 2 hours after the integration loads.
The speed test interval is chosen to be 2 hours not to put unnecessary load on the network and reduce data usage.
When one or more of the three sensors is enabled, the speed tests will be performed. Note that this can cause high data usage depending on your internet connection speed which might be relevant when using metered/limited networks.
The Ethernet link status sensor indicates if the router is currently able to connect to the internet.
CPU and memory utilization sensors in percentage of available resources of the router.
For each device connected to the NETGEAR router the following entities will be available:
Displays if the device is currently connected to the router (Home) or not (Away).
Switch that lets you Allow or Block a device on the Network.
For this entity to actually Block the device, “Access Control” needs to be turned on in the Router settings.
Enable the Access Control switch entity and turn it on.
Displays the wifi signal strength of the device.
Displays the current link rate of the device indicating the maximum possible data speed with the current connection.
Displays the current link type: wired, 2.4GHz or 5GHz.
If you get a “Connection or login error” when trying to set up the NETGEAR integration, please try using the IP address of the router (often “192.168.1.1”) as host instead of the default “routerlogin.net”.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NETGEAR hub was introduced in Home Assistant pre 0.7, and it's used by
2824 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Quentame
@starkillerOG
Categories
Presence detection
Update
Back to top
