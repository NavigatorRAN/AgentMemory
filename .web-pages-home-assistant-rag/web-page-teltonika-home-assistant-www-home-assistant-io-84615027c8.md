# Teltonika - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/teltonika
- Final URL: https://www.home-assistant.io/integrations/teltonika
- Canonical URL: https://www.home-assistant.io/integrations/teltonika/
- Fetched at: 2026-06-28T03:21:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Teltonika routers with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Automatic discovery
Sensors
Data updates
Examples
Signal monitoring card
Known limitations
Troubleshooting
Connection issues
Sensors unavailable
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Teltonika integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Teltonika Networks routers with Home Assistant, allowing you to monitor cellular signal quality, modem temperature, and network connectivity.
Most Teltonika routers running RutOS are supported, including:
RUT series (such as RUT240, RUT950, and RUT955)
RUTX series (such as RUTX08, RUTX09, RUTX11, and RUTX50)
TRB series (such as TRB140, TRB245, and TRB500)
You need the IP address and login credentials for your router’s web interface.
To add the Teltonika device to your Home Assistant instance, use this My button:
Teltonika can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Teltonika .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your router. The integration will try both HTTPS and HTTP.
Username
Username for the router’s web interface.
Password
Password for the router’s web interface.
Validate SSL certificate
Enable SSL certificate validation. Leave disabled for self-signed certificates.
Teltonika routers are automatically discovered via DHCP.
The integration creates the following sensors for each cellular modem:
RSSI - Signal strength in dBm
RSRP - Reference signal power in dBm (LTE/5G)
RSRQ - Reference signal quality in dB (LTE/5G)
SINR - Signal to interference ratio in dB
Temperature - Modem temperature in °C
Operator - Mobile network operator name
Connection type - Network technology (2G/3G/4G/5G)
Signal sensors include additional attributes like frequency band and modem state.
Data is polled from the router every 30 seconds.
type : entities title : Cellular Signal Quality entities : - entity : sensor.modem_2_1_rssi name : Signal Strength (RSSI) - entity : sensor.modem_2_1_rsrp name : Reference Power (RSRP) - entity : sensor.modem_2_1_rsrq name : Signal Quality (RSRQ) - entity : sensor.modem_2_1_sinr name : Signal/Noise Ratio (SINR) - entity : sensor.modem_2_1_temperature name : Modem Temperature - entity : sensor.modem_2_1_operator name : Network Operator - entity : sensor.modem_2_1_connection_type name : Connection Type
Only cellular modem monitoring is supported
No SMS sending or router configuration
Data usage statistics are not available
Verify the router is reachable on your network and the web interface is accessible. Check that you’re using the correct IP address and credentials.
Ensure a SIM card is inserted and the modem has an active cellular connection. Check the modem status in the router’s web interface under Network > Mobile .
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Teltonika Networks
Teltonika Networks Wiki
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Teltonika device was introduced in Home Assistant 2026.3, and it's used by
292 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@karlbeecken
Categories
Sensor
Back to top
