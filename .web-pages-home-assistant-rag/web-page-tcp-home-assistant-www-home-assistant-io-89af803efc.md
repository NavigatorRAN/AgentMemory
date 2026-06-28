---
source_url: "https://www.home-assistant.io/integrations/tcp"
final_url: "https://www.home-assistant.io/integrations/tcp"
canonical_url: "https://www.home-assistant.io/integrations/tcp/"
source_handle: "web:www-home-assistant-io:89af803efce1"
source_section: "integrations-tcp"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9c7d3a1cfc41cbdc00e3bcfff3379679eee5fb9a168dc64933ded3aa84294659"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# TCP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tcp
- Final URL: https://www.home-assistant.io/integrations/tcp
- Canonical URL: https://www.home-assistant.io/integrations/tcp/
- Fetched at: 2026-06-28T03:21:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up TCP within Home Assistant.

## Extracted Text

On this page
Sensor
Examples
Binary sensor
Related topics
The TCP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows the integration of some services for which a specific Home Assistant integration does not exist. If the service communicates over a TCP socket with a simple request/reply mechanism then the chances are that this integration will allow integration with it.
There is currently support for the following device types within Home Assistant:
To enable the TCP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : tcp host : IP_ADDRESS port : PORT payload : PAYLOAD
Configuration Variables
Looking for your configuration file?
name string ( Optional )
The name you’d like to give the sensor in Home Assistant.
host string Required
The hostname/IP address to connect to.
port integer Required
The port to connect to the host on.
payload string Required
What to send to the host to get the response we’re interested in.
timeout integer ( Optional , default: 10 )
How long in seconds to wait for a response from the service before giving up and disconnecting.
value_template template ( Optional )
Defines a template to extract the value. By default it’s assumed that the entire response is the value.
unit_of_measurement string ( Optional )
The unit of measurement to use for the value.
buffer_size integer ( Optional , default: 1024 )
The size of the receive buffer in bytes. Set this to a larger value if you expect to receive a response larger than the default.
ssl boolean ( Optional , default: false )
If true , use SSL/TLS.
verify_ssl boolean ( Optional , default: true )
Set this to false if the server is using a self-signed certificate.
In this section you find some real-life examples of how to use this sensor.
EBUSd
The EBUSd service enables connection to an EBUS serial bus on some home heating/cooling systems. Using this service it is possible to extract various metrics which may be useful to have within Home Assistant. To use EBUSd, you connect to it using a TCP socket and send it a command. The service will respond with the value it has received from EBUS. On the command line, this would look something like:
$ echo "r WaterPressure" | nc 10.0.0.127 8888
0.903 ; ok
You will notice that the output from the service is not just a single value (it contains “;ok” as well). To grab the value we’re interested in, we can use a Jinja2 template. The response received is injected into the template as the value variable. To use this value within Home Assistant, use the following configuration:
sensor : # Example configuration.yaml entry - platform : tcp name : Central Heating Pressure host : 10.0.0.127 port : 8888 timeout : 5 payload : " r WaterPressure \n " value_template : " {{ value.split(';')[0] }}" unit_of_measurement : Bar
hddtemp
The tool hddtemp collects the temperature of your hard disks.
$ hddtemp
/dev/sda: SAMSUNG MZMTE256HMHP-000L1: 39°C
With hddtemp -d you can run the tool in TCP/IP daemon mode on port 7634 which enables you to get the data across the network.
$ telnet localhost 7634
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]' .
|/dev/sda|SAMSUNG MZMTE256HMHP-000L1|38|C|Connection closed by foreign host.
The entry for the configuration.yaml file for a hddtemp sensor could look like the example below.
sensor : # Example configuration.yaml entry - platform : tcp name : HDD temperature host : 127.0.0.1 port : 7634 timeout : 5 payload : " \n " value_template : " {{ value.split('|')[3] }}" unit_of_measurement : " °C"
The TCP Binary Sensor is a type of TCP Sensor which is either “off” or “on”. To use this sensor type, in addition to the configuration for the TCP Sensor, you must supply a value_on value to represent what is returned when the device is turned on.
To enable this sensor, add the following lines to your configuration.yaml :
# Example configuration.yaml entry binary_sensor : - platform : tcp host : IP_ADDRESS port : PORT payload : PAYLOAD value_on : 1
name string ( Optional , default: TCP Sensor )
value_on string Required
The value returned when the device is “on”.
Defines a template to extract the value.
Default:
entire response is the value
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TCP integration was introduced in Home Assistant 0.14, and it's used by
140 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
