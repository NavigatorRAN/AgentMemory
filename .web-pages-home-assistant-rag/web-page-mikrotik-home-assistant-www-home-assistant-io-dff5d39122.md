# Mikrotik - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mikrotik
- Final URL: https://www.home-assistant.io/integrations/mikrotik
- Canonical URL: https://www.home-assistant.io/integrations/mikrotik/
- Fetched at: 2026-06-28T03:00:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate MikroTik/RouterOS based devices into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Use a certificate
The user privileges in RouterOS
The MikroTik integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers presence detection by looking at connected devices to a MikroTik RouterOS based router.
There is currently support for the following device types within Home Assistant:
Presence detection
You have to enable accessing the RouterOS API on your router to use this platform.
RouterOS uses a ping test to determine client presence, make sure you are not blocking this on the client (Windows firewall default behavior), as this will result in the provided device_tracker having the state not_home .
Terminal:
/ip service
set api disabled = no port = 8728
Web Frontend:
Go to IP > Services > API and enable it.
Make sure that port 8728 or the port you choose is accessible from your network.
To add the Mikrotik device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Mikrotik .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your MikroTik router.
Username
The username used to authenticate with the RouterOS API.
Password
The password for the username above.
Port
The port the RouterOS API listens on. The default is 8728 . If you use SSL, the default api-ssl port is 8729 .
Verify SSL certificate
When enabled, the SSL certificate presented by the router is verified. Disable this if you use a self-signed certificate.
The integration provides the following configuration options:
Force scanning using DHCP
When disabled (default), the integration detects devices from the wireless registration table (CAPSman, wireless, wifiwave2, or wifi). When enabled, it uses the DHCP lease table instead. Enable this if you also want to detect wired (non-wireless) devices connected to your router.
Enable ARP ping
When enabled, the integration sends an ARP ping to each non-wireless device that has an active DHCP address to verify that the device is actually reachable on the network. This prevents stale DHCP leases from keeping a device marked as home after it has left.
Consider home interval
The time in seconds a device must be unseen before it is considered away. The default is 300 seconds (5 minutes).
To use SSL to connect to the API (via api-ssl instead of api service) further configuration is required at RouterOS side. You have to upload or generate a certificate and configure api-ssl service to use it. Here is an example of a self-signed certificate:
/certificate add common-name = "Self signed demo certificate for API" days-valid = 3650 name = "Self signed demo certificate for API" key-usage = digital-signature,key-encipherment,tls-server,key-cert-sign,crl-sign
/certificate sign "Self signed demo certificate for API"
/ip service set api-ssl certificate = "Self signed demo certificate for API"
/ip service enable api-ssl
If everything is working fine you can disable the pure api service in RouterOS:
/ip service disable api
To use this device tracker, you only need limited privileges. To enhance the security of your MikroTik device, create a “read only” group with solely API and ping test permissions and add a user to that group:
/user
group add name = homeassistant policy = read ,api,test
add group = homeassistant name = homeassistant
You will be prompted to set a password for the newly created user. Depending on your RouterOS version and configuration, you might need to set a password yourself:
/user set [ find username = homeassistant] password = PASSWORD
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mikrotik device was introduced in Home Assistant 0.44, and it's used by
2879 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
Categories
Hub
Back to top
