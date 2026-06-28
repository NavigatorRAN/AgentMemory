# eQ-3 Bluetooth Smart Thermostats - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/eq3btsmart
- Final URL: https://www.home-assistant.io/integrations/eq3btsmart
- Canonical URL: https://www.home-assistant.io/integrations/eq3btsmart/
- Fetched at: 2026-06-28T02:41:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate eQ-3 Bluetooth Smart Thermostats into Home Assistant.

## Extracted Text

On this page
Pairing
Configuration
The eQ-3 Bluetooth Smart Thermostats integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate eQ-3 Bluetooth Smart Thermostats.
The current functionality allows setting the temperature as well as controlling the supported modes with help of the eq3btsmart library.
As the device doesn’t contain a temperature sensor ( read more ), we report target temperature also as current one.
Pairing your eQ-3 Bluetooth Smart Thermostat device works differently based on your method of connection and the device’s firmware version.
ESPHome Bluetooth Proxies
For firmware versions below 148, no additional configuration is required when using ESPHome Bluetooth Proxies.
Since version 148, a security flaw in the devices has been fixed that now requires entering a passkey.
To configure the passkey, add the following to your ESPHome Bluetooth Proxy’s configuration:
esp32_ble : io_capability : keyboard_only ble_client : - mac_address : <MAC> id : my_eq3_thermostat auto_connect : true on_passkey_request : then : - ble_client.passkey_reply : id : my_eq3_thermostat passkey : <PIN code displayed on the thermostat. To display the PIN hold down the main button.>
For further information see the ESPHome documentation .
Other
Pairing is only required with firmware versions above 120.
Before configuring Home Assistant you need to pair the thermostat to your Bluetooth adapter using bluetoothctl .
bluetoothctl
scan on
# Wait for the thermostat to show up and copy its MAC address # Expected output: [NEW] Device 00:1A:23:27:F8:4E CC-RT-BLE
scan off
pair <MAC>
# Hold down the main button on the thermostat to display the PIN # Enter the displayed PIN when prompted
trust <MAC>
disconnect <MAC>
exit
To add the eQ-3 Bluetooth Smart Thermostats device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select eQ-3 Bluetooth Smart Thermostats .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The eQ-3 Bluetooth Smart Thermostats device was introduced in Home Assistant 2024.5, and it's used by
219 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@eulemitkeule
@dbuezas
Categories
Climate
Back to top
