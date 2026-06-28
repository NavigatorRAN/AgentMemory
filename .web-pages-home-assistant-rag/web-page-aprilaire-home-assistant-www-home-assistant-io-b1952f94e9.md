# AprilAire - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aprilaire
- Final URL: https://www.home-assistant.io/integrations/aprilaire
- Canonical URL: https://www.home-assistant.io/integrations/aprilaire/
- Fetched at: 2026-06-28T02:28:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate AprilAire devices into Home Assistant.

## Extracted Text

On this page
Supported Models
Prerequisites
Configuration
Caution regarding device limitations
The AprilAire integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control an AprilAire thermostat.
This integration supports AprilAire 8800-series Home Automation Wi-Fi Thermostats and 6000-series Wi-Fi Zone Control devices which support setting the thermostat to automation mode. It is known that there are some models which are marketed as home automation capable that do not support automation mode, and are therefore not supported.
To connect to the thermostat, you will need to enable automation mode. This involves going into the Contractor Menu on your thermostat and changing the Connection Type to Automation. As the specific instructions can vary per model, consult the manual for your specific model.
To add the AprilAire device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AprilAire .
Follow the instructions on screen to complete the setup.
Due to limitations of the thermostats, only one automation connection to a device is permitted at one time (the AprilAire app is not included in this limitation as it uses a separate protocol). Attempting to connect multiple times to the same thermostat simultaneously can cause various issues, including the thermostat becoming unresponsive and shutting down. If this does occur, power cycling the thermostat should restore functionality.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AprilAire device was introduced in Home Assistant 2024.3, and it's used by
22 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chamberlain2007
Categories
Climate
Back to top
