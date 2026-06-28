# Homevolt - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/homevolt
- Final URL: https://www.home-assistant.io/integrations/homevolt
- Canonical URL: https://www.home-assistant.io/integrations/homevolt/
- Fetched at: 2026-06-28T02:49:51Z
- Content type: text/html; charset=UTF-8

## Description

Connect Homevolt batteries locally to expose sensors in Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Switches
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Homevolt integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets Home Assistant read local data from your Homevolt battery over your network, no cloud required.
To add the Homevolt device to your Home Assistant instance, use this My button:
Homevolt can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Homevolt .
Follow the instructions on screen to complete the setup.
API access must be explicitly enabled on the Homevolt device; contact Tibber Customer Support to activate the API.
Configuration needs the device IP address and, if set on the device, a password.
Host
The IP address or hostname of your Homevolt device. You can find it in your router or via the device’s discovery.
Password
The password for your Homevolt device, if it is password protected. Leave empty if no password is set.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates sensors reported by the device, including:
Power (W) and energy (Wh/kWh)
Voltage (V) and current (A)
Temperature (°C) and frequency (Hz)
Battery/percentage (%)
Signal strength (dB)
Text, count, or schedule status values
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates switches reported by the device, including:
Local mode, enable or disable loacal control mode
Failed to connect : confirm the IP address, device is powered, and reachable on your network.
Invalid authentication : verify the device password or remove it if none is set.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Homevolt device was introduced in Home Assistant 2026.3, and it's used by
34 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@danielhiversen
@liudger
Categories
Energy
Sensor
Back to top
