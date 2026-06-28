# Downloader - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/downloader
- Final URL: https://www.home-assistant.io/integrations/downloader
- Canonical URL: https://www.home-assistant.io/integrations/downloader/
- Fetched at: 2026-06-28T02:38:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the downloader integration with Home Assistant.

## Extracted Text

On this page
Configuration
Use the action
Download status events
The Downloader integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides an action to download files. It will raise an error and not continue to set itself up when the download directory does not exist. The directory needs to be writable for the user who is running Home Assistant.
To add the Downloader service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Downloader .
Follow the instructions on screen to complete the setup.
If the path is not absolute, it’s assumed to be relative to the Home Assistant configuration directory (for example, /config/downloads ). So if you have a folder called /config/my_download_folder , when prompted to Select a location to get to store downloads , enter my_download_folder . Home Assistant checks if the directory exists.
Go to the “Developer tools”, then to “Actions”, and choose downloader.download_file from the list of available actions. Fill the “data” field as shown in the example below and select “Perform action”.
{ "url" : "http://domain.tld/path/to/file" }
This will download the file from the given URL.
Data attribute Optional Description url no The URL of the file to download. subdir yes Download into subdirectory of download_dir filename yes Determine the filename. overwrite yes Whether to overwrite the file or not, defaults to false . headers yes Dictionary of custom HTTP headers to add to the request.
When a download finished successfully, Home Assistant will emit a downloader_download_completed event to the event bus which you can use to write automations against.
In case download failed another event downloader_download_failed is emitted to indicate that the download did not complete successfully.
Along with the event the following payload parameters are available:
Parameter Description url The url that was requested. filename The name of the file that was being downloaded. Example automation:
- alias : " Download Failed Notification" triggers : - trigger : event event_type : downloader_download_failed actions : - action : persistent_notification.create data : message : " download failed" title : " Download Failed"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Downloader service was introduced in Home Assistant pre 0.7, and it's used by
2787 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@erwindouna
Categories
Downloading
Back to top
