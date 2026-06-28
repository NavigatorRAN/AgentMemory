# Azure Storage - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/azure_storage
- Final URL: https://www.home-assistant.io/integrations/azure_storage
- Canonical URL: https://www.home-assistant.io/integrations/azure_storage/
- Fetched at: 2026-06-28T02:30:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Azure storage accounts to be used with backups.

## Extracted Text

On this page
Configuration
Known Limitations
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use Azure storage accounts for use with Home Assistant Backups.
To add the Azure Storage service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Azure Storage .
Follow the instructions on screen to complete the setup.
Storage account name
The name of the storage account. Only the name, nothing else.
Container name
Blob container name to store the backups. If the container does not exist, it will be created. Defaults to hass-backups .
Storage account key
One of the two storage account keys. Used to authenticate against the storage account
Only storage accounts that have a default URL storageaccountname.blob.core.windows.net are supported at this point
Since only key based authentication is possible, this has to be enabled in your storage account.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Authentication failure
Check that your storage account allows Shared Key access .
DNS Error
You may encounter a aiodns.error.DNSError: (4, 'Domain name not found') error.
To resolve this:
Navigate to Settings → System → Network → DNS Servers in Home Assistant
Manually set fallback DNS servers to 1.1.1.1 (Cloudflare) and 8.8.8.8 (Google) (or any other that you prefer). This allows Home Assistant to resolve Azure domain names successfully.
Restart Home Assistant to propagate the new settings.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Azure Storage service was introduced in Home Assistant 2025.3, and it's used by
148 active installations.
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
