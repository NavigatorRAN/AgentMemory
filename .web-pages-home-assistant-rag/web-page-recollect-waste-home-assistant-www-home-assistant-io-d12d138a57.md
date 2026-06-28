# ReCollect Waste - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/recollect_waste
- Final URL: https://www.home-assistant.io/integrations/recollect_waste
- Canonical URL: https://www.home-assistant.io/integrations/recollect_waste/
- Fetched at: 2026-06-28T03:11:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up ReCollect Waste sensor within Home Assistant.

## Extracted Text

On this page
Configuration
The ReCollect Waste integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to track the next scheduled waste pickup and what type of waste from ReCollect Waste .
To use this integration, you must know both your ReCollect Place and Service IDs. In general, cities/municipalities that use ReCollect will give you a way to subscribe to a calendar with pickup dates. If you examine the iCal URL for this calendar, the Place and Service IDs are embedded in it:
webcal://recollect.a.ssl.fastly.net/api/places/PLACE_ID/services/SERVICE_ID/events.en-US.ics
The default frequency for pulling data from ReCollect Waste is once a day (86400 seconds).
Warning
The ReCollect Waste sensor uses the ReCollect API URL to obtain data and not an official API from ReCollect. Use at your own risk.
To add the ReCollect Waste service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ReCollect Waste .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ReCollect Waste service was introduced in Home Assistant 0.87, and it's used by
211 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Calendar
Sensor
Back to top
