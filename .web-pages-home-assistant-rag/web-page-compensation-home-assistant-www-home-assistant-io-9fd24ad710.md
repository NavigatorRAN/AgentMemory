---
source_url: "https://www.home-assistant.io/integrations/compensation"
final_url: "https://www.home-assistant.io/integrations/compensation"
canonical_url: "https://www.home-assistant.io/integrations/compensation/"
source_handle: "web:www-home-assistant-io:9fd24ad7105c"
source_section: "integrations-compensation"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "18ddbb14a2d6b39d7d5aa19c324c88ccb4b0f8f4e27322d101ef039019385233"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Compensation - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/compensation
- Final URL: https://www.home-assistant.io/integrations/compensation
- Canonical URL: https://www.home-assistant.io/integrations/compensation/
- Fetched at: 2026-06-28T02:34:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate compensation sensors into Home Assistant.

## Extracted Text

On this page
Configuration
The Compensation integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] consumes the state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] from other sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] . It exports the compensated value as state in a separate entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] and the following values as attributes: entity_id and coefficients . A single polynomial, linear by default, is fit to all data points provided.
To enable the compensation sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry compensation : media_player_db_volume : source : media_player.yamaha_receiver attribute : volume_level unit_of_measurement : dB data_points : - [ 0.2 , -80.0 ] - [ 1.0 , 0.0 ] media_player_zone_2_db_volume : source : media_player.yamaha_receiver_zone_2 attribute : volume_level unit_of_measurement : dB # Ensure that the sensor's value will not have a state lower than -80.0 # when the source sensors value is less than 0.2 lower_limit : true # Ensure that the sensor's value will not have a state greater than 0.0 # when the source sensors value is greater than 1.0 upper_limit : true data_points : - [ 0.2 , -80.0 ] - [ 1.0 , 0.0 ]
Configuration Variables
Looking for your configuration file?
attribute string ( Optional )
Attribute from the source to monitor/compensate. When omitted, the state value of the source will be used.
data_points list Required
The collection of data point conversions with the format [uncompensated_value, compensated_value] , for example, [1.0, 2.1] . The number of required data points is equal to the polynomial degree + 1. For example, a linear compensation (with degree: 1 ) requires at least 2 data points.
degree integer ( Optional , default: 1 )
The degree of a polynomial. For example, a linear compensation (y = x + 3) has 1 degree and a quadratic compensation (y = x 2 + x + 3) has 2 degrees.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
lower_limit boolean ( Optional , default: false )
Enables a lower limit for the sensor. The lower limit is defined by the data collections ( data_points ) lowest uncompensated_value . For example, if the lowest uncompensated_value value is 1.0 and the paired compensated_value is 0.0 , any source state less than 1.0 will produce a compensated state of 0.0 .
name string ( Optional )
Name to use in the frontend.
precision integer ( Optional , default: 2 )
Defines the precision of the calculated values, through the argument of round().
source string Required
The entity to monitor/compensate.
state_class string ( Optional )
The state_class of the sensor.
unique_id string ( Optional )
An ID that uniquely identifies this sensor. Set this to a unique value to allow customization through the UI.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
upper_limit boolean ( Optional , default: false )
Enables an upper limit for the sensor. The upper limit is defined by the data collections ( data_points ) greatest uncompensated_value . For example, if the greatest uncompensated_value value is 5.0 and the paired compensated_value is 10.0 , any source state greater than 5.0 will produce a compensated state of 10.0 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Compensation integration was introduced in Home Assistant 2021.5, and it's used by
397 active installations.
Its IoT class is Calculated.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Petro31
Categories
Sensor
Utility
Back to top
