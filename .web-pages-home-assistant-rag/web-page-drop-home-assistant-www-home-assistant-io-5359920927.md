# DROP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/drop_connect
- Final URL: https://www.home-assistant.io/integrations/drop_connect
- Canonical URL: https://www.home-assistant.io/integrations/drop_connect/
- Fetched at: 2026-06-28T02:38:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate DROP into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
The DROP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity with
DROP smart water system devices via a local MQTT API.
There is currently support for the following DROP products within Home Assistant:
DROP Hub : centralized system status and control.
Leak Detector : reports detected leaks around the home.
Softener : improves water quality by decreasing water hardness with integral water shutoff.
Filter : improves water quality by removing contaminants with integral water shutoff.
Protection Valve : automatic water shutoff with slow leak detection.
Pump Controller : smart replacement for an FSG pressure switch.
RO Filter : reverse osmosis drinking water filtration.
Salt Sensor : alerts when the salt level in the softener brine tank is low.
Alert : monitors both the water level in a sump pit and electrical power to the sump pump.
To use DROP with Home Assistant, you must have already configured the MQTT platform.
To enable the DROP integration, use the DROP Connect app to connect your DROP Hub to your MQTT broker:
Start the DROP Connect app and connect to your DROP Hub.
In the Hub Network Settings section on the System > Advanced page, tap the Configure MQTT button.
Enter the MQTT broker address, port number, username, and password.
Click Connect and confirm that the DROP Hub has connected to the MQTT broker.
Once the DROP Hub is connected to your MQTT broker, the devices on your DROP system should be discovered by Home
Assistant.
Manual configuration steps
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
Set up the new discovered devices.
Important
The MQTT broker address and port used for the DROP Hub must be the same as configured for the Home Assistant MQTT integration.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DROP hub was introduced in Home Assistant 2024.1, and it's used by
30 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ChandlerSystems
@pfrazer
Categories
Binary sensor
Select
Sensor
Switch
Back to top
