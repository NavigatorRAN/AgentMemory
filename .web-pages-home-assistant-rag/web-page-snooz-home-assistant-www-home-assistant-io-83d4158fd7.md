# Snooz - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/snooz
- Final URL: https://www.home-assistant.io/integrations/snooz
- Canonical URL: https://www.home-assistant.io/integrations/snooz/
- Fetched at: 2026-06-28T03:17:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SNOOZ devices into Home Assistant.

## Extracted Text

On this page
Configuration
Supported devices
Setup
Entering pairing mode
Platforms
Fan
List of actions
Integrates SNOOZ devices into Home Assistant.
To add the Snooz device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Snooz .
Follow the instructions on screen to complete the setup.
The SNOOZ integration will automatically discover devices once the Bluetooth integration is enabled and functional.
SNOOZ White Noise Machine
Once a device is discovered, it needs to be put into pairing mode to complete setup.
Ensure the device is not connected to a mobile app or any other Bluetooth controller.
Hold your finger on the power button until all buttons begin pulsing on and off (~ 5 seconds).
Devices are exposed as Fan entities with a persistent connection to the device.
Fan speed percentage is mapped to the device volume level.
Note
Speed percentages less than 10 have no effect - they all map to a value of 1 on the device.
The Snooz integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Transition off ( snooz.transition_off )
Gradually lowers a Snooz device’s volume, then turns it off.
Transition on ( snooz.transition_on )
Gradually changes a Snooz device’s volume over a set duration.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Snooz device was introduced in Home Assistant 2022.11, and it's used by
159 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@AustinBrunkhorst
Categories
Back to top
