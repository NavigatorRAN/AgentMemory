# Tomato - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tomato
- Final URL: https://www.home-assistant.io/integrations/tomato
- Canonical URL: https://www.home-assistant.io/integrations/tomato/
- Fetched at: 2026-06-28T03:23:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Tomato routers into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
SSL Certificate
The Tomato integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to track devices which are
connected to a wireless router that is running Tomato
as firmware.
Because of a limitation in Tomato’s API, this integration will only track wireless devices.
This integration is confirmed to be working with FreshTomato 2020.8 and may also be working with AdvancedTomato .
The integration requires an extra configuration variable called http_id . The
value can be obtained by logging in to the Tomato admin interface and search for
http_id in the page’s source code.
To use this device tracker in your installation,
add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry device_tracker : - platform : tomato host : YOUR_ROUTER_IP_ADDRESS username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD http_id : YOUR_HTTP_ID
Configuration Variables
Looking for your configuration file?
host string Required
The IP address or hostname of your router, e.g., 192.168.1.1 or rt-ac68u .
port integer ( Optional )
The port number of your router, e.g., 443 .
Default:
80/443 (automatically detected)
ssl boolean ( Optional , default: false )
Whether to connect via https .
verify_ssl string | boolean ( Optional , default: true )
If SSL verification for HTTPS resources needs to be turned off (for self-signed certs, etc.) this can take on boolean values false or true or you can pass a location on the device where a certificate can be used for verification e.g., /mnt/NAS/router_cert.pem .
username string Required
The username of a user with administrative privileges, usually admin .
password string Required
The password for your given admin account.
http_id string Required
The value of http_id .
See the device tracker integration page for
instructions how to configure the people to be tracked.
Gathering the SSL Certificate of your router can be accomplished with this (or
a similar) command:
openssl s_client -showcerts -connect 172.10.10.1:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > router_cert.pem
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tomato integration was introduced in Home Assistant pre 0.7, and it's used by
49 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
