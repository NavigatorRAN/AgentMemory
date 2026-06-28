# Modern Forms - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/modern_forms
- Final URL: https://www.home-assistant.io/integrations/modern_forms
- Canonical URL: https://www.home-assistant.io/integrations/modern_forms/
- Fetched at: 2026-06-28T03:00:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Modern Forms Smart Fan with Home Assistant.

## Extracted Text

On this page
Configuration
Fans
Lights
Binary sensors
Sensors
Switches
Actions
Action modern_forms.clear_fan_sleep_timer
Action modern_forms.clear_light_sleep_timer
Action modern_forms.set_fan_sleep_timer
Action modern_forms.set_light_sleep_timer
Modern Forms has a line of smart Wi-Fi-connected fans that allow for cloud or local control of the fan and light. There is support for individual sleep timers for the fan and light that can be set and cleared independently.
To add the Modern Forms integration to your Home Assistant instance, use this My button:
Modern Forms can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Modern Forms .
Follow the instructions on screen to complete the setup.
Note
If the Modern Forms fan does not have a light unit installed, then the Light entities and actions will not show up.
The Modern Forms integration has support for the Modern Forms fans. This includes directional support, and sleep timer actions for the fan.
The Modern Forms integration has support for the Modern Forms fans light. This includes brightness, and sleep timer actions for the light.
The Modern Forms integration provides binary sensors for the following information:
Fan sleep timer active status
Light sleep timer active status
The Modern Forms integration provides sensors for the following information:
Fan sleep timer time expiring
Light sleep timer time expiring
The Modern Forms integration provides support for the following toggleable attributes of a fan:
Away mode - to allow the fan simulate someone being home.
Adaptive learning - for allow learning for away mode.
This action will clear the sleep timer for the fan if it has been set. It will not turn off the fan when the timer is cleared.
This action will clear the sleep timer for the light if it has been set. It will not turn off the light when the timer is cleared.
This action will set a sleep timer for the fan. When the sleep timer is expired it will turn off the fan.
Data attribute Required Description sleep_time yes The amount of time in minutes to set the sleep timer for. This is time in minutes from 1 to 1440 (1 day).
This action will set a sleep timer for the light. When the sleep timer is expired it will turn off the light.
Modern Forms Fans use NTP to pool.ntp.org to set its internal clock and check of sleep timers have expired. Sleep timers will only work if the Modern Forms Fans have internet NTP access. You can block off cloud access for the fan and only leave NTP (UDP port 123) outbound working for the sleep timers.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Modern Forms integration was introduced in Home Assistant 2021.7, and it's used by
736 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@wonderslug
Categories
Binary sensor
Fan
Light
Sensor
Switch
Back to top
