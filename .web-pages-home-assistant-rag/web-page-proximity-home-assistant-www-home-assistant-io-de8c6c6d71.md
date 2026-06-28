# Proximity - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/proximity
- Final URL: https://www.home-assistant.io/integrations/proximity
- Canonical URL: https://www.home-assistant.io/integrations/proximity/
- Fetched at: 2026-06-28T03:09:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Proximity monitoring within Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Distance
Direction of travel
Nearest device
Nearest distance
Nearest Direction of travel
Video tutorial
The Proximity integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the proximity of devices or persons to a particular zone and the direction of travel.
This integration is useful to reduce the number of automation rules required when wanting to perform automations based on locations outside a particular zone. The zone and state based triggers allow similar control but the number of rules grows exponentially when factors such as direction of travel need to be taken into account.
Some examples of its use include:
Increase thermostat temperature as you near home
Decrease temperature the further away from home you travel
To add the Proximity integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Proximity .
Follow the instructions on screen to complete the setup.
Note
When adding the Proximity integration, you are prompted to define the Tolerance distance . The tolerance distance must be provided in meters (m) and is used to filter out small GPS coordinate changes ( due to inaccuracies of GPS ) to calculate the direction of travel.
The following sensor entities will be created.
For each tracked device or person , a sensor is created showing the distance from the edge of monitored zone in a unit depending on your Home Assistant Unit System selection. When a tracked person or device enters the monitored zone, the distance is set to 0.
For each tracked device or person, a sensor is created showing the direction of travel to or from the monitored zone. Possible states are:
arrived
away_from
stationary
towards
unknown
Important
To calculate the distance and the direction of travel for a tracked device or person, they must specify a geo-location.
A sensor is created showing the device or person which is nearest ( shortest distance ) to the monitored zone. If several devices or persons are at the same nearest distance, this sensor displays them all.
This sensor shows the distance of the device or person nearest to the monitored zone. The unit depends on your settings for the Home Assistant unit system . When a tracked person or device enters the monitored zone, the distance is set to 0.
This sensor shows the direction of travel of the nearest device or person to the monitored zone. Possible states are:
This comprehensive video tutorial explains how to use the Proximity integration to automatically adjust the heating in your home based on your presence, whether you’re leaving or entering an area around your house.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Proximity integration was introduced in Home Assistant 0.13, and it's used by
4.2% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
Categories
Automation
Presence detection
Back to top
