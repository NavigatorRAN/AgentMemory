# ROMY Vacuum Cleaner - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/romy
- Final URL: https://www.home-assistant.io/integrations/romy
- Canonical URL: https://www.home-assistant.io/integrations/romy/
- Fetched at: 2026-06-28T03:12:50Z
- Content type: text/html; charset=UTF-8

## Description

Integrate your ROMY vacuum robot with Home Assistant.

## Extracted Text

On this page
Configuration
Actions
Integration entities
Troubleshooting
Local HTTP interface password
ROMY robot interface protocol
The ROMY integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your ROMY vacuum robot.
This integration currently supports the following models:
ROMY C5
ROMY L6 Performance
ROMY L6 Animal
To add the ROMY Vacuum Cleaner device to your Home Assistant instance, use this My button:
ROMY Vacuum Cleaner can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ROMY Vacuum Cleaner .
Follow the instructions on screen to complete the setup.
Currently supported actions are:
start
pause
continue
stop
return_to_base
The ROMY will add the following sensors.
Binary Sensors:
Dustbin present : True if dustbin is inserted.
Robot docked : True if the robot is docked.
Watertank present : True if watertank is mounted (only present for ROMY’s with wet cleaning function).
Watertank empty : True if watertank is empty and water infill is required (only present for ROMY’s with wet cleaning function).
Sensors:
Battery Level : The battery level in percent.
RSSI : Wi-Fi signal strength.
Dustbin Dirt Level : The raw dustbin dirt sensor value (not every ROMY has one).
Total cleaning time : How many hours the robot has spent cleaning in total.
Total cleaning runs : The total number of cleaning runs.
Total cleaned area : The total area in m² the robot has cleaned.
Total distance driven : The total distance in m the robot has driven.
You have to enable the local interface first with a password. This is printed as QR Code on a label directly under the dust bin inside the robot.
Is available as download under romy-robot-interface-protocol
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ROMY Vacuum Cleaner device was introduced in Home Assistant 2024.2, and it's used by
194 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@xeniter
Categories
Vacuum
Back to top
