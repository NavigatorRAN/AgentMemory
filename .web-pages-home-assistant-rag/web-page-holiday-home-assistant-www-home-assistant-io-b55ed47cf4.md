# Holiday - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/holiday
- Final URL: https://www.home-assistant.io/integrations/holiday
- Canonical URL: https://www.home-assistant.io/integrations/holiday/
- Fetched at: 2026-06-28T02:49:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use holiday calendars in Home Assistant.

## Extracted Text

On this page
Configuration
Holiday calendar automations
The Holiday integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to create a calendar of holidays in Home Assistant for powering automations.
It uses the Python module holidays to incorporate information about region-specific public holidays.
A calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity has a state and attributes that represent the next upcoming event (only). A calendar trigger is a much more flexible way to power automations with fewer limitations than using the entity state.
Some countries provide additional categories to be configured besides the public holidays. See the details for each country in the holidays library. If the country does not support additional categories, the option to configure categories will not be displayed.
To add the Holiday integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Holiday .
Follow the instructions on screen to complete the setup.
Individual holiday Events are what powers automations such as:
Turn on the Christmas lights at the start of Christmas Day.
Prevent your covers from being opened on public holidays.
For an overview, refer to calendar automations . You can use calendar trigger variables in a condition or action such as the event summary , description , location and in other places.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Holiday integration was introduced in Home Assistant 2024.1, and it's used by
2.4% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jrieger
@gjohansson-ST
Categories
Calendar
Back to top
