# TechnoVE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/technove
- Final URL: https://www.home-assistant.io/integrations/technove
- Canonical URL: https://www.home-assistant.io/integrations/technove/
- Fetched at: 2026-06-28T03:21:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate TechnoVE smart EV charging stations with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Binary sensors
Numbers
Sensors
Switches
Data updates
Known limitations
Troubleshooting
The station cannot be reached during setup
The station becomes unavailable intermittently
Cannot change the maximum current
Cannot enable or disable charging
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The TechnoVE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor and control your TechnoVE smart EV charging station directly from Home Assistant using the station’s local API. No cloud account or internet connection is required — everything communicates over your local network.
Use case: If you have a TechnoVE charging station at home, you can automate your EV charging based on electricity prices, solar panel production, or time of day. For example, you could automatically start charging at night when electricity rates are lower, or pause charging when your home’s power consumption is too high.
The integration supports all Wi-Fi enabled EV charging stations released by the TechnoVE brand.
Before setting up this integration, make sure:
Your TechnoVE charging station is powered on and connected to your local network (Wi-Fi).
Your Home Assistant instance can reach the charging station over the network.
While Home Assistant will typically discover your station automatically on your network, if you need to add it manually, make sure you know the IP address or hostname of your TechnoVE station. You can find this in your router’s connected devices list.
To add the TechnoVE device to your Home Assistant instance, use this My button:
TechnoVE can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select TechnoVE .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your TechnoVE charging station. If not discovered automatically, you can find this in your router’s connected devices list.
The TechnoVE integration provides the following entities.
Battery protected
Description : Indicates whether battery protection mode is active on the station.
Conflict with power sharing mode
Description : Indicates a configuration conflict in power sharing mode. This typically means that the power sharing settings between connected stations are not aligned.
Power sharing mode
Description : Indicates whether the station is operating in power sharing mode, where multiple stations coordinate to share available electrical capacity.
Static IP
Description : Indicates whether the station is configured with a static IP address.
Enabled by default : No
Update available
Description : Indicates whether a firmware update is available for the station.
Maximum current
Description : Sets the maximum current that the charging station is allowed to deliver to the vehicle. This value cannot be changed when the station is in power sharing mode.
Status
Description : The current charging status of the station.
Possible values :
EVSE fault
Ground fault
High tariff period
Out of activation period
Pilot fault
Plugged (waiting)
Plugged (charging)
Unplugged
Ventilation required
Current
Description : The electrical current currently being delivered to the vehicle.
Input voltage
Description : The voltage measured at the station’s input.
Output voltage
Description : The voltage measured at the station’s output, going to the vehicle.
Max station current
Description : The maximum current rating of the charging station hardware.
Total energy usage
Description : The total energy consumed by the station since its installation.
Last session energy usage
Description : The energy consumed during the most recent (or current) charging session.
Signal strength
Description : The Wi-Fi signal strength (RSSI) of the station.
Wi-Fi network name
Description : The name (SSID) of the Wi-Fi network the station is connected to.
Auto-charge
Description : When enabled, vehicles start charging automatically as soon as they are plugged in. When turned off, you need to manually start each charging session. Disabling auto-charge does not interrupt an ongoing charging session.
Charging enabled
Description : Controls whether the station is allowed to charge a connected vehicle. You can disable this to pause or stop a charging session. This switch can only be used when auto-charge mode is disabled.
The TechnoVE integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the charging station every 5 seconds over the local network. This frequent polling interval ensures that status changes (such as plugging in or unplugging the vehicle) are reflected promptly in Home Assistant.
The integration communicates with the station over the local network only. If the station is on a different network segment or VLAN than Home Assistant, you may need to configure routing between the networks.
The maximum current setting cannot be changed while the station is in power sharing mode. You need to disable power sharing first.
Charging can only be manually started or stopped when auto-charge mode is disabled.
The integration does not support firmware updates. Firmware updates must be performed through the TechnoVE app.
If you see a “Failed to connect” error when trying to add the integration:
Make sure your TechnoVE station is powered on and the status LEDs are active.
Verify the station is connected to your Wi-Fi network. Check your router’s connected devices list to confirm it appears.
Make sure the IP address or hostname you entered is correct.
Try pinging the station from a computer on the same network to verify connectivity.
If the station is on a different VLAN or network segment than Home Assistant, make sure routing is configured between the networks.
If the station keeps going unavailable and coming back:
Check the Signal strength sensor, if available. This entity may be disabled by default, so you might need to enable it first. If you don’t see it, check your router, access point, or manufacturer tools to verify the station’s Wi-Fi signal quality. A weak signal can cause intermittent connection issues.
Consider moving the station closer to your Wi-Fi access point or adding a Wi-Fi extender.
Make sure your network is not blocking local traffic between Home Assistant and the station.
If you receive an error when trying to change the maximum current:
Make sure the station is not in power sharing mode. The maximum current cannot be changed while power sharing is active.
If you receive an error when trying to toggle charging:
Make sure auto-charge mode is disabled. The charging enabled switch only works when auto-charge mode is off.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TechnoVE device was introduced in Home Assistant 2024.2, and it's used by
24 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Moustachauve
Categories
Car
Back to top
