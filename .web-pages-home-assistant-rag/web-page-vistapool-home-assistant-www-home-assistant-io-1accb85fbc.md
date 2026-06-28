# Vistapool - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vistapool
- Final URL: https://www.home-assistant.io/integrations/vistapool
- Canonical URL: https://www.home-assistant.io/integrations/vistapool/
- Fetched at: 2026-06-28T03:26:51Z
- Content type: text/html; charset=UTF-8

## Description

Monitor and control Hayward-branded pool controllers via the Hayward cloud API.

## Extracted Text

On this page
Configuration
Prerequisites
Supported devices
Sensors
Known limitations
Troubleshooting
Entities show “Unavailable”
Reauth notification appears
Entities not updating
Removing the integration
To remove an integration instance from Home Assistant
The Vistapool integration connects Home Assistant to Hayward-branded pool controllers , including AquaRite, Vistapool, Sugar Valley, Poolwatch, Kripsol, and Dagen devices.
It communicates with the official Hayward cloud API using real-time push updates (no polling), giving you instant visibility and control over your pool equipment.
To add the Vistapool hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Vistapool .
Follow the instructions on screen to complete the setup.
A supported Hayward-compatible pool controller
A Wi-Fi module connected to the internet
The controller must already be linked to your Hayward cloud account
Any pool controller compatible with the Hayward / AquaRite cloud platform, including:
Hayward AquaRite
Vistapool
Sugar Valley
Poolwatch
Kripsol
Dagen
The integration provides the following sensors:
Water temperature : current pool water temperature
pH : current pH level (if pH module installed)
ORP / Rx : redox potential in mV (if Rx module installed)
Chlorine (Cl) : chlorine level (if Cl module installed)
CD : conductivity level (if CD module installed)
UV : UV module reading (if UV module installed)
Electrolysis / Hydrolysis : current production level in gr/h
Filtration intel time : daily runtime in Intel mode
Wi-Fi signal strength : controller RSSI (diagnostic, disabled by default)
The integration requires an active internet connection as it communicates via the Hayward cloud API
Sensor availability depends on which modules are physically installed on your controller
Check your internet connection and verify the controller is online in the Hayward app. The integration will automatically reconnect when the connection is restored.
Your credentials may have changed or expired. Select the notification to re-enter your Hayward username and password.
The integration uses real-time cloud push. If updates stop, try reloading the integration from Settings > Devices & services .
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Vistapool hub was introduced in Home Assistant 2026.6, and it's used by
18 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fdebrus
Categories
Sensor
Back to top
