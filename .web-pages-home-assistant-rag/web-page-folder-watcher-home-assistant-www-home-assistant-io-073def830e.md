# Folder watcher - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/folder_watcher
- Final URL: https://www.home-assistant.io/integrations/folder_watcher
- Canonical URL: https://www.home-assistant.io/integrations/folder_watcher/
- Fetched at: 2026-06-28T02:43:44Z
- Content type: text/html; charset=UTF-8

## Description

Integration for monitoring changes within the filesystem.

## Extracted Text

On this page
Configuration
Patterns
Automations
The Folder watcher integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds Watchdog file system monitoring.
It creates event entities for these monitored event types:
closed
created
deleted
modified
moved
Configured folders must be added to allowlist_external_dirs . Note that by default folder monitoring is recursive, meaning that the contents of sub-folders are also monitored.
To add the Folder watcher integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Folder watcher .
Follow the instructions on screen to complete the setup.
Pattern matching using fnmatch can be used to limit filesystem monitoring to only files which match the configured patterns.
As example to monitor specific file, as example YAML and text-files add *.yaml and *.txt .
The attributes the event entities contain are:
event_type : matching the event_type of the filter (one of created , moved , modified , deleted , closed )
path : The full path to the file (e.g. “/hello/world.txt”)
file : The name of the file (e.g. “world.txt”)
folder : The folder path (e.g. “/hello”)
When the event_type is moved , the file details are for the source file and destination details are included:
dest_path : The full path to the moved file (e.g. “/hello/world.txt”)
dest_file : The name of the moved file (e.g. “world.txt”)
dest_folder : The folder moved path (e.g. “/hello”)
Automations can be triggered on file system events data using a template. The following automation will send a notification with the name and folder of new files added to that folder:
#Send notification for new image (including the image itself) automation : alias : " New file alert" triggers : - trigger : state entity_id : event.created actions : - action : notify.notify data : title : New image captured! message : " Created {{ trigger.to_state.attributes.file }} in {{ trigger.to_state.attributes.folder }}" data : file : " {{ trigger.to_state.attributes.file }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Folder watcher integration was introduced in Home Assistant 0.67, and it's used by
1262 active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
