# Bosch SHC - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bosch_shc
- Final URL: https://www.home-assistant.io/integrations/bosch_shc
- Canonical URL: https://www.home-assistant.io/integrations/bosch_shc/
- Fetched at: 2026-06-28T02:32:06Z
- Content type: text/html; charset=UTF-8

## Description

Integrate Bosch SHC.

## Extracted Text

On this page
Configuration
Binary sensor
Cover
Sensor
Switch
Client registration
The Bosch SHC integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Bosch Smart Home Controller to Home Assistant to control and monitor your Bosch Smart Home devices.
There is currently support for the following device types within Home Assistant:
To add the Bosch SHC hub to your Home Assistant instance, use this My button:
Bosch SHC can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bosch SHC .
Follow the instructions on screen to complete the setup.
The binary sensor platform allows you to monitor the states of your shutter contact and battery sensors. Binary sensor devices are added for each of the following devices:
Shutter Contact
Shutter Contact II
Battery powered devices
The cover platform allows you to control your covers. Cover devices are added for each Shutter Control device.
The sensor platform allows you to monitor the states of your temperature, humidity, purity, air quality, power, energy, and valve tappet sensors. Sensor devices are added for each of the following devices:
Thermostat
Wall Thermostat
Twinguard
Smart Plug
Smart Plug Compact
The switch platform allows you to control your outlets and light switches. Switches are added for each of the following devices:
Light Switch
To start the client registration, press and hold the button on the controller until the LED starts flashing. During configuration, a client SSL cert/key pair is generated and registered on the controller. For this step, the system password of your controller is needed, which was created upon initial setup of the controller.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bosch SHC hub was introduced in Home Assistant 2021.6, and it's used by
1657 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tschamm
Categories
Hub
Back to top
