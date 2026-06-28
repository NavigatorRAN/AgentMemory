---
source_url: "https://www.home-assistant.io/integrations/nzbget"
final_url: "https://www.home-assistant.io/integrations/nzbget"
canonical_url: "https://www.home-assistant.io/integrations/nzbget/"
source_handle: "web:www-home-assistant-io:2a8e879e160c"
source_section: "integrations-nzbget"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "842201c01f13477fa99c2cff3801ef6359407f43b37d025962cee0d2ae017214"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NZBGet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nzbget
- Final URL: https://www.home-assistant.io/integrations/nzbget
- Canonical URL: https://www.home-assistant.io/integrations/nzbget/
- Fetched at: 2026-06-28T03:04:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NZBGet within Home Assistant.

## Extracted Text

On this page
Configuration
Sensor
Event automation
Actions
Action: Set speed
The NZBGet integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control your downloads with NZBGet from within Home Assistant. It also allows you to set up automation based on the information.
To add the NZBGet service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NZBGet .
Follow the instructions on screen to complete the setup.
This integration will create these sensors:
nzbget_article_cache : Article cache size in MB.
nzbget_average_speed : Average download rate since server start in MB/s.
nzbget_download_paused : Whether downloading is paused.
nzbget_speed : Current download rate in MB/s.
nzbget_queue_size : Remaining size to download in MB.
nzbget_disk_free : Free disk space at the storage location of NZBGet.
nzbget_post_processing_jobs : Number of Par-Jobs or Post-processing script jobs in the post-processing queue.
nzbget_post_processing_paused : Whether post processing is paused.
nzbget_uptime : NZBGet server uptime.
nzbget_size : Amount of data downloaded since server start in MB.
nzbget_speed_limit : Download queue speed limit in MB/s.
The NZBGet integration continuously monitors nzbget’s download history. When a download completes, an event usable for automation is triggered on the Home Assistant Bus.
Possible events are:
nzbget_download_complete
The event includes the name, category, and status of the downloaded nzb.
Example automation to send a Telegram message on a completed download:
- alias : " Completed Torrent" triggers : - trigger : event event_type : nzbget_download_complete event_data : category : tv actions : - action : notify.telegram_notifier data : title : " Download completed!" message : " {{trigger.event.data.name}}"
Available actions:
pause : Pause the download queue.
resume : Resume the download queue.
set_speed : Set the download queue speed limit.
The nzbget.set_speed action sets the download queue speed limit.
Data attribute Optional Description speed yes Sets the download speed limit, specified in Kb/s. 0 disables the speed limit. Defaults to 1000.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NZBGet service was introduced in Home Assistant 0.17, and it's used by
385 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chriscla
Categories
Downloading
Back to top
