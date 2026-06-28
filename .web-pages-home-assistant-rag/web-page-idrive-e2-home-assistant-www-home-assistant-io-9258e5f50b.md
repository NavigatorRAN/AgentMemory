---
source_url: "https://www.home-assistant.io/integrations/idrive_e2"
final_url: "https://www.home-assistant.io/integrations/idrive_e2"
canonical_url: "https://www.home-assistant.io/integrations/idrive_e2/"
source_handle: "web:www-home-assistant-io:9258e5f50bc3"
source_section: "integrations-idrive-e2"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "882e040524077667fd17879f795497c360fc470589e1e3c911effbfdc37c1bc6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# IDrive e2 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/idrive_e2
- Final URL: https://www.home-assistant.io/integrations/idrive_e2
- Canonical URL: https://www.home-assistant.io/integrations/idrive_e2/
- Fetched at: 2026-06-28T02:51:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up an IDrive e2 bucket to use as a backup location.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The IDrive e2 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use an IDrive e2 bucket with Home Assistant Backups.
Before configuring this integration, you need to prepare your IDrive e2 account. This includes creating a bucket to store your backups and an access key with permissions to that bucket.
Create a new IDrive e2 bucket
Log in to the IDrive e2 Management Console .
Follow the steps on creating a bucket in the iDrive documentation.
When prompted to define a bucket name, make sure it is unique: Name (for example, home-assistant-backups-123456 ).
When adjusting the settings:
Files in bucket are private : Enabled by default. It is recommended to leave it enabled.
Versioning (optional): Lets you recover backups after Home Assistant deletes them, but it can increase storage costs . Disable this to allow permanent deletion based on retention settings.
Make a note of the bucket name and region. You’ll need it later.
Create an access key
To create an access key that has access to the bucket:
Follow the steps on creating an access key in the iDrive documentation.
When prompted to define a name, make it descriptive (for example, home-assistant-backup ).
Access key expiry : Disabled by default. It is recommended to leave it disabled.
Access permission : Read and write (default).
Allow deletion of objects : Enabled by default. It is recommended to leave it enabled.
Allow bucket deletion : Disable this option (unchecked).
Assign the access key to the bucket you created earlier.
Make a note of the Access key id and Secret access key . You’ll need them when configuring the integration in Home Assistant.
Note
Avoid using credentials that have more permissions than is necessary.
By limiting credentials to a specific bucket, you reduce risk and help keep your IDrive e2 account secure.
To add the IDrive e2 service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select IDrive e2 .
Follow the instructions on screen to complete the setup.
Access key id
The access key ID for your IDrive e2 account.
Secret access key
The secret access key for your IDrive e2 account.
Bucket name
IDrive e2 bucket name to store the backups. Bucket must already exist and be writable by the provided credentials.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IDrive e2 service was introduced in Home Assistant 2026.3, and it's used by
30 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@patrickvorgers
Categories
Backup
Back to top
