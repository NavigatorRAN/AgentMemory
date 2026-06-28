# IKEA Idasen Desk - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/idasen_desk
- Final URL: https://www.home-assistant.io/integrations/idasen_desk
- Canonical URL: https://www.home-assistant.io/integrations/idasen_desk/
- Fetched at: 2026-06-28T02:51:11Z
- Content type: text/html; charset=UTF-8

## Description

Control and monitor your IKEA Idåsen standing desk.

## Extracted Text

On this page
Configuration
Connect/Disconnect buttons
Sensors
Removing the integration
To remove an integration instance from Home Assistant
The IKEA IDÅSEN integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your IKEA Idåsen motorized desk to Home Assistant, making it possible to control the desk height and also monitor height changes from the physical controller.
Tip
The recommended way to connect the desk to Home Assistant is by using an ESPHome Bluetooth Proxy , as they provide the best experience.
If you are not using an ESPHome Bluetooth Proxy, you need to keep bluetoothctl (or any other Bluetooth Agent) open during the integration setup, or it will fail to authenticate with the desk. The connection process is also less reliable than with ESPHome, so you may need to retry a few times until it succeeds. This is due to a limitation in the third-party Bluetooth implementation used by Home Assistant.
Also, if not using an ESPHome Bluetooth Proxy, you may experience the desk becoming unavailable and needing re-pairing after a restart of Home Assistant or a reload of the integration. To pair it permanently, access the host over SSH , pair the desk with bluetoothctl pair <desk-BT-address> , and validate it being listed by bluetoothctl devices Paired . If the desk is not listed as paired, repeat the command several times while entering pairing mode on the desk.
To add the IKEA Idasen Desk device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IKEA Idasen Desk .
Follow the instructions on screen to complete the setup.
Home Assistant will display a list of addresses of the available desks, and you just need to select the one you want to add. Repeat the process to add more than one desk.
Note
If you see an “No unconfigured devices found” message, make sure that the desk is in Bluetooth pairing mode. For that, press the small button with the Bluetooth logo on the controller until it starts blinking (about 3 seconds).
This integration provides two buttons to connect and disconnect to/from the desk using Bluetooth. These can be used to automate connecting to the desk only when needed, for example, to avoid keeping a constant connection when the available connection slots are limited.
Height
The current height of the desk, in meters.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IKEA Idasen Desk device was introduced in Home Assistant 2023.10, and it's used by
420 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@abmantis
Categories
Cover
Back to top
