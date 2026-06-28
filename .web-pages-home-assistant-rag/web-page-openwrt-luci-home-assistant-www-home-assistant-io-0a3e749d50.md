# OpenWrt (luci) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/luci
- Final URL: https://www.home-assistant.io/integrations/luci
- Canonical URL: https://www.home-assistant.io/integrations/luci/
- Fetched at: 2026-06-28T02:57:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenWrt routers into Home Assistant.

## Extracted Text

On this page
This is a presence detection scanner for OpenWrt using luci .
Before this scanner can be used you have to install the luci RPC package on OpenWrt:
apk update
apk add luci-mod-rpc
To use this device tracker in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : luci host : ROUTER_IP_ADDRESS username : YOUR_ADMIN_USERNAME password : YOUR_ADMIN_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of your router, e.g., 192.168.1.1 .
username string Required
The username of a user with administrative privileges, usually admin .
password string Required
The password for your given admin account.
ssl boolean ( Optional , default: false )
If your router enforces SSL connections, set to true .
verify_ssl boolean ( Optional , default: true )
If SSL/TLS verification for HTTPS resources needs to be turned off (for self-signed certs)
See the device tracker integration page for instructions how to configure the people to be tracked.
This device tracker provides several additional attributes for each tracked device (if it is at home): flags , ip , device , and host . The first three attributes are taken from the ARP table returned by the luci RPC. The host attribute is taken from the platform configuration and can be used to distinguish in which router a device is logged in, if you are using multiple OpenWrt routers.
Note
Some installations have a small bug . The timeout for luci RPC calls is not set and this makes the call fail.
If you want to locally fix your OpenWrt installation, you can apply the change manually to /usr/lib/lua/luci/controller/rpc.lua , or simply set a fixed timeout. The default is 3600.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenWrt (luci) integration was introduced in Home Assistant pre 0.7, and it's used by
580 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mzdrale
Categories
Presence detection
Back to top
