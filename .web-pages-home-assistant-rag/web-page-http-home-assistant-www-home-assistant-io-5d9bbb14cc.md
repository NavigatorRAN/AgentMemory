---
source_url: "https://www.home-assistant.io/integrations/http"
final_url: "https://www.home-assistant.io/integrations/http"
canonical_url: "https://www.home-assistant.io/integrations/http/"
source_handle: "web:www-home-assistant-io:5d9bbb14cc4d"
source_section: "integrations-http"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ad06b15de42e8d2356fc4bc4179b1dce5d6dc9ef6358cf224a3e3fe01706fc02"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# HTTP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/http
- Final URL: https://www.home-assistant.io/integrations/http
- Canonical URL: https://www.home-assistant.io/integrations/http/
- Fetched at: 2026-06-28T02:50:14Z
- Content type: text/html; charset=UTF-8

## Description

Offers a web framework to serve files.

## Extracted Text

On this page
Reverse proxies
APIs
HTTP sensors
IP filtering and banning
Hosting files
Binary sensor
Examples
Sensor
The HTTP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] serves all files and data required for the Home Assistant frontend. You only need to add this to your configuration file if you want to change any of the default settings.
There is currently support for the following device types within Home Assistant:
Warning
The option server_host should only be used on a Home Assistant Container installation!
# Example configuration.yaml entry http :
Configuration Variables
Looking for your configuration file?
server_host list | string ( Optional , default: 0.0.0.0, :: )
Only listen to incoming requests on specific IP/host. By default the http integration auto-detects IPv4/IPv6 and listens on all connections. Use server_host: 0.0.0.0 if you want to only listen to IPv4 addresses. The default listed assumes support for IPv4 and IPv6.
server_port integer ( Optional , default: 8123 )
Allows you to specify which port Home Assistant should listen on.
ssl_certificate string ( Optional )
Path to your TLS/SSL certificate to serve Home Assistant over a secure connection. If you are using the Let’s Encrypt app for Home Assistant (formerly known as Let’s Encrypt add-on), this will be at /ssl/fullchain.pem . We recommend to use the NGINX app for Home Assistant (formerly known as NGINX add-on) instead of using this option.
ssl_peer_certificate string ( Optional )
Path to the client/peer TLS/SSL certificate to accept secure connections from.
ssl_key string ( Optional )
Path to your TLS/SSL key to serve Home Assistant over a secure connection. If you are using the Let’s Encrypt app , this will be at /ssl/privkey.pem .
cors_allowed_origins string | list ( Optional )
A list of origin domain names to allow CORS requests from. Enabling this will set the Access-Control-Allow-Origin header to the Origin header if it is found in the list, and the Access-Control-Allow-Headers header to Origin, Accept, X-Requested-With, Content-type, Authorization . You must provide the exact Origin. That is, https://www.home-assistant.io will allow requests from https://www.home-assistant.io but not http://www.home-assistant.io .
use_x_forwarded_for boolean ( Optional , default: false )
Enable parsing of the X-Forwarded-For header, passing on the client’s correct IP address in proxied setups. You must also whitelist trusted proxies using the trusted_proxies setting for this to work. Non-whitelisted requests with this header will be considered IP spoofing attacks, and the header will, therefore, be ignored.
use_x_frame_options boolean ( Optional , default: true )
Controls the X-Frame-Options header to help prevent clickjacking .
trusted_proxies string | list ( Optional )
List of trusted proxies, consisting of IP addresses or networks, that are allowed to set the X-Forwarded-For header. This is required when using use_x_forwarded_for because all requests to Home Assistant, regardless of source, will arrive from the reverse proxy IP address. Therefore in a reverse proxy scenario, this option should be set with extreme care. If the immediate upstream proxy is not in the list, the request will be rejected. If any other intermediate proxy is not in the list, the first untrusted proxy will be considered the client.
ip_ban_enabled boolean ( Optional , default: true )
Flag indicating whether additional IP filtering is enabled.
login_attempts_threshold integer ( Optional , default: -1 )
Number of failed login attempts from a single IP after which it will be automatically banned if ip_ban_enabled is true . When set to -1 no new automatic bans will be added.
ssl_profile string ( Optional , default: modern )
The Mozilla SSL profile to use. Only lower if you are experiencing integrations causing SSL handshake errors.
The sample below shows a configuration entry in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file with possible values:
# Example configuration.yaml entry http : server_port : 12345 ssl_certificate : /etc/letsencrypt/live/hass.example.com/fullchain.pem ssl_key : /etc/letsencrypt/live/hass.example.com/privkey.pem cors_allowed_origins : - https://google.com - https://www.home-assistant.io use_x_forwarded_for : true trusted_proxies : - 10.0.0.200 - 172.30.33.0/24 ip_ban_enabled : true login_attempts_threshold : 5
The Set up encryption using Let’s Encrypt blog post gives you details about the encryption of your traffic using free certificates from Let’s Encrypt .
When using a reverse proxy, you will need to enable the use_x_forwarded_for and trusted_proxies options. Requests from reverse proxies will be blocked if these options are not set.
http : use_x_forwarded_for : true trusted_proxies : - 10.0.0.200 # Add the IP address of the proxy server - 172.30.33.0/24 # You may also provide the subnet mask
Important
When a network mask is provided, you must use the network address (for example, 192.168.1.0/24 ), not a host address (for example, 192.168.1.50/24 ).
Note
The use_x_forwarded_for and trusted_proxies settings only apply when Home Assistant is behind a traditional reverse proxy, such as NGINX, Caddy, Traefik, or HAProxy. If you use Home Assistant Cloud for remote access, requests arrive through a secure tunnel without X-Forwarded-* headers containing the original client IP address. For cloud connections, these settings have no effect, and all requests appear as coming from 127.0.0.1 .
On top of the http integration is a REST API , Python API and WebSocket API available.
The http platforms are not real platforms within the meaning of the terminology used around Home Assistant. Home Assistant’s REST API sends and receives messages over HTTP.
To use those kind of sensors or binary sensors in your installation no configuration in Home Assistant is needed. All configuration is done on the devices themselves. This means that you must be able to edit the target URL or endpoint and the payload. The entity will be created after the first message has arrived.
If you want to use an HTTP sensor, create a Long-Lived Access Token in the Home Assistant UI in the Security section of your User profile page.
All requests need to be sent to the endpoint of the device and must be POST .
If you want to apply additional IP filtering, and automatically ban brute force attempts, set ip_ban_enabled to true and login_attempts_threshold to the maximum number of attempts before a ban is activated. After the first ban, an ip_bans.yaml file will be created in the root configuration folder. It will have the banned IP address and time in UTC when it was added:
If you use Home Assistant Cloud for remote access, all cloud connections appear with the IP address 127.0.0.1 . This means IP-based banning does not distinguish between individual remote clients connecting through the cloud. Banning 127.0.0.1 would block all cloud connections.
127.0.0.1 : banned_at : " 2016-11-16T19:20:03"
After a ban is added a Persistent Notification will appear in the Home Assistant frontend.
To clear an IP ban, you can either:
Remove the specific IP entry from ip_bans.yaml , or
Delete the entire ip_bans.yaml file. It will be recreated automatically the next time a ban occurs.
After making changes, restart Home Assistant to apply them.
If you want to use Home Assistant to host or serve static files then create a directory called www under the configuration path ( /config ). The static files in www/ can be accessed by the following URL http://your.domain:8123/local/ , for example audio.mp3 would be accessed as http://your.domain:8123/local/audio.mp3 .
If you’ve had to create the www/ folder for the first time, you’ll need to restart Home Assistant.
Caution
Files served from the www folder ( /local/ URL), aren’t protected by the Home Assistant authentication. Files stored in this folder, if the URL is known, can be accessed by anybody without authentication.
The HTTP binary sensor is dynamically created with the first request that is made to its URL. You don’t have to define it in the configuration first.
The sensor will then exist as long as Home Assistant is running. After a restart of Home Assistant the sensor will be gone until it is triggered again.
The URL for a binary sensor looks like the example below:
http://IP_ADDRESS:8123/api/states/binary_sensor.DEVICE_NAME
You should choose a unique device name (DEVICE_NAME) to avoid clashes with other devices.
The JSON payload must contain the new state and can have a friendly name. The friendly name is used in the frontend to name the sensor.
{ "state" : "on" , "attributes" : { "friendly_name" : "Radio" }}
For a quick test curl can be useful to “simulate” a device.
$ curl -X POST -H "Authorization: Bearer LONG_LIVED_ACCESS_TOKEN" \ -H "Content-Type: application/json" \ -d '{"state": "off", "attributes": {"friendly_name": "Radio"}}' \
http://localhost:8123/api/states/binary_sensor.radio
To check if the sensor is working, use again curl to retrieve the current state .
$ curl -X GET -H "Authorization: Bearer LONG_LIVED_ACCESS_TOKEN" \ -H "Content-Type: application/json" \
{ "attributes" : { "friendly_name" : "Radio" } ,
"entity_id" : "binary_sensor.radio" ,
"last_changed" : "16:45:51 05-02-2016" ,
"last_updated" : "16:45:51 05-02-2016" ,
"state" : "off" }
To delete the sensor, send DELETE request with curl
$ curl -X DELETE -H "Authorization: Bearer LONG_LIVED_ACCESS_TOKEN" \
In this section you’ll find some real-life examples of how to use this sensor, besides curl , which was shown earlier.
Using Python request module
As already shown on the API page, it’s very simple to use Python and the Requests module for the interaction with Home Assistant.
response = requests . post ( " http://localhost:8123/api/states/binary_sensor.radio " , headers = { " Authorization " : " Bearer LONG_LIVED_ACCESS_TOKEN " , " content-type " : " application/json " , }, data = json . dumps ({ " state " : " on " , " attributes " : { " friendly_name " : " Radio " }}), ) print ( response . text )
Using httpie
httpie is a user-friendly CLI HTTP client.
$ http -v POST http://localhost:8123/api/states/binary_sensor.radio \ 'Authorization:Bearer LONG_LIVED_ACCESS_TOKEN' content-type:application/json state = off \
attributes: = '{"friendly_name": "Radio"}'
The HTTP sensor is dynamically created with the first request that is made to its URL. You don’t have to define it in the configuration first.
The URL for a sensor looks like the example below:
http://IP_ADDRESS:8123/api/states/sensor.DEVICE_NAME
The JSON payload must contain the new state and should include the unit of measurement and a friendly name. The friendly name is used in the frontend to name the sensor.
{ "state" : "20" , "attributes" : { "unit_of_measurement" : "°C" , "friendly_name" : "Bathroom Temperature" }}
For a quick test, curl can be useful to “simulate” a device.
$ curl -X POST -H "Authorization: Bearer LONG_LIVED_ACCESS_TOKEN" \ -H "Content-Type: application/json" \ -d '{"state": "20", "attributes": {"unit_of_measurement": "°C", "friendly_name": "Bathroom Temp"}}' \
http://localhost:8123/api/states/sensor.bathroom_temperature
You can then use curl again to retrieve the current sensor state and verify the sensor is working.
{ "attributes" : { "friendly_name" : "Bathroom Temp" ,
"unit_of_measurement" : " \u 00b0C" } ,
"entity_id" : "sensor.bathroom_temperature" ,
"last_changed" : "09:46:17 06-02-2016" ,
"last_updated" : "09:48:46 06-02-2016" ,
"state" : "20" }
For more examples please visit the HTTP binary sensor page.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HTTP system was introduced in Home Assistant pre 0.7, and it's used by
29.1% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
