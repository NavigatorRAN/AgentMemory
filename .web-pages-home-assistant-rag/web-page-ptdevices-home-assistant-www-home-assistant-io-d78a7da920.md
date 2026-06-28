---
source_url: "https://www.home-assistant.io/integrations/ptdevices"
final_url: "https://www.home-assistant.io/integrations/ptdevices"
canonical_url: "https://www.home-assistant.io/integrations/ptdevices/"
source_handle: "web:www-home-assistant-io:d78a7da920f6"
source_section: "integrations-ptdevices"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "33d78c0938a464047370c78ff3b3eb73868c80438c5965974f0f645bd352ca68"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# PTDevices - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ptdevices
- Final URL: https://www.home-assistant.io/integrations/ptdevices
- Canonical URL: https://www.home-assistant.io/integrations/ptdevices/
- Fetched at: 2026-06-28T03:09:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your PTLevel into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Examples
Send a push notification when Low on water
Supported functionality
Sensors
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The PTDevices integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your PTLevel into Home Assistant.
Use cases include:
Send notifications for low level or excessive usage.
Setup Automations to turn off pumps when running low.
Setup Automations to run appliances after water has been delivered.
PTLevel Long Range Wireless
PTLevel Long Range Wireless - Septic
PTLevel Long Range Wireless - Deep Well
PTLevel Wired Wifi
PTLevel Wired Wifi - Septic
PTLevel Wired Wifi - Temperature Probe
You will need to create a token for your PTDevices account if you haven’t done so already. If you have already generated a Token API token, you don’t need to generate another one.
Log in to your PTDevices account that contains the devices you wish to integrate.
Go to the My Account page from the left hand side menu or https://www.ptdevices.com/profile .
Go to the Settings page from the top menu.
At the bottom of this page, select the Regenerate API Token button.
Copy the generated API token to a safe location. This API token will be used when setting up the PTDevices integration in Home Assistant.
To add the PTDevices hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PTDevices .
Follow the instructions on screen to complete the setup.
alias : " PTDevice - Low Level Notification" description : " Notify when the level drops below a set level" mode : single triggers : - trigger : numeric_state entity_id : - sensor.TARGET_PTDEVICE_level_percent below : 15 conditions : [] actions : - action : notify.TARGET_MOBILE_DEVICE data : message : " Your PTDevice has dropped below 15%, its time to order water." title : " Your PTDevice is below 15%"
Replace TARGET_PTDEVICE and TARGET_MOBILE_DEVICE with your actual devices.
The PTDevices integration provides the following entities.
Note
Some sensors are disabled by default because they provide information that is only useful to advanced users. You can manually enable them in Settings > Devices & services > Entities > the sensor entity you want to enable > Advanced settings > Enabled .
Level depth :
Description : The depth of the remaining fluid.
Available for models : All
Unit : Meters
Level percent :
Description : The remaining level in percent.
Unit : %
Level volume :
Description : The volume of remaining fluid.
Unit : Liters
Probe temperature :
Description : The current temperature measured by the external temperature probe.
Available for models : PTLevel Wired Wifi With Temperature Probe
Unit : °C
Status :
Description : The current status of the device. For example, Working or Not connected .
Battery voltage :
Description : The current voltage reading of the onboard batteries.
Available for models : All battery powered models
Remarks : Disabled by default.
Unit : Volts
Wi-Fi signal strength :
Description : The signal strength of the WiFi at the receiver/WiFI device.
Unit : dBm
LoRa signal strength :
Description : The signal strength between the receiver and transmitter.
Available for models : PTLevel Long Range Wireless Only
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from PTDevices every 60 seconds by default.
This integration does not allow you to change the settings of the device. You must go to PTDevices.com to change device settings.
This integration follows the standard integration removal. No extra steps required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PTDevices hub was introduced in Home Assistant 2026.6, and it's used by
6 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ParemTech-Inc
@frogman85978
Categories
Sensor
Back to top
