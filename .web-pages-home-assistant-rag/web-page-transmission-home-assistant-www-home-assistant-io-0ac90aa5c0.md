---
source_url: "https://www.home-assistant.io/integrations/transmission"
final_url: "https://www.home-assistant.io/integrations/transmission"
canonical_url: "https://www.home-assistant.io/integrations/transmission/"
source_handle: "web:www-home-assistant-io:0ac90aa5c036"
source_section: "integrations-transmission"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "34fa7883a74a5759284283ba7d912a55fd5d8b5e3c20f6b4f8c10a5a69a1e114"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Transmission - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/transmission
- Final URL: https://www.home-assistant.io/integrations/transmission
- Canonical URL: https://www.home-assistant.io/integrations/transmission/
- Fetched at: 2026-06-28T03:23:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Transmission within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Sensors
Switches
Event entity
Usage examples
Event automation
List of actions
Templating
Attribute torrent_info
Removing the integration
To remove an integration instance from Home Assistant
The Transmission integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Transmission BitTorrent downloads from within Home Assistant and set up automations based on that information.
Before setting up the Transmission integration, ensure you have:
Transmission installed and running on your network.
The IP address or hostname and port of your Transmission instance.
The username and password of your Transmission instance, if set.
Your Transmission client must first be configured to allow remote access. In your Transmission client navigate to Preferences > Remote tab and then click the Allow remote access checkbox.
To add the Transmission service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Transmission .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your Transmission instance. For example: 192.168.1.100 or transmission.local .
Path
The RPC request target path, for example, /transmission/rpc .
Port
The port Transmission is running on. Default is 9091 .
Username
Your Transmission username, if set.
Password
Your Transmission password, if set.
Verify SSL certificate
Enable SSL certificate verification when connecting via HTTPS.
The Transmission integration provides the following sensors and switches.
The status of your Transmission daemon.
The current download speed [MB/s].
The current upload speed [MB/s].
The current number of active torrents.
The current number of paused torrents.
The total number of torrents present in the client.
The current number of started torrents (downloading).
The current number of completed torrents (seeding).
The current session downloaded data [GB].
The current session uploaded data [GB].
The total downloaded data [GB].
The total uploaded data [GB].
The current session upload/download ratio.
The total upload/download ratio.
A switch to start/stop all torrents.
A switch to enable turtle mode (a.k.a. alternative speed limits).
The Transmission integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides an Event entity Events are signals that are emitted when something happens, for example, when a user presses a physical button like a doorbell or when a button on a remote control is pressed. [Learn more] that records the last torrent event. The entity state stores the time of that event, and several event attributes provide more details that you can use in automations.
State attribute : event_type
Description : The type of the last torrent event. Possible states are Started, Downloaded, and Removed.
State attribute : name
Description : The filename of the torrent.
State attribute : id
Description : The ID of the torrent within Transmission .
State attribute : download_path
Description : The path where the torrent content is downloaded.
State attribute : labels
Description : The list of labels added to the torrent.
Create a persistent notification when a torrent is downloaded.
alias : Transmission torrent downloaded event description : " Notify when a torrent is downloaded" triggers : - trigger : state entity_id : - event.transmission_torrent not_from : - unavailable conditions : - condition : state entity_id : event.transmission_torrent attribute : event_type state : " downloaded" actions : - action : persistent_notification.create data : message : > {{ state_attr(trigger.entity_id, 'name') }} was downloaded mode : single
The Transmission integration is continuously monitoring the status of torrents in the target client. Once a torrent is started or completed, an event is triggered on the Home Assistant Bus containing the torrent name, ID, and labels, which can be used with automations.
Possible events are:
transmission_downloaded_torrent
transmission_started_torrent
transmission_removed_torrent
Inside the event, there is the name of the torrent that is started or completed and the path where the files are downloaded, as seen in the Transmission User Interface.
Example of an automation that notifies on successful download and removes the torrent from the client if the torrent has a label of Remove:
alias : Transmission download complete description : " Notify on download complete and remove if label set" triggers : - trigger : event event_type : transmission_downloaded_torrent actions : - action : notify.persistent_notification metadata : {} data : message : >- {{trigger.event.data.name}} downloaded to {{trigger.event.data.download_path}} with labels {{trigger.event.data.labels}} - if : - condition : template value_template : " {{ 'Remove' in trigger.event.data.labels }}" then : - action : transmission.remove_torrent data : delete_data : false entry_id : YOUR_TRANSMISSION_ENTRY_ID id : " {{trigger.event.data.id}}"
The Transmission integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add torrent ( transmission.add_torrent )
Adds a new torrent to download in Transmission.
Get torrents ( transmission.get_torrents )
Returns the current torrents in Transmission.
Remove torrent ( transmission.remove_torrent )
Removes a torrent from Transmission.
Start torrent ( transmission.start_torrent )
Starts a torrent in Transmission.
Stop torrent ( transmission.stop_torrent )
Stops a torrent in Transmission.
For an overview of every action across all integrations, see the actions reference .
All *_torrents sensors, such as sensor.transmission_total_torrents or sensor.transmission_started_torrents , have a state attribute torrent_info that contains information about the torrents that are currently in a corresponding state. You can see this information in Settings > Developer tools > States > sensor.transmission_total_torrents > Attributes , or by adding a Markdown card to a dashboard with the following code:
content : > {% set payload = state_attr('sensor.transmission_total_torrents', 'torrent_info') %} {% for torrent in payload.items() %} {% set name = torrent[0] %} {% set data = torrent[1] %} {{ name|truncate(20) }} is {{ data.percent_done }}% complete, with {{ data.ratio }} ratio, {{ data.eta }} remaining {% endfor %} type : markdown
This integration follows standard integration removal. After removal, your Transmission instance continues running with its current configuration.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Transmission service was introduced in Home Assistant 0.87, and it's used by
1775 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
@JPHutchins
@andrew-codechimp
Categories
Downloading
Sensor
Switch
Back to top
