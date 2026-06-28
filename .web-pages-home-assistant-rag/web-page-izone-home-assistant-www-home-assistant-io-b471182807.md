# iZone - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/izone
- Final URL: https://www.home-assistant.io/integrations/izone
- Canonical URL: https://www.home-assistant.io/integrations/izone/
- Fetched at: 2026-06-28T02:53:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate iZone climate control devices with Home Assistant.

## Extracted Text

On this page
Supported hardware
Configuration
Manual configuration
Network settings
Master controller
Zones
Control zone (climate control mode)
When you can set the controller’s target temperature
When you set temperatures on individual zones
Debugging
List of actions
Related topics
The iZone integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows access of control of a local iZone ducted reverse-cycle climate control devices. These are largely available in Australia.
Any current iZone unit with ducted reverse cycle air-conditioning, and the CB wired or wireless bridge device installed should currently work. There is currently no support for the iZone lights, reticulation, or other devices.
To add the iZone hub to your Home Assistant instance, use this My button:
iZone can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select iZone .
Follow the instructions on screen to complete the setup.
Alternatively, the iZone integration can be configured manually via the
configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file if there is more than one iZone system on the local
network and one or more must be excluded use manual configuration.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Full manual example configuration.yaml entry izone : exclude : - " 000013170"
Configuration Variables
Looking for your configuration file?
exclude list ( Optional )
Exclude particular units from integration with Home Assistant.
The iZone system uses UDP broadcast discovery on the local network to find and communicate with iZone devices. For discovery to work reliably, Home Assistant must be able to receive this broadcast discovery traffic. In most cases, this means Home Assistant and the iZone bridge need to be on the same local network segment, like the same VLAN. If they are on different segments, standard routing is usually not enough. Your network must support a UDP broadcast relay, directed broadcast, or a similar feature to forward this traffic between segments.
For connectivity, Home Assistant must be able to send outbound UDP discovery packets to destination port 12107 , listen locally for inbound UDP iZone messages on port 7005 , and use TCP port 80 for HTTP communication with the bridge. The integration currently listens on 0.0.0.0 and sends discovery to local IPv4 broadcast addresses, which is not configurable.
Unit modes off, heat, cool, dry, and fan only are supported. For units fitted with the ‘iSave’ system, which vents in external air into the house, this is available as ‘eco’ mode.
Zones have three modes available, closed, open, and auto. These are mapped to Home Assistant modes off, fan only, and auto, respectively. Only the auto mode supports setting the temperature.
When your iZone system has multiple climate-controlled zones, the target temperature behavior depends on your system configuration:
You can set the target temperature directly on the controller in these situations:
Your system is in RAS mode (return air sensor mode, not master/slave mode)
Your system is in master mode, but the control zone is set to zone 13 (the master unit itself) or an invalid zone number
Any of your zones don’t have a temperature sensor installed
In these cases, you can set the target temperature on the controller entity just like any other climate entity.
When your system is in master mode with a valid control zone (and all zones have temperature sensors), you set the target temperature for each individual zone instead of the controller.
The climate controller automatically selects the zone that is furthest from its target temperature and uses that zone’s current and target temperatures to control the air conditioner unit, closing zones that have already reached their target.
In this mode, the controller entity reports:
The current control zone that has been selected
The target temperature for that zone (read-only on the controller; set it via the individual zone entities)
The current temperature of the control zone
You can configure sensors to read these values (in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] ), along with the supply temperature (use the ID of your unit):
# Example configuration.yaml entry to create sensors # from the izone controller state attributes template : - sensor : - name : " Control zone" state : " {{ state_attr('climate.izone_controller_0000XXXXX','control_zone_name') }}" - name : " Target temperature" state : " {{ state_attr('climate.izone_controller_0000XXXXX','control_zone_setpoint') }}" unit_of_measurement : " °C" - name : " Supply temperature" state : " {{ state_attr('climate.izone_controller_0000XXXXX','supply_temperature') }}" unit_of_measurement : " °C"
And then graph them on a dashboard, along with the standard values such as the current temperature. Either add the sensor entities via the visual editor, or cut and paste this
snippet into the code editor:
# Example snippet for dashboard card configuration (code editor) entities : - entity : sensor.control_zone_target - entity : sensor.control_zone - entity : sensor.temperature_supply - entity : climate.izone_controller_0000XXXXX hours_to_show : 24 refresh_interval : 0 type : history-graph
If you’re trying to track down issues with the integration, set up logging for it:
# Example configuration.yaml with logging for iZone logger : default : warning logs : homeassistant.components.izone : debug pizone : debug
This will help you to find network connection issues.
The iZone integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set maximum airflow ( izone.airflow_max )
Sets the maximum airflow percentage for an iZone zone.
Set minimum airflow ( izone.airflow_min )
Sets the minimum airflow percentage for an iZone zone.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The iZone hub was introduced in Home Assistant 0.100, and it's used by
239 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Swamp-Ig
Categories
Climate
Back to top
