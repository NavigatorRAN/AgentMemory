---
source_url: "https://www.home-assistant.io/integrations/caldav"
final_url: "https://www.home-assistant.io/integrations/caldav"
canonical_url: "https://www.home-assistant.io/integrations/caldav/"
source_handle: "web:www-home-assistant-io:050459b50309"
source_section: "integrations-caldav"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "07f138a566b7d2ad3272dccb633277af6c59a22b26cb1591515282ba97ef4a04"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# CalDAV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/caldav
- Final URL: https://www.home-assistant.io/integrations/caldav
- Canonical URL: https://www.home-assistant.io/integrations/caldav/
- Fetched at: 2026-06-28T02:33:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a WebDav calendar into Home Assistant.

## Extracted Text

On this page
Configuration
Manual configuration
Calendar Event Automations
Calendar Entity Attributes
To-do Entity
Troubleshooting
Related topics
The CalDAV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your WebDAV calendar to Home Assistant
as one of these entity types:
A calendar entity which can be used to trigger automations based on the start or end of an event using criteria such as the event name or description.
A todo entity which tracks the number of active items
on the to-do list.
The WebDAV entities are updated roughly every 15 minutes.
To add the CalDAV service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select CalDAV .
Follow the instructions on screen to complete the setup.
During the configuration flow you will be asked for the CalDAV server and credentials
for it. An example CalDAV URL is https://caldav.icloud.com/ .
This integration was tested against the following systems, but any other complying with the RFC4791 should work:
Baikal
iCloud Calendar
Nextcloud
Owncloud
Synology Calendar
You may also manually add a WebDAV calendar in Home Assistant by adding the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. This method does not support to-do lists.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Manual configuration examples
# Example configuration.yaml entry for baikal calendar : - platform : caldav username : [email protected] password : !secret caldav url : https://baikal.my-server.net/cal.php/calendars/ [email protected] /default
# Example configuration.yaml entry for nextcloud, calendars will be found automatically calendar : - platform : caldav username : john.doe password : !secret caldav url : https://nextcloud.example.com/remote.php/dav
# Example configuration.yaml entry for Radicale, calendars will be found automatically calendar : - platform : caldav username : john.doe password : !secret caldav url : https://radicale.example.com/
# Example configuration.yaml entry for iCloud, calendars will be found automatically calendar : - platform : caldav username : !secret userIcloud password : !secret passIcloud url : https://caldav.icloud.com
All day events are not supported by default when configured using yaml.
The examples below create calendar entities that match specific search criteria.
# Example configuration.yaml entry calendar : - platform : caldav username : [email protected] password : !secret caldav url : https://baikal.my-server.net/cal.php/calendars/ [email protected] /default custom_calendars : - name : " HomeOffice" calendar : " Agenda" search : " HomeOffice" - name : " WarmupFlat" calendar : " Agenda" search : " Warmup"
This will create two entities for the calendar name Agenda: “HomeOffice” and “WarmupFlat” with events matching the regular expression specified in search . In custom calendars, events that last a whole day are taken into account.
If you use the custom_calendars option, only those calendars will be loaded. You cannot use calendars and custom_calendars in the same configuration.
Configuration Variables
Looking for your configuration file?
url string Required
The full URL to your calendars.
username string ( Optional )
Username for authentication.
password string ( Optional )
Password for authentication.
calendars list ( Optional )
List of the calendars to filter. Empty or absent means no filtering; that is, all calendars will be added. It cannot be used if the custom_calendars option is used.
custom_calendars list ( Optional )
Details on any custom calendars you want to create. Using this will only load the custom calendars supplied. No other calendars will load.
name string Required
The name of your custom calendar.
calendar string Required
The source calendar to search on.
search string Required
Regular expression for filtering the events based on the content of their summary, description or location.
days integer ( Optional , default: 1 )
Number of days for the search for upcoming appointments.
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate or not. If using self-signed certificates, this usually needs to be set to “False”.
Individual Calendar Events can power automations such as:
Turn on a light at the start of the event named Front Yard Light
Send a notification 5 minutes before the start of any event
Stop the media player 30 minutes after the end of the event named Exercise .
See Calendar Automations for an overview, and read more about Calendar Trigger Variables for the available information you can use in a condition or action such as the event summary , description , location and more.
The calendar entity has additional attributes related to a single next upcoming event.
Tip
Using the entity state and attributes is more error prone and less flexible than using Calendar Automations. The calendar entity itself may only track a single upcoming active event and can’t handle multiple events with the same start time, or overlapping events.
offset_reached : If set in the event title and parsed out will be on/off once the offset in the title in minutes is reached. So the title Very important meeting !! -10 would trigger this attribute to be on 10 minutes before the event starts. This should be in the format of HH:MM or MM . This attribute is not available when configured from the UI.
all_day : True/False if this is an all day event. Will be False if there is no event found.
message : The event title with the search values extracted. So in the above example for offset_reached the message would be set to Very important meeting
description : The event description.
location : The event Location.
start_time : Start time of event.
end_time : End time of event.
The todo entity is the number of incomplete items on the to-do list. See the
todo integration documentation for details and available
actions that can be used in automations.
iCloud
You may be required to use app specific passwords
to generate a new password for use by Home Assistant to avoid sharing your iCloud account
password.
List of to do list integrations
To do list card
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The CalDAV service was introduced in Home Assistant 0.60, and it's used by
2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Calendar
To-do List
Back to top
