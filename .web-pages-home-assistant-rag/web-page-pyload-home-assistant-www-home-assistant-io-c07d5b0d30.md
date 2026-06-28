# pyLoad - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pyload
- Final URL: https://www.home-assistant.io/integrations/pyload
- Canonical URL: https://www.home-assistant.io/integrations/pyload/
- Fetched at: 2026-06-28T03:10:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate pyLoad download manager with Home Assistant.

## Extracted Text

On this page
About pyLoad
How you can use this integration
Prerequisites
Configuration
Configuration parameters
Sensors
Buttons
Switches
Automations
Pause downloads when disk space is low
Halt pyLoad downloads when watching Netflix
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The pyLoad integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables monitoring your downloads directly in Home Assistant. This integration provides various sensors to keep track of your download activities and allows creating automations based on the sensor information, alongside button and switch controls for performing specific tasks such as aborting downloads and managing file restarts.
pyLoad is an open-source download manager designed for always-on devices like home servers, NAS systems, and routers. It supports various file hosts, container formats, and web standards, enabling fully automated, unattended downloads. With its web interface, pyLoad allows for easy remote management from any device.
The pyLoad integration allows you to monitor and control your downloads directly from Home Assistant. Here are some ways you can use it:
Track active downloads – Send a notification when all downloads are complete or if the queue is empty.
Free space alerts – Set up an automation to alert you when disk space is low, ensuring downloads don’t fail due to storage issues.
Pause downloads – Automatically pause downloads when streaming or gaming to avoid bandwidth congestion, then resume them later.
To set up the pyLoad integration, you must have a running pyLoad instance on your home server, NAS, or any other device. An always-on device is recommended. Ensure that pyLoad’s web interface is accessible for Home Assistant.
If you haven’t set up pyLoad yet, an easy way to get it up and running is by installing the pyLoad-ng app for Home Assistant .
During the setup process in Home Assistant, you will need:
pyLoad account credentials – A valid username and password to authenticate with pyLoad.
The full URL of your pyLoad web interface, including the protocol (HTTP or HTTPS), hostname or IP address, port (pyLoad uses 8000 by default), and any path prefix if applicable.
Note
The account used for integration must either be an admin account or one with at least the following permissions: DELETE , STATUS , LIST , and MODIFY . You can set up and manage users and permissions under Settings -> Users in the pyLoad web interface.
To add the pyLoad service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select pyLoad .
Follow the instructions on screen to complete the setup.
URL
The full URL of the pyLoad web interface, including the protocol (HTTP or HTTPS), hostname or IP address, port, and any path prefix if applicable. Example: https://example.com:8000/path
Verify SSL certificate
If checked, the SSL certificate will be validated to ensure a secure connection.
API key
The API key to authenticato with the pyLoad API.
Username [Deprecated]
The username used to access the pyLoad instance. No longer supported with pyLoad 0.5.0b3.dev97 or later.
Password [Deprecated]
The password associated with the pyLoad account. No longer supported with pyLoad 0.5.0b3.dev97 or later.
Speed : Monitors the current download speed.
Active downloads : Indicates the number of files pyLoad is actively downloading
Downloads in queue : Shows the number of downloads currently in the queue.
Finished downloads : Indicates the number of completed downloads.
Free space : Shows the available disk space in the download directory.
Abort all running downloads : Aborts all currently running downloads.
Delete finished files/packages : Deletes all finished files and packages.
Restart all failed files/packages : Restarts all failed downloads.
Restart pyLoad core : Restarts the pyLoad core.
Pause/Resume Queue : Pauses or resumes the download queue. When paused, active downloads will continue, but new downloads in the queue will not start.
Auto-reconnect : If configured, enables pyLoad to automatically reconnect the internet connection.
Get started with these example automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] .
This automation will pause new downloads when your available disk space falls below 5 GB.
Example YAML configuration
alias : " Monitor pyLoad download queue" description : " Pause new downloads when the disk space is low." triggers : - trigger : numeric_state entity_id : sensor.pyload_free_space below : 5000000000 # Trigger when free space drops below 5 GB (in bytes) actions : - action : switch.turn_off target : entity_id : switch.pyload_pause_resume_queue - action : notify.persistent_notification data : message : " Free space is low, pausing pyLoad queue." mode : single
This automation halts all active pyLoad downloads when watching Netflix on your media player.
alias : " Halt pyLoad downloads when watching Netflix" description : " Halt all pyLoad downloads when Netflix streaming starts on the media player." triggers : - trigger : state entity_id : media_player.android_tv to : playing conditions : - condition : state entity_id : media_player.android_tv attribute : app_id state : com.netflix.ninja actions : - action : button.press target : entity_id : button.pyload_abort_all_running_downloads - action : notify.persistent_notification data : message : " pyLoad downloads have been halted because Netflix streaming started." mode : single
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] your pyLoad instance every 20 seconds. If you prefer a different update frequency, you can define a custom polling interval — see Defining a custom polling interval for details.
Paused downloads : When the download queue is paused, active downloads will continue, but new downloads in the queue will not start until the queue is resumed.
Halt all downloads : To completely halt downloading, use the Abort all running downloads action. The Restart failed files/packages action will also resume any aborted downloads.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The pyLoad service was introduced in Home Assistant 0.58, and it's used by
20 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Downloading
Back to top
