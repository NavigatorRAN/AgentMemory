---
source_url: "https://www.home-assistant.io/integrations/aws_s3"
final_url: "https://www.home-assistant.io/integrations/aws_s3"
canonical_url: "https://www.home-assistant.io/integrations/aws_s3/"
source_handle: "web:www-home-assistant-io:acf4fc45d672"
source_section: "integrations-aws-s3"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "238070fb320d927d462e072f9f89d71a5ecab18449c7e0da0da7420af659255c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AWS S3 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aws_s3
- Final URL: https://www.home-assistant.io/integrations/aws_s3
- Canonical URL: https://www.home-assistant.io/integrations/aws_s3/
- Fetched at: 2026-06-28T02:30:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up AWS S3 bucket to be used as a backup location.

## Extracted Text

On this page
Prerequisites
Configuration
Setting up the AWS S3 integration in Home Assistant
Organizing backups with the prefix option
Examples
Sensors
Known limitations
No support for third-party S3 API compatible providers
Removing the integration
To remove an integration instance from Home Assistant
The AWS S3 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use AWS S3 bucket with Home Assistant Backups.
Important
This integration is specifically designed to work only with Amazon AWS S3 and not with third-party storage providers that claim S3 API compatibility. Third-party providers like Wasabi, DigitalOcean Spaces, Backblaze B2, Infomaniak, and others are not supported.
This integration requires an existing S3 bucket and an IAM user that has access to that bucket. For security reasons, it is strongly recommended to scope the IAM policy as narrowly as possible to only the required operations and resources.
Create a new S3 bucket
Log in to the AWS Management Console .
Navigate to S3 from the Services menu.
Click Create bucket .
Choose a unique bucket name (for example, home-assistant-backups-123456 ).
Select your preferred AWS region (for example, eu-central-1 ).
Adjust the settings:
✅ Block all public access (enabled by default, recommended)
⚠️ Enable Bucket Versioning (optional). This lets you recover backups after Home Assistant deletes them, but it can increase storage costs . Disable this to allow permanent deletion based on retention settings.
Make a note of the bucket name — you’ll need it later.
Create an IAM user
To create a new IAM user that can access the S3 bucket:
Go to IAM > Users in the AWS Management Console.
Click Add users .
Use a name like home-assistant-backup .
Check Access key - Programmatic access only.
Click Next: Permissions .
Now, let’s create and attach a custom IAM policy to give the user the necessary permissions to the bucket:
Click Create policy , go to the JSON tab, and paste the following (replace YOUR_BUCKET_NAME ):
{ "Version" : "2012-10-17" , "Statement" : [ { "Sid" : "AllowS3BackupOperations" , "Effect" : "Allow" , "Action" : [ "s3:ListBucket" , "s3:GetObject" , "s3:PutObject" , "s3:DeleteObject" , "s3:AbortMultipartUpload" ], "Resource" : [ "arn:aws:s3:::YOUR_BUCKET_NAME" , "arn:aws:s3:::YOUR_BUCKET_NAME/*" ] } ] }
Name the policy (for example, HomeAssistantS3Policy ) and create it.
Return to the user creation wizard and attach the new policy.
Complete the user setup.
Save the Access Key ID and Secret Access Key — you’ll need these when setting up the AWS S3 integration in Home Assistant.
Note
Avoid using credentials for your AWS root account or IAM users that have more permissions than is necessary.
By limiting credentials to a specific bucket, you reduce risk and help keep your AWS account secure.
To add the AWS S3 service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select AWS S3 .
Follow the instructions on screen to complete the setup.
Access Key ID
The access key ID for your AWS S3 account.
Secret Access Key
The secret access key for your AWS S3 account.
Bucket Name
S3 bucket name to store the backups. Bucket must already exist and be writable by the provided credentials.
Endpoint URL
Endpoint URL provided to Boto3 Session . Region-specific AWS S3 endpoints are available in their documentation. Defaults to https://s3.eu-central-1.amazonaws.com/ .
Prefix
Optional path prefix within the S3 bucket where backups will be stored. For example, home-assistant will store backups in s3://bucket-name/home-assistant/ . This is useful for organizing backups when using the same bucket for multiple purposes. Leading and trailing slashes will be automatically removed.
In Home Assistant, go to Settings > Devices & services .
Select Add Integration and search for AWS S3 .
Enter the following details:
Access Key ID and Secret Access Key from the IAM user
Your bucket name
The region endpoint (for example, https://s3.eu-central-1.amazonaws.com/ )
The optional prefix (path inside the bucket for organizing backups; you can leave this empty)
The integration will test the connection and confirm access to your S3 bucket.
The optional prefix option allows you to organize your backups within a specific path inside your S3 bucket. This is useful when you want to:
Store backups in a dedicated path (for example, home-assistant/backups/ )
Use the same S3 bucket for multiple purposes
Manage multiple Home Assistant instances with separate backup paths
Without prefix
Backups are stored at the root of your bucket:
s3://my-bucket/
├── backup-2025-02-01.tar
├── backup-2025-02-01.metadata.json
├── backup-2025-02-02.tar
└── backup-2025-02-02.metadata.json
With prefix home-assistant
Backups are stored in a path prefix:
s3://my-bucket/home-assistant/
With nested prefix backups/home-assistant
Backups are stored in nested prefixes:
s3://my-bucket/backups/home-assistant/
The prefix is automatically normalized, so you can enter it with or without leading/trailing slashes. For example, home-assistant , /home-assistant , and home-assistant/ all work the same way.
The integration provides the following sensor, which is updated every 6 hours:
Total size of backups : The combined size of all Home Assistant backups stored in the configured S3 bucket for this Home Assistant installation.
The AWS S3 integration has the following limitations:
This integration is designed to work only with the official Amazon AWS S3 service. Despite claims of S3 API compatibility, third-party storage providers like Wasabi, DigitalOcean Spaces, Backblaze B2, Infomaniak, OVH Cloud, and others have often proven to be incompatible. Even when they appear to work initially, they cannot guarantee ongoing compatibility with this AWS S3 integration in the future.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AWS S3 service was introduced in Home Assistant 2025.5, and it's used by
252 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tomasbedrich
Categories
Backup
Back to top
