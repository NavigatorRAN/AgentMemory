# QNAP QSW - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qnap_qsw
- Final URL: https://www.home-assistant.io/integrations/qnap_qsw
- Canonical URL: https://www.home-assistant.io/integrations/qnap_qsw/
- Fetched at: 2026-06-28T03:10:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate QNAP QSW within Home Assistant.

## Extracted Text

On this page
Configuration
Binary sensors
Buttons
Sensors
Update
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] interacts with the local API of QNAP QSW managed switches .
To add the QNAP QSW device to your Home Assistant instance, use this My button:
QNAP QSW can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select QNAP QSW .
Follow the instructions on screen to complete the setup.
URL
Device URL (usually http://IP )
Username
Username (usually admin)
Password
The following binary sensors are created:
Binary sensor Description anomaly Device anomaly.
The following binary sensors are created for each port (or LACP):
Binary sensor Description link Link status.
The following buttons are created:
Button Description reboot Reboot device.
The following sensors are created:
Sensors Description fan_1_speed Fan 1 Speed. fan_2_speed Fan 2 Speed. ports Number of used ports. rx Total RX bytes. rx_errors Total number of RX errors. rx_speed Total RX speed. temperature Switch temperature. tx Total TX bytes. tx_speed Total TX speed. uptime Uptime seconds.
The following sensors are created for each port (or LACP):
Sensors Description link_speed Link speed. rx RX bytes. rx_errors Number of RX errors. rx_speed RX speed. tx TX bytes. tx_speed TX speed.
Update Description firmware_update Firmware update status.
The QNAP QSW firmware allows only one authenticated session at a time. Because this integration maintains a persistent session to poll the switch, you cannot sign in to the switch’s web management console (QSS) while the integration is active. Attempting to do so results in a “Duplicate login detected” error.
To access the switch’s web console, temporarily disable the integration under Settings > Devices & services , then re-enable it when you are done.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The QNAP QSW device was introduced in Home Assistant 2022.5, and it's used by
82 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Noltari
Categories
Binary sensor
Button
Sensor
Back to top
