# Hunter Hydrawise - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hydrawise
- Final URL: https://www.home-assistant.io/integrations/hydrawise
- Canonical URL: https://www.home-assistant.io/integrations/hydrawise/
- Fetched at: 2026-06-28T02:50:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Hunter Hydrawise Wi-Fi irrigation control system within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Binary sensor
Sensor
Switch
Switch operation
List of actions
Valve
The Hunter Hydrawise integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Hunter Hydrawise Wi-Fi irrigation controller system in Home Assistant.
There is currently support for the following device types within Home Assistant:
To set up the Hydrawise integration, you must first set up an online account at
https://app.hydrawise.com .
Then, use your online credentials to configure the integration.
To add the Hunter Hydrawise hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hunter Hydrawise .
Follow the instructions on screen to complete the setup.
Binary sensor entities are created for the controller:
Cloud API availability
Rain sensor moisture detection (if a rain sensor is attached to the controller)
Binary sensor entities are created for each irrigation zone:
Running status
Sensor entities are created for the controller:
Daily total water use (if a flow sensor is attached to the controller)
Daily active water use (if a flow sensor is attached to the controller)
Daily inactive water use (if a flow sensor is attached to the controller)
Sensor entities are created for each irrigation zone:
Timestamp for the next scheduled automatic watering cycle
Remaining time (in minutes) for the current watering cycle
Daily active water use for the zone (if a flow sensor is attached to the irrigation zone)
Switches are added for each zone, controlling:
Smart watering features
Manual watering
When auto_watering is on the irrigation zone will follow the Smart Watering schedule set through the Hydrawise mobile or web app . When the auto_watering switch is off the zone’s Smart Watering schedule is suspended for 1 year.
When manual_watering is on the zone will run for 15 minutes.
Note
Due to changes in the Hydrawise API the status of the Auto Watering switches has changed. Under normal conditions the Auto Watering switches correctly reflect the Smart Watering schedule on the Hydrawise mobile or web app. However, if a rain sensor is connected to the system and it is active (rain detected), or the zone is running the Auto Watering switch will turn off. After both of those conditions are removed the switch will again show the correct Auto Watering condition.
The Hunter Hydrawise integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Resume automatic watering ( hydrawise.resume )
Resumes an irrigation zone’s automatic watering schedule.
Start watering ( hydrawise.start_watering )
Starts a watering cycle in the selected irrigation zone.
Suspend automatic watering ( hydrawise.suspend )
Suspends an irrigation zone’s automatic watering schedule until the given date and time.
For an overview of every action across all integrations, see the actions reference .
A valve is added for each zone allowing manual control of zone watering.
When a zone’s valve is opened through Home Assistant, it will have an automatic shutoff time set to the zone’s default watering duration configured in the Hydrawise mobile or web app .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hunter Hydrawise hub was introduced in Home Assistant 0.71, and it's used by
2533 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dknowles2
@thomaskistler
@ptcryan
Categories
Irrigation
Back to top
