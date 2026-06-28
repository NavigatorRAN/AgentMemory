# Apache Kafka - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/apache_kafka
- Final URL: https://www.home-assistant.io/integrations/apache_kafka
- Canonical URL: https://www.home-assistant.io/integrations/apache_kafka/
- Fetched at: 2026-06-28T02:28:26Z
- Content type: text/html; charset=UTF-8

## Description

Send data and events to Apache Kafka.

## Extracted Text

On this page
Configure filter
The Apache Kafka integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sends all state changes to a
Apache Kafka topic.
Apache Kafka is a real-time data pipeline that can read and write streams of data. It
stores its data safely in a distributed, replicated, fault-tolerant cluster.
To use the Apache Kafka integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your
configuration.yaml file:
apache_kafka : ip_address : localhost port : 9092 topic : home_assistant_1
Configuration Variables
Looking for your configuration file?
ip_address string Required
The IP address or hostname of an Apache Kafka cluster.
port integer Required
The port to use.
username string ( Optional )
The username of Apache Kafka cluster for SASL authentication. Required with SASL_SSL security protocol only.
password string ( Optional )
The password of Apache Kafka cluster for SASL authentication. Required with SASL_SSL security protocol only.
security_protocol string ( Optional , default: PLAINTEXT )
The security protocol used to communicate with brokers. Use SSL for secure or SASL_SSL for secure with SASL authentication. (only SASL_PLAINTEXT SASL mechanism is supported)
topic string Required
The Kafka topic to send data to.
filter map ( Optional )
Filters for entities to be included/excluded. ( Configure Filter )
include_domains list ( Optional )
Domains to be included.
include_entity_globs list ( Optional )
Include all entities matching a listed pattern.
include_entities list ( Optional )
Entities to be included.
exclude_domains list ( Optional )
Domains to be excluded.
exclude_entity_globs list ( Optional )
Exclude all entities matching a listed pattern.
exclude_entities list ( Optional )
Entities to be excluded.
By default, no entity will be excluded. To limit which entities are being exposed to Apache Kafka , you can use the filter parameter.
# Example filter to include specified domains and exclude specified entities apache_kafka : ip_address : localhost port : 9092 topic : home_assistant_1 filter : include_domains : - alarm_control_panel - light include_entity_globs : - binary_sensor.*_occupancy exclude_entities : - light.kitchen_light
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
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apache Kafka integration was introduced in Home Assistant 0.97, and it's used by
5 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
History
Back to top
