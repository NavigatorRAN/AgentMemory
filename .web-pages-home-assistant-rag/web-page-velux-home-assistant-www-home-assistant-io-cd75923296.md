# Velux - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/velux
- Final URL: https://www.home-assistant.io/integrations/velux
- Canonical URL: https://www.home-assistant.io/integrations/velux/
- Fetched at: 2026-06-28T03:26:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Velux KLF 200 with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Unsupported Hardware
Velux KLF 150
Velux Active (KIX 300)
The Velux integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to connect to a Velux KLF 200 interface so you can control io-homecontrol devices, such as windows, blinds, lights, and switches. The integration lets you start scenes configured on the KLF 200.
At least firmware version > 2.0.0.0 is required on the KLF 200 device. The firmware images may be obtained from the vendor’s website and may be imported via the web interface of your KLF 200.
There is currently support for the following device types within Home Assistant:
Binary sensor (reports rain detection for windows that support it)
Button (Reboot button on the gateway device to reboot the KLF 200 gateway)
Cover
Light
Number (controls the power level of exterior heating devices connected to the gateway, from 0% to 100%)
Scene
Switch
Rain sensors of supported windows do not report automatically and must be polled every 5 minutes. For this reason, they are disabled by default, because polling uses more radio bandwidth and battery power than simply reporting changed window positions.
Make sure you have the password for your gateway’s wireless access point.
You’ll find it printed on the underside of your KLF 200 device.
It is not the web login password.
Reboot or power cycle the KLF 200 device.
You must complete the configuration within 5 minutes of rebooting the device while its Wi-Fi access point is still visible.
During configuration, keep your Home Assistant connected to your regular network.
Don’t connect to the device’s wireless access point.
To add the Velux hub to your Home Assistant instance, use this My button:
Velux can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Velux .
Follow the instructions on screen to complete the setup.
During configuration, you will be asked for a hostname and password:
Hostname
The IP address or hostname of the KLF 200 gateway. You can find it in your router.
Password
The password of the gateway’s wireless access point. You can find it printed on the underside of the device. It is not the web login password.
Remember: You must complete the configuration within 5 minutes of rebooting the KLF 200 gateway. If you can’t complete in time and setup fails, power cycle the device and try again.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The Velux KLF 150 is not supported by this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , even though Velux markets it as the replacement for the now-discontinued KLF 200. Unlike the KLF 200, the KLF 150 does not provide a local API that Home Assistant can communicate with directly.
However, there is a community project that bridges the KLF 150’s GPIO interface with MQTT. Using this project with additional hardware, you can control your KLF 150 through the MQTT Cover integration .
The Velux Active (KIX 300) set is not supported by this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . To integrate Velux Active (KIX 300) with Home Assistant, you can use the HomeKit Controller integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] and get full control over your windows, curtains, covers, and the air quality sensor KLA 300.
Add the Velux Active gateway using HomeKit pairing (with the pairing code on the sticker at the bottom of the Velux Active gateway) and the devices connected to the gateway - including sensors - will be automatically discovered and added to Home Assistant.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Velux hub was introduced in Home Assistant 0.49, and it's used by
785 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Julius2342
@pawlizio
@wollew
Categories
Back to top
