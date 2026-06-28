# YoLink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yolink
- Final URL: https://www.home-assistant.io/integrations/yolink
- Canonical URL: https://www.home-assistant.io/integrations/yolink/
- Fetched at: 2026-06-28T03:30:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate YoLink Devices into Home Assistant.

## Extracted Text

On this page
Configuration
Supported device list
List of actions
Community notes
Integrates YoLink Devices into Home Assistant.
To add the YoLink hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select YoLink .
Follow the instructions on screen to complete the setup.
Using custom application credentials
Home Assistant will use account linking provided by Nabu Casa for authenticating with YoLink, this service is provided for free and does not require a Nabu Casa subscription. The steps below are thus not required.
If you want to use separate credentials, please contact to obtain a `client_id` and `client_secret`. Then you can add your credentials via application credentials. Settings > Devices & services > click the menu (three dots at the top right of the screen) and then **Application Credentials**. Enter your credentials in the pop-up window.
The integration is tested and verified for the following devices from YoLink:
YS1604-UC (SpeakerHub)
YS3604-UC (YoLink KeyFob)
YS3614-UC (Mini FlexFob)
YS4002-UC (YoLink Thermostat)
YS4003-UC (YoLink Thermostat Heatpump)
YS4004-UC (YoLink Thermostat 2)
YS4906-UC + YS7706-UC (Garage Door Kit 1)
YS4908-UC + YS7706-UC (Garage Door Kit 2 (Finger))
YS4909-UC (Water Valve Controller)
YS5001-UC (X3 Water Valve Controller)
YS5002-UC (YoLink Motorized Ball Valve)
YS5003-UC (Water Valve Controller 2)
YS5006-UC (FlowSmart Control)
YS5007-UC (FlowSmart Meter)
YS5008-UC (FlowSmart All-in-One)
YS5705-UC (In-Wall Switch)
YS5706-UC (YoLink Relay)
YS5707-UC (Dimmer Switch)
YS5708-UC (In-Wall Switch 2)
YS6602-UC (YoLink Energy Plug)
YS6604-UC (YoLink Plug Mini)
YS6704-UC (In-wall Outlet)
YS6801-UC (Smart Power Strip)
YS6802-UC (Smart Outdoor Power Strip)
YS6803-UC (Outdoor Energy Plug)
YS7103-UC (Siren Alarm)
YS7104-UC (Outdoor Alarm Controller)
YS7105-UC (X3 Outdoor Alarm Controller)
YS7106-UC (Power Fail Alarm)
YS7107-UC (Outdoor Alarm Controller 2)
YS7201-UC (Vibration Sensor)
YS7606-UC (YoLink Smart Lock M1)
YS7607-UC (YoLink Smart Lock M2)
YS7616-UC (YoLink Smart Lock)
YS7617-UC (YoLink Smart Lock)
YS7618-UC (YoLink Smart Lock)
YS7704-UC (Door Sensor)
YS7706-UC (Garage Door Sensor)
YS7707-UC (Contact Sensor)
YS7804-UC (Motion Sensor)
YS7805-UC (Outdoor Motion Sensor)
YS7903-UC (Water Leak Sensor)
YS7904-UC (Water Leak Sensor 2)
YS7905-UC (WaterDepthSensor)
YS7906-UC (Water Leak Sensor 4)
YS7916-UC (Water Leak Sensor 4 MoveAlert)
YS7A01-UC (Smart Smoke/CO Alarm)
YS8003-UC (Temperature Humidity Sensor)
YS8004-UC (Weatherproof Temperature Sensor)
YS8005-UC (Weatherproof Temperature & Humidity Sensor)
YS8006-UC (X3 Temperature & Humidity Sensor)
YS8007-UC (Thermometer Hygrometer)
YS8008-UC (Floating Thermometer)
YS8013-UC (Thermometer Hygrometer)
YS8014-UC (X3 Outdoor Temperature Sensor)
YS8015-UC (X3 Outdoor Temperature & Humidity Sensor)
YS8017-UC (Thermometer)
YS8023-UC (Hygrometer Thermometer)
YS4102-UC (Sprinkler)
YS4103-UC (Sprinkler Timer)
YS7914-UC (Leak Sensor)
The YoLink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Play on SpeakerHub ( yolink.play_on_speaker_hub )
Converts text to speech for playback on a YoLink SpeakerHub.
For an overview of every action across all integrations, see the actions reference .
This integration requires an MQTT connection to be established via port 8003. If you are using a firewall, please allow communication via port 8003 in the firewall settings.
If you use a network proxy, such as a VPN, the integration may not be able to update the device status. Turn off the VPN.
Please do not use UAC as credentials for the Home Assistant YoLink integration.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The YoLink hub was introduced in Home Assistant 2022.6, and it's used by
3468 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@matrixd2
Categories
Binary sensor
Climate
Cover
Light
Lock
Number
Sensor
Siren
Switch
Back to top
