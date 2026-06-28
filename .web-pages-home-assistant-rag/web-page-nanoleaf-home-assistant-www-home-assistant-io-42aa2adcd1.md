# Nanoleaf - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nanoleaf
- Final URL: https://www.home-assistant.io/integrations/nanoleaf
- Canonical URL: https://www.home-assistant.io/integrations/nanoleaf/
- Fetched at: 2026-06-28T03:02:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Nanoleaf Panels into Home Assistant.

## Extracted Text

On this page
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The Nanoleaf integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor Nanoleaf Light Panels, Canvas, Shapes, Elements, and Lines.
This integration does not support the Nanoleaf Remote and Essentials lights. Controlling Nanoleaf Essentials lights is possible over Thread and Bluetooth through the HomeKit Controller integration.
To add the Nanoleaf device to your Home Assistant instance, use this My button:
Nanoleaf can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nanoleaf .
Follow the instructions on screen to complete the setup.
Transition and brightness
When using a transition in an action (such as light.turn_on ), the transition is only applied to brightness and does not apply to color. When an action has a transition set, but no brightness is included, the light will automatically transition to 100% brightness.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nanoleaf device was introduced in Home Assistant 0.67, and it's used by
1.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@milanmeu
@joostlek
@loebi-ch
@JaspervRijbroek
@jonathanrobichaud4
Categories
Button
Event
Light
Back to top
