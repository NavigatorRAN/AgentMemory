# Twente Milieu - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twentemilieu
- Final URL: https://www.home-assistant.io/integrations/twentemilieu
- Canonical URL: https://www.home-assistant.io/integrations/twentemilieu/
- Fetched at: 2026-06-28T03:24:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Twente Milieu with Home Assistant.

## Extracted Text

On this page
Configuration
Use cases
Supported functionality
Calendar
Sensors
Data updates
Examples
Send notification the evening before the garbage pickup day
Send notification at the end of day to bring in the empty bin
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Twente Milieu integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to monitor the upcoming waste collection schedules provided by Twente Milieu , a waste collection company serving municipalities in the Twente region of the Netherlands, including Enschede, Hengelo, Almelo, Borne, Hof van Twente, Oldenzaal, and Losser. This integration helps you stay informed about the next pickup dates for different types of waste (like organic, paper, plastic, and non-recyclable), ensuring you never miss a collection day.
To add the Twente Milieu service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Twente Milieu .
Follow the instructions on screen to complete the setup.
Postal code
The postal code of the address, for example “7500AA”.
House number
The house number of the address.
House letter/additional
The house letter or additional information of the address, if applicable.
With the Twente Milieu integration, you can:
Monitor upcoming waste collection dates for different waste types
Create automations to remind you to put out your waste bins before collection day
View all your upcoming waste pickups in the calendar dashboard
See at a glance when your next waste collection is due
The integration provides a calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity that displays all upcoming waste collection dates from Twente Milieu. You can view this calendar in your Calendar dashboard .
This integration creates a sensor for the next collection date of each waste type:
Organic waste pickup : The next collection date for organic waste.
Packages waste pickup : The next collection date for packaging waste, such as plastic, metal, and drink cartons.
Paper waste pickup : The next collection date for paper and cardboard.
Non-recyclable waste pickup : The next collection date for non-recyclable waste.
Christmas tree pickup : The next collection date for Christmas trees, which only has a date during the seasonal collection period.
Each sensor shows the next scheduled date for its waste type, so you know when to put out which bin.
The integration updates its information by polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Twente Milieu service every hour. This ensures your waste collection schedule in Home Assistant stays current.
Below are practical examples of how you can use the Twente Milieu integration in your automations.
This example sends a notification to your mobile device the evening before collection day, ensuring you remember to put out the correct bin.
automation : - alias : " Reminder to put out the bin" triggers : - trigger : calendar event : start entity_id : calendar.twente_milieu # Fire 12 hours before the calendar event starts, # so you get notified the evening before the pickup day. offset : " -12:00:00" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Garbage day!" message : > Reminder: Tomorrow is {{ trigger.calendar_event.summary }} pickup day. Don't forget to put out the bin!
This example sends a notification to remind you to bring the empty bin back in after collection.
automation : - alias : " Reminder to bring in the bin" triggers : - trigger : calendar event : end entity_id : calendar.twente_milieu # Fire 4 hours before the calendar event ends, # so you get notified in the evening of the pickup day. offset : " -4:00:00" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Bring in the bin!" message : > Reminder: The waste has been collected today. Don't forget to bring in your empty bin!
Home Assistant currently doesn’t support translating calendar items. Therefore, waste collection events in the calendar will always be displayed in English, regardless of your language settings.
There are no commonly known issues with this integration.
This integration follows standard integration removal. No additional steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Twente Milieu service was introduced in Home Assistant 0.97, and it's used by
304 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Environment
Sensor
Back to top
