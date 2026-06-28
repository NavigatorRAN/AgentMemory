# Raspberry Pi Power Supply Checker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rpi_power
- Final URL: https://www.home-assistant.io/integrations/rpi_power
- Canonical URL: https://www.home-assistant.io/integrations/rpi_power/
- Fetched at: 2026-06-28T03:13:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Raspberry Pi Power Supply Checker within Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
The Raspberry Pi Power Supply Checker integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect bad power supply on the Raspberry Pi that is running Home Assistant.
Note
This integration can only monitor the Raspberry Pi that Home Assistant is running on. It cannot monitor remote Raspberry Pis over the network.
If you have multiple Raspberry Pis and are running Home Assistant on one of them, this integration will only check the power supply status of the Pi where Home Assistant is installed.
To add the Raspberry Pi Power Supply Checker integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Raspberry Pi Power Supply Checker .
Follow the instructions on screen to complete the setup.
This integration interfaces with the kernel’s power management system to detect whether the Raspberry Pi is receiving sufficient power. It creates a binary sensor that indicates whether your power supply is adequate (normal state) or if there are voltage issues (problem state).
If issues are detected, consider upgrading to a higher quality power supply that can deliver stable 5V power with sufficient current for your Raspberry Pi model.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Raspberry Pi Power Supply Checker integration was introduced in Home Assistant 0.116, and it's used by
27% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shenxn
@swetoast
Categories
System monitor
Back to top
