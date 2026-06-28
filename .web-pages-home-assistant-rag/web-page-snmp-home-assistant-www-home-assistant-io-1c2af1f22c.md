---
source_url: "https://www.home-assistant.io/integrations/snmp"
final_url: "https://www.home-assistant.io/integrations/snmp"
canonical_url: "https://www.home-assistant.io/integrations/snmp/"
source_handle: "web:www-home-assistant-io:1c2af1f22ca1"
source_section: "integrations-snmp"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4d7299d2a765651b9ad75fea3ddff13ca150e2c867c48b9130d901f000f30643"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# SNMP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/snmp
- Final URL: https://www.home-assistant.io/integrations/snmp
- Canonical URL: https://www.home-assistant.io/integrations/snmp/
- Fetched at: 2026-06-28T03:17:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SNMP into Home Assistant.

## Extracted Text

On this page
Presence detection
Using templates
Sensor
Finding OIDs
Examples
Switch
Many routers, Wi-Fi access points, printers, and other network-connected devices support the Simple Network Management Protocol (SNMP) . This is a standardized method for monitoring/managing network-connected devices. SNMP uses a tree-like hierarchy where each node is an object. Many of these objects contain continuously updated lists of metrics like network interfaces throughput, disk activity, active devices on the network, toner levels, and such.
There is currently support for the following device types within Home Assistant:
Printer uptime minutes
Important
This device tracker needs SNMP to be enabled on the target network device. It could be that you need to install SNMP support manually on your router, switch, server, or any other device that you will be trying to extract information from.
The following OIDs refer to the current MAC Address table from various common router brands. These reflect all recent devices seen on the network. However, since devices are usually not removed from these internal tables until after a predefined timeout (typically in a range of 5-15 minutes after they were last active on the network, depending on the specific manufacturer’s implementation), this is less effective for device tracking than desirable. If near-realtime values are needed, it is recommended to use Ping or Nmap integrations instead.
Brand Device/Firmware OID Aerohive AP230 1.3.6.1.4.1.26928.1.1.1.2.1.2.1.1 Apple Airport Express (2nd gen.) 7.6.9 1.3.6.1.2.1.3.1.1.2 or 1.3.6.1.2.1.4.22.1.2 Aruba IAP325 on AOS 6.5.4.8 1.3.6.1.4.1.14823.2.3.3.1.2.4.1.1 BiPAC 7800DXL Firmware 2.32e 1.3.6.1.2.1.17.7.1.2.2.1.1 DD-WRT unknown version/model 1.3.6.1.2.1.4.22.1.2 IPFire 2.25 1.3.6.1.2.1.4.22.1.2 MikroTik unknown RouterOS version/model 1.3.6.1.4.1.14988.1.1.1.2.1.1 MikroTik RouterOS 6.x on RB2011 1.3.6.1.2.1.4.22.1.2 OpenWrt Chaos Calmer 15.05 1.3.6.1.2.1.4.22.1.2 OPNsense 19.1 1.3.6.1.2.1.4.22.1.2 pfSense 2.2.4 1.3.6.1.2.1.4.22.1.2 Ruckus ZoneDirector 9.13.3 1.3.6.1.4.1.25053.1.2.2.1.1.3.1.1.1.6 TP-Link Archer VR1600v 1.3.6.1.2.1.3.1.1.2.16.1 TP-Link Archer VR2600v 1.3.6.1.2.1.3.1.1.2.19.1 TP-Link Archer VR600 1.3.6.1.2.1.3.1.1.2 Ubiquiti Edgerouter Lite v1.9.0 1.3.6.1.2.1.4.22.1.2
To use SNMP version 1 or 2c in your installation, add the following to your configuration.yaml file:
# Example configuration.yaml entry for SNMP version 1 or 2c device_tracker : - platform : snmp host : 192.168.1.1 community : public baseoid : 1.3.6.1.4.1.14988.1.1.1.2.1.1
If your network device supports SNMP version 3 and is configured appropriately, you can enable encryption by adding auth_key and priv_key variables. Example configuration:
# Example configuration.yaml entry for SNMP version 3 device_tracker : - platform : snmp host : 192.168.1.1 community : USERNAME auth_key : AUTHPASS priv_key : PRIVPASS baseoid : 1.3.6.1.4.1.14988.1.1.1.2.1.1
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the router, e.g., 192.168.1.1.
community string Required
The SNMP community which is set for the device. Most devices have a default community set to public with read-only permission (which is sufficient for most purposes).
baseoid string Required
The OID prefix where wireless client registrations can be found, usually vendor specific. It’s advised to use the numerical notation. To find this base OID, check vendor documentation or check the MIB file for your device.
auth_key string ( Inclusive )
Authentication key for SNMPv3. Variable priv_key must also be set.
priv_key string ( Inclusive )
Privacy key SNMPv3. Variable auth_key must also be set.
See the device tracker integration page for instructions how to configure the people to be tracked.
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
The snmp sensor platform displays values made available by network devices through the SNMP protocol.
To enable this sensor in your installation, add the following to your configuration.yaml file:
# Example configuration.yaml entry sensor : - platform : snmp host : 192.168.1.32 baseoid : 1.3.6.1.4.1.2021.10.1.3.1
accept_errors string ( Optional , default: false )
Determines whether the sensor should start and keep working even if the SNMP host is unreachable or not responding. This allows the sensor to be initialized properly even if, for example, your printer is not on when you start Home Assistant.
auth_key string ( Optional , default: no key )
Authentication key to use for SNMP v3.
auth_protocol string ( Optional , default: none )
Authentication protocol to use for SNMP v3.
The OID where the information is located. It’s advised to use the numerical notation.
community string ( Optional , default: public )
The SNMP community which is set for the device for SNMP v1 and v2c. Most devices have a default community set to public with read-only permission (which is sufficient for most devices that don’t accept direct modifications of their parameters via SNMP, such as printers).
default_value string ( Optional )
Determines what value the sensor should take if accept_errors is set and the host is unreachable or not responding. If not set, the sensor will have value unknown in case of errors.
device_class string ( Optional )
Sets the class of the device , changing the device state and icon that is displayed on the frontend.
host string ( Optional , default: localhost )
The IP address of your host, e.g., 192.168.1.32 .
icon template ( Optional )
Defines a template for the icon of the SNMP sensor.
name template ( Optional , default: SNMP )
Defines a template for the name of the SNMP sensor.
picture template ( Optional )
Defines a template for the entity picture of the SNMP sensor.
port string ( Optional , default: 161 )
The SNMP port of your host.
priv_key string ( Optional , default: no key )
Privacy key to use for SNMP v3.
priv_protocol string ( Optional , default: none )
Privacy protocol to use for SNMP v3.
state_class string ( Optional )
The state_class of the sensor.
unique_id string ( Optional )
An ID that uniquely identifies this entity. This allows changing the name , icon and entity_id from the web interface.
unit_of_measurement string ( Optional )
Defines the units of measurement of the sensor, if any.
username string ( Optional )
Username to use for authentication.
value_template template ( Optional )
Defines a template to parse the value.
version string ( Optional , default: 1 )
Version of SNMP protocol, 1 , 2c or 3 . Version 2c or higher is needed to read data from 64-bit counters.
Valid values for auth_protocol :
none
hmac-md5
hmac-sha
hmac128-sha224
hmac192-sha256
hmac256-sha384
hmac384-sha512
Valid values for priv_protocol :
des
3des-ede
aes-cfb-128
aes-cfb-192
aes-cfb-256
OIDs may vary on different systems because they are vendor-specific. The best place to find OIDs is in your device’s manual or vendor documentation. For example, the following OIDs are for the load of a Linux system.
1 minute Load: 1.3.6.1.4.1.2021.10.1.3.1
5 minute Load: 1.3.6.1.4.1.2021.10.1.3.2
15 minute Load: 1.3.6.1.4.1.2021.10.1.3.3
There is a large amount of tools available to work with SNMP. snmpwalk let you easily retrieve the value of an OID.
$ snmpwalk -Os -c public -v 2c 192.168.1.32 1.3.6.1.4.1.2021.10.1.3.1
laLoad.1 = STRING: 0.19
According to the most common SNMP standard, the uptime of a device is accessible under OID 1.3.6.1.2.1.1.3.0 . The value represented using a format called TimeTicks , in units of hundredths of a second.
To create a sensor that displays the uptime for your printer in minutes, you can use this configuration:
# Example configuration.yaml entry sensor : - platform : snmp name : " Printer uptime" host : 192.168.2.21 baseoid : 1.3.6.1.2.1.1.3.0 accept_errors : true unit_of_measurement : " minutes" value_template : " {{((value | int) / 6000) | int}}"
The accept_errors option will allow the sensor to work even if the printer is not on when Home Assistant is first started: the sensor will just display a - instead of a minute count.
The value_template option converts the original value to minutes.
The snmp switch platform allows you to control SNMP-enabled equipment.
Currently, only SNMP OIDs that accept integer values are supported. SNMP v1, v2c and v3 are supported.
To use an SNMP switch in your installation:
# Example configuration.yaml entry: switch : - platform : snmp host : 192.168.0.2 baseoid : 1.3.6.1.4.1.19865.1.2.1.4.0
The SNMP BaseOID which to poll for the state of the switch.
command_oid string ( Optional )
The SNMP OID which to set to turn the switch on and off, if different from baseoid .
The IP/host which to control.
The port on which to communicate.
community string ( Optional , default: private )
community string to use for authentication (SNMP v1 and v2c).
SNMP version to use - either 1 , 2c or 3 .
payload_on string ( Optional , default: 1 )
What return value represents an On state for the switch. The same value is used in writes to turn on the switch if command_payload_on is not set.
payload_off string ( Optional , default: 0 )
What return value represents an Off state for the switch. The same value is used in writes to turn off the switch if command_payload_off is not set.
command_payload_on string ( Optional )
The value to write to turn on the switch, if different from payload_on .
command_payload_off string ( Optional )
The value to write to turn off the switch, if different from payload_off .
vartype string ( Optional , default: none )
The SNMP vartype for the payload_on and payload_off commands as defined in RFC1902 .
You should check with your device’s vendor to find out the correct OID and what values turn the switch on and off.
Valid values for vartype :
Counter32
Counter64
Gauge32
Integer32
Integer
IpAddress
ObjectIdentifier
OctetString
Opaque
TimeTicks
Unsigned32
Complete examples:
switch : - platform : snmp name : SNMP v1 switch host : 192.168.0.2 community : private baseoid : 1.3.6.1.4.1.19865.1.2.1.4.0 payload_on : 1 payload_off : 0 - platform : snmp name : SNMP v3 switch host : 192.168.0.3 version : " 3" username : " myusername" auth_key : " myauthkey" auth_protocol : " hmac-sha" priv_key : " myprivkey" priv_protocol : " aes-cfb-128" baseoid : 1.3.6.1.4.1.19865.1.2.1.4.0 payload_on : 1 payload_off : 0 - platform : snmp name : Enable PoE on NETGEAR switch port 2 using SNMP v3 host : 192.168.0.4 version : " 3" username : " myusername" auth_key : " myauthkey" auth_protocol : " hmac-sha" priv_key : " myprivkey" priv_protocol : " des" baseoid : 1.3.6.1.4.1.4526.11.15.1.1.1.1.1.2 payload_on : 15400 payload_off : 3000 vartype : Gauge32
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SNMP integration was introduced in Home Assistant 0.57, and it's used by
3163 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@nmaggioni
Categories
Network
Back to top
