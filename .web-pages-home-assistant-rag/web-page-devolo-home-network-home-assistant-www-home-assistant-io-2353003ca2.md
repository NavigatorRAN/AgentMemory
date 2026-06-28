# devolo Home Network - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/devolo_home_network
- Final URL: https://www.home-assistant.io/integrations/devolo_home_network
- Canonical URL: https://www.home-assistant.io/integrations/devolo_home_network/
- Fetched at: 2026-06-28T02:37:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate devolo Home Network devices with Home Assistant.

## Extracted Text

On this page
Configuration
Entities
Binary sensors
Buttons
Images
Presence detection
Sensors
Switch
Update
Supported devolo Devices
Known limitations
Troubleshooting
Gigabridge
Example automations
Restart PLC device on loss of pairing
Notify on data rate drop
Enable guest wifi on time basis
Removing the integration
To remove an integration instance from Home Assistant
The devolo Home Network integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control your devolo PLC network. Depending on the device you add to Home Assistant, different use cases are possible. Roughly you can categorize the devices into Wi-Fi and non-Wi-Fi devices. Non-Wi-Fi devices are more or less limited in monitoring your PLC network. The Wi-Fi devices, however, can help with presence detection and remote control of your guest Wi-Fi. For details, please continue reading about the entities and look at the supported devices .
To add the devolo Home Network device to your Home Assistant instance, use this My button:
devolo Home Network can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select devolo Home Network .
Follow the instructions on screen to complete the setup.
IP address
IP address of your devolo Home Network device. This can be found in the devolo Home Network App on the device dashboard.
Currently, the following entities within Home Assistant are supported.
Device attached to the router
Updates every 5 minutes
Is disabled by default because it typically rarely changes
Identify a PLC device by making its LED blink for 2 minutes
Start pairing on a PLC device
Restart the device
Start WPS
QR code of your guest Wi-Fi credentials
Updates every 15 seconds if changes are detected
Is enabled by default
Detect presence of devices connected to the main or the guest Wi-Fi
Updates every 15 seconds
Automatically adds new devices as disabled entities unless disabled via system option
Number of connected Wi-Fi clients
Number of neighbored Wi-Fi networks
Is disabled by default because it runs quite long
Number of PLC devices in the same PLC network
PLC PHY rates
PHY rates to/from the device attached to the router are enabled by default. PHY rates between all other devices are disabled by default.
Last restart of the device
Is disabled by default because it’s of lower interest to most users.
Turn on/off guest Wi-Fi
Turn on/off the device LEDs
Update the firmware of a device.
Is enabled by default but will only give a result if regular checks are enabled on the device.
The list of supported devolo devices depends on the device firmware and the device features. The following devices were tested running firmware 5.6.0:
Magic 2 WiFi 6 next
Magic 2 WiFi 6
Magic 2 WiFi next
Magic 2 WiFi 2-1
Magic 1 WiFi mini
Magic 1 WiFi 2-1
WiFi 6 Repeater 5400
WiFi 6 Repeater 3000
WiFi Repeater+ ac
dLAN 1200+ WiFi ac
dLAN 550+ Wifi
dLAN 550 WiFi
Since firmware 7.10 also the following device without Wi-Fi can be used as long as the corresponding entities are supported:
Magic 2 LAN triple
Magic 2 DinRail
Magic 2 LAN 1-1
Magic 1 LAN 1-1
This integration only supports using the API the devolo Home Network App uses. The device website usually offers additional features. However, these features are not available via API and thus cannot be supported until devolo adds them to the API.
The devolo Gigabridge is the only device that comes with a default password. However, it seems that in factory default the password works for the device website but not for the API. If you give the device a new password via the website, it is applied to both and the integration starts working. Even using the same password again works.
PLC networks are sometimes flaky. To restore a network’s state, it’s sometimes a good idea to reboot the PLC device attached to the router if the number of PLC devices is lower than expected. If you apply this automation, keep in mind that devices might be expected on standby. In this example, the expected number of devices is 3.
alias : " PLC Feeder Restart" description : " Restart device connected to the router if number of PLC devices is unexpected low" triggers : - trigger : numeric_state entity_id : - sensor.devolo_001_connected_plc_devices # Replace with your device's sensor for : hours : 0 minutes : 10 seconds : 0 below : 3 actions : - action : button.press target : entity_id : button.devolo_001_restart_device # Replace with your device's button
Noise on the electric wire can significant disturb PLC data rates. A notification close to a drop can help identify the action that lead to the drop. The following example takes 25% as threshold.
alias : " PLC data rate" description : " PLC data rate dropped more than 25%" triggers : - entity_id : - sensor.devolo_001_plc_downlink_phy_rate_devolo_002 # Replace with your device's sensors - sensor.devolo_001_plc_uplink_phy_rate_devolo_002 trigger : state conditions : - condition : template value_template : >- # Checks if new value is less than 75% of previous value {{ (trigger.to_state.state|float / trigger.from_state.state|float) < 0.75 }} actions : - action : notify.send_message target : entity_id : notify.my_device data : message : >- PLC data rate of {{ trigger.to_state.name }} dropped to {{ trigger.to_state.state }} {{trigger.to_state.attributes.unit_of_measurement}} title : PLC data rate dropped
You might want to expose your guest wifi only during the day but turn it off at night.
alias : " Toggle guest Wi-Fi" description : " Turn Guest Wi-Fi on and off" triggers : - trigger : time at : - " 08:00:00" - " 17:00:00" actions : - action : switch.toggle target : entity_id : switch.devolo_001_enable_guest_wifi # Replace with your device's switch
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The devolo Home Network device was introduced in Home Assistant 2021.12, and it's used by
3055 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@2Fake
@Shutgun
Categories
Binary sensor
Button
Image
Sensor
Back to top
