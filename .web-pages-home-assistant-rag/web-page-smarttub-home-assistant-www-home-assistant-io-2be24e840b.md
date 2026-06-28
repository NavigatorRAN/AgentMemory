# SmartTub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smarttub
- Final URL: https://www.home-assistant.io/integrations/smarttub
- Canonical URL: https://www.home-assistant.io/integrations/smarttub/
- Fetched at: 2026-06-28T03:17:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SmartTub into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Actions
Action: Set primary filtration
Action: Set secondary filtration
Action: Snooze reminder
Action: Reset reminder
The SmartTub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view and control hot tubs which use the SmartTub system, in Home Assistant.
A hot tub with a SmartTub module
A SmartTub account (registration is not supported, you can use the SmartTub mobile app)
To add the SmartTub hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SmartTub .
Follow the instructions on screen to complete the setup.
The smarttub.set_primary_filtration action updates the settings for the primary filtration cycle on a hot tub.
Data attribute Optional Description Example entity_id no The entity to update. sensor.jacuzzi_j_335_primary_filtration_cycle duration no The desired duration of the primary filtration cycle, in hours. 4 start_hour no The desired starting hour of the day for the primary filtration cycle. 2 (that is, 02:00 or 2:00am)
The smarttub.set_secondary_filtration action updates the settings for the secondary filtration cycle on a hot tub.
Data attribute Optional Description Example entity_id no The entity to update. sensor.jacuzzi_j_335_secondary_filtration_cycle mode no The desired secondary filtration mode. Can be frequent, infrequent or away. away
The smarttub.snooze_reminder action temporarily suppresses a maintenance reminder on a hot tub.
Data attribute Optional Description Example entity_id no The entity to update. binary_sensor.jacuzzi_j_335_refresh_water_reminder days no The number of days to snooze the reminder (minimum 10). 10
The smarttub.reset_reminder action resets a maintenance reminder on a hot tub.
Data attribute Optional Description Example entity_id no The entity to update. binary_sensor.jacuzzi_j_335_refresh_water_reminder days no The number of days when reminder should trigger next (minimum 30). 180
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SmartTub hub was introduced in Home Assistant 2021.3, and it's used by
107 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mdz
Categories
Binary sensor
Climate
Light
Sensor
Switch
Back to top
