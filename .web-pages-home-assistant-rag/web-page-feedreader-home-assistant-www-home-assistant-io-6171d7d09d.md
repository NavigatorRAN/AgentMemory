---
source_url: "https://www.home-assistant.io/integrations/feedreader"
final_url: "https://www.home-assistant.io/integrations/feedreader"
canonical_url: "https://www.home-assistant.io/integrations/feedreader/"
source_handle: "web:www-home-assistant-io:6171d7d09db1"
source_section: "integrations-feedreader"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b668f3c95cd87c702aecdd331b77486ab46d5bd12134701685aeda4623ceff82"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Feedreader - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/feedreader
- Final URL: https://www.home-assistant.io/integrations/feedreader
- Canonical URL: https://www.home-assistant.io/integrations/feedreader/
- Fetched at: 2026-06-28T02:42:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate RSS feeds into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Usage
Automation
Event entity
Video tutorial
Event listener
Other examples
Remove the integration
To remove an integration instance from Home Assistant
Related topics
Add an RSS/Atom feed reader that polls feeds every hour and sends new entries into the event bus.
To add the Feedreader service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Feedreader .
Follow the instructions on screen to complete the setup.
URL
The URL of the RSS/Atom feed you want to integrate.
To define options for Feedreader, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Feedreader are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Maximum feed entries
The maximum number of entries to extract from each feed.
Feedreader events can be used out of the box to trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] automation actions, e.g.:
automation : - alias : " Trigger action when new element(s) in RSS feed" triggers : - trigger : event event_type : feedreader actions : - action : script.turn_on target : entity_id : script.my_action
automation : - alias : " Send notification of RSS feed title when updated" triggers : - trigger : event event_type : feedreader event_data : feed_url : " https://hasspodcast.io/feed/podcast" actions : - action : persistent_notification.create data : title : " New HA Podcast available" message : " New Podcast available - {{ as_timestamp(now()) | timestamp_custom('%I:%M:%S %p %d%b%Y', true) }}" notification_id : " {{ trigger.event.data.title }}"
The trigger.event.data variable contains at least the following keys, there might be more depending on the data the configured feed is providing.
Key Description trigger.event.data.link The URL to this feed entry. trigger.event.data.title The title of this feed entry. trigger.event.data.description The description of this feed entry. trigger.event.data.content The content of this feed entry.
An Event entity Events are signals that are emitted when something happens, for example, when a user presses a physical button like a doorbell or when a button on a remote control is pressed. [Learn more] entity will be created for each configured feed which always represents the latest entry of the feed.
This video tutorial explains how to set up the feedreader and show a list of news feed items on your dashboard in Home Assistant.
For more advanced use cases, a custom integration registering to the feedreader Event Every time something happens in Home Assistant, an event is fired. There are different types of events, such as state change events, when an action was triggered, or the time changed. All entities produce state change events. Every time a state changes, a state change event is produced. Events can be used to trigger automations or scripts. For example, you can trigger an automation when a light is turned on, then a speaker turns on in that room. Events can also be used to trigger actions in the frontend. For example, you can trigger an action when a button is pressed. [Learn more] type could be used instead:
EVENT_FEEDREADER = " feedreader " hass . bus . listen ( EVENT_FEEDREADER , event_listener )
To get started developing custom integrations, please refer to the developers documentation
For a drop in packaged complete example of Feedreader, you can use the PodCast notifier .
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Defining a custom polling interval
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Feedreader service was introduced in Home Assistant 0.18, and it's used by
2610 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
Categories
Event
Other
Back to top
