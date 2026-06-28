# iNELS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/inels
- Final URL: https://www.home-assistant.io/integrations/inels
- Canonical URL: https://www.home-assistant.io/integrations/inels/
- Fetched at: 2026-06-28T02:52:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate iNELS with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
To remove a setting from eLANRF
To remove a setting from CU3
The iNELS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor the devices connected to your control units ( BUS or eLAN ).
There is currently support for the following device types within Home Assistant:
Switch
MQTT broker.
eLAN devices flashed with version mqtt_1.0 or later.
BUS devices flashed with version mqtt_1.0 or later.
See the Wiki page for instructions on how to configure the control units.
To add the iNELS hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select iNELS .
Follow the instructions on screen to complete the setup.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Launch the IDM application.
Select Configuration of the central unit from the menu.
Select MQTT settings then choose Not Connect in the mode options and click Save to CU .
Open the eLANRF web interface.
Go to Settings and disable MQTT under MQTT connection .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The iNELS hub was introduced in Home Assistant 2025.11, and it's used by
11 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@epdevlab
Categories
Back to top
