# OpenWrt (ubus) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ubus
- Final URL: https://www.home-assistant.io/integrations/ubus
- Canonical URL: https://www.home-assistant.io/integrations/ubus/
- Fetched at: 2026-06-28T03:24:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenWrt devices into Home Assistant.

## Extracted Text

On this page
Troubleshooting
Increase log level
Inspect packets with TCPDump
Cleanup
Related topics
This is a presence detection scanner for OpenWrt using ubus . It scans for changes in hostapd.* , which will detect and report changes in client devices connected to the access point on the OpenWrt device.
Important
The integration should be configured on OpenWrt devices providing wireless access points, not on devices acting only as routers.
Before this scanner can be used, you have to install the ubus RPC packages on OpenWrt (versions older than 18.06.x do not require the uhttpd-mod-ubus package):
apk update
apk add rpcd-mod-file uhttpd-mod-ubus
Add a new system user hass (or do it in any other way that you prefer):
Add line to /etc/passwd : hass:x:10001:10001:hass:/var:/bin/false
Add line to /etc/shadow : hass:x:0:0:99999:7:::
Then set a password for the hass user:
passwd hass
Edit the /etc/config/rpcd and add the following lines:
config login option username 'hass' option password '$p$hass' list read hass list read unauthenticated list write hass
Then, create an ACL file at /usr/share/rpcd/acl.d/hass.json for the user hass :
{ "hass" : { "description" : "Access role for OpenWrt ubus integration" , "read" : { "ubus" : { "hostapd.*" : [ "get_clients" ], "uci" : [ "get" ], "dhcp" : [ "ipv4leases" ], "file" : [ "read" ] }, "file" : { "/tmp/dhcp.leases" : [ "read" ] } }, "write" : {} } }
Check your lease file path: The entry /tmp/dhcp.leases is the OpenWrt default for dnsmasq. If you have a custom configuration, run uci get dhcp.@dnsmasq[0].leasefile on your device. Should it return a different path, then you must update the hass.json file above to match it, or client device names will not be correctly resolved. This step can be ignored if dnsmasq is disabled on your device.
Restart the services.
# /etc/init.d/rpcd restart && /etc/init.d/uhttpd restart
Check if the file namespace is registered with the RPC server.
# ubus list | grep file
file
Tip
If not already done, add the ACL file path to /etc/sysupgrade.conf so that the file remains after updating/upgrading your OpenWrt firmware.
# echo "/usr/share/rpcd/acl.d/hass.json" >> /etc/sysupgrade.conf
Now that the device setup is finished, add the password for the hass account created in a previous step to your secrets.yaml file.
hass_password : " YOUR_HASS_PASSWORD"
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : ubus host : OPENWRT_IP_ADDRESS username : hass password : !secret hass_password # If you configured multiple OpenWrt devices, add a separate entry for each device. - platform : ubus host : OPENWRT_IP_ADDRESS_2 username : hass password : !secret hass_password
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of your OpenWrt device, for example, 192.168.1.1 .
username string Required
The username for the account you created on your OpenWrt device. Use the dedicated hass user rather than root to follow the principle of least privilege.
password string Required
The password for the user above.
dhcp_software string ( Optional , default: dnsmasq )
The DHCP software used in your OpenWrt device: dnsmasq , odhcpd , or none . Use none if neither service is used on the device, for example, if it’s a bridged access point.
See the device tracker integration page for instructions on how to configure the people to be tracked.
If you find that this never creates known_devices.yaml , or if you need more information on the communication chain between Home Assistant and OpenWrt, follow these steps to grab the packet stream and gain insight into what’s happening.
On your Home Assistant device, stop Home Assistant
Adjust configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] to log more detail for the device_tracker integration.
logger : default : warn logs : homeassistant.components.device_tracker : debug
In another window, observe the logs.
If using an Home Assistant Supervisor The Home Assistant Supervisor is a program that manages a Home Assistant installation, taking care of installing and updating Home Assistant, apps, itself, and, if used, updating the Home Assistant Operating System. based installation, such as the
Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , log in through the SSH add-on and run the following command:
ha core logs --follow | grep device_tracker
If not using the Home Assistant Supervisor The Home Assistant Supervisor is a program that manages a Home Assistant installation, taking care of installing and updating Home Assistant, apps, itself, and, if used, updating the Home Assistant Operating System. tail the log file in the configuration directory:
tail -f home-assistant.log | grep device_tracker
If you see a Python stack trace like the following, check your configuration for correct username/password.
17-04-28 10:43:30 INFO (MainThread) [homeassistant.loader] Loaded device_tracker from homeassistant.components.device_tracker
17-04-28 10:43:30 INFO (MainThread) [homeassistant.loader] Loaded device_tracker.ubus from homeassistant.components.device_tracker.ubus
17-04-28 10:43:30 INFO (MainThread) [homeassistant.setup] Setting up device_tracker
17-04-28 10:43:31 INFO (MainThread) [homeassistant.components.device_tracker] Setting up device_tracker.ubus
17-04-28 10:43:31 ERROR (MainThread) [homeassistant.components.device_tracker] Error setting up platform ubus
File "/opt/homeassistant/venv/lib/python3.4/site-packages/homeassistant/integrations/device_tracker/__init__.py", line 152, in async_setup_platform
File "/opt/homeassistant/venv/lib/python3.4/site-packages/homeassistant/integrations/device_tracker/ubus.py", line 36, in get_scanner
File "/opt/homeassistant/venv/lib/python3.4/site-packages/homeassistant/integrations/device_tracker/ubus.py", line 58, in __init__
File "/opt/homeassistant/venv/lib/python3.4/site-packages/homeassistant/integrations/device_tracker/ubus.py", line 156, in _get_session_id
File "/opt/homeassistant/venv/lib/python3.4/site-packages/homeassistant/integrations/device_tracker/ubus.py", line 147, in _req_json_rpc
17-04-28 10:43:31 INFO (MainThread) [homeassistant.core] Bus:Handling <Event service_registered[L]: domain=device_tracker, service=see>
17-04-28 10:43:31 INFO (MainThread) [homeassistant.core] Bus:Handling <Event component_loaded[L]: component=device_tracker>
If you see lines like the following repeated at intervals that correspond to the check interval from the configuration (12 seconds by default), then Home Assistant is correctly polling the router, and you’ll need to look at what the router is sending back.
17-04-28 10:50:34 INFO (Thread-7) [homeassistant.components.device_tracker.ubus] Checking ARP
These steps require that tcpdump is installed on your Home Assistant device, and that you have a utility such as Wireshark for viewing the packets. It also assumes that Home Assistant is communicating with your router over HTTP and not HTTPS.
In another shell on your Home Assistant device, start tcpdump
sudo tcpdump -nnvXSs 0 -w /var/tmp/dt.out 'host <router_ip> and port 80'
In this example we are only looking for traffic to or from port 80, and we are writing the packet stream out to /var/tmp/dt.out
Start Home Assistant
After a few seconds you should see a line like Got xx where xx is an incrementing number. This indicates that it has captured packets that match our filter. After you see this number increment a few times (>20), you can hit Ctrl-C to cancel the capture.
Transfer /var/tmp/dt.out to the machine where you’re running Wireshark and either drag/drop it onto the Wireshark window or use File/Open to open the capture file.
In the window that opens, look for the first line that reads POST /ubus . Right click on this line, choose Follow and then HTTP Stream to view just the HTTP stream for this connection.
The first POST will show Home Assistant logging into ubus and receiving a session identifier back. It will look something like this:
POST /ubus HTTP/1.1
Host: 10.68.0.1
Accept: */*
User-Agent: python-requests/2.13.0
Connection: keep-alive
Accept-Encoding: gzip, deflate
Content-Length: 161
{"jsonrpc": "2.0", "params": ["00000000000000000000000000000000", "session", "login", {"password": "<password>", "username": "root"}], "method": "call", "id": 1}
HTTP/1.1 200 OK
Content-Type: application/json
Transfer-Encoding: chunked
{"jsonrpc":"2.0","id":1,"result":[0,{"ubus_rpc_session":"8b4e1632389fcfd09e96a792e01c332c","timeout":300,"expires":300,"acls":{"access-group":{"unauthenticated":["read"],"user":["read"]},"ubus":{"*":["*"],"session":["access","login"]},"uci":{"*":["read"]}},"data":{"username":"root"}}]}
In the response above, the portion that reads "result":[0, indicates that ubus accepted the login without issue. If this is not 0 , search online for what ubus status corresponds to the number you’re receiving and address any issues that it brings to light.
Otherwise, back in the main Wireshark window click the x in the right side of the filter bar where it reads tcp.stream eq 0 . Scroll down until you find the next POST /ubus line and view the HTTP stream again. This request is Home Assistant actually requesting information and will look something like the following:
Content-Length: 114
{"jsonrpc": "2.0", "params": ["8b4e1632389fcfd09e96a792e01c332c", "hostapd.*", "", {}], "method": "list", "id": 1}
{"jsonrpc":"2.0","id":1,"result":{}}
In this case we are actually receiving a valid response with no data. The request says that we are looking for ARP information from hostapd.* , which is the access point on the router. In my environment I don’t use the AP on the router, and so it was correctly returning no data. Armed with this information, I know that I cannot use this integration for device tracking or presence.
When you’re done troubleshooting, remember to reset your logging configuration and delete any capture files that contain sensitive information.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenWrt (ubus) integration was introduced in Home Assistant 0.7.6, and it's used by
128 active installations.
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
