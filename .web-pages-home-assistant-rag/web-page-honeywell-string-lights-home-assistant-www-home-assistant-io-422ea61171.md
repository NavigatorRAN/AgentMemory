# Honeywell String Lights - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/honeywell_string_lights
- Final URL: https://www.home-assistant.io/integrations/honeywell_string_lights
- Canonical URL: https://www.home-assistant.io/integrations/honeywell_string_lights/
- Fetched at: 2026-06-28T02:50:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Honeywell String Lights into Home Assistant.

## Extracted Text

On this page
Configuration
Assumed state
Supported devices
Removing the integration
To remove an integration instance from Home Assistant
The Honeywell String Lights integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control a Honeywell radio frequency (RF) remote-controlled string light set from Home Assistant.
The integration uses the Radio Frequency entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] platform to send the turn on and turn off commands. This means you need a compatible RF transmitter (for example, an ESPHome device with a 433.92 MHz OOK transmitter) set up before you can add the Honeywell String Lights.
To add the Honeywell String Lights device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Honeywell String Lights .
Follow the instructions on screen to complete the setup.
Radio frequency transmitter
Select the RF transmitter that Home Assistant should use to control the lights. Only transmitters that support 433.92 MHz OOK transmissions are shown.
Because RF transmission is a one-way broadcast, Home Assistant cannot confirm whether the lights actually turned on or off. The integration therefore uses the assumed state pattern: the state is the last state Home Assistant set, and it is restored across restarts.
The integration has been tested with the Honeywell String Lights sold with a 433.92 MHz OOK remote.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Honeywell String Lights device was introduced in Home Assistant 2026.5, and it's used by
4 active installations.
Its IoT class is Assumed State.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@balloob
Categories
Light
Back to top
