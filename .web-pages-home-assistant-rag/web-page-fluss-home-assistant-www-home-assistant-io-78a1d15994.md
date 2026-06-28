# Fluss+ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fluss
- Final URL: https://www.home-assistant.io/integrations/fluss
- Canonical URL: https://www.home-assistant.io/integrations/fluss/
- Fetched at: 2026-06-28T02:43:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Fluss+ devices within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Button
Removing the integration
To remove an integration instance from Home Assistant
The Fluss+ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Fluss+ devices through Home Assistant. Fluss turns your phone into a remote key that can open your garage, your gate, your door or even the parking at your office - giving you complete control. The Home Assistant integration allows you to trigger Fluss+ devices via Wi-Fi to open or close a connected motor device.
A Fluss+ device (Can order here: https://fluss.io/flussplus ).
A Fluss+ account.
The Fluss+ app installed on your smart phone.
A Fluss+ device physcially connected to your device (for example, a garage door opener).
Fluss+ device connected to your Wi-Fi network and has internet access.
During setup of the integration in Home Assistant, you will be prompted to input your API key.
You can request an API key in the Fluss+ app under your profile settings.
The API key will allow you to access your Fluss+ devices and trigger them through Home Assistant.
To add the Fluss+ integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fluss+ .
Follow the instructions on screen to complete the setup.
A button in Home Assistant represents a Fluss device you have access to. You can press the button for a certain device via Wi-Fi, and it will then send a command to the connected device (like a garage door opener).
Example
If you have access to three devices in the Fluss+ app, named “Home Garage Door,” “Front Gate,” and “Office Park,” Home Assistant will display three buttons, each labeled with the corresponding device name. Pressing the “Home Garage Door” button sends a command to the Fluss+ device connected to your garage door opener, which will then trigger the motor to open / close. The same applies to the other devices.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fluss+ integration was introduced in Home Assistant 2026.1, and it's used by
6 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fluss
Categories
Back to top
