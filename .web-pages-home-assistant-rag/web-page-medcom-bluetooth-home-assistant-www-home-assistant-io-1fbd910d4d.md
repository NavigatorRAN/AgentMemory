# Medcom Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/medcom_ble
- Final URL: https://www.home-assistant.io/integrations/medcom_ble
- Canonical URL: https://www.home-assistant.io/integrations/medcom_ble/
- Fetched at: 2026-06-28T02:59:06Z
- Content type: text/html; charset=UTF-8

## Description

Integrate International Medcom radiation monitors

## Extracted Text

On this page
Configuration
Supported devices
Sensors
Integrates International Medcom Bluetooth-enabled radiation monitors into Home Assistant.
International Medcom is an American company that manufactures radiation detection instruments that are used in professional environments, for home and office, and by community projects worldwide.
This integration supports the Medcom Inspector BLE via a Bluetooth low-energy interface.
To add the Medcom Bluetooth device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Medcom Bluetooth .
Follow the instructions on screen to complete the setup.
The Medcom Bluetooth integration will automatically discover devices once the Bluetooth integration is enabled and working. It will list each detected Inspector using its Bluetooth MAC address as the serial number.
To limit the load on the Bluetooth radio on the Home Assistant side, the integration only polls for a reading every 5 minutes, which should be adequate for ongoing background monitoring. An Inspector BLE battery should last several months with continuous use before needing replacement.
Medcom Inspector BLE
This integration adds a counts-per-minute (“CPM”) sensor for each detected Inspector BLE device. See the Inspector BLE manual for how to convert this CPM reading into another unit if desired, which can be done via a custom template sensor
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Medcom Bluetooth device was introduced in Home Assistant 2023.10, and it's used by
0 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elafargue
Categories
Environment
Sensor
Back to top
