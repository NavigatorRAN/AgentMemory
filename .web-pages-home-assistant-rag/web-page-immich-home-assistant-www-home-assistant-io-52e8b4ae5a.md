# Immich - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/immich
- Final URL: https://www.home-assistant.io/integrations/immich
- Canonical URL: https://www.home-assistant.io/integrations/immich/
- Fetched at: 2026-06-28T02:51:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an Immich user account into Home Assistant.

## Extracted Text

On this page
Prerequisites
API key permissions
Configuration
Data fetching
Media source
Sensors
Update entity
List of actions
Troubleshooting
Known limitations
Remove the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows adding an Immich user account to Home Assistant.
You need to obtain the API key for your user account in your Immich instance.
Enable the following permissions when creating your API key. Without these permissions, the integration may not work properly. The “admin-only” permissions are only available when your API key belongs to an administrative user.
asset.download
asset.upload
asset.read
asset.view
album.read
albumAsset.create
person.read
server.about
server.statistics ( admin-only )
server.storage
server.versionCheck
tag.read
user.read
Important
Before immich server version 1.138.0 the all permission is necessary for your API key.
To add the Immich service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Immich .
Follow the instructions on screen to complete the setup.
URL
The URL of your Immich instance. ( e.g. https://immich.example.com ).
API key
API key of your user account to connect to your Immich instance.
Verify SSL certificate
Whether to verify the SSL certificate when SSL encryption is used to connect to your Immich instance.
The integration polls data every 60 seconds.
A media source is provided for your Immich albums. It shows only the assets you own or that are shared with you. If you have multiple Immich integrations in Home Assistant ( one integration for each Immich user ), only the assets for that specific user are shown. The assets are grouped by albums, people, and tags.
The following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] are created. For some of those the API key needs to have admin rights.
Entity Description Default enabled Disk size Overall size of the disk ✅ Disk available Free space on the disk ✅ Disk used Used space on the disk ❌ Disk usage Usage of the disk in percentage ❌ Photos count Count of stored photos ( admin only ) ✅ Videos count Count of stored videos ( admin only ) ✅ Disk used by photos Used disk space by photos ( admin only ) ❌ Disk used by videos Used disk space by videos ( admin only ) ❌
An update An update entity is an entity that indicates if an update is available for a device or service. [Learn more] entity is created to inform about a new available Immich server version ( requires Immich server v1.134.0 ).
The Immich integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Upload file ( immich.upload_file )
Uploads a file to your Immich instance.
For an overview of every action across all integrations, see the actions reference .
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue re-occurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
There are no known limitations.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If the API key is not used anymore, you can remove it from your Immich instance.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Immich service was introduced in Home Assistant 2025.6, and it's used by
2778 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
Categories
Multimedia
Sensor
Update
Back to top
