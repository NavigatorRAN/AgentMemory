# OpenRGB - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openrgb
- Final URL: https://www.home-assistant.io/integrations/openrgb
- Canonical URL: https://www.home-assistant.io/integrations/openrgb/
- Fetched at: 2026-06-28T03:06:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenRGB within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Supported functionality
Lights
Select
Data updates
Reconfiguration
Known limitations
Troubleshooting
Connection errors
Devices not appearing
Light effects not working
Removing the integration
To remove an integration instance from Home Assistant
The OpenRGB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate the RGB lighting devices from computers running OpenRGB .
OpenRGB provides a unified interface for controlling various RGB lighting hardware from different manufacturers.
To use this integration, you need the OpenRGB application installed on your computer with the SDK Server running.
To enable the OpenRGB SDK server:
In the OpenRGB application, go to SDK Server tab.
Select Start Server .
Optionally, go to the Settings tab and check Start at Login , Start Minimized , and Start Server for convenience.
Note : if you opted to Install System Service in the OpenRGB Windows installer , the SDK server is probably already running. You can check this in the Services application in Windows, looking for the OpenRGB service.
To add the OpenRGB hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenRGB .
Follow the instructions on screen to complete the setup.
Name
A name for this integration entry, like the name of the computer running the OpenRGB SDK server (for example, My Gaming PC ).
Host
The hostname or IP address of the computer running the OpenRGB SDK server (for example, 192.168.1.100 ).
Port
The port number that the OpenRGB SDK server is running on (default is 6742 ).
This integration supports any RGB device that is compatible with OpenRGB. Refer to the OpenRGB Supported Devices list .
The OpenRGB integration provides the following entities:
For each RGB device connected to OpenRGB, the integration creates a light entity to control all the LEDs on that device as a single unit.
For each OpenRGB server device, a select entity is created that allows selecting the profiles configured in the OpenRGB application.
The OpenRGB integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the OpenRGB SDK server every 15 seconds .
If you need to update your OpenRGB SDK server connection details, you can reconfigure the integration:
Select OpenRGB . Select the three dots menu and then select Reconfigure .
Update the hostname/IP address and port number as needed.
Select Submit .
The integration will then reconnect to the OpenRGB SDK server with the new settings.
The light state shown in Home Assistant may not always reflect the actual device state. Most RGB devices don’t report their status back to OpenRGB, so it assumes the state based on the last command sent. If other applications control the same devices, the state reported by OpenRGB (and thus Home Assistant) may be outdated.
Changes made directly in the OpenRGB application may not be immediately reflected in Home Assistant (the integration polls for updates every 15 seconds).
Some OpenRGB features like per-zone and per-LED control are not yet supported through Home Assistant.
The profile select entity cannot be used to determine which profile is currently active as this information is not currently provided by the OpenRGB SDK server.
If you encounter connection errors:
Verify that the OpenRGB SDK server is running in the OpenRGB application.
Verify that the SDK Server > Server Host is set to 0.0.0.0 in the OpenRGB application.
Confirm that the IP address of the computer running the OpenRGB SDK server matches the Host configured in the OpenRGB integration.
Confirm that the SDK Server > Server Port matches the port configured in the OpenRGB integration.
Check for firewall rules that may block the connection from Home Assistant to the OpenRGB SDK server.
If your RGB devices don’t appear in Home Assistant:
Verify the devices are detected and working in the OpenRGB application first.
If lighting effects are not working:
Verify the effect/mode can be applied in the OpenRGB application first.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenRGB hub was introduced in Home Assistant 2025.11, and it's used by
319 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@felipecrs
Categories
Light
Back to top
