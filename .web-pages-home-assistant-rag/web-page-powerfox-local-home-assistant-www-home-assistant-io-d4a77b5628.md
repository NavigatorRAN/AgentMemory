# Powerfox Local - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/powerfox_local
- Final URL: https://www.home-assistant.io/integrations/powerfox_local
- Canonical URL: https://www.home-assistant.io/integrations/powerfox_local/
- Fetched at: 2026-06-28T03:08:58Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Powerfox device locally with Home Assistant.

## Extracted Text

On this page
Prerequisites
Supported devices
Configuration
Configuration parameters
Automatic discovery
Data updates
Actions
Examples
Get alerted when power usage spikes
Supported functionality
Power meter
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Powerfox Local integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to gather data from your Poweropti device directly over your local network, without relying on the Powerfox cloud API.
Powerfox is a German company that provides smart meters (Poweropti) for reading electricity, water, gas, and heat. This integration communicates directly with the device on your local network, offering faster updates and no dependency on internet connectivity or the Powerfox cloud service.
Note
This integration only supports power meters . If you need support for water, gas, or heat meters, or prefer using the Powerfox cloud API, see the Powerfox integration.
A powerfox PRO Service subscription is required to use the local interface. The PRO Service can be purchased in the powerfox Shop .
Your Poweropti device must be running firmware version v2.02.07 or higher .
The local interface is available for the following Poweropti models:
PA 201901
PA 201902
PB 202001 (poweropti+)
To add the Powerfox Local device to your Home Assistant instance, use this My button:
Powerfox Local can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Powerfox Local .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your Poweropti device on your local network.
API key
The API key of your Poweropti device. The default value is the 12-character device ID printed on the label of the device (for example, 1097bd725557 ).
If your Poweropti device is on the same network as Home Assistant, it will be discovered automatically via mDNS/Zeroconf. You only need to confirm the setup. No manual entry of the host or API key is required.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Poweropti device every 5 seconds and provides real-time measurements.
This integration does not provide additional actions.
Use this automation to keep an eye on sudden peaks in your electricity usage. When the Poweropti sensor reports more than 4 kW for two minutes, Home Assistant sends a notification so you can react quickly (for example by switching off large loads).
Example YAML automation
```yaml
alias: "Powerfox high usage alert"
description: "Notify me when the Poweropti meter reports sustained high power draw."
triggers:
- trigger: numeric_state
entity_id: sensor.poweropti_power
above: 4000
for:
minutes: 2
actions:
- action: notify.send_message
target:
entity_id: notify.my_device
data:
title: "High consumption detected"
message: "Poweropti currently reports {{ states('sensor.poweropti_power') }} W."
```
Replace the threshold value and the notify target with the entities that exist in your installation.
The Powerfox Local platform provides sensors that you can use in your energy dashboard .
It will create the following sensors:
Power (W) : Active power that is currently measured.
Energy usage (Wh) : Total energy used since installation.
Energy usage - high tariff (Wh) : Energy usage on the high tariff.
Energy usage - low tariff (Wh) : Energy usage on the low tariff.
Energy return (Wh) : Energy returned to the grid.
Cannot connect to the device
Make sure the Poweropti device is powered on and connected to the same network as Home Assistant.
Verify that the host (IP address or hostname) and API key are correct.
The default API key is the 12-character device ID printed on the label of the device.
401 Unauthorized error
The local interface is only available with an active powerfox PRO Service subscription.
Verify that your device is activated for the PRO Service in the Powerfox app or shop.
Also, make sure the firmware version of your device is v2.02.07 or higher .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Powerfox Local device was introduced in Home Assistant 2026.3, and it's used by
274 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@klaasnicolaas
Categories
Energy
Sensor
Back to top
