# WebDAV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/webdav
- Final URL: https://www.home-assistant.io/integrations/webdav
- Canonical URL: https://www.home-assistant.io/integrations/webdav/
- Fetched at: 2026-06-28T03:28:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up a WebDAV location to be used with backups.

## Extracted Text

On this page
Installation
Configuration
Common WebDAV URLs
Removing the integration
To remove an integration instance from Home Assistant
Known issues / limitations
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use a WebDAV compatible location for Home Assistant Backups .
To add the WebDAV service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WebDAV .
Follow the instructions on screen to complete the setup.
URL
URL of the WebDAV server. Common examples are provided below.
Username
Username for the WebDAV server.
Password
Password for the WebDAV server.
Backup path
Path to the folder where the backups should be stored. The path is relative to the root of the WebDAV server.
Verify SSL
Verify the SSL certificate of the WebDAV server.
Nextcloud : https://<your-nextcloud-domain>/remote.php/webdav/ alternatively this can be found in the interface of your Nextcloud instance.
To do this, open the file overview and click on ‘Settings’ in the left-hand column.
Owncloud : https://<your-owncloud-domain>/remote.php/webdav/
Hetzner Storage Box : https://<username>.your-storagebox.de
Strato HiDrive : https://webdav.hidrive.strato.com
Seafile : https://<your-seafile-domain>/seafdav if you are running your Seafile behind a reverse proxy, make sure to add the relevant port, by default WebDAV serves at port 8080.
Beeline Cloud : https://webdav.cloudbeeline.ru – free 10GB (forever), to enable WebDAV – navigate to Profile → Security and toggle the setting (screenshots and detailed explanation here ).
Mail.ru Cloud : https://webdav.cloud.mail.ru/ – free 8GB (forever).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you remove the integration, the backup folder is not automatically deleted. You have to manually delete it.
Due to the nature of WebDAV, it is required to have a fairly high file upload limit on the server.
If you experience issues with the backup, please check the server configuration or with your WebDAV service provider.
Following WebDAV services are known to have issues with Home Assistant backups:
Yandex Disk is not supported, as the speed is artificially slowed down when using WebDAV.
pCloud WebDAV implementation proved to be unstable and is not recommended for backups.
Backups
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WebDAV service was introduced in Home Assistant 2025.3, and it's used by
2218 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
Categories
Backup
Back to top
