---
source_url: "https://www.home-assistant.io/integrations/qbittorrent"
final_url: "https://www.home-assistant.io/integrations/qbittorrent"
canonical_url: "https://www.home-assistant.io/integrations/qbittorrent/"
source_handle: "web:www-home-assistant-io:64cfb8f02c51"
source_section: "integrations-qbittorrent"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d4465e86e3a8cf6775f9e5020f0632813eee6bf53bea177c7d2abd602423511b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# qBittorrent - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/qbittorrent
- Final URL: https://www.home-assistant.io/integrations/qbittorrent
- Canonical URL: https://www.home-assistant.io/integrations/qbittorrent/
- Fetched at: 2026-06-28T03:10:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate qBittorrent sensors within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Sensors
Switch
List of actions
The qBittorrent integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your downloads with qBittorrent from within Home Assistant and setup automations based on the information.
You can control the alternative speed via the Alternative speed switch.
This sensor requires the qBittorrent Web UI enabled. The official reference describes how to set up the Web UI.
To add the qBittorrent service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select qBittorrent .
Follow the instructions on screen to complete the setup.
The qBittorrent integration will add the following sensors:
sensor.qbittorrent_status : The status of qBittorrent - up_down , seeding , downloading , or idle .
sensor.qbittorrent_connection_status : The connection status of qBittorrent - connected , firewalled , or disconnected .
sensor.qbittorrent_upload_speed : The current total upload speed in kB/s.
sensor.qbittorrent_download_speed : The current total download speed in kB/s.
sensor.qbittorrent_upload_speed_limit : The active qBittorrent upload speed limit (disabled by default).
sensor.qbittorrent_download_speed_limit : The active qBittorrent download speed limit (disabled by default).
sensor.qbittorrent_alltime_upload : The total amount of uploaded data.
sensor.qbittorrent_alltime_download : The total amount of downloaded data.
sensor.qbittorrent_global_ratio : The global share ratio (disabled by default).
sensor.qbittorrent_all_torrents : The current total torrents in qBittorrent.
sensor.qbittorrent_active_torrents : The current active torrents in qBittorrent.
sensor.qbittorrent_inactive_torrents : The current inactive torrents in qBittorrent.
sensor.qbittorrent_paused_torrents : The current paused torrents in qBittorrent.
sensor.qbittorrent_errored_torrents : The current errored torrents in qBittorrent.
The qBittorrent integration adds the following switch:
Alternative speed : Allows you to enable or disable qBittorrent’s alternative speed.
The qBittorrent integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get all torrents ( qbittorrent.get_all_torrents )
Gets the current torrents from all qBittorrent instances.
Get torrents ( qbittorrent.get_torrents )
Gets the current torrents from one qBittorrent instance.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The qBittorrent service was introduced in Home Assistant 0.84, and it's used by
3345 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@geoffreylagaisse
@finder39
Categories
Downloading
Back to top
