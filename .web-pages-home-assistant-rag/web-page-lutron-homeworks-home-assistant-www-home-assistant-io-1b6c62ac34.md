# Lutron Homeworks - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/homeworks
- Final URL: https://www.home-assistant.io/integrations/homeworks
- Canonical URL: https://www.home-assistant.io/integrations/homeworks/
- Fetched at: 2026-06-28T02:49:56Z
- Content type: text/html; charset=UTF-8

## Description

How to use Lutron Homeworks Series 4 & 8 with Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Lutron is an American lighting control company. The Lutron Homeworks Series 4 & 8 systems are relatively old (~2003), and use RS-232 connections to communicate with home automation systems. The homeworks integration in Home Assistant is responsible for communicating with the main controller for these systems. Communication is through an ethernet to serial converter (NPort, for example).
Only a subset of the Homeworks system is supported - lights and keypads.
Lutron has created many systems over the years, each with their own unique interfacing protocol. There are three Homeworks systems - QS, Series 4 & 8, and original. This platform is only for Series 4 & 8. There is another integration lutron which handles Lutron RadioRA 2 systems.
Homeworks keypad buttons are momentary switches. The button is pressed and released, meaning that there is no “state”. Buttons generate homeworks_button_press and homeworks_button_release events. These events contain the “id”, “name”, and “button” of the button that was pressed. “id” is derived from “name”, and “button” is the number of the button on the keypad (starting at 1). It’s also possible to add binary sensor entities which indicate if a keypad LED is lit and button entities which can be used to trigger the actions bound to a keypad button.
To add the Lutron Homeworks hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Lutron Homeworks .
Follow the instructions on screen to complete the setup.
The protocol for automatically extracting device information from the controller isn’t documented. Lights and keypads need to be added manually. This is done by configuring the integration after it has been added.
The Lutron Homeworks integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Send command ( homeworks.send_command )
Sends a custom command to a Lutron Homeworks controller.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Lutron Homeworks hub was introduced in Home Assistant 0.85, and it's used by
32 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Button
Hub
Light
Back to top
