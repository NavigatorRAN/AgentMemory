# IKEA TRÅDFRI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tradfri
- Final URL: https://www.home-assistant.io/integrations/tradfri
- Canonical URL: https://www.home-assistant.io/integrations/tradfri/
- Fetched at: 2026-06-28T03:23:34Z
- Content type: text/html; charset=UTF-8

## Description

Access and control your IKEA Trådfri Gateway and its connected Zigbee-based devices.

## Extracted Text

On this page
Configuration
Troubleshooting
Incorrect security key
Firmware updates
Known limitations
The IKEA TRÅDFRI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your IKEA Trådfri Gateway to Home Assistant. The gateway can control compatible Zigbee-based lights (certified Zigbee Light Link products) connected to it.
To add the IKEA TRÅDFRI hub to your Home Assistant instance, use this My button:
IKEA TRÅDFRI can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IKEA TRÅDFRI .
Follow the instructions on screen to complete the setup.
You will be prompted to configure the gateway through the Home Assistant interface. The configuration process is very simple: when prompted, enter the security key printed on the sticker on the bottom of the IKEA Trådfri Gateway, then click configure .
Tip
If you see an “Unable to connect” message, restart the gateway and try again. Don’t forget to assign a permanent IP address to your IKEA Trådfri Gateway on your router or DHCP server.
Note
There is currently no dedicated core integration for the Dirigera hub released in October 2022.
The Dirigera hub can, however, be integrated directly via the HomeKit device integration or the Matter integration. As of Hub version 2.615.8 (September 2024), there is support for the following device types via Matter Bridge: lights (including drivers), smart plugs/outlets, connected blinds, remotes, motion sensors, open/close sensors, air purifiers, and air quality sensors.
Fatal DTLS error: code 20 might indicate a missing or incorrect security key. Pay close attention as e.g., “I” and “l” can easily be confused.
After updating your IKEA Trådfri Gateway firmware it might be necessary to repeat the configuration process. One error you might experience after a firmware update is Fatal DTLS error: code 115 . If you encounter problems:
when configured using the integration: remove the integration through Settings > Integrations > Tradfri > delete (trash can icon)
Then restart Home Assistant. When prompted, enter the security key and click configure , just like during initial setup.
The TRÅDFRI Shortcut button, Remotes and motion sensor only send information about their battery status, no events, to Home Assistant and thus can’t be used to automate with. If you want to automate with these devices, you need to use something like ZHA , or the HomeKit device integration as mentioned above.
The groups you find in the app are not imported into Home Assistant as they are known to cause stability issues. We recommend that you use the native light groups instead.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IKEA TRÅDFRI hub was introduced in Home Assistant 0.43, and it's used by
1.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Cover
Fan
Light
Sensor
Switch
Back to top
