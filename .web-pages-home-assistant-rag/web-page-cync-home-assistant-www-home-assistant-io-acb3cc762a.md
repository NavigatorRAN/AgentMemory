# Cync - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cync
- Final URL: https://www.home-assistant.io/integrations/cync
- Canonical URL: https://www.home-assistant.io/integrations/cync/
- Fetched at: 2026-06-28T02:35:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Cync devices into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Lights
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Cync integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with smart devices sold by GE Lighting . Cync, formerly known as “C by GE”, is the name given to GE Lighting’s line of smart devices.
A Cync account is required to use this integration.
Any device you wish to add to Home Assistant must first be set up via the Cync app.
At least one Wi-Fi connected device is required to be set up in your Cync account.
Older, Bluetooth-only Cync devices may not be recognized by the integration without a Cync bridge device.
To add the Cync hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cync .
Follow the instructions on screen to complete the setup.
Email
Your Cync account’s email address
Password
Your Cync account’s password
The Cync integration provides the following entities.
Supported operations:
On/Off
Brightness*
Color temperature*
RGB color*
*If supported by device.
The following lighting features are not yet supported:
Dynamic effects
Light shows
Music shows
LED strip segment control
Cync servers only allow one instance of your account to connect at a time. If you open the Cync app while Home Assistant is running, the integration will briefly lose its connection. It will automatically reconnect after a 10 second waiting period.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cync hub was introduced in Home Assistant 2025.10, and it's used by
1028 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Kinachi249
Categories
light
Back to top
