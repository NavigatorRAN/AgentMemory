# OneDrive - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/onedrive
- Final URL: https://www.home-assistant.io/integrations/onedrive
- Canonical URL: https://www.home-assistant.io/integrations/onedrive/
- Fetched at: 2026-06-28T03:05:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up OneDrive to be used with backups.

## Extracted Text

On this page
Configuration
Options
Backup folder
Backup folder is called Graph
Requested permissions by the integration
Sensors
List of actions
Automations
Send alert when drive is near storage limit
Getting application credentials
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use OneDrive for Home Assistant Backups as well as uploading generic files to your OneDrive.
Backup encryption is enabled by default and can be disabled as shown in the backup documentation .
Backups will be created in a folder called Home Assistant\backups_<id> in the App Folder of your OneDrive by default.
id is part of your Home Assistant instance’s unique id to allow backups from multiple instances to the same OneDrive account.
The integration only has access to an application specific Home Assistant folder in the App Folder and cannot access any other parts of your OneDrive.
Important
Because of an issue in Microsoft’s APIs, the application-specific folder is often called Graph instead of Home Assistant . More on that below .
To add the OneDrive service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OneDrive .
Follow the instructions on screen to complete the setup.
Client ID
Application ID of the app registration to be used with the integration. Uses Home Assistant provided by default.
Client secret
Application secret for the app registration. Uses Home Assistant provided by default.
Folder name
The name of the instance specific backup folder .
To define options for OneDrive, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of OneDrive are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Delete files permanently
By default, files are put into the Recycle Bin when deleted, where they remain available for another 30 days. If you enable this option, files will be deleted immediately when they are cleaned up by the backup system.
The backup folder is root:\Apps\[Home Assistant | Graph]\backups_{id} . This is not configurable because otherwise the integration would need permissions to write into your entire drive. You can, however, rename the application folder which is called Home Assistant or Graph in your OneDrive.
The last folder in the hierarchy ( backups_{id} ) is always a unique folder per Home Assistant instance to ensure that backups from different instances are not mixed. The name of this folder can be set during integration setup and can be changed later through reconfiguring the integration or by renaming the folder in OneDrive.
This integration uses Microsoft’s Graph API to communicate with your OneDrive. Because of an issue in that API, the application folder is often not named with the name of the application ( Home Assistant ), but Graph instead.
There is no risk of different applications mixing in that Graph folder, if you already have such a Graph folder from a different application, the next folders will just be called Graph 1 , Graph 2 and so on.
You should be able to manually rename the folder to something else, without the integration breaking.
The integration will request the following permissions on your OneDrive for the integration to work:
Files.ReadWrite.AppFolder : Grants the application permission to read and write in its own, app-specific folder inside your OneDrive
offline_access : Grants the application permission to refresh its authentication token without requiring your manual intervention
openid : Grants the application permission to read basic information, e.g. if you have a OneDrive
The integration provides the following sensors, which are updated every 5 minutes:
Total available storage : The total size of your drive (disabled by default)
Used storage : The amount of storage you have used up
Remaining storage : The amount of storage that is left in your drive
Drive state : Calculated state of your drive, based on the storage left. Possible values: Normal , Nearing limit , Critical , Exceeded
Note
A drive that is in Drive state Exceeded will be automatically frozen (meaning you can’t upload any more backups & files), until you clear up enough storage.
The OneDrive integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Delete files ( onedrive.delete )
Deletes one or more files from OneDrive.
Upload files ( onedrive.upload )
Uploads one or more files to OneDrive.
For an overview of every action across all integrations, see the actions reference .
Get started with these automation examples.
Send an alert when the drive usage is close to the storage limit and needs cleanup.
Example YAML configuration
alias : Alert when OneDrive is close to storage limit description : Send notification to phone when drive needs cleanup. triggers : - trigger : state entity_id : - sensor.my_drive_drive_state from : " normal" to : " nearing" - trigger : state entity_id : - sensor.my_drive_drive_state from : " nearing" to : " critical" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : OneDrive is almost full! message : > OneDrive has used up {{ states('sensor.my_drive_used_storage') }} of {{ states('sensor.my_drive_total_available') }}GB. Only {{ states('sensor.my_drive_remaining_storage') }}GB remaining. mode : single
This integration comes with a predefined set of application credentials through Home Assistant account linking. This means you should not need to provide credentials, but get redirected to Microsoft’s sign-in page.
Even if you use the default credentials, nobody will ever have access to your data except you, as the app does not have permission to do anything on its own. It only works with a signed-in user (it only has delegated not application permissions ).
However, if you want to use your own credentials, follow this guide to create your own client ID and secret.
Tip
You will need an Azure tenant with an active Azure subscription to create your own client credentials.
Make sure to configure the following settings on the app registration:
Supported account types : Personal Microsoft accounts only
Redirect URI : Type: Web , URL: https://my.home-assistant.io/redirect/oauth
If you set the integration up with the default credentials and switch to custom credentials later, your backup folder will change inside your OneDrive, and you will have to manually copy existing backups from the old folder to the new one.
Only personal OneDrives are supported at the moment.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Unknown error while adding the integration
Make sure that your OneDrive is not frozen. This can happen if you haven’t used it for a longer period of time, or went over your data quota.
Default credentials not available
If the integration asks you for a client ID and a client secret , that likely means you disabled part of the default_config in your Home Assistant configuration. For account linking to work you’ll need my & cloud integrations loaded.
Backups
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OneDrive service was introduced in Home Assistant 2025.2, and it's used by
2.4% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zweckj
Categories
Backup
Back to top
