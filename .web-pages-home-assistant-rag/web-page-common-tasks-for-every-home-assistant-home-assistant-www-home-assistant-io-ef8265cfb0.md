---
source_url: "https://www.home-assistant.io/common-tasks/general"
final_url: "https://www.home-assistant.io/common-tasks/general"
canonical_url: "https://www.home-assistant.io/common-tasks/general/"
source_handle: "web:www-home-assistant-io:ef8265cfb079"
source_section: "common-tasks-general"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fe766417a99e73ce0f1c15c0d82c2d525052de3755d6c0a8ee7a0803441d2188"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Common tasks for every Home Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/common-tasks/general
- Final URL: https://www.home-assistant.io/common-tasks/general
- Canonical URL: https://www.home-assistant.io/common-tasks/general/
- Fetched at: 2026-06-28T02:18:19Z
- Content type: text/html; charset=UTF-8

## Description

Tasks that work the same on every Home Assistant installation: managing users, creating backups, configuring access tokens, and similar housekeeping.

## Extracted Text

On this page
Backups
Preparing for a backup
Setting up an automatic backup process
Defining backup locations
Creating a backup automation using the backup action
Creating a manual backup
Downloading your local backups
Downloading a backup from Home Assistant Cloud
Deleting obsolete backups
Restoring a backup
Enabling or disabling entities
To enable or disable a single entity
To enable or disable multiple entities
Related topics
Defining a custom polling interval
What is data polling?
Why use an automation instead of changing the integration’s polling configuration?
Removing an integration instance
To remove an integration instance from Home Assistant
This section provides tasks that do not depend on a specific Home Assistant installation type or a specific integration. They may be referenced in other procedures.
It is important to regularly back up your Home Assistant setup. You may have spent many hours configuring your system and creating automations. Keep your configurations safe so that you can restore a system or migrate your Home Assistant to new hardware.
Backups are encrypted and stored in a compressed archive file (.tar) and by default, stored locally in the /backup directory.
A full backup includes the following directories:
config
share
addons (only manually installed or created apps, not those installed from the store)
ssl
media
A partial backup consists of any number of the above default directories and installed apps.
Before creating a backup, check if you can reduce the size of the backup. This is especially important if you want to use the backup to migrate the system to new hardware, for example from a Raspberry Pi Compute Module 4 to a Raspberry Pi Compute Module 5.
Check if your configuration directory contains a large database file:
Go to Settings > System > Repairs .
From the three dots menu, select System information and under the Recorder section, look for the Estimated Database Size (MiB) .
By default, the data is kept for 10 days. If you have modified that to a longer period, check the recorder integration page for options to keep your database data down to a size that won’t cause issues.
Note the keep days, purge interval, and include/exclude options.
To check how much space you’ve used in total, go to Settings > System > Repairs .
From the three dots menu, select System information , and check under Home Assistant Supervisor > Disk used .
If you have apps installed that you no longer use, uninstall those apps. Some apps require quite a bit of space.
If you want to store the backup on your network storage instead of just locally on your system, follow the steps on adding a new network storage and select the Backup option.
The automatic backup process creates a backup on a predefined schedule and also deletes old, redundant backups.
Go to Settings > System > Backups .
Under Set up backups , select Set up backups .
Download the emergency kit and store it somewhere safe.
You need it to restore encrypted backups.
To learn more about backup encryption, refer to the documentation on the backup emergency kit .
Define the backup schedule.
It is recommended to back up Daily , but you can also choose to back up on specific days.
Define the time:
System optimal sets a time in a predefined time window as shown in the UI.
Custom lets you pick the time when you want the backup to start.
Make sure you pick a time when all your backup locations are up and running and available. Otherwise, the backup will fail for locations which are not available.
Define if you want to back up automatically before updating.
This sets a default. But you can change this setting each time before updating.
For large installations, backups might take a while.
Your update might start later than you expected.
Define how many backups you want to keep.
Older backups will be automatically deleted.
For example: if you back up daily, and select 7 backups, then the backup from 8 days ago and older will be deleted.
Define the data you want to back up.
It is recommended to disable media and the shared folder to reduce the size of the backup.
A large backup also takes longer to restore.
Some apps may also be quite large.
Define the location for backups .
You might need a backup in case your system has crashed. If you only store backups on the device itself, you won’t be able to access them easily. It is recommended to keep a copy on another system (outside of Home Assistant) and ideally also one off-site.
Note
You will find an overview of integrations which provide a backup location here .
About the backup storage on Home Assistant Cloud
If you have Home Assistant Cloud, you can store a backup of maximum 5 GB on Home Assistant Cloud. This cloud storage space is available for all existing and new Home Assistant Cloud subscribers without additional cost. It stores one backup file: the backup that was last saved to Home Assistant Cloud. These backups are always encrypted. To restore encrypted backups, you need the encryption key stored in the backup emergency kit .
To define the backup location for automatic backups
Go to Settings > System > Backups and under Automatic backups , select Configure automatic backups .
Under Locations , use the toggle to enable all the backup locations you want to use.
If you don’t see Home Assistant Cloud in the list, you are not logged in .
If you want to back up to your NAS (such as Synology ) or a cloud provider (such as Google Drive or Microsoft OneDrive ), check their integration documentation for specific instructions on setting up a Home Assistant backup.
If you don’t see a network storage, you haven’t added one. Follow the steps on adding a new network storage and select the Backup option.
For each enabled location, select the cog to enable/disable encryption.
Info : The backup stored on Home Assistant Cloud is always encrypted.
If the backup automation settings provided in the UI do not match your use case, you can manually configure your own backup automation using the backup.create_automatic action.
Using the backup.create_automatic action in your own automation allows you to create automated backups on any schedule you like, or even add conditions and actions around it. For example, you could make an automation that triggers on a calendar, turns on your NAS, waits until it is online, and then triggers a backup.
This creates a backup instantly. You can create a manual backup at any time, irrespective of any automatic backups you may have defined.
In the lower-right corner, select Backup now and select Manual backup .
It is recommended to disable media and the share folder to reduce the size of the backup.
Provide a name for the backup.
Choose the backup locations.
To learn more about the locations, refer to the section on defining the backup location .
Download the backup emergency kit and store it somewhere safe. Make sure you take note of the backup name it belongs to.
To start the backup process, select Create backup .
When downloading the backup from the Home Assistant backup page, it is decrypted on the fly so that you can view the data using your favorite archive tool. This is done for all backup locations and also when you download from Home Assistant Cloud.
There are multiple ways to download your local backup from your Home Assistant instance and store it on another device:
Option 1 : Download from the backup page:
Under Settings > System > Backups , select Show all backups .
To select multiple backups, select the button.
Select the three dots menu and select Download backup .
Result: The selected backup is stored in the Downloads folder of your computer.
If a backup is stored on multiple locations, you can select where you download it from:
Select the backup, and under Locations , select the three dots and select Download from this location .
Option 2 : Copy backups from the backups folder:
If you haven’t already done so, configure access to files on Home Assistant , using one of the methods listed there.
For example, use the samba app .
In your file explorer, access Home Assistant, open the backup folder and copy the file to your computer.
If you were logged in to Home Assistant Cloud and had Cloud backup enabled when creating a backup, your last backup is stored on Home Assistant Cloud.
There are two ways to download the backup from Home Assistant Cloud:
Option 1 : From the backups page
Go to Settings > System > Backups and select Show all backups .
Select the backup from the list.
Under Locations , select the three dots and select Download from this location .
Option 2 : From your Home Assistant Cloud account
Log in to your Home Assistant Cloud account .
Under Stored files , you can see the latest available backup file. Select the Download button.
If you defined an automatic backup and backup purge schedule, old backups are deleted automatically. However, you might still have some old backups around that you want to delete.
To delete old backups, follow these steps:
In Home Assistant, under Settings > System > Backups , select Show all backups .
To delete one backup : from the list, select the backup of interest.
Select the three dots menu and select Delete .
To delete multiple backups : select the button.
From the list of backups, select all the ones you want to delete and select Delete selected .
Consider keeping at least one recent backup for recovery purposes.
To delete a backup that is stored on Home Assistant Cloud , you have 2 options:
Option 1 : Trigger backup deletion from within Home Assistant
Follow steps 1 and 2 from above.
Even though you select Delete in Home Assistant, it will be deleted from Home Assistant Cloud storage.
Option 2 : Delete the backup from the Nabu Casa account page.
Log in to your Nabu Casa account .
Under Backups , delete the backup.
There are two ways to use a backup:
On your current system to recover your settings.
During onboarding, to migrate your setup to a new device or to a device on which you performed a factory reset.
Estimated duration
The time it takes to restore a backup depends on your installation. Home Assistant Core and all apps are being reinstalled. For a larger installation, this process can take about 45 minutes.
Restoring a backup during onboarding
You can use a backup during the onboarding process to restore your configuration.
Migration : This procedure also works if you want to migrate from one device to another. In that case, use the backup of the old device on the new device. The target device can be a different device type. For example, you can migrate from a Raspberry Pi to another device.
Prerequisites
This procedure assumes you have already completed the installation procedure on your target device and are now viewing the welcome screen as part of the onboarding .
The login credentials of the device from which you made the backup.
The backup emergency kit that contains the key needed to decrypt the backup.
Required storage capacity : If you migrate the installation to a new device, make sure the new device has more storage capacity than the existing device.
Before migrating, on the old system, check how much storage you used.
Go to Settings > System > Repairs > … > System Information , and under Home Assistant Supervisor , look at the Disk used value.
The target device must have more free space than the source device.
If your target device is a Home Assistant Yellow, note that it is the size of the eMMC that is relevant.
The restore process mainly uses the eMMC, not the NVMe.
The size of the backup file is no indication of the size of your installation. To know the size of your installation, you need to check the Disk used value mentioned above.
If you are migrating to a new device:
You do not need to transfer the backup to a USB or SD card to bring it to your device.
You will be able to upload the backup file from the device you are accessing the onboarding from.
To restore a backup during onboarding
If you are migrating to a new device and you had controllers or radios connected (such as a Z-Wave stick or a Connect ZBT-2):
make sure to plug them into the new device.
You can either restore a backup from your local machine or a backup stored on Home Assistant Cloud:
Option 1 : restoring from a local backup.
On the welcome screen, select Upload backup .
Select Select backup file .
The file explorer opens on the device on which you are viewing the Home Assistant User interface.
You can access any connected network drive from there.
Select the backup file.
Option 2 : restoring from a Home Assistant Cloud backup.
On the welcome screen, select Home Assistant Cloud .
Sign in to Home Assistant Cloud.
In the dialog, select all the parts you want to restore.
Your current system will be overwritten with the parts that you choose to restore.
If you want to restore the complete configuration with all directories and apps, select everything.
Enter the encryption key stored in the backup emergency kit .
To start the process, select Restore backup .
The restore may take a while, depending on the amount of data.
Don’t refresh the page. Just wait.
If you refresh the page, you will see a “Not found” message. This is because the system is shutdown, wiped, and reinstalled from the backup. During that time, it won’t be reachable.
If your previous installation had certificates enabled directly for the http integration , when the restore is complete, it will no longer respond to http:// requests. In this case, use https:// (added s ) instead.
On the login screen, enter the credentials of the system from which you took the backup.
The login password and username must match the ones you used at the time the backup was taken.
Your dashboard should show all the elements as they were when you created the backup.
If some devices are shown as unavailable, you may need to wake the battery-powered devices.
If you had network storage connected on the previous system, you may need to reconnect those.
If you had Zigbee devices, and you migrated to a new device with its own Zigbee radio built-in:
Because this is now a different Zigbee radio, you need to migrate Zigbee .
To restore a backup on your current system
From the list of backups, select the backup from which you want to restore.
Select what to restore:
If you only want to restore specific elements, only select the folders and apps you want to restore.
Select Restore .
This may take a while, depending on how much there is to compress or decompress.
Once the restore is complete, Home Assistant restarts to apply the new settings.
You will lose the connection to the UI and it will return once the restart is completed.
On the login screen, enter the password and username as they were at the time the backup was taken.
Some entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] are disabled by default. Whether a particular entity of a device is disable or enabled by default, depends on the integration. Diagnostic entities for example are often disabled by default so that they don’t clutter Home Assistant. For example, the RSSI entity (representing the RF signal strength) provided by the ZHA integration for each Zigbee device is disabled by default.
There are different ways to enable entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . You can enable a single entity in the entity settings, or you can enable multiple entities at once from the list of entities.
Go to Settings > Devices & services and select your integration card.
Select the device.
To see all the entities, you may need to expand the entity not shown section.
Select the entity of interest, select the cogwheel , then select the toggle for Enable .
Select Update .
Confirm the notification stating that it will take about 30 seconds for the entity to become enabled. Select OK .
In Home Assistant, open the table of interest.
To enable or disable entities, go to Settings > Devices & services > Entities .
To enable or disable automations, go to Settings > Automations & Scenes .
Enable multiselect and select all the entities you want to enable or disable.
In the top right corner, select the three dots menu, then select Enable or Disable .
Customizing entities
Grouping your assets
Working with tables
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic.
Creating an automation for polling gives you more flexibility on when to poll:
Not all integrations have a configurable polling interval. The homeassistant.update_entity service, on the other hand, works with most of the integrations; no code changes are required.
An automation allows you to poll whenever you want. For example, if you have a rate-limited solar panel provider with a maximum number of requests per day, you may want to lower/stop the polling at night but poll more frequently during the day.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
If you no longer want to use a device or service in Home Assistant, you can remove the integration instance including the device or service with all its entities.
The following steps describe the general steps needed to remove an integration instance. Depending on the integration, additional steps can be needed, such as resetting the device or to delete credentials. Refer to the integration documentation to see if additional steps are needed.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Installation independent
Home Assistant Operating System
Home Assistant Container
General troubleshooting
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
