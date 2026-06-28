# Salda Smarty - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smarty
- Final URL: https://www.home-assistant.io/integrations/smarty
- Canonical URL: https://www.home-assistant.io/integrations/smarty/
- Fetched at: 2026-06-28T03:17:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Salda Smarty 2X/3X/4X P/V ventilation systems into Home Assistant.

## Extracted Text

On this page
Configuration
The Salda Smarty integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Salda Smarty ventilation units from Home Assistant. You need a MB-GATEWAY or something similar to connect to your local network.
There is currently support for the following device types within Home Assistant:
Button
Fan
Sensor
Switch
The integration has a fan platform to view and control the ventilation speed, a switch platform to control the Boost state (which temporarily increases the fan speed to maximum for 10 minutes before returning to the previous speed), a button platform to reset the filters’ timer, and a sensors platform to read:
Outdoor air temperature
Extract air temperature
Supply air temperature
Extract fan speed rpm
Supply fan speed rpm
Alarm
Warning
Filter Change Timer
To add the Salda Smarty hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Salda Smarty .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Salda Smarty hub was introduced in Home Assistant 0.95, and it's used by
12 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@z0mbieprocess
Categories
Hub
Back to top
