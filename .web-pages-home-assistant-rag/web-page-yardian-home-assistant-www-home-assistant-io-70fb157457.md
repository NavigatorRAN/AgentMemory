# Yardian - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yardian
- Final URL: https://www.home-assistant.io/integrations/yardian
- Canonical URL: https://www.home-assistant.io/integrations/yardian/
- Fetched at: 2026-06-28T03:30:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yardian device within Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Binary sensors
List of actions
The Yardian integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Yardian Smart Sprinkler Controller .
There is currently support for the following platforms within Home Assistant:
Switch - Allows you to view the status of zones and control them.
Binary sensor - Shows watering status along with standby and freeze prevent diagnostics. Per-zone enabled diagnostics are provided but disabled by default.
To add the Yardian device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yardian .
Follow the instructions on screen to complete the setup.
During the configuration, you will have to manually set the Host and the Access Token . You can find them inside your Yardian App .
The Yardian integration provides the following entities.
Watering running : Is on when a zone is currently irrigating.
Standby : Is on when the controller is in standby mode.
Freeze prevent : Turns on when the controller enables freeze prevention.
Zone enabled : On if a zone is enabled. These entities are disabled by default and created per zone.
The Yardian integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Start irrigation ( yardian.start_irrigation )
Starts the irrigation for a zone for a set number of minutes.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yardian device was introduced in Home Assistant 2023.9, and it's used by
153 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@aeon-matrix
Categories
Irrigation
Sensor
Switch
Back to top
