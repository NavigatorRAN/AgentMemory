# rTorrent - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rtorrent
- Final URL: https://www.home-assistant.io/integrations/rtorrent
- Canonical URL: https://www.home-assistant.io/integrations/rtorrent/
- Fetched at: 2026-06-28T03:13:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate rTorrent sensors within Home Assistant.

## Extracted Text

On this page
Related topics
The rTorrent integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your downloads with rTorrent from within Home Assistant and setup automations based on the information.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : rtorrent url : " http://<user>:<password>@<host>:<port>/RPC2" monitored_variables : - ' current_status' - ' download_speed' - ' upload_speed' - ' all_torrents' - ' stopped_torrents' - ' complete_torrents' - ' uploading_torrents' - ' downloading_torrents' - ' active_torrents'
This sensor requires the rTorrent XML-RPC API exposed on an HTTP interface.
Note that for security reasons, simply using the SCGI interface (default localhost:5000 ) of rTorrent won’t work.
The official reference describes how to set up that HTTP interface.
Alternatively, the arch-rtorrentvpn container can be used with url set to http://admin: [email protected] :9080/RPC2 .
Configuration Variables
Looking for your configuration file?
url string Required
The URL to the HTTP endpoint of the rTorrent XML-RPC API.
name string ( Optional )
The name to use when displaying this rTorrent instance.
monitored_variables list Required
Conditions to be monitored.
current_status
The status of your rTorrent daemon.
download_speed
The current download speed.
upload_speed
The current upload speed.
all_torrents
The number of all torrents.
stopped_torrents
The number of torrents that are stopped.
complete_torrents
The number of torrents that are fully downloaded.
uploading_torrents
The number of torrents that are seeding.
downloading_torrents
The number of torrents that are leeching.
active_torrents
The number of torrents that are actively ( measurable speed ) leeching, seeding or both.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The rTorrent integration was introduced in Home Assistant 0.81, and it's used by
26 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Downloading
Back to top
