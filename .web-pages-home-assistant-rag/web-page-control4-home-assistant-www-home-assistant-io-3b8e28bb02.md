# Control4 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/control4
- Final URL: https://www.home-assistant.io/integrations/control4
- Canonical URL: https://www.home-assistant.io/integrations/control4/
- Fetched at: 2026-06-28T02:35:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on adding a Control4 system to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Options
The Control4 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor lights, Room Media, cover, and climate devices from your local Control4 system. Your Control4 controller must be running OS 3.0+.
Before setting up, you should assign a static IP address/DHCP reservation on your router to your Control4 controller. Home Assistant must be able to communicate with the controller over the local network; 4Sight remote access is not supported.
The username and password required for this integration are the same credentials you use to log in to the Control4 mobile app and the customer portal at https://customer.control4.com/ .
To add the Control4 hub to your Home Assistant instance, use this My button:
Control4 can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Control4 .
Follow the instructions on screen to complete the setup.
The Control4 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers additional options in Settings > Devices & services > Control4 > Options :
Configuration Variables
Looking for your configuration file?
Seconds between updates integer ( Optional , default: 5 )
How often Home Assistant will poll the Control4 controller for state updates. Very frequent polling could cause the controller to lag, especially with many devices.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Control4 hub was introduced in Home Assistant 0.114, and it's used by
359 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lawtancool
@davidrecordon
Categories
Climate
Cover
Light
Media Player
Back to top
