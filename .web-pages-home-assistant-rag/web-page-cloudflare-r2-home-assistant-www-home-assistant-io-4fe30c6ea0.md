---
source_url: "https://www.home-assistant.io/integrations/cloudflare_r2"
final_url: "https://www.home-assistant.io/integrations/cloudflare_r2"
canonical_url: "https://www.home-assistant.io/integrations/cloudflare_r2/"
source_handle: "web:www-home-assistant-io:4fe30c6ea032"
source_section: "integrations-cloudflare-r2"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bc5a64b1028b4f900af03deb8a2437a52b5c296f7c4d8b13ad2dba2e4f9310e7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Cloudflare R2 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cloudflare_r2
- Final URL: https://www.home-assistant.io/integrations/cloudflare_r2
- Canonical URL: https://www.home-assistant.io/integrations/cloudflare_r2/
- Fetched at: 2026-06-28T02:34:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Cloudflare R2 bucket to be used as a backup location.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
The Cloudflare R2 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use Cloudflare R2 buckets with Home Assistant Backups.
This integration requires an existing R2 bucket and admin access to the bucket so you can create a Secret Access Key.
Create a new Cloudflare R2 bucket
Log in to your Cloudflare Dashboard .
On the sidebar, go to Storage & databases , click on R2 object storage and then Overview .
Select + Create bucket .
Choose a unique Bucket name , for example, home-assistant-backups-123456 .
Select your preferred location .
Select your preferred storage class (Standard is fine, as Infrequent Access is still in beta)
Select Create bucket .
Make a note of the bucket name — you’ll need it later.
Create an API Token/Secret Key
To create a new Secret Key that can access the R2 bucket:
Go back to the R2 object storage > Overview page.
Click Manage API Tokens .
Click Create User API token .
Give it a name like Home Assistant Backup .
Check Object Read & Write .
Select Apply to specific buckets only and choose the bucket you created previously, for example, home-assistant-backups-123456 .
Do not touch the other options and click Create User API Token .
Save the Access Key ID , the Secret Access Key and also the S3 endpoint — you’ll need these when setting up the Cloudflare R2 integration in Home Assistant.
Note
Avoid using credentials and API Keys that have more permissions than is necessary.
By limiting credentials to a specific bucket, you reduce risk and help keep your Cloudflare account secure.
To add the Cloudflare R2 service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cloudflare R2 .
Follow the instructions on screen to complete the setup.
Access key ID
Access key ID to connect to Cloudflare R2.
Secret access key
Secret access key to connect to Cloudflare R2. See Cloudflare documentation
Bucket name
R2 bucket name to store the backups. Bucket must already exist and be writable by the provided credentials.
Endpoint URL
Cloudflare R2 S3-compatible endpoint.
Folder prefix
Optional folder path inside the bucket. For example, backups/homeassistant
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cloudflare R2 service was introduced in Home Assistant 2026.2, and it's used by
392 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@corrreia
Categories
Backup
Back to top
