# Ecoforest - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ecoforest
- Final URL: https://www.home-assistant.io/integrations/ecoforest
- Canonical URL: https://www.home-assistant.io/integrations/ecoforest/
- Fetched at: 2026-06-28T02:39:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ecoforest fireplaces with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported models
Number
Switch
Sensor
The Ecoforest integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows monitoring and control of local Ecoforest fireplaces in Home Assistant.
There is currently support for the following device platforms within Home Assistant:
To configure the Ecoforest integration you will need to enter your Ecoforest credentials which are the same ones you would use with the manufacturer app. The image below shows how to obtain the credentials:
Username: use the serial number of the device as identified by 1.
Password: use the first 8 characters of the wifi password as identified by 4.
To add the Ecoforest device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ecoforest .
Follow the instructions on screen to complete the setup.
Any Ecoforest device working with Ecoforest Home should be supported, this integration is confirmed to support:
Ecoforest Cordoba Glass (using firmware version 30Abr19_v2z )
The Ecoforest integration exposes a number entity for the device power level.
The Ecoforest integration exposes a switch entity to turn status of the device to on and off.
The Ecoforest integration exposes multiple sensors to monitor various features:
temperature: a sensor for the current ambient temperature
cpu_temperature: a sensor for the current CPU temperature
gas_temperature: a sensor for the current gas temperature
ntc_temperature: a sensor for the current NTC probe temperature
status: a sensor for the current status of the device. Possible values are: off, starting, pre-heating, on, shutting down, standby, alarm.
alarm: a sensor for the current alarm of the device. Possible values are: air depression, pellets, CPU overheating, unknown.
depression: a sensor for the current depression air entrance.
working_hours: a sensor for the total number of working hours of the device.
ignitions: a sensor for the total number of ignitions of the device.
live_pulse: a sensor for the current duration of the live pulse.
pulse_offset: a sensor for the current duration of the waiting pulse.
extractor: a sensor for the current extractor velocity.
convecto_air_flow: a sensor for the current device air velocity.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ecoforest device was introduced in Home Assistant 2023.10, and it's used by
36 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pjanuario
Categories
Climate
Back to top
