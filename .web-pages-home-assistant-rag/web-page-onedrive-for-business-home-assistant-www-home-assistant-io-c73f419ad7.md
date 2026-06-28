---
source_url: "https://www.home-assistant.io/integrations/onedrive_for_business"
final_url: "https://www.home-assistant.io/integrations/onedrive_for_business"
canonical_url: "https://www.home-assistant.io/integrations/onedrive_for_business/"
source_handle: "web:www-home-assistant-io:c73f419ad75c"
source_section: "integrations-onedrive-for-business"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f0ec3d557befb778d895d1f8b42ba240bb5110b00833942d1ca1e3cf02a2952e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OneDrive for Business - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/onedrive_for_business
- Final URL: https://www.home-assistant.io/integrations/onedrive_for_business
- Canonical URL: https://www.home-assistant.io/integrations/onedrive_for_business/
- Fetched at: 2026-06-28T03:05:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up OneDrive for Business to be used with backups.

## Extracted Text

On this page
Configuration
Options
Requested permissions by the integration
Getting application credentials
Sensors
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The OneDrive for Business integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use OneDrive for Business for Home Assistant Backups .
Backup encryption is enabled by default and can be disabled as shown in the backup documentation .
To add the OneDrive for Business service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OneDrive for Business .
Follow the instructions on screen to complete the setup.
Tenant ID
Tenant ID of the Entra ID tenant where the account to be used with the integration lives.
Client ID
Application ID of the app registration to be used with the integration.
Client secret
Application secret for the app registration.
Folder path
The path of the folder where to store backups.
To define options for OneDrive for Business, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of OneDrive for Business are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The integration will request the following permissions on your OneDrive for the integration to work:
Files.ReadWrite.All : Grants the application permission to read and write in any folder of your OneDrive. Unfortunately, unlike the personal OneDrive, OneDrive for Business does not support the Files.ReadWrite.AppFolder permissions, so these are the least possible permissions.
offline_access : Grants the application permission to refresh its authentication token without requiring your manual intervention.
openid : Grants the application permission to read basic information, for example, if you have a OneDrive.
You’ll need to follow this guide by Microsoft on registering an application to create your own client ID and secret.
Make sure to configure the following settings on the app registration:
Supported account types : Choose one of Accounts in this organizational directory only (recommended), Accounts in any organizational directory , Accounts in any organizational directory (Any Microsoft Entra ID tenant - Multitenant) and personal Microsoft accounts
Redirect URI : Type: Web , URL: https://my.home-assistant.io/redirect/oauth
The integration provides the following sensors, which are updated every 5 minutes:
Total available storage : The total size of your drive (disabled by default).
Used storage : The amount of storage you have used up.
Remaining storage : The amount of storage that is left in your drive.
Drive state : Calculated state of your drive, based on the storage left. Possible values: Normal , Nearing limit , Critical , Exceeded .
Note
A drive in Drive state Exceeded will be automatically frozen (meaning you can’t upload any more backups & files) until you free up enough storage.
Currently we don’t have any known troubleshooting steps, if you find something please create a documentation PR. Thanks!
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Backups
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OneDrive for Business service was introduced in Home Assistant 2026.3, and it's used by
98 active installations.
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
