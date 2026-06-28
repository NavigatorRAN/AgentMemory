# LiteJet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/litejet
- Final URL: https://www.home-assistant.io/integrations/litejet
- Canonical URL: https://www.home-assistant.io/integrations/litejet/
- Fetched at: 2026-06-28T02:57:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the LiteJet hub, Centralite Elegance or Centralite Jetstream within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Trigger
LiteJet is a centralized lighting system that predates most home automation technology. All lights and wall switches are wired to a central panel. This central panel has a serial port interface that allows a computer to control the system via LiteJet’s third party protocol. Home Assistant integrates the LiteJet 3rd party protocol and allows you to get the status and control the connected lights. This integration also supports the Centralite Elegance and Centralite Jetstream.
Your LiteJet MCP should be configured for 19.2 K baud, 8 data bits, 1 stop bit, no parity, and to transmit a ‘CR’ after each response. These settings can be configured using the LiteJet programming software from the Dragon Technologies Programming page. Connect the LiteJet’s RS232-2 port to your computer.
To add the LiteJet hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LiteJet .
Follow the instructions on screen to complete the setup.
By default only light entities will be enabled. Scene and switch entities can be individually enabled on the integration’s entity list page.
LiteJet switches can be used as triggers to allow those buttons to behave differently based on hold time. For example, automation can distinguish quick tap versus long hold.
platform ( Required ): Must be ‘litejet’.
number ( Required ): The switch number to be monitored.
held_more_than ( Optional ): The minimum time the switch must be held before the trigger can activate.
held_less_than ( Optional ): The maximum time the switch can be held for the trigger to activate.
The trigger will activate at the earliest moment both held_more_than and held_less_than are known to be satisfied. If neither are specified, the trigger activates the moment the switch is pressed. If only held_more_than is specified, the trigger will activate the moment the switch has been held down at least that time. If held_less_than specified, the trigger can only activate when the switch is released.
automation : - triggers : platform : litejet number : 55 held_more_than : milliseconds : 1000 held_less_than : milliseconds : 2000
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LiteJet hub was introduced in Home Assistant 0.32, and it's used by
3 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joncar
Categories
Light
Scene
Switch
Back to top
