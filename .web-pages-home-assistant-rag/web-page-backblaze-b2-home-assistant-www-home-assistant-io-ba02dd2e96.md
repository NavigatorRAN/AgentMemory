# Backblaze B2 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/backblaze_b2
- Final URL: https://www.home-assistant.io/integrations/backblaze_b2
- Canonical URL: https://www.home-assistant.io/integrations/backblaze_b2/
- Fetched at: 2026-06-28T02:30:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up a Backblaze B2 bucket to be used as a backup location.

## Extracted Text

On this page
Prerequisites
Configuration
Troubleshooting
Expired keys
Files are being overwritten due to non-unique bucket prefix
Removing the integration
To remove an integration instance from Home Assistant
The Backblaze integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to use a Backblaze B2 bucket as a backup location in Home Assistant.
This integration requires an existing B2 bucket and an application key that has access to that bucket. It is recommended to create a key that only has access to the required bucket and prefix (if desired).
Create a new B2 bucket
Log in to the Backblaze Console .
Create a bucket .
Choose a unique bucket name (such as, home-assistant-backups-123456 ).
Make a note of the bucket name — you’ll need it later.
Adjust the settings:
Set bucket to private : Enabled by default, recommended.
Encryption : This enables Backblaze’s server-side encryption. This is separate from the Home Assistant backup encryption. This is optional. If Home Assistant backups are configured to use encryption, you can disable this.
Create an application key
To create an application key that can access the bucket:
Go to Application Keys in the sidebar.
Create a new application key .
Use a name like home-assistant-backup .
Limit access to the bucket by selecting it from the Choose a bucket dropdown.
The type of access should be Read and Write .
Allow List All Bucket Names can be left unchecked.
Optionally, you can limit the key to a specific prefix (such as home-assistant-backups ) if you want to save backups in a specific folder within the bucket.
Save the Key ID and Application Key . You’ll need these when setting up the Backblaze integration in Home Assistant.
Note
By limiting credentials to a specific bucket, you reduce risk and help keep your Backblaze account secure.
To add the Backblaze B2 service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Backblaze B2 .
Follow the instructions on screen to complete the setup.
Key ID
The access key ID for your Backblaze account.
Application Key
The application key for your Backblaze account.
Bucket Name
Bucket name to store the backups. Bucket must already exist and be writable by the provided credentials.
Prefix
Optional prefix for the backups. This is useful if you want to store backups in a specific folder within the bucket.
If the application key expires, you will need to create a new one and update the integration in Home Assistant.
If you set a prefix, all backups will be stored under that prefix in the bucket. Ensure that the prefix is unique to avoid overwriting other files. Changing the prefix will not move existing backups.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Backblaze B2 service was introduced in Home Assistant 2025.12, and it's used by
412 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hugo-vrijswijk
@ElCruncharino
Categories
Backup
Back to top
