---
source_url: "https://www.home-assistant.io/integrations/overseerr"
final_url: "https://www.home-assistant.io/integrations/overseerr"
canonical_url: "https://www.home-assistant.io/integrations/overseerr/"
source_handle: "web:www-home-assistant-io:41052c19546d"
source_section: "integrations-overseerr"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "212c79b415b39ea249a67352b1223d5476f4c555a91a85c84acb930cfa10edab"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Seerr - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/overseerr
- Final URL: https://www.home-assistant.io/integrations/overseerr
- Canonical URL: https://www.home-assistant.io/integrations/overseerr/
- Fetched at: 2026-06-28T03:06:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Seerr with Home Assistant.

## Extracted Text

On this page
Configuration
Supported versions
Supported functionality
Events
Sensors
List of actions
Use cases
Example automations
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
Seerr is a service that allows you to manage media requests and to integrate these media requests with Plex, Jellyfin, Radarr, and Sonarr. The Seerr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Seerr instance. The integration is backward compatible with Overseerr .
To add the Seerr service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Seerr .
Follow the instructions on screen to complete the setup.
URL
The URL of your Seerr instance.
API key
The API key of your Seerr instance, which can be found in the Seerr settings.
The latest version of Seerr is supported by this integration.
The Seerr integration provides a couple of entities to Home Assistant.
Below is an overview of these entities.
Seerr provides an event entity for updates around media.
The possible events that this entity has are:
pending
approved
available
failed
declined
auto_approved
Relevant data about the request is stored in the attributes.
The integration provides statistics for both requests and issues stored in Seerr.
Request sensors
There are sensors for:
Total requests
Movie requests
TV requests
Pending requests
Declined requests
Processing requests
Available requests
Issue sensors
Total issues
Open issues
Closed issues
Video issues
Audio issues
Subtitle issues
The Seerr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get requests ( overseerr.get_requests )
Retrieves a list of media requests from Seerr.
For an overview of every action across all integrations, see the actions reference .
The integration can be used to build automations to help and notify you of new media requests and issues.
Send me a push notification on a new request
alias : " Overseerr push notification" description : " Send me a push notification on a new media request" triggers : - trigger : state entity_id : - event.overseerr_last_media_event not_from : - unknown - unavailable conditions : - condition : template value_template : >- {{ state_attr('event.overseerr_last_media_event', 'event_type') == 'pending' }} actions : - action : notify.send_message target : entity_id : notify.my_device metadata : {} data : message : >- {{ state_attr('event.overseerr_last_media_event', 'subject') }} has been requested
Send notification when open issues exceed threshold
alias : " Notify when too many open issues" description : " Alert when open issues in Overseerr exceed 10" triggers : - trigger : numeric_state entity_id : - sensor.overseerr_open_issues above : 10 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : >- Warning: {{ states('sensor.overseerr_open_issues') }} open issues in Overseerr! title : " High Issue Count"
Track audio issues trend with statistics sensor
alias : " Monitor audio issue trends" description : " Create a statistics sensor to track audio issue trends over time" sensor : - platform : statistics name : " Audio Issues Statistics" entity_id : sensor.overseerr_audio_issues state_characteristic : mean max_age : days : 7 sampling_size : 100
Alert when video issues spike
alias : " Video issues spike alert" description : " Notify when video issues increase significantly" triggers : - trigger : numeric_state entity_id : - sensor.overseerr_video_issues above : 5 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : >- Video issues are elevated: {{ states('sensor.overseerr_video_issues') }} issues detected title : " Video Quality Alert"
Daily issue report
alias : " Daily Overseerr issue summary" description : " Send a daily report of all issue types" triggers : - trigger : time at : " 09:00:00" conditions : - condition : numeric_state entity_id : sensor.overseerr_total_issues above : 0 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Overseerr Daily Report" message : >- Total Issues: {{ states('sensor.overseerr_total_issues') }} Open: {{ states('sensor.overseerr_open_issues') }} Closed: {{ states('sensor.overseerr_closed_issues') }} Video: {{ states('sensor.overseerr_video_issues') }} Audio: {{ states('sensor.overseerr_audio_issues') }} Subtitle: {{ states('sensor.overseerr_subtitle_issues') }}
Create dashboard badge for subtitle issues
type : entity entity : sensor.overseerr_subtitle_issues name : Subtitle Issues icon : mdi:subtitles
When loading the integration, it will try to configure the webhook in Seerr to give updates to Home Assistant.
This makes the integration a push-based integration.
When the integration receives an update about the requests, it updates the statistics to make sure they are up to date.
In addition, the integration checks for updates every 5 minutes.
There are a few known limitations for using the integration:
Seerr is only capable of having one webhook set up at a time.
This means you can only have one Home Assistant instance connected to your Seerr instance at a time.
The integration is not able to function with CSRF protection turned on. In Overseer, go to Settings and turn off the CSRF Protection .
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Failed to register Seerr webhook
Make sure your Seerr instance can reach your Home Assistant instance.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Seerr service was introduced in Home Assistant 2025.2, and it's used by
1236 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
@AmGarera
Categories
Event
Multimedia
Sensor
Back to top
