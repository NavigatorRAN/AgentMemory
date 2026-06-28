# Local calendar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/local_calendar
- Final URL: https://www.home-assistant.io/integrations/local_calendar
- Canonical URL: https://www.home-assistant.io/integrations/local_calendar/
- Fetched at: 2026-06-28T02:57:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use local calendars in Home Assistant.

## Extracted Text

On this page
Configuration
Calendar Event Automations
The Local calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to create a calendar of events in Home Assistant for powering automations.
A calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity has a state and attributes that represent the next upcoming event (only). A calendar trigger is a much more flexible way to power automations with fewer limitations than using the entity state.
To add the Local calendar integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Local calendar .
Follow the instructions on screen to complete the setup.
Individual Calendar Events are what powers automations such as:
Turn on a light at the start of the event named Front Yard Light
Send a notification 5 minutes before the start of any event
Stop the media player 30 minutes after the end of the event named Exercise .
See Calendar Automations for an overview, and read more about Calendar Trigger Variables for the available information you can use in a condition or action such as the event summary , description , location and more.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Local calendar integration was introduced in Home Assistant 2022.12, and it's used by
8.9% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@allenporter
Categories
Calendar
Back to top
