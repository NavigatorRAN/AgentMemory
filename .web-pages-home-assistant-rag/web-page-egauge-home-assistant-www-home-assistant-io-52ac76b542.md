# eGauge - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/egauge
- Final URL: https://www.home-assistant.io/integrations/egauge
- Canonical URL: https://www.home-assistant.io/integrations/egauge/
- Fetched at: 2026-06-28T02:39:24Z
- Content type: text/html; charset=UTF-8

## Description

eGauge Energy Monitors

## Extracted Text

On this page
Supported devices
Prerequisites
Creating a read-only user account for Home Assistant
Configuring eGauge registers
Configuration
Supported functionality
Sensors
Data updates
Known limitations
Troubleshooting
Can’t set up the device
Unexpected sensor values
Removing the integration
To remove an integration instance from Home Assistant
Related links
The eGauge integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to integrate with eGauge energy monitors . eGauge provides energy monitors for residential and commercial applications. They are commonly used with solar energy installations. The eGauge integration can expose sensor readings from eGauge devices into Home Assistant, including energy meters that work with the Energy Dashboard.
This integration supports all eGauge energy monitors running firmware version 4.2 or newer. For instructions on how to check and upgrade the firmware on eGauge devices, see the eGauge knowledge base .
This setup is optional but recommended as a security best practice.
Go to your eGauge’s web dashboard.
Select Settings , then Access Control .
Add a new user with privileges set to Allowed to view all data and settings .
Select Save .
Select Change Password to create a password for the new account.
This setup is optional, but required for integration with the Energy Dashboard.
While eGauge meters are usually configured to measure net usage, Home Assistant needs separate sensors for energy consumed and generated. This section describes how to configure your eGauge to produce these measurements for common installations.
Consult the eGauge Configuration Guide or ask your installer to determine which type of installation you have. First, follow the basic configuration instructions in the guide. Then, you’ll need to create grid_in and grid_out registers for use with Home Assistant. Note that you can name these whatever you want; you’ll select them in the Energy Dashboard configuration screen.
Split-phase back-fed
In this installation, solar inverters are wired into your electrical panel.
grid_in = [= ] [Power (W)] max(0, $"grid")
grid_out = [= ] [Power (W)] max(0, -$"grid")
Direct-feed
In this installation, solar inverters feed directly into the grid.
grid_in = [= ] [Power (W)] max(0, $"grid"-$"solar")
grid_out = [= ] [Power (W)] max(0, $"solar"-$"grid")
Other installations
For prerequisites of other installation types, consult the eGauge configuration guide .
To add the eGauge device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select eGauge .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your eGauge device.
Username
Username that Home Assistant should use to access your eGauge device. This user must have permission to view data and settings.
Password
The password for the configured user.
Uses an SSL certificate
Use SSL for a secure connection to the eGauge device. Leave this on if you’re not sure.
Verify SSL certificate
Verify that the eGauge device’s SSL certificate is signed by a trusted certificate authority. By default, eGauge devices use a self-signed certificate, so leave this off unless you’ve uploaded a custom certificate to your eGauge.
The eGauge integration provides the following entities:
Power and energy : Each power register on the eGauge will appear as two Home Assistant sensors: one reporting current power and the other reporting cumulative total energy usage.
Voltage : Each voltage register on the eGauge will appear as a Home Assistant sensor reporting the electrical voltage in volts (V).
Current : Each current register on the eGauge will appear as a Home Assistant sensor reporting the electrical current in amperes (A).
The eGauge integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the device every 30 seconds.
The integration currently only supports a subset of register types. See Sensor for this list of supported types.
The integration is currently read-only and cannot modify settings on the eGauge device.
Symptom: “Failed to connect”
When trying to set up the integration, the form shows the message “Failed to connect”.
Resolution
This means that Home Assistant cannot find an eGauge device at the configured host. Double-check the hostname or IP address and make sure it can be reached from your Home Assistant server. You can also check to ensure that Verify SSL certificate is turned off or that the eGauge has been configured with a custom certificate signed by a certificate authority that the Home Assistant server trusts.
Symptom: “Invalid authentication”
When trying to set up the integration, the form shows the message “Invalid authentication”.
This means that Home Assistant failed to authenticate using the provided username and password. Double-check that the provided credentials are correct and that the configured user has permission to view data and settings.
Check that your eGauge registers are configured correctly for your installation.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
eGauge Home
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The eGauge device was introduced in Home Assistant 2026.1, and it's used by
21 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@neggert
Categories
Energy
Back to top
