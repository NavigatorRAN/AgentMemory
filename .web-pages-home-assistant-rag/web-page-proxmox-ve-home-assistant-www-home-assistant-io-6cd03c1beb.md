---
source_url: "https://www.home-assistant.io/integrations/proxmoxve"
final_url: "https://www.home-assistant.io/integrations/proxmoxve"
canonical_url: "https://www.home-assistant.io/integrations/proxmoxve/"
source_handle: "web:www-home-assistant-io:6cd03c1bebc8"
source_section: "integrations-proxmoxve"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cecdff40e8a090277a78aecf31b72943b70f6c757e60605916a55834858a0a4f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Proxmox VE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/proxmoxve
- Final URL: https://www.home-assistant.io/integrations/proxmoxve
- Canonical URL: https://www.home-assistant.io/integrations/proxmoxve/
- Fetched at: 2026-06-28T03:09:31Z
- Content type: text/html; charset=UTF-8

## Description

Access your ProxmoxVE instance in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Proxmox permissions
Choose the right role
Create a Home Assistant group
Add Group Permissions to all Assets
Create a user for Home Assistant
API tokens
Entities
Sensor
Binary sensor
Button
Data updates
Examples
Alert for offline VM
Known limitations
Troubleshooting
Buttons not working
Diagnostic data
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Proxmox VE is an open-source server virtualization environment. This integration lets you monitor your Proxmox VE nodes, virtual machines, and containers in Home Assistant, and exposes control actions (if your Proxmox permissions allow it).
Important
To see entities in Home Assistant, you need at least one node with at least one virtual machine or container in Proxmox VE.
Before you set up the integration, make sure you have created a Proxmox VE user with the right permissions. See Proxmox permissions .
To add the Proxmox VE service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Proxmox VE .
Follow the instructions on screen to complete the setup.
Authentication Method
Authentication source of Proxmox. Default is PAM . For a dedicated Home Assistant account, we recommend using the built-in Proxmox VE realm and selecting PVE (see Proxmox permissions ).
Host
The hostname or IP address of your Proxmox VE server. Example: pve.mydomain.local or 10.20.30.40 .
Port
Port to connect to Proxmox. Default is 8006 .
Username
Configured user to authenticate. Example: hass .
Verify SSL certificate
Enable SSL certificate verification for secure connections.
API token
Enable to use an API token or leave disabled to authenticate with a password.
Password
When using password authentication: Password associated with the username.
Token ID
When using API tokens: The name given to the API token during creation.
Token Secret
When using API tokens: The secret generated for the API token.
Realm
Only required when you choose the Other option for the Authentication Method field: Enter the realm name as defined in Proxmox.
To use Proxmox VE with Home Assistant, start by creating a dedicated user in Proxmox and granting it only the permissions Home Assistant needs. The paragraphs below will guide you through the Proxmox configuration. First, decide which authentication realm to use. If Home Assistant shows Authentication Method during setup, choose the matching realm.
You can use any realm as long as you have valid credentials, like a username and password or an API token:
PAM : Reuse an existing Linux user on the Proxmox node.
PVE : Create a Proxmox-only user (recommended).
Other : LDAP, AD, OpenID Connect, or a custom realm. If you choose Other , you must enter the realm name manually during setup. See the Authentication Realms section in the Proxmox User Management documentation for details.
When using password authentication, Home Assistant will use the format username@realm. In the UI, you typically enter only the username portion.
For security, create a dedicated Proxmox VE user for Home Assistant and grant only the minimum required permissions. We recommend avoiding the root account.
The minimum required permissions depend on what you want to do:
Monitor only (sensors and binary sensors): The Auditor role ( PVEAuditor ) is typically sufficient.
Monitor and control (button entities like start, stop, reboot): You will need a role that allows those actions, such as User ( PVEVMUser ) or another custom role that includes the required privileges.
If you are not sure which privileges you need for control in your Proxmox VE setup, start with PVEVMUser , confirm everything works, and then tighten the permissions by switching to a custom role. If you want full but responsible control start with PVEVMAdmin .
Before creating the user, you need to create a group for the user.
Privileges can be either applied to Groups or Roles.
Group instructions
Select Datacenter .
Open Permissions and select Groups .
Select the Create button above all the existing groups.
Name the new group (for example, HomeAssistant ).
Confirm Create .
Assign the role you chose to the group at the root path ( / ) so it applies to all nodes, VMs, and containers.
Permissions instructions
Select Permissions .
Open Add and select Group Permission .
For Path , select / .
For Group , select your Home Assistant group ( HomeAssistant ).
For Role , select the role you want to use, like PVEAuditor (monitoring only) or PVEVMUser (monitoring plus basic actions).
Make sure Propagate is checked.
Using the PVE realm helps limit the account to API access, instead of Linux system authentication and remote (SSH) command line access.
If you plan to use the PVE realm, make sure you select it during user creation.
User instructions
Open Permissions and select Users .
Select Add .
Enter a username (for example, hass ). You don’t need to add the realm, just the username.
Set the realm to Proxmox VE authentication server for PVE (or Linux PAM standard authentication for PAM ).
Enter a secure password (it can be complex as you will only need to copy/paste it into your Home Assistant configuration).
Select the group just created earlier ( HomeAssistant ) to grant access to Proxmox.
Ensure Enabled is checked and Expire is set to “never” (for example, leave it blank).
Confirm Add .
Optional: You can authenticate using an API token instead of a password. This is recommended because it gives you a separate, revocable credential for Home Assistant, and avoids storing your Proxmox password in Home Assistant. To limit the token to only the permissions Home Assistant needs, make sure you enable privilege separation and assign token-specific permissions.
API token instructions
To create a token:
Open Permissions and select API tokens .
Select the User the token will belong to.
Enter a Token ID (for example hass ). This is the value you will enter as Token ID during configuration.
Choose whether to enable Privilege Separation .
Checked: you can assign specific permissions to the token.
Unchecked: the token inherits all permissions of the user.
(Optional) Set an Expire date. When the token expires, you will need to re-authenticate.
Copy the Secret shown in the dialog. It will be displayed only once, so either use it while configuring or store it safely.
Close the dialog when ready.
CPU : Percentage of CPU usage.
Max CPU : Maximum amount of CPU on the node/VM/LXC.
Disk : Disk usage of the node/VM/LXC.
Last backup & Backup duration : Time and duration of the last backup on the node. Returns unknown if no backups exist.
Max disk : Maximum amount of available disk space.
Memory & Memory percentage : The amount of memory in use, and the percentage of memory in use, on the node/VM/LXC.
Max memory : Maximum amount of memory on the node/VM/LXC.
Network input : Amount of incoming network traffic since starting the VM/LXC.
Network output : Amount of outgoing network traffic since starting the VM/LXC.
Uptime : Time since the node/VM/LXC started.
Backup status : for the node. This will be on if the last backup was successful or off for any other state.
Status : for each VM/LXC. This will be on if the state is running or off for any other state.
Create snapshot : Creates a snapshot of a VM/LXC.
Start : Starts a node/VM/LXC.
Start all : Starts all VMs and LXCs known on a node.
Stop : Stops a node/VM/LXC.
Stop all : Stops all VMs and LXCs known on a node.
Restart : Restarts a VM/LXC.
Reboot : Reboots a node.
Shutdown : Shuts a node/VM down.
Hibernate : Puts a VM in hibernation; only available to VMs.
Reset : Resets a VM; only available to VMs.
Note
Reboot and Shutdown will attempt to perform a graceful action (if you have the guest agent installed). On a node this will attempt the graceful shutdown of every VM/LXC.
Restart and Stop / Stop all will stop a running system immediately. In other words, it is like pulling the power plug of a running computer.
Data is polled Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] from devices every 60 seconds.
This example automation will alert you if a critical VM is offline beyond a reasonable time.
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Proxmox Database VM Offline Alert"
triggers:
- trigger: state
entity_id: binary_sensor.databaseserver_status
from: "on"
to: "off"
for:
minutes: 15
actions:
- action: notify.send_message
metadata: {}
data:
message: "The Database Server VM has been offline for over 15 minutes."
target:
entity_id: notify.notifier
Unfortunately not all storage types and data are exposed fully via the ProxmoxVE API.
If you want to use the button entities to perform actions on your node(s), additional privileges may be required:
For actions related to power, such as start, stop, or reboot, the Proxmox VE user must have the power-management privilege VM.PowerMgmt , or role PVEVMUser .
To create snapshots, the privilege VM.Snapshot is required, or role PVEVMAdmin .
If monitoring works (for example, sensors provide relevant information) but button presses fail, assign a more permissive role or create a custom role and try again.
If you need to create an issue to report a bug or want to inspect diagnostic data, use the following steps to retrieve diagnostics:
Go to Settings > Devices & services , and select your integration and device.
On the integration entry, select the .
Then, select Download diagnostics and a JSON file will be downloaded.
You can inspect the downloaded file or, when requested, upload it to your issue report.
This integration follows standard integration removal. No extra steps are required within Home Assistant. Remember to clean up your Proxmox permissions.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Proxmox VE service was introduced in Home Assistant 0.103, and it's used by
1.1% of the active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Corbeno
@erwindouna
@CoMPaTech
Categories
Back to top
