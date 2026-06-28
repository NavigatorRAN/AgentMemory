# InfluxDB - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/influxdb
- Final URL: https://www.home-assistant.io/integrations/influxdb
- Canonical URL: https://www.home-assistant.io/integrations/influxdb/
- Fetched at: 2026-06-28T02:52:09Z
- Content type: text/html; charset=UTF-8

## Description

Record events in InfluxDB.

## Extracted Text

On this page
Configuration
InfluxDB 1.x configuration options
InfluxDB 2.x and 3.x configuration options
Additional options
Configure filter
Examples
InfluxDB configuration
Sensor
Sensor configuration
Sensor configuration variables
Full configuration for InfluxDB 1.x
Full configuration for InfluxDB 2.x
Querying your data in Influx
Sensors
Everything else
Related topics
The InfluxDB integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you transfer all state changes to an external InfluxDB database. This integration supports:
InfluxDB 3 Core and InfluxDB 3 Enterprise – The latest InfluxDB with v1 and v2 write API compatibility. Sensors query using InfluxQL. Use external tools for SQL.
InfluxDB 2.x – Including InfluxDB Cloud . Sensors query using Flux.
InfluxDB 1.x – Sensors query using InfluxQL.
For more information on configuration of InfluxDB, refer to the InfluxDB configuration section below.
The integration can export state changes for all entity types to InfluxDB, not just sensors. In addition, it can create Sensor entities in Home Assistant that query data back from InfluxDB.
Note
The influxdb integration runs parallel to the Home Assistant database. It does not replace it.
To add the InfluxDB integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select InfluxDB .
Follow the instructions on screen to complete the setup.
If you have an existing YAML configuration, it will be imported automatically as a config entry. Additional options such as entity filters, tags, and measurement attributes are configured via YAML. For details, refer to the options section below.
URL
The URL of your InfluxDB host.
Username
Database username with read/write privileges.
Password
Password for the database user.
Database
Database name. You must create the database before you can write to it.
Verify SSL
Verify SSL certificate for HTTPS requests.
SSL CA Certificate
Upload an optional CA certificate to use for SSL verification. Accepted formats: .pem , .crt , .cer , .der .
Organization
Organization ID. For InfluxDB 2.x, find this in your installation URL after /orgs . For InfluxDB 3, this value is required but not validated—use any value.
Bucket
For InfluxDB 2.x, the bucket name. For InfluxDB 3, this maps to the database name.
Token
Authentication token with write access.
Additional options can be configured via YAML.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Configuration Variables
Looking for your configuration file?
max_retries integer ( Optional , default: 0 )
Set this to allow the integration to retry if there was a network error when transmitting data.
precision string ( Optional , default: ns )
Set this to specify the time precision sent to influxdb. Setting a coarser precision allows InfluxDb to compress your data better. If not set, defaults to ns.
measurement_attr string ( Optional , default: unit_of_measurement )
State object attribute(s) to use as measurement name. Possible values: unit_of_measurement , domain__device_class or entity_id .
default_measurement string ( Optional )
Measurement name to use when the measurement_attr state attribute does not exist, e.g. when an entity doesn’t have a unit.
Default:
uses the entity id of the entity
override_measurement string ( Optional )
Measurement name to use instead of measurement_attr or default measurement. This will store all data points in a single measurement.
exclude list ( Optional )
Configure which integrations should be excluded from recording to InfluxDB. ( Configure Filter )
entities string | list ( Optional )
The list of entity ids to be excluded from recording to InfluxDB.
entity_globs string | list ( Optional )
Exclude all entities matching a listed pattern.
domains string | list ( Optional )
The list of domains to be excluded from recording to InfluxDB.
include list ( Optional )
Configure which integrations should be included in recordings to InfluxDB. If set, all other entities will not be recorded to InfluxDB. ( Configure Filter )
The list of entity ids to be included in recording to InfluxDB.
Include all entities matching a listed pattern.
The list of domains to be included in recording to InfluxDB.
tags string | list
Tags to mark the data.
tags_attributes string | list ( Optional , default: 0 )
The list of attribute names which should be reported as tags and not fields to InfluxDB. For example, if set to friendly_name , it will be possible to group by entities’ friendly names as well, in addition to their ids.
ignore_attributes string | list ( Optional )
The list of attribute names to ignore when reporting to InfluxDB. This can be used to filter out attributes that either don’t change or don’t matter to you to reduce the amount of data stored in InfluxDB. Please be aware of the underlying InfluxDB mechanism that converts non-string attributes to strings and adds a _str suffix to the attribute name in this case. It means that when you want to ignore, for example, the icon_str attribute that shows in your InfluxDB instance, you need to provide icon to ignore_attributes .
component_config string ( Optional )
This attribute contains integration-specific override values. See Customizing devices and services for format.
Measurement name to use instead of a unit or default measurement. This will store all data points in a single measurement.
The list of attribute names to ignore when reporting to InfluxDB. Will be merged with the default ignore_attributes list when processing a state change event for a particular entity.
component_config_domain string ( Optional )
This attribute contains domain-specific integration override values. See Customizing devices and services for format.
component_config_glob string ( Optional )
Measurement name to use instead of unit or default measurement. This will store all data points in a single measurement.
By default, no entity will be excluded. To limit which entities are being exposed to InfluxDB, you can use the include and exclude parameters.
# Example filter to include specified domains and exclude specified entities influxdb : include : domains : - alarm_control_panel - light entity_globs : - binary_sensor.*_occupancy exclude : entities : - light.kitchen_light
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
Example 1
influxdb : max_retries : 3 default_measurement : state exclude : entities : - entity.id1 - entity.id2 domains : - automation include : entities : - entity.id3 - entity.id4 tags : instance : prod source : hass
Example 2
influxdb : tags : source : HA tags_attributes : - friendly_name default_measurement : units exclude : entities : - zone.home domains : - persistent_notification - person include : domains : - sensor - binary_sensor - sun entities : - weather.home
Authentication
InfluxDB 3 : Authentication optional (enabled by default). Token can be generated via InfluxDB.
InfluxDB 2.x : Requires authentication. Token can be generated via InfluxDB.
InfluxDB 1.x : Authentication optional (disabled by default). If running on the same host with default settings, leave user and password empty.
For InfluxDB 1.x, you must first create a database named home_assistant . InfluxDB 2.x and 3.x create buckets/databases automatically.
InfluxDB 3 (Core and Enterprise)
See how to get started using InfluxDB 3:
InfluxDB 3 Core : Free, open-source, optimized for recent data queries.
InfluxDB 3 Enterprise : Adds compaction for historical queries. Includes a free At-Home license for non-commercial use.
Write API compatibility
InfluxDB 3 Core and Enterprise provide InfluxDB v1 and v2 write API compatibility , allowing you to write data using api_version: 2 .
Query API compatibility
InfluxDB 3 supports the v1 query API (InfluxQL) and v3 query API (SQL and InfluxQL). The v2 query API (Flux) is not supported.
Tools for querying: Query InfluxDB 3 using SQL or InfluxQL with external tools such as InfluxDB 3 Explorer or Grafana .
Generate tokens using the influxdb3 CLI or InfluxDB 3 Explorer .
The influxdb sensor lets you query values from an InfluxDB database to populate a sensor state. Use this to present statistics as Home Assistant sensors from the influxdb history integration or an external data source.
InfluxDB 3 sensor support: InfluxDB 3 supports the v1 query API (InfluxQL), so 1.x sensors using queries: may work. The v2 query API (Flux) is not supported— queries_flux: sensors don’t work with InfluxDB 3.
Important
You must configure the influxdb history integration to create influxdb sensors. To create sensors for an external InfluxDB database without writing data to it, exclude all entities:
influxdb : exclude : entity_globs : " *"
Define the sensor connection variables and queries in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. A sensor is created for each query.
InfluxDB 1.x sensors (InfluxQL)
sensor : - platform : influxdb queries : - name : mean value of foo where : ' "name" = ' ' foo' ' ' measurement : ' "°C"'
InfluxDB 2.x sensors (Flux)
InfluxDB 2.x requires queries in Flux . Use the query builder in the InfluxDB UI to construct queries:
sensor : - platform : influxdb api_version : 2 organization : RANDOM_16_DIGIT_HEX_ID token : GENERATED_AUTH_TOKEN queries_flux : - group_function : mean imports : - strings name : " Mean humidity reported from past day" query : > filter(fn: (r) => r._field == "value" and r.domain == "sensor" and strings.containsStr(v: r.entity_id, substr: "humidity")) |> keep(columns: ["_value"]) range_start : " -1d"
api_version string
API version to use. Valid values are 1 or 2 .
ssl boolean ( Optional , default: false )
Use HTTPS instead of HTTP. Defaults to true for 2.x, false for 1.x.
host string ( Optional , default: localhost )
IP address or domain of your database host. For InfluxDB Cloud, defaults to us-west-2-1.aws.cloud2.influxdata.com .
port integer ( Optional , default: 8086 )
Port to use.
path string ( Optional )
Path to use if InfluxDB is behind a reverse proxy.
username string ( Inclusive )
1.x only - Database username with read privileges.
password string ( Inclusive )
1.x only - Password for the database user. Required with username .
database string ( Optional , default: home_assistant )
1.x only - Database name. Individual sensors can override this.
verify_ssl boolean ( Optional , default: true )
1.x only - Verify SSL certificate. For 2.x, SSL verification is always enabled.
token string ( Inclusive )
2.x only - Auth token with read access to your Organization and Bucket.
organization string ( Inclusive )
2.x only - Organization ID. Find this in your InfluxDB URL after /orgs .
bucket string ( Optional , default: Home Assistant )
2.x only - Bucket name. Individual sensors can override this.
queries list Required
1.x only - List of sensors using InfluxQL queries.
name string Required
The name of the sensor.
unique_id string ( Optional )
The unique ID for this query. This allows changing the name, icon and entity_id from the web interface.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
measurement string Required
Defines the measurement name in InfluxDB (the FROM clause of the query).
where template Required
Defines the data selection clause (the where clause of the query). This supports templates .
value_template template ( Optional )
Defines a template to extract a value from the payload.
Name of the database to use.
group_function string ( Optional , default: mean )
The group function to be used.
field string Required , default: value
The field name to select.
queries_flux list Required
2.x only - List of sensors using Flux queries.
range_start string ( Optional , default: -15m )
Duration or time value to start range from. All Flux queries require a range filter, one is automatically added to the beginning of your Flux query in the form of range(start: {range_start}, stop: {range_stop}) .
range_stop string ( Optional , default: now() )
Duration or time value to stop range at. See range_start above for how this is used in query.
query template Required
One or more flux filters used to get to the data you want. These should limit resultset to one table, or any beyond the first will be ignored. Your query should not begin or end with a pipe ( |> ). This supports templates .
group_function string ( Optional )
The group function to be used. If provided, adds {group_function}(column: "_value") to your query. Unlike 1.x queries, this does not default to mean. If omitted, limit(n: 1) is added instead.
Defines a template to extract a value from the payload. Note that value will be set to the value of the _value field in your query output.
Name of the bucket within your Organization to read from.
imports string | list ( Optional )
Libraries to import to execute your query. For example, strings , date , or experimental/query .
The example configuration entry below creates two requests to your local InfluxDB instance, one to the database db1 , the other to db2 :
select last(value) as value from "°C" where "name" = "foo"
select min(tmp) as value from "%" where "entity_id" = ''salon'' and time > now() - 1h
sensor : - platform : influxdb host : localhost username : home-assistant password : password queries : - name : last value of foo unit_of_measurement : °C value_template : ' {{ value | round(1) }}' group_function : last where : ' "name" = ' ' foo' ' ' measurement : ' "°C"' field : value database : db1 - name : Min for last hour unit_of_measurement : " %" value_template : ' {{ value | round(1) }}' group_function : min where : ' "entity_id" = ' ' salon' ' and time > now() - 1h' measurement : ' "%"' field : tmp database : db2
sensor : - platform : influxdb api_version : 2 token : GENERATED_AUTH_TOKEN organization : RANDOM_16_DIGIT_HEX_ID bucket : BUCKET_NAME queries_flux : - range_start : " -1d" name : " How long have I been here" query : > filter(fn: (r) => r._domain == "person" and r._entity_id == "me" and r._value != "{{ states('person.me') }}") |> map(fn: (r) => ({ _value: r._time })) value_template : " {{ relative_time(strptime(value, '%Y-%m-%d %H:%M:%S %Z')) }}" - range_start : " -1d" name : " Cost of my house today across all power sensor" query : > filter(fn: (r) => r.domain == "sensor" and r._field == "value" and regexp.matchRegexpString(r: /_power$/, v: r.entity_id)) |> keep(columns: ["_value", "_time"]) |> sort(columns: ["_time"], desc: false) |> integral(unit: 5s, column: "_value") imports : regexp value_template : " {{ value|float / 24.0 / 1000.0 * states('sensor.current_cost_per_kwh')|float }}" - range_start : " -1d" bucket : Glances Bucket name : " Average CPU temp today" query : " filter(fn: (r) => r._field == \" value \" and r.entity_id == \" glances_cpu_temperature \" )" group_function : mean
Note that when working with Flux queries, the resultset is broken into tables, you can see how this works in the Data Explorer of the UI. If you are operating on data created by the InfluxDB history integration, this means by default, you will have a table for each entity and each attribute of each entity (other than unit_of_measurement and any others you promoted to tags).
This is more tables compared to 1.x queries, where you have one table per unit_of_measurement across all entities. You can still create aggregate metrics across multiple sensors. As shown above, use the keep or drop filters. When you remove key columns, InfluxDB merges tables that share a schema for _value into one.
For sensors with a unit of measurement defined, the unit of measurement is used as the measurement name and entries are tagged with the second part of the entity_id . Therefore you need to add a WHERE clause to the query to filter out values.
For example a query on a % battery for sensor.multi_sensor_battery_level :
SELECT * FROM "%" WHERE time > now () - 12 h AND "entity_id" = 'multi_sensor_battery_level' ;
Or for temperatures represented in °C :
SELECT * FROM "°C" WHERE time > now () - 1 h ;
Everything else can be queried using the entity_id as its measurement name.
SELECT * FROM "binary_sensor.front_doorbell" WHERE time > now () - 24 h ;
SELECT "temperature" FROM "climate.kitchen" WHERE time > now () - 24 h ;
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The InfluxDB integration was introduced in Home Assistant 0.9, and it's used by
5.9% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mdegat01
@Robbie1221
Categories
History
Back to top
