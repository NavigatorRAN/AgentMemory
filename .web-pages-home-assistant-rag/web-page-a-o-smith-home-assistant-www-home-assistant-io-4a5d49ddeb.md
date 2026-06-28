# A. O. Smith - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aosmith
- Final URL: https://www.home-assistant.io/integrations/aosmith
- Canonical URL: https://www.home-assistant.io/integrations/aosmith/
- Fetched at: 2026-06-28T02:28:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your A. O. Smith water heater with Home Assistant.

## Extracted Text

On this page
Known compatible models
Configuration
Platforms
Water heater
Sensor
Select
Disclaimer
The A. O. Smith integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a compatible A. O. Smith iCOMM-enabled water heater from Home Assistant.
Before using this integration, your water heater must be connected to a Wi-Fi network and linked to your account using the A. O. Smith mobile app ( iOS / Android ).
EE9-40R55DV
EE9-40H55DV
EE9-50R55DV
EE9-50H55DV
EE12-50R55DVF
EE12-50H55DVF
EE12-55H55DVF
HETF-50-100
HPA10-40H45DV
HPA10-50H45DV
HPA10-66H45DV
HPA10-80H45DV
HPS10-50H45DV
HPS10-66H45DV
HPS10-80H45DV
HPSX-50-DHPT
HPSX-50-DHPT 2
HPSX-66-DHPT
HPSX-66-DHPT 2
HPSX-80-DHPT
HPSX-80-DHPT 2
HPTA-40
HPTA-50
HPTA-66
HPTA-80
HPTS-50
HPTS-66
HPTS-80
HPV10-50H01DV
HPV10-66H01DV
HPV10-80H01DV
Water heaters that can be controlled using the A. O. Smith mobile app should be compatible with this integration. If your water heater is not detected by the integration, but it can be controlled using the mobile app, please open an issue on GitHub so that support can be added. Similarly, if your water heater is working with this integration, but its model number is not listed here, please open a documentation issue so it can be added to the list.
To add the A. O. Smith hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select A. O. Smith .
Follow the instructions on screen to complete the setup.
The water heater entity offers the following capabilities:
Adjust target temperature
Change operation mode
Enable/disable away mode (will set the water heater to “vacation” mode)
Operation modes
This table shows the supported operation modes. The available modes will depend on your specific water heater model.
Mode displayed in A. O. Smith app Mode displayed in Home Assistant Mode name for water_heater.set_operation_mode action Electric/Standard Electric electric Hybrid Eco eco Heat Pump Heat Pump heat_pump Vacation N/A - use away mode N/A - use water_heater.set_away_mode
The following sensor entities are available:
Hot water availability (percentage)
Energy usage
If your water heater supports the “Hot Water+” feature, a select entity will be added to control the Hot Water+ level.
This integration is not affiliated with or endorsed by A. O. Smith.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The A. O. Smith hub was introduced in Home Assistant 2024.1, and it's used by
201 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdr99
Categories
Back to top
