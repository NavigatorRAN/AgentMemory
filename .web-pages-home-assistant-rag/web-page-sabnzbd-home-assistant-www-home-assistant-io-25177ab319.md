# SABnzbd - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sabnzbd
- Final URL: https://www.home-assistant.io/integrations/sabnzbd
- Canonical URL: https://www.home-assistant.io/integrations/sabnzbd/
- Fetched at: 2026-06-28T03:13:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SABnzbd with Home Assistant.

## Extracted Text

On this page
Use cases
Prerequisites
Configuration
Supported functionality
Binary sensors
Buttons
Sensors
Numbers
Examples
Basic download monitoring automation
Disk space warning
Bandwidth management during streaming
Smart scheduling with speed limits
Dashboard card example
Data updates
Troubleshooting
SABnzbd not found or unreachable
SABnzbd app-specific issues
Removing the integration
To remove an integration instance from Home Assistant
The SABnzbd integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control your downloads with SABnzbd from within Home Assistant and set up automations based on download status and activity.
SABnzbd is a popular newsgroup binary downloader that automates the downloading, verification, repairing, and extraction of files from Usenet. With this integration, you can create smart home automations that respond to your download activity, monitor disk space, and control your downloads remotely.
Here are some practical ways you can use the SABnzbd integration:
Download completion notifications: Get notified on your phone or smart display when downloads finish.
Bandwidth management: Automatically pause downloads during peak internet usage hours or when streaming services are active.
Disk space monitoring: Set up alerts when your download drive is running low on space.
Smart scheduling: Automatically start downloads during off-peak hours when internet is faster or cheaper.
Home theater integration: Pause downloads when movie night starts to ensure smooth streaming.
Security monitoring: Get alerted if SABnzbd goes offline or becomes unreachable.
You need to grab your API key from your SABnzbd instance to configure this integration:
Navigate to your SABnzbd web interface.
Select Config * , then General .
Copy your API key under Security .
To add the SABnzbd service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SABnzbd .
Follow the instructions on screen to complete the setup.
URL
The full URL, including port, of your SABnzbd server. Example: http://localhost:8080 or http://a02368d7-sabnzbd:8080 , if you are using the SABnzbd app for Home Assistant.
API key
The API key of your SABnzbd server. You can find this in the SABnzbd web interface under Config (top right) > General > Security .
Warnings : Indicates if SABnzbd has any warnings (for example, disk space low, download errors)
Pause : Pause all downloads
Resume : Resume paused downloads
This integration creates the following sensors to monitor your SABnzbd instance:
Status : The current status of SABnzbd (such as Idle, Downloading, or Paused)
Speed : The current download speed in MB/s
Queue : The total size of the download queue in GB
Left : The remaining size of the download queue in GB
Disk : The total disk size at SABnzbd’s download location in GB
Disk free : The available disk space at SABnzbd’s download location in GB
Queue count : The number of items in the download queue
Total : Total GB downloaded since SABnzbd was last restarted
Speed limit : Set the download speed limit (as a percentage of your configured maximum speed).
This automation sends a notification when a download completes:
- alias : " SABnzbd download complete" triggers : - trigger : state entity_id : sensor.sabnzbd_status to : " Idle" from : " Downloading" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Download Complete" message : " SABnzbd has finished downloading and extracting files"
Get notified when your download drive is running low on space:
- alias : " SABnzbd low disk space warning" triggers : - trigger : numeric_state entity_id : sensor.sabnzbd_disk_free below : 10 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Low Disk Space" message : " Download drive has less than {{ states('sensor.sabnzbd_disk_free') }} GB free" data : priority : high
Automatically pause downloads when your media players are active:
- alias : " Pause downloads during movie time" triggers : - trigger : state entity_id : media_player.living_room_tv to : " playing" conditions : - condition : state entity_id : sensor.sabnzbd_status state : " Downloading" actions : - action : button.press target : entity_id : button.sabnzbd_pause - action : notify.send_message target : entity_id : notify.my_device data : message : " Downloads paused for movie time" - alias : " Resume downloads after movie time" triggers : - trigger : state entity_id : media_player.living_room_tv from : " playing" for : " 00:05:00" conditions : - condition : state entity_id : sensor.sabnzbd_status state : " Paused" actions : - action : button.press target : entity_id : button.sabnzbd_resume
Reduce download speed during peak hours and increase it during off-peak hours:
- alias : " SABnzbd peak hours speed limit" triggers : - trigger : time at : " 18:00:00" actions : - action : number.set_value target : entity_id : number.sabnzbd_speed_limit data : value : 30 - alias : " SABnzbd off-peak full speed" triggers : - trigger : time at : " 23:00:00" actions : - action : number.set_value target : entity_id : number.sabnzbd_speed_limit data : value : 100
Create a comprehensive SABnzbd monitoring card for your dashboard:
type : entities title : SABnzbd Downloads entities : - entity : sensor.sabnzbd_status name : Status - entity : sensor.sabnzbd_speed name : Download speed - entity : sensor.sabnzbd_queue_count name : Items in queue - entity : sensor.sabnzbd_left name : Remaining - type : divider - entity : button.sabnzbd_pause name : Pause downloads - entity : button.sabnzbd_resume name : Resume downloads - type : divider - entity : sensor.sabnzbd_disk_free name : Free space - entity : number.sabnzbd_speed_limit name : Speed limit
The SABnzbd integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from your SABnzbd server every 30 seconds by default. This provides near real-time updates of download progress, queue status, and system information without putting excessive load on your SABnzbd instance.
Verify SABnzbd is running: Check that SABnzbd is running and accessible via its web interface.
Check the URL: Ensure you’re using the correct URL format including the port (typically http://localhost:8080 ).
Test API key: Verify your API key is correct by comparing it in the SABnzbd web interface.
Network connectivity: If SABnzbd is on another device, ensure Home Assistant can reach it over the network
Firewall settings: Check that your firewall allows connections to SABnzbd’s port.
Enable debug logging: Temporarily enable debug logging for the SABnzbd integration to get more detailed error messages.
If you’re using the SABnzbd app for Home Assistant (formerly known as add-on):
Use internal URL: Use http://a02368d7-sabnzbd:8080 instead of localhost .
Check app logs: Review the SABnzbd app logs for any error messages.
App configuration: Ensure the app is properly configured and started.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SABnzbd service was introduced in Home Assistant 0.7, and it's used by
1840 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shaiu
@jpbede
Categories
Downloading
Sensor
Back to top
