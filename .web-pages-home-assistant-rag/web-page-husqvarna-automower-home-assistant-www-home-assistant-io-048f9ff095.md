# Husqvarna Automower - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/husqvarna_automower
- Final URL: https://www.home-assistant.io/integrations/husqvarna_automower
- Canonical URL: https://www.home-assistant.io/integrations/husqvarna_automower/
- Fetched at: 2026-06-28T02:50:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Husqvarna Automower lawn mowers into Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
Entities
Binary sensor
Button (if available)
Calendar
Device tracker (if available)
Event (if available)
Lawn mower
Number (if available)
Select (if available)
Sensor
Switch
List of actions
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Husqvarna Automower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides connectivity with Husqvarna Automowers lawn mowers through Husqvarna’s cloud API. Only mowers with Automower® Connect or with the Automower® Connect Module are supported.
To use this integration you must properly configure OAuth2 credentials using your Husqvarna account. Refer to this guide for general overview of the process.
Your Husqvarna account username/password used for the Automower® Connect phone app is required. Most users probably created a Husqvarna account during initial mower setup.
Go to the Husqvarna Developer Portal and sign in with your Husqvarna account. Authorize Developer Portal to access Husqvarna account when prompted.
After signing in you will be automatically redirected to “My applications”. (Otherwise go to: Applications )
Create a new application:
Name is required but can be anything, for example “My Home Assistant”
Description is optional
Redirect URL: https://my.home-assistant.io/redirect/oauth
Make sure no extra spaces were appended at end of URL from copy and paste.
Click CREATE . Application Key and Application Secret will be generated and shown. Protect these like a username and password.
Click on CONNECT NEW API and connect the Authentication API .
Click on CONNECT NEW API again and connect the Automower Connect API .
Leave this tab open in browser and continue with Home Assistant configuration.
To add the Husqvarna Automower hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Husqvarna Automower .
Follow the instructions on screen to complete the setup.
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Internal examples: http://192.168.0.2:8123/auth/external/callback , http://homeassistant.local:8123/auth/external/callback .”
Name
Enter the name for the provided credentials. You can choose your favorite name.
OAuth Client ID
Enter the Application key from your Husqvarna developer application.
OAuth Client Secret
Enter the Application secret from your Husqvarna developer application.
If you have an error with your credentials, you can delete them on the application credentials page.
Once you have enabled the Husqvarna Automower integration, you should see the following entities:
The integration will create the following binary sensors:
Battery charging
The mower is currently charging. It reports this state if it autonomously returned to the dock due to low battery and if it leaves the dock for mowing after being fully charged.
Leaving dock
The mower is currently leaving the charging station and heading out to a starting point.
The integration will create the following buttons:
Confirm Error (if available): For confirming minor mower errors.
Reset cutting blade usage time (if available): Resets the cutting blade usage time.
Sync clock : Syncs the clock of the mower with the time set in Home Assistant.
The integration will create a calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity for all mowers. The calendar shows all current and upcoming schedules.
The integration will create a device tracker entity to show the position of the mower.
Shows the last error as event.
Includes additional context: severity , latitude , longitude , and date_time .
Example attributes Attribute Description event_type Error code (for example, tilt_error ) severity Error severity (for example, error , warning ) latitude Latitude where the error occurred longitude Longitude where the error occurred date_time Timestamp of the error Use cases
Send a notification when the mower is lifted or stuck.
Show last error location on a map
Note
The entity will only be created when a new message is received. If a mower hasn’t reported any errors yet, the entity won’t show up.
The integration will create a lawn mower entity to control the mower. This entity can:
Resume the schedule
Pause mowing
Park until next schedule
Cutting height
The integration will create a number entity for changing the cutting height of the mower. This entity is disabled by default. You have to enable it manually. It can’t be detected with the API if the mower has the capability to change the cutting height remotely. Before enabling this function, refer to the mower documentation. Depending on the mower, it is possible that you can use this entity only passively as a sensor and not actively to change the cutting height.
Possible values are 1 (grass stays short) to 9 (grass stays high).
Cutting height for work areas
The integration will create a number entity for changing the cutting height for each work area of the mower if your mower supports work areas. Possible values for the cutting heights are 0% (grass stays short) to 100% (grass stays high) of the default cutting height. Note: It’s not yet possible to change the default cutting height with Home Assistant.
The integration will create a select entity for selecting the headlight mode of the mower.
The integration will create the following sensors:
Battery level
Cutting blade usage time (if available)
Error. For example: Mower tilted , outside geofence .
Downtime (if available)
Inactive reason (if available). For example: Searching for satellites or planning .
Remaining charging time
Restricted reason. For example: Week schedule , frost , or daily limit .
Mode
Next start
Number of charging cycles
Number of collisions
Total charging time
Total cutting time
Total drive distance
Total running time
Total searching time
Uptime (if available)
Work area (if available). For example: My lawn , Front lawn , Back lawn
For each work area with activated systematic mowing these sensors are created:
Progress (in percent)
Last time completed
Avoid (if available)
The integration will create a switch for each stay-out zone defined for your mower. When the switch is on, the mower avoids the corresponding zone. When the switch is off, the mower enters the corresponding zone.
Enable schedule
The integration will create a switch to enable or disable the schedule of the mower. If the switch is on, the mower will mow according to the schedule. If the switch is off the mower will return to the dock and park until further notice.
Work area (if available)
The integration will create a switch for each work area defined for your mower. When the switch is on, the mower mows the corresponding area. When the switch is off, the mower doesn’t mow the corresponding area.
The Husqvarna Automower integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Override schedule ( husqvarna_automower.override_schedule )
Lets the mower either mow or park for a given duration, overriding all schedules.
Override schedule work area ( husqvarna_automower.override_schedule_work_area )
Lets the mower mow for a given duration in a specified work area, overriding all schedules.
For an overview of every action across all integrations, see the actions reference .
The mower can only be started using the lawn_mower.start_mowing action during the schedules configured in the Automower Connect App. To start the mower outside the scheduled times, use the husqvarna_automower.override_schedule action. In both cases, the battery must be fully charged beforehand.
Stay-out zone handling is not supported for mowers equipped with EPOS technology.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Husqvarna Automower hub was introduced in Home Assistant 2024.3, and it's used by
2279 active installations.
Its IoT class is Cloud Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Thomas55555
Categories
Button
Device tracker
Event
Lawn Mower
Number
Select
Back to top
