---
source_url: "https://www.home-assistant.io/integrations/sftp_storage"
final_url: "https://www.home-assistant.io/integrations/sftp_storage"
canonical_url: "https://www.home-assistant.io/integrations/sftp_storage/"
source_handle: "web:www-home-assistant-io:f1e6a2d2451c"
source_section: "integrations-sftp-storage"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4d25832d1f30d901401a88cd70cf5634fe4f23acf8cb5b1b541dadaad96ad2aa"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SFTP Storage - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sftp_storage
- Final URL: https://www.home-assistant.io/integrations/sftp_storage
- Canonical URL: https://www.home-assistant.io/integrations/sftp_storage/
- Fetched at: 2026-06-28T03:15:28Z
- Content type: text/html; charset=UTF-8

## Description

Allows storing backups created with Backup system onto remote SFTP host.

## Extracted Text

On this page
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The SFTP Storage integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] works with the core Backup integration. When you enable SFTP Storage in the Locations section of your Backup integration settings, Home Assistant automatically stores manual and automatic backups on your remote SSH/SFTP server.
To learn how to create and restore a backup, refer to the backup section under common tasks .
To add the SFTP Storage service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SFTP Storage .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of SSH/SFTP Server to connect to.
Port
Port of your SSH/SFTP Server. This is usually 22.
Username
Username to authenticate with.
Password
Password to authenticate with. Provide this or Private Key File .
Private Key File
Upload a private key file used for authentication. The key must not be protected by a passphrase. Provide this or Password .
Remote path
Remote path where to upload backups. Directory must already exist and user provided in Username must have write access to it.
If both Password and Private Key File are provided, service will try to log in with private key first, then fallback to password-based authentication if private key authentication fails.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After you remove the integration, all Home Assistant backups stored on the remote server are not automatically deleted. You need to manually delete them from the remote filesystem.
Backups
Backup emergency kit
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SFTP Storage service was introduced in Home Assistant 2025.10, and it's used by
837 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@maretodoric
Categories
Backup
Back to top
