---
source_url: "https://www.home-assistant.io/integrations/hp_ilo"
final_url: "https://www.home-assistant.io/integrations/hp_ilo"
canonical_url: "https://www.home-assistant.io/integrations/hp_ilo/"
source_handle: "web:www-home-assistant-io:0795f91c9e1c"
source_section: "integrations-hp-ilo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4b3d734a10c5cde98dae092e63216685e7a9eef94e3bcbd80a2c2479c8002258"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# HP Integrated Lights-Out (ILO) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hp_ilo
- Final URL: https://www.home-assistant.io/integrations/hp_ilo
- Canonical URL: https://www.home-assistant.io/integrations/hp_ilo/
- Fetched at: 2026-06-28T02:50:07Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate HP ILO (Integrated Lights-Out) sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Example
Hardware specifics
HP Microserver Gen8
Related topics
The HP Integrated Lights-Out integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to do an API call to the HP ILO (Integrated Lights-Out) sensor of your server, and use this data in Home Assistant sensors.
If the ILO or specified jsonpath query returns only a single value (e.g., a temperature or state), it will be put in the state field. If a data structure is returned, it will be placed in the ilo_data attribute.
Some more details about what can be retrieved from these sensors is available in the python-hpilo documentation .
To use this integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : hp_ilo host : IP_ADDRESS or HOSTNAME username : YOUR_USERNAME password : YOUR_PASSWORD monitored_variables : - name : SENSOR NAME sensor_type : SENSOR TYPE
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address on which the ILO can be reached.
port string ( Optional , default: 443 )
The port on which the ILO can be reached.
username string Required
The username used to connect to the ILO.
password string Required
The password used to connect to the ILO.
monitored_variables list ( Optional )
Sensors created from the ILO data.
Default:
Defaults to an empty list (no sensors are created).
name string Required
The sensor name.
sensor_type string Required
The sensor type, has to be one of the valid sensor types specified below.
unit_of_measurement string ( Optional )
The sensors’ unit of measurement.
value_template template ( Optional )
When a Jinja2 template is specified here, the created sensor will output the template result. The ILO response can be referenced with the ilo_data variable.
Valid sensor_types:
server_name : Get the name of the server this iLO is managing.
server_fqdn : Get the fqdn of the server this iLO is managing.
server_host_data : Get SMBIOS records that describe the host.
server_oa_info : Get information about the Onboard Administrator of the enclosing chassis.
server_power_status : Whether the server is powered on or not.
server_power_readings : Get current, min, max and average power readings.
server_power_on_time : How many minutes ago has the server been powered on (Non-resetting counter, akin to hours used).
server_asset_tag : Gets the server asset tag.
server_uid_status : Get the status of the UID light.
server_health : Get server health information.
network_settings : Get the iLO network settings.
To get two sensors reporting CPU fan speed and Ambient Inlet Temperature, as well as a dump of server_health on a HP Microserver Gen8, you could use the following in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file
sensor : - platform : hp_ilo host : IP_ADDRESS or HOSTNAME username : YOUR_USERNAME password : YOUR_PASSWORD monitored_variables : - name : CPU fanspeed sensor_type : server_health unit_of_measurement : " %" value_template : ' {{ ilo_data.fans["Fan 1"].speed[0] }}' - name : Inlet temperature sensor_type : server_health unit_of_measurement : " °C" value_template : ' {{ ilo_data.temperature["01-Inlet Ambient"].currentreading[0] }}' - name : Server Health sensor_type : server_health value_template : ' {{ ilo_data.health_at_a_glance }}'
Note
Not every hardware supports all values.
On this hardware you should avoid using the following sensor_types as monitored_variables: to prevent errors.
server_oa_info
server_power_readings
server_power_on_time
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HP Integrated Lights-Out (ILO) integration was introduced in Home Assistant 0.27, and it's used by
342 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
