# Remote Calendar - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/remote_calendar
- Final URL: https://www.home-assistant.io/integrations/remote_calendar
- Canonical URL: https://www.home-assistant.io/integrations/remote_calendar/
- Fetched at: 2026-06-28T03:11:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use remote calendars in Home Assistant.

## Extracted Text

On this page
Known limitations
Installation instructions
Configuration
Data updates
Defining a custom polling interval
Supported functionality
Calendar Event Automations
Removing the integration
To remove an integration instance from Home Assistant
The Remote calendar integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to read a calendar in Home Assistant for powering automations.
The integration supports HTTP Basic Authentication but does not provide the ability to connect to a resource that requires other special headers.
To add the Remote Calendar service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Remote Calendar .
Follow the instructions on screen to complete the setup.
Please provide the following information to the config flow.
Calendar Name
A name for your calendar, you can choose a name you want. Example: Home Assistant Events
Calendar URL
The URL of the remote calendar. Example: https://calendar.google.com/calendar/ical/p07n98go11onamd08d0kmq6jhs%40group.calendar.google.com/public/basic.ics
Verify SSL certificate
Enable SSL certificate verification when connecting via HTTPS.
If the calendar URL requires authentication, you will be prompted for a username and password in an additional setup step.
Username
The username for HTTP Basic Authentication.
Password
The password for HTTP Basic Authentication.
At the start of the integration, we fetch data from the remote. If the update fails, the integration tries again to fetch the data. After that, the update interval of the calendar is set to every 24 hours.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
The integration only supports reading a calendar. A calendar entity has a state and attributes that represent the next upcoming event (only). All the events of the calendar can be displayed in the Calendar dashboard.
Individual Calendar Events are what powers automations such as:
Notify me 12 hours before the start of the event named Garbage collection .
See Calendar Automations for an overview, and read more about Calendar Trigger Variables for the available information you can use in a condition or action such as the event summary , description , location and more.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Remote Calendar service was introduced in Home Assistant 2025.4, and it's used by
1.3% of the active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Thomas55555
@allenporter
Categories
Calendar
Back to top
