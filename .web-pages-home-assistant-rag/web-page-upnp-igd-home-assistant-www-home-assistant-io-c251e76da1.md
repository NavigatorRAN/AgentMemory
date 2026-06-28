# UPnP/IGD - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/upnp
- Final URL: https://www.home-assistant.io/integrations/upnp
- Canonical URL: https://www.home-assistant.io/integrations/upnp/
- Fetched at: 2026-06-28T03:25:22Z
- Content type: text/html; charset=UTF-8

## Description

Internet Gateway Device (IGD) Protocol for Home Assistant.

## Extracted Text

On this page
Configuration
Enforcing polling of data
Debugging integration
The UPnP/IGD integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to collect network statistics from your router such as bytes in/out and packets in/out, uptime, WAN IP address, and WAN connectivity status. This information is provided by the UPnP / Internet Gateway Device (IGD) Protocol if enabled on your router.
There is currently support for the following device types within Home Assistant:
Binary Sensor - If router is connected to the WAN.
Sensor - Allows you to get the network statistics from your router such as bytes in/out and packets in/out, uptime, status, and IP. Sensor for uptime will only be there if supported by the router.
UPnP or NAT-PMP needs to be enabled on your router for this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] to work.
To add the UPnP/IGD device to your Home Assistant instance, use this My button:
UPnP/IGD can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select UPnP/IGD .
Follow the instructions on screen to complete the setup.
Some UPnP/IGD devices have a broken UPnP implementation and will provide invalid data or no data at all. A configuration option is provided to fall back to polling of all data for the sensors. Please try this when you feel not all sensors which should be working are working.
If you have problems with this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can add debug prints to the log.
logger : default : info logs : homeassistant.components.upnp : debug async_upnp_client : debug async_upnp_client.traffic : error
When creating an issue, please include the (relevant) logging with the issue. Any sensitive information such as IPs can be obfuscated.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The UPnP/IGD device was introduced in Home Assistant 0.18, and it's used by
32.9% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@StevenLooman
Categories
Binary sensor
Network
Sensor
Back to top
