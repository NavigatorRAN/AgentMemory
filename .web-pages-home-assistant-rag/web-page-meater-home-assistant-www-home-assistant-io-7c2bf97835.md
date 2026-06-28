# Meater - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meater
- Final URL: https://www.home-assistant.io/integrations/meater
- Canonical URL: https://www.home-assistant.io/integrations/meater/
- Fetched at: 2026-06-28T02:59:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Meater Temperature Probe within Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
The Meater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows for communicating with the Meater Temperature Probe from Apption Labs.
To add the Meater hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Meater .
Follow the instructions on screen to complete the setup.
Once configuration is complete, probes will be added as soon as they’re seen by Home Assistant. They will be marked unavailable when the probes are disconnected from Meater Cloud.
Currently, both the internal and external temperature of each probe will be displayed.
Devices will only be returned from the Meater Cloud API after the following criteria are met. There may be a delay between the Meater Cloud seeing your device and it being returned by the API.
Device must be seen by the Meater Cloud. Ensure you’ve completed a cook while connected to Meater Cloud.
The Meater app or Block must have an active Bluetooth connection with the device.
The Meater app or Block must have an active Meater Cloud connection.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Meater hub was introduced in Home Assistant 2022.5, and it's used by
3271 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Sotolotl
@emontnemery
Categories
Sensor
Back to top
