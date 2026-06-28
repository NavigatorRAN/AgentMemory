# IamMeter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iammeter
- Final URL: https://www.home-assistant.io/integrations/iammeter
- Canonical URL: https://www.home-assistant.io/integrations/iammeter/
- Fetched at: 2026-06-28T02:51:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IAMMETER sensor within Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Single-phase energy meter (WEM3080/WEM3162)
Three-phase energy meter (WEM3080T)
Related topics
IAMMETER provides both a bi-directional single-phase energy meter( WEM3080 ) and a bi-directional three-phase energy monitor ( WEM3080T ). Both of them can be integrated into Home Assistant.
The WEM3050T is the latest three-phase/split-phase meter, released by IAMMETER on Nov 2023.
The WEM3050T provides nearly all of the features the WEM3080T provides, with the exception of the cloud service.
The WEM3050T can be integrated into Home Assistant by all of the methods that WEM3080T supports.
Because there is no cloud service by default, the WEM3050T is much cheaper than the WEM3080T.
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : iammeter host : IP_ADDRESS_OF_HOST
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your IAMMETER.
port integer ( Optional , default: 80 )
port of your IAMMETER.
name string ( Optional , default: IamMeter )
Name for the sensor entity.
Sensors available in the library:
name Unit Description wem3080_voltage V Voltage. wem3080_current A current. wem3080_power W active power. wem3080_importenergy kWh Energy consumption from grid wem3080_exportgrid kWh Energy export to grid
name Unit Description wem3080t_voltage_a V A phase voltage wem3080t_current_a A A phase current wem3080t_power_a W A phase active power wem3080t_importenergy_a kWh A phase import energy wem3080t_exportgrid_a kWh A phase export energy wem3080t_frequency_a Hz A phase frequency wem3080t_pf_a A phase power factor wem3080t_voltage_b V B phase voltage wem3080t_current_b A B phase current wem3080t_power_b W B phase active power wem3080t_importenergy_b kWh B phase import energy wem3080t_exportgrid_b kWh B phase export energy wem3080t_frequency_b Hz B phase frequency wem3080t_pf_b B phase power factor wem3080t_voltage_c V C phase voltage wem3080t_current_c A C phase current wem3080t_power_c W C phase active power wem3080t_importenergy_c kWh C phase import energy wem3080t_exportgrid_c kWh C phase export energy wem3080t_frequency_c Hz C phase frequency wem3080t_pf_c C phase power factor
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IamMeter integration was introduced in Home Assistant 0.107, and it's used by
103 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lewei50
Categories
Energy
Sensor
Back to top
