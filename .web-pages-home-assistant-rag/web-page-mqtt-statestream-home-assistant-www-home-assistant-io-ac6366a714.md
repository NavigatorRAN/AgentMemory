# MQTT Statestream - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mqtt_statestream
- Final URL: https://www.home-assistant.io/integrations/mqtt_statestream
- Canonical URL: https://www.home-assistant.io/integrations/mqtt_statestream/
- Fetched at: 2026-06-28T03:01:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up MQTT Statestream within Home Assistant.

## Extracted Text

On this page
Configuration
Configure filter
Common filtering examples
Operation
Related topics
The MQTT Statestream integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] publishes state changes in Home Assistant to individual MQTT topics. The MQTT integration is a prerequisite for MQTT Statestream to work.
To enable MQTT Statestream in Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mqtt_statestream : base_topic : homeassistant publish_attributes : true publish_timestamps : true
Configuration Variables
Looking for your configuration file?
base_topic string Required
Base topic used to generate the actual topic used to publish.
publish_attributes boolean ( Optional , default: false )
Publish attributes of the entity as well as the state.
publish_timestamps boolean ( Optional , default: false )
Publish the last_changed and last_updated timestamps for the entity.
exclude list ( Optional )
Configure which integrations should be excluded from recordings. ( Configure Filter )
entities list ( Optional )
The list of entity ids to be excluded from recordings.
entity_globs list ( Optional )
Exclude all entities matching a listed pattern from recordings (e.g., sensor.weather_* ).
domains list ( Optional )
The list of domains to be excluded from recordings.
include list ( Optional )
Configure which integrations should be included in recordings. If set, all other entities will not be recorded. ( Configure Filter )
The list of entity ids to be included from recordings.
Include all entities matching a listed pattern in recordings (e.g., sensor.weather_* ).
The list of domains to be included from recordings.
By default, no entity will be excluded. To limit which entities are being exposed to MQTT Statestream , you can use the include and exclude parameters.
# Example filter to include specified domains and exclude specified entities mqtt_statestream : base_topic : homeassistant include : domains : - alarm_control_panel - light entity_globs : - binary_sensor.*_occupancy exclude : entities : - light.kitchen_light
Filters are applied as follows:
No filter
All entities included
Only includes
Entity listed in entities include: include
Otherwise, entity matches domain include: include
Otherwise, entity matches glob include: include
Otherwise: exclude
Only excludes
Entity listed in exclude: exclude
Otherwise, entity matches domain exclude: exclude
Otherwise, entity matches glob exclude: exclude
Otherwise: include
Domain and/or glob includes (may also have excludes)
Otherwise, entity listed in entities exclude: exclude
Domain and/or glob excludes (no domain and/or glob includes)
Otherwise, entity listed in exclude: exclude
No Domain and/or glob includes or excludes
The following characters can be used in entity globs:
* - The asterisk represents zero, one, or multiple characters
? - The question mark represents zero or one character
# Example of excluding entities mqtt_statestream : base_topic : homeassistant exclude : domains : - switch entities : - sensor.nopublish
In the above example, all entities except for switch.x and sensor.nopublish will be published to MQTT.
# Example of excluding entities mqtt_statestream : base_topic : homeassistant include : domains : - sensor entities : - lock.important
In this example, only sensor.x and lock.important will be published.
# Example of excluding entities mqtt_statestream : base_topic : homeassistant include : domains : - sensor exclude : entities : - sensor.noshow
In this example, all sensors except for sensor.noshow will be published.
When any Home Assistant entity changes, this integration will publish that change to MQTT.
The topic for each entity is different, so you can easily subscribe other systems to just the entities you are interested in.
The topic will be in the form base_topic/domain/entity/state .
For example, with the example configuration above, if an entity called ‘light.master_bedroom_dimmer’ is turned on, this integration will publish on to homeassistant/light/master_bedroom_dimmer/state .
If that entity also has an attribute called brightness , the integration will also publish the value of that attribute to homeassistant/light/master_bedroom_dimmer/brightness .
All states and attributes are passed through JSON serialization before publishing. Please note that this causes strings to be quoted (e.g., the string ‘on’ will be published as ‘“on”’). You can access the JSON deserialized values (as well as unquoted strings) at many places by using value_json instead of value .
The last_updated and last_changed values for the entity will be published to homeassistant/light/master_bedroom_dimmer/last_updated and homeassistant/light/master_bedroom_dimmer/last_changed , respectively. The timestamps are in ISO 8601 format - for example, 2017-10-01T23:20:30.920969+00:00 .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MQTT Statestream integration was introduced in Home Assistant 0.54, and it's used by
1302 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Other
Back to top
