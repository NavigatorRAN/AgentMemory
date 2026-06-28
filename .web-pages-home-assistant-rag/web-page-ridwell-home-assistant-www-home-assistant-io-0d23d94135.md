# Ridwell - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ridwell
- Final URL: https://www.home-assistant.io/integrations/ridwell
- Canonical URL: https://www.home-assistant.io/integrations/ridwell/
- Fetched at: 2026-06-28T03:12:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Ridwell

## Extracted Text

On this page
Configuration
Options
Event summary details
Calendar
Pickup types
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Ridwell integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows users to track waste recycling pickups scheduled with Ridwell .
To add the Ridwell service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ridwell .
Follow the instructions on screen to complete the setup.
To define options for Ridwell, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Ridwell are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The calendar event summary can be customized to display different details about a given pickup.
The following choices are available for customizing the text. Each option is also detailed more in separate sections below.
Pickup status
The current state of the individual pickup occurring that day (Default option)
Rotating category
The name of the rotating category selected for that pickup
No details
No text will be displayed after the event title
Common statuses for an individual pickup include:
initialized : Available for customers to opt-in for pickup
scheduled : Opted-into; Ridwell will include you in their route that day
notified : Ridwell has attempted to contact customers who have not opted-in to pickups happening soon
skipped : Previously scheduled but then later unscheduled (canceled)
The rotating category will be displayed once a pickup has been scheduled successfully.
If a pickup does not have the scheduled status, the calendar event will display the Pickup status values described under Pickup status until the pickup has a scheduled status.
The calendar title will show “Ridwell Pickup” only, but full details on the various pickup types will still be included in the description of the event.
Note
The Ridwell integration will reload after changing this option.
You may notice the Ridwell calendar disappear briefly before reappearing with the newly formatted calendar events.
The calendar sensor contains a calendar state attribute, which contains:
The name of the Ridwell Calendar.
If the event is an all-day event (Boolean).
The start time of the calendar event. Starts at midnight.
The end time of the event. Ends at midnight.
The location of the event.
The description of the items being picked up.
Friendly name of the calendar event.
For example:
message : Ridwell Pickup (scheduled) all_day : true start_time : 2024-07-26 00:00:00 end_time : 2024-07-27 00:00:00 location : description: Pickup types: Light Bulbs (quantity : 1), Hand Tools (quantity : 1), Batteries (quantity : 1), Threads (quantity : 1), Plastic Film (quantity : 1) friendly_name : Ridwell
The pickup sensor contains a pickup_types state attribute, which contains:
The items being picked up during this particular event
The category of each item
The quantity of each item
{ "Latex Paint" : { "category" : "add_on" , "quantity" : 7 }, "Beyond the Bin" : { "category" : "add_on" , "quantity" : 2 }, "Fluorescent Light Tubes" : { "category" : "add_on" , "quantity" : 1 }, "Winter Coats and Jackets" : { "category" : "rotating" , "quantity" : 1 }, "Light Bulbs" : { "category" : "standard" , "quantity" : 1 }, "Batteries" : { "category" : "standard" , "quantity" : 1 }, "Threads" : { "category" : "standard" , "quantity" : 1 }, "Plastic Film" : { "category" : "standard" , "quantity" : 1 } }
Tip
The Ridwell integration checks for updated information from your Ridwell account about once every hour.
Changes to pickups may take up to 60 minutes appear in Home Assistant.
If pickup information in Home Assistant does not match recent changes to your Ridwell account, you can manually trigger a check for new details by reloading the Ridwell integration. On the integration overview page, choose Reload from the options menu on the specific account instance you want refreshed.
This integration follows standard integration removal steps.
Removing this integration from Home Assistant will not end or disrupt your paid subscription.
Any pickups scheduled or modified by this integration will persist after removing the integration, and they can continue to be managed using the Ridwell site or app.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ridwell service was introduced in Home Assistant 2021.12, and it's used by
54 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Sensor
Back to top
