# Oral-B - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/oralb
- Final URL: https://www.home-assistant.io/integrations/oralb
- Canonical URL: https://www.home-assistant.io/integrations/oralb/
- Fetched at: 2026-06-28T03:06:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Oral-B devices into Home Assistant.

## Extracted Text

On this page
Configuration
Supported devices
Sensor
Integrates Oral-B devices into Home Assistant.
To add the Oral-B device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Oral-B .
Follow the instructions on screen to complete the setup.
The Oral-B integration will automatically discover devices once the Bluetooth integration is enabled and functional.
The integration can discover most Bluetooth-enabled Oral-B toothbrushes. Brushes not listed as supported below may not be correctly identified or have some modes missing.
IO Series 4
IO Series 6
IO Series 7
IO Series 8
IO Series 9
Smart Series 4000
Smart Series 6000
Smart Series 7000
Genius Series 8000
Genius Series 9000
Genius Series 10000
Triumph V2
Genius X
Mode - selected cleaning mode e.g. daily clean.
Number of sectors - brushing areas set in the Set Pacer Visualisation in the brushing preferences in the mobile app.
Sector - the current sector of brush goal you are in (that is, if brush goal is 2:00 minutes, and you are at 0:37, you are in sector 2)
Time - total brushing time in seconds.
Toothbrush state - whether the toothbrush is running, idle.
Battery - toothbrush battery percentage.
Important
Updates of the battery sensor require an active Bluetooth connection and relatively close proximity. If you use a Bluetooth proxy , please ensure it supports active connections. All the other sensors update with active or passive connections.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Oral-B device was introduced in Home Assistant 2022.11, and it's used by
3.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@Lash-L
Categories
Back to top
