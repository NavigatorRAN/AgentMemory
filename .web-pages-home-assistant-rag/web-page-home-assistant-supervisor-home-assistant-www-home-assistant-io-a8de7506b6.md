# Home Assistant Supervisor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hassio
- Final URL: https://www.home-assistant.io/integrations/hassio
- Canonical URL: https://www.home-assistant.io/integrations/hassio/
- Fetched at: 2026-06-28T02:48:02Z
- Content type: text/html; charset=UTF-8

## Description

Control Supervisor Apps and OS from Home Assistant

## Extracted Text

On this page
Sensor entities
Binary sensor entities
Switch entities
Update entities
List of actions
The Home Assistant Supervisor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control Supervisor apps and operating system from Home Assistant.
This integration is already installed if you run Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. . It
cannot be installed on Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] .
For each installed app, the following sensors are available:
Sensor Enabled by default Description Version no Current version of the app Newest Version no Latest version of the app currently available CPU Percent no The CPU Percent usage of the app Memory Percent no The Memory (RAM) Percent usage of the app
For Home Assistant OS, the following sensors are available:
Sensor Enabled by default Description Version no Current version of the Home Assistant OS Newest Version no Latest version of the Home Assistant OS currently available
For Home Assistant Core, the following sensors are available:
Sensor Enabled by default Description CPU Percent no The CPU Percent usage of the core Memory Percent no The Memory (RAM) Percent usage of the core
For Home Assistant Supervisor, the following sensors are available:
Sensor Enabled by default Description CPU Percent no The CPU Percent usage of the supervisor Memory Percent no The Memory (RAM) Percent usage of the supervisor
For Home Assistant Host, the following sensors are available:
Sensor Enabled by default Description OS Agent Version no The version of the installed OS Agent Apparmor Version no The version of apparmor Disk Free no Free space (in GB) left on the device Disk Total no Total space (in GB) on the device Disk Used no Used space (in GB) on the device
For each installed app Supervisor provides following binary sensors:
(These entities are disabled by default and must be re-enabled to appear)
Sensor Enabled by default Description Update Available no Whether there is an update available for this app (This is deprecated, use the Update entities instead.) Running no Whether the app is running or not.
For each network storage Supervisor provides following binary sensors:
Sensor Enabled by default Description Connected no Whether the network storage is connected and working properly.
For Home Assistant OS Supervisor provides following binary sensors:
Sensor Enabled by default Description Update Available no Whether there is an update available for OS
For each installed app, the following switch is available:
Switch Enabled by default Description Running no Shows whether the app is running or not, and allows you to start or stop the app depending on its current state.
For all your installed apps, Home Assistant Core, Home Assistant Supervisor, and for the Home Assistant Operating System (if you are running that), this integration will provide update entities that provide information about pending updates, and will allow you to update to them.
The Home Assistant Supervisor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Restart app ( hassio.app_restart )
Restarts a Home Assistant app.
Start app ( hassio.app_start )
Starts a Home Assistant app.
Write data to app stdin ( hassio.app_stdin )
Writes data to the standard input of a Home Assistant app.
Stop app ( hassio.app_stop )
Stops a Home Assistant app.
Create a full backup ( hassio.backup_full )
Creates a full backup.
Create a partial backup ( hassio.backup_partial )
Creates a partial backup.
Reboot the host system ( hassio.host_reboot )
Reboots the host system.
Power off the host system ( hassio.host_shutdown )
Powers off the host system.
Reload network storage mount ( hassio.mount_reload )
Reloads a network storage mount.
Restore from full backup ( hassio.restore_full )
Restores from a full backup.
Restore from partial backup ( hassio.restore_partial )
Restores from a partial backup.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Home Assistant Supervisor integration was introduced in Home Assistant 0.42, and it's used by
81.3% of the active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Backup
Binary sensor
Sensor
Switch
Update
Back to top
