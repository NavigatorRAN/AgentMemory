# Backup - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/backup
- Final URL: https://www.home-assistant.io/integrations/backup
- Canonical URL: https://www.home-assistant.io/integrations/backup/
- Fetched at: 2026-06-28T02:30:39Z
- Content type: text/html; charset=UTF-8

## Description

Create and restore backups of your Home Assistant installation.

## Extracted Text

On this page
List of actions
Restoring a backup
Event entity
Usage examples
Sensors
Backup manager state
Next scheduled automatic backup
Last attempted automatic backup
Last successful automatic backup
Related topics
The Backup integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] creates and restores backups across all installation types .
To learn how to create and restore a backup, refer to the backup section under common tasks .
You no longer need to create your own automation to make backups. You can set up an automatic backup from the UI instead. If you do want to trigger a backup yourself, the integration provides actions for it.
The Backup integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Create backup ( backup.create )
Creates a basic local backup of your Home Assistant instance.
Create automatic backup ( backup.create_automatic )
Creates a backup using your configured automatic backup settings.
For an overview of every action across all integrations, see the actions reference .
To restore a backup, follow the steps described in Restoring a backup .
The Backup integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides an Event entity Events are signals that are emitted when something happens, for example, when a user presses a physical button like a doorbell or when a button on a remote control is pressed. [Learn more] that represents the state of the last automatic backup ( completed , in progress , or failed ). It also provides several event attributes you can use in automations.
Attribute Description event_type The translated state of the last automatic backup task ( possible states: completed, in progress, failed ). backup_stage The current automatic backup stage ( is None when event_type is not in progress ). failed_reason The reason for a failed automatic backup ( is None when event_type is completed or in progress ).
Send a notification to the mobile app when an automatic backup fails:
alias : " Backup failed" triggers : - trigger : state entity_id : - event.backup_automatic_backup conditions : - condition : state entity_id : event.backup_automatic_backup attribute : event_type state : failed actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Automatic backup failed" message : >- The last automatic backup failed due to {{ state_attr('event.backup_automatic_backup', 'failed_reason') }}
The Backup integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides several sensors.
The current state of the backup system. Possible states are:
Idle
Creating a backup
Receiving a backup
The timestamp of the next scheduled automatic backup.
The timestamp of the last attempted automatic backup.
The timestamp of the last successful automatic backup.
Backups
Backup locations
Recover from backup during onboarding
Backup emergency kit
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Backup service was introduced in Home Assistant 2022.4, and it's used by
93.6% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Event
Other
Sensor
Back to top
