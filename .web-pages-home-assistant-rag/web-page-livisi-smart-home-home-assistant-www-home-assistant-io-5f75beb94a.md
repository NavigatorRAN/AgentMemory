# LIVISI Smart Home - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/livisi
- Final URL: https://www.home-assistant.io/integrations/livisi
- Canonical URL: https://www.home-assistant.io/integrations/livisi/
- Fetched at: 2026-06-28T02:57:10Z
- Content type: text/html; charset=UTF-8

## Description

Access and control your LIVISI Smart Home Controller (SHC) and its connected RWE/innogy devices.

## Extracted Text

On this page
Prerequisites
Configuration
Extra configuration
Device discovery
The LIVISI Smart Home integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your LIVISI Smart Home Controller (SHC) to Home Assistant. The SHC can control compatible devices from RWE/innogy connected to it.
The following devices are currently supported by this integration:
Indoor Smart Plug (PSS)
Inwall Switch (ISSx)
Outdoor Smart Plug (PSSO)
Room Heating Control (VRCC) that includes support for physical heating devices such as Radiator Thermostat (RSTx), Room Thermostat (WRT) or Floor Heating Control (FSC8)
Wall Switches (ISS, ISS2)
Window-Door Sensor (WDS)
This integration communicates with the local version of LIVISI SmartHome only.
To activate the local SmartHome functionality, please use the LIVISI App and go to Settings >> General Settings >> Local SmartHome and click Activate .
Please visit LIVISI Community for more information.
To add the LIVISI Smart Home hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LIVISI Smart Home .
Follow the instructions on screen to complete the setup.
The current integration will not find your SHC automatically and needs to be configured manually. You will need to provide the IP address and the local password for the controller.
All devices are automatically discovered and included by the integration. If you include a new device in LIVISI SmartHome, the device will automatically appear in Home Assistant after a few minutes.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LIVISI Smart Home hub was introduced in Home Assistant 2022.12, and it's used by
217 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@StefanIacobLivisi
@planbnet
Categories
Binary sensor
Climate
Switch
Back to top
