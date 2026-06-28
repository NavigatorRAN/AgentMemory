# Nederlandse Spoorwegen (NS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nederlandse_spoorwegen
- Final URL: https://www.home-assistant.io/integrations/nederlandse_spoorwegen
- Canonical URL: https://www.home-assistant.io/integrations/nederlandse_spoorwegen/
- Fetched at: 2026-06-28T03:02:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate timetable data for traveling by train in the Netherlands within Home Assistant.

## Extracted Text

On this page
Prerequisites
Obtaining an API Key
Configuration
Managing routes
Searching for a specific train vs. the next train
Data source
Troubleshooting
Authentication errors
Removing the integration
To remove an integration instance from Home Assistant
The Nederlandse Spoorwegen (NS) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides real-time information about Dutch train schedules using the NS API . This integration allows you to monitor departure times, delays, and travel information for your regular routes.
To use this integration, you need an API key from the NS API Portal.
Create an account on the NS API Portal .
Request an API key for the Reisinformatie API, which is part of the Ns-App product.
To add the Nederlandse Spoorwegen (NS) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nederlandse Spoorwegen (NS) .
Follow the instructions on screen to complete the setup.
After adding the integration, you can manage your travel routes:
Find the Nederlandse Spoorwegen integration.
Click Configure .
Add or remove routes as needed.
The integration provides a station selector in the UI, so you don’t need to manually look up station codes. Simply search for and select your departure and arrival stations from the dropdown menus during route configuration.
The default behavior (without specifying a time) gives you information about the next available train that fits your route criteria (from, to, via stations).
When you specify a departure time during route configuration, the integration filters trips to show only those departing at or after your specified time. This time-based filter compares only the time component (for example, 17:00), ignoring the date, so it works continuously throughout the day.
This is useful when you want to focus on specific parts of your daily schedule. For example:
Set time to “08:00” for morning commute trains
Set time to “17:00” to only see evening trains home
Avoid seeing very early morning trains when you’re interested in your regular departure
The sensor automatically handles day transitions. If the current time is past your configured time, it will show tomorrow’s first trip at or after that time. This ensures you always see relevant upcoming trips matching your schedule, without the sensor becoming unavailable.
The data is provided by Nederlandse Spoorwegen through their official API, ensuring high-quality and up-to-date information about train schedules, delays, and service disruptions.
If you encounter authentication errors:
Verify your API key is correct.
Ensure your NS API subscription is active.
Check that you’re using the correct API (Reisinformatie API).
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
All entities and data associated with the integration will be removed.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nederlandse Spoorwegen (NS) service was introduced in Home Assistant 0.57, and it's used by
425 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@YarmoM
@heindrichpaul
Categories
Transport
Back to top
